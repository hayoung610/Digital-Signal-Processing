/************************************************************
* dsp_ap.c
* 		You should edit this file to contain your DSP code
*		and calls to functions in other files.
*************************************************************/

#include "dsp_ap.h"
#include "pll.h"

/* Definitions for the PLL used here. */
/* Fill in Values !!! */
/* Loop gain */
#define PLL1_K 1
/* Center frequency */
#define PLL1_F0 0.1
/* Damping factor */
#define PLL1_DAMP 1
/* Loop time constant */
#define PLL1_T 100

/* Global Declarations.  Add as needed. */
/* Pointers to PLL state structures */
pll_state_def *pll1, *plld, *pllh;

/*-----------------------------------------------------------
* dsp_init
*	This function will be called when the board first starts.
*	In here you should allocate buffers or global things
*   you will need later during actual processing.
* Inputs:
*	None
* Outputs:
*	0	Success
*	1	Error
*----------------------------------------------------------*/
int dsp_init()
{
    /* Initialize SIN table */
    SIN_init();

    /* Initialize a standard (non-multiplying) PLL block */
    if ((pll1 = pll_init(PLL1_F0, PLL1_T, PLL1_K, PLL1_DAMP, 1.0)) == 0)
    {
        /* Error */
        return(1);
    }

    /* You need to implement frequency multiplication in PLL before uncommenting these! */

    if ((plld = pll_init(PLL1_F0, PLL1_T, PLL1_K, PLL1_DAMP, 2.0)) == 0)
    {
        return(1);
    }

    if ((pllh = pll_init(PLL1_F0, PLL1_T, PLL1_K, PLL1_DAMP, 0.5)) == 0)
    {
        return(1);
    }
    

    /* Success */
    return(0);
}

/*-----------------------------------------------------------
* dsp_process
*	This function is what actually processes input samples
*	and generates output samples.  The samples are passed
*	in using the arrays inL and inR, corresponding to the
*	left and right channels, respectively.  You
*	can read these and then write to the arrays outL
*	and outR.  After processing the arrays, you should exit.
* Inputs:
*	inL		Array of left input samples.  Indices on this
*			and the other arrays go from 0 to BUFFER_SAMPLES.
*
* Outputs:
*	0	Success
*	1	Error
*----------------------------------------------------------*/
void dsp_process(
	const float inL[],
	const float inR[],
	float outL[],
	float outR[])
{
	int i;
        int switch_state;
        
	/* Copy input left to output left (debug) */
	for (i=0; i<BUFFER_SAMPLES; i++)
	{
		outL[i] = inL[i];
	}

        /* Send to PLL also and put output on right channel */
        switch_state = (USER_REG >> 4) & 0x7;
        switch(switch_state)
        {
            default:
            case 0: /* Normal PLL */
                pll(pll1, inL, outR);
                break;
            case 1: /* Doubling PLL */
                pll(plld, inL, outR);
                break;
            case 2: /* Halving PLL */
                pll(pllh, inL, outR);
                break;
        }
}
