/*============================================================================
 * sin_tables.h
 *      Header file for sin table structures.
 *==========================================================================*/

#ifndef _sin_tables_h_
#define _sin_tables_h_

/* Static arrays to hold sin() and cos() functions */
#define SIN_TABLE_SIZE  512
extern float sin_table[SIN_TABLE_SIZE];
extern float cos_table[SIN_TABLE_SIZE];

/* Pi */
#define M_PI    3.14159265358979

/* Lookup table for SIN(2*pi*x) and COS(2*pi*x) */  
#define SIN_value(x) (sin_table[(int)(SIN_TABLE_SIZE*(x))])
#define COS_value(x) (cos_table[(int)(SIN_TABLE_SIZE*(x))])

#endif
