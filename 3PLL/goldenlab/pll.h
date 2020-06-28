/*============================================================================
 * pll.h
 *      Global definitions for PLL code.
 *==========================================================================*/

#ifndef _pll_h_
#define _pll_h_

/*-- Defines ---------------------------------------------------------------*/
#define PLL_SEG_ID            0               /* IDRAM - fast.  PLL doesn't need much */
#define PLL_BUFFER_ALIGN      4               /* Just align on word boundary. */

/*-- Structures ------------------------------------------------------------*/
typedef struct
{
    /* Filter parameters */
    float a1, b0, b1;
    float f0, damp_fact;
    float K;
    float mult;
    float T;
        
    /* State variables */
    float x_nm1;
    float y_nm1;
    float z_nm1;
    float v_nm1;
    float accum;               
    float accum2;
    float Ap;

} pll_state_def;

/*-- Function Prototypes ---------------------------------------------------*/

pll_state_def *pll_init(float f0, float T, float K, float damp_fact, float mult);
void pll(pll_state_def *s, const float x_in[], float y_out[]);

#endif /* _pll_h_ */

