*&---------------------------------------------------------------------*
*& Report ZZTEST_PGR_004
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZZTEST_PGR_004.

DATA itab TYPE RANGE OF i.

itab = VALUE #( sign = 'I'  option = 'BT' ( low = 1  high = 10 )
                                          ( low = 21 high = 30 )
                                          ( low = 41 high = 50 )
                            option = 'GE' ( low = 61 )  ).

break pgrzadziel.
