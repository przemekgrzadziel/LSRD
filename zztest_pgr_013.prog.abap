*&---------------------------------------------------------------------*
*& Report ZZTEST_PGR_013
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZZTEST_PGR_013.

TYPES: BEGIN OF t_struc,
        col1 TYPE i,
        col2 TYPE i,
       END OF t_struc.

DATA dref  TYPE REF TO data.
DATA struc TYPE t_struc.

dref = NEW t_struc( ).
CAST t_struc( dref )->col1 = struc-col1.

break pgrzadziel.
