/*============================================================================
 * pll.c
 *      Code to implement a simple frequency locked loop on the DSP.
 *==========================================================================*/

#include <std.h>
#include <sys.h>
#include <dev.h>
#include <sio.h>
#include <math.h>

#include "dsp_ap.h"
#include "pll.h"

#include "sin_tables.h"

/* Mathematical constants */
#define M_PI    3.14159265358979

/*----------------------------------------------------------------------------
 * pll_init
 *      Initializes state of the PLL.
 * Inputs:
 *      f0      Nominal center frequency of PLL (discrete)
 *      T       Time constant of loop filter
 *      k       Gain factor
 *      damp    Damping factor (1.0=critically damped)
 *      mult    Frequency multiplier on output
 * Notes:
 *      The multiplier operation is not implemented.  You will have to
 *      consider how to do this!
 *--------------------------------------------------------------------------*/
pll_state_def *pll_init(float f0, float T, float K, float damp, float mult)
{
    pll_state_def *s;
    float wn, tau1, tau2;

    /* Allocate a new pll_state_def structure.  Holds state and parameters. */
    if ((s = (pll_state_def *)MEM_calloc(PLL_SEG_ID, sizeof(pll_state_def), PLL_BUFFER_ALIGN)) == NULL)
    {
        SYS_error("Unable to create state structure for PLL.", SYS_EUSER, 0);
        return(0);
    }

    /* Copy input parameters */
    s->f0 = f0;
    s->damp_fact = damp;
    s->K = K;
    s->mult = mult;
    
    /* Compute the filter coefficients */
    wn = (2*M_PI)/100;
    tau1 = K/(wn*wn);
    tau2 = ((2*damp)/wn)-(1/K);
    s->a1 = -(1.0-2*tau1)/(1.0+2*tau1);
    s->b0 = (1.0+2*tau2)/(1.0+2*tau1);
    s->b1 = (1.0-2*tau2)/(1.0+2*tau1);

    /* Set state variables (initially all 0) */ 
    s->z_nm1 = 0;
    s->v_nm1 = 0;
    s->x_nm1 = 0;
    s->y_nm1 = 0;
    s->accum = 0;
    s->accum2 = 0;
        
    /* Set initial block amplitude (cannot be 0!) */
    s->Ap = 1.0;

    return(s);
}

/*---------------------------------------------------------------------------
 * pll
 *      PLL process function.
 *--------------------------------------------------------------------------*/
void pll(pll_state_def *s, const float x_in[], float y_out[])
{
    int n;
    float A;

    float x_n;
    float z_n;
    float v_n;
    float y_n;

    /* Add other temporary variables as needed. */
    /* Do not put any arrays as local variables! */
    
    float d_acc;
    float vco_gain;
    vco_gain = s->K/(2.0*M_PI*s->Ap);

    /*
     * If signal level is below some threshold, make Ap large, which has the
     * effect of just doing holdover mode.
     */
    if (s->Ap < 1.0E-3)
    {
        s->Ap = 100.;
    }

    A = 0.0;  /* Variable for computing amplitude */
    for (n=0; n<BUFFER_SAMPLES; n++)
    {
        /* Input sample (input reference) */
        /* Take the sign of the input signal. */
        x_n = x_in[n];

        /* Estimate amplitude from summed |x| */
        A = A + fabs(x_n);
        
        /* Add your code here to do PLL operation !!! */
        /* Code should generate y_n from x_n. */

        //Multiply
        z_n = s->x_nm1*s->y_nm1;

        /* Loop Filter*/
        v_n = s->a1*s->v_nm1+s->b0*z_n+s->b1*s->z_nm1;
        
        //Get amount to be added to accumulator
        d_acc = s->f0+vco_gain*v_n;

        //Accumulator update for internal VCO
        s->accum = s->accum+d_acc;

        //Make accumulator modulo 1
        s->accum = s->accum - floor(s->accum);

        //get internal output value


        //Second accumulator generates output, allowing frequency multiplication
        s->accum2 = s->accum2+s->mult*d_acc;
        s->accum2 = s->accum2 - floor(s->accum2);
        y_n = sin_table[(int)(s->accum2*(float)SIN_TABLE_SIZE)];
        /* Put output sample */
        y_out[n] = y_n;

        
        /* Shift current variables to previous values. */
        s->z_nm1 = z_n;
        s->v_nm1 = v_n;
        s->x_nm1 = x_n;
        s->y_nm1 = y_n;
    }

    /* Get amplitude estimate for next block (compute from A) */
    s->Ap = (A/n)*(M_PI/2);

}
