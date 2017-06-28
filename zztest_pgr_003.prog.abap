*&---------------------------------------------------------------------*
*& Report ZZTEST_PGR_003
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZZTEST_PGR_003.

*Elementary line type:

TYPES t_itab TYPE TABLE OF i WITH EMPTY KEY.

DATA itab TYPE t_itab.

itab = VALUE #( ( ) ( 1 ) ( 2 ) ).

break pgrzadziel.
