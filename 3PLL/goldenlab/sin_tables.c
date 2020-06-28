/*============================================================================
 * sin_tables.c
 *      Contains code to setup and access a SIN and COS table for use in
 *      real-time DSP programs.
 *==========================================================================*/

#include "sin_tables.h"
#include "math.h"

float sin_table[SIN_TABLE_SIZE];
float cos_table[SIN_TABLE_SIZE];

/*----------------------------------------------------------------------------
 * SIN_init()
 *      Initializes the SIN and COS table with values of a single period.
 *--------------------------------------------------------------------------*/
void SIN_init()
{
    int i;
    
    /* Initialize sine table */
    for (i=0; i<SIN_TABLE_SIZE; i++)
    {
        sin_table[i] = sin(2.0*M_PI*(float)i/(float)SIN_TABLE_SIZE);
        cos_table[i] = cos(2.0*M_PI*(float)i/(float)SIN_TABLE_SIZE);
    }
}




