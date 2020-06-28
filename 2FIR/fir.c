/*
 * fir.c
 *
 *  Created on: Apr 30, 2019
 *      Author: DSP_Lab
 */
#include <std.h>
#include <sys.h>
#include <dev.h>
#include <sio.h>

#include "fir.h"
#include "dsp_ap.h"
#include "rc1_taps.h"

/*----------------------------------------------------------------------------
 * fir_init()
 *      This function initializes a FIR block.
 * Inputs:
 *      None.
 * Returns:
 *      0       An error ocurred
 *      other   A pointer to a new delay structure
 *--------------------------------------------------------------------------*/

fir_state_def *fir_init(int len, float *h)
{
    fir_state_def *s;

    /* Allocate a new fir_state_def structure.  Holds state and parameters. */
    if ((s = (fir_state_def *)MEM_calloc(FIR_SEG_ID, sizeof(fir_state_def), FIR_BUFFER_ALIGN)) == NULL)
    {
        SYS_error("Unable to create an input delay floating-point buffer.", SYS_EUSER, 0);
        return(0);
    }

    /* Set initial value of fir structure*/
    s->t = 0;
    s->h = h;
    s->len=len; 
    /* Success.  Return a pointer to the new state structure. */
    return(s);
}

/*----------------------------------------------------------------------------
 * fir()
 *      Process one buffer of samples with the fir block.
 *--------------------------------------------------------------------------*/
void fir(fir_state_def *s, const float x_in[], float y_out[])
{
    int i,j;
    int ptr;
    float sum;

    /* Read all input samples into tail of buffer */
    for (i=0; i<BUFFER_SAMPLES; i++)
    {
        s->buffer[s->t] = x_in[i];
        s->t++; s->t &= FIR_BUFFER_CMASK;//Circular decrement of pointer
        ptr=s->t+FIR_BUFFER_CMASK;
        ptr &= FIR_BUFFER_CMASK;
        sum=0;

    for (j=0; j<s->len; j++)
    {
    	sum=sum+s->buffer[ptr]*s->h[j]; //Get all filter outputs
    	ptr+=FIR_BUFFER_CMASK; // Move sum into output positions in a circular fashion
    	ptr&=FIR_BUFFER_CMASK;
    }

    	y_out[i]=sum;   /* Read all output samples from head of buffer */
}}