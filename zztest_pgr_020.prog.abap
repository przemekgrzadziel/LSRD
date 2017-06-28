*&---------------------------------------------------------------------*
*& Report ZZTEST_PGR_020
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZZTEST_PGR_020.

TYPES: BEGIN OF struc1,
    col1 TYPE i,
    col2 TYPE i,
  END OF struc1,
  itab1 TYPE TABLE OF struc1 WITH EMPTY KEY,
  itab2 TYPE TABLE OF itab1 WITH EMPTY KEY,
  BEGIN OF struc2,
    col1 TYPE i,
    col2 TYPE itab2,
  END OF struc2,
  itab3 TYPE TABLE OF struc2 WITH EMPTY KEY.

DATA(itab) = VALUE itab3(
   ( col1 = 1  col2 = VALUE itab2(
                       ( VALUE itab1(
                           ( col1 = 2 col2 = 3 )
                           ( col1 = 4 col2 = 5 ) ) )
                       ( VALUE itab1(
                           ( col1 = 6 col2 = 7 )
                           ( col1 = 8 col2 = 9 ) ) ) ) )
   ( col1 = 10 col2 = VALUE itab2(
                       ( VALUE itab1(
                           ( col1 = 11 col2 = 12 )
                           ( col1 = 13 col2 = 14 ) ) )
                       ( VALUE itab1(
                           ( col1 = 15 col2 = 16 )
                           ( col1 = 17 col2 = 18 ) ) ) ) ) ).

* Reading the column with value 13 with READ TABLE statements
READ TABLE itab     INTO DATA(wa1) INDEX 2.
READ TABLE wa1-col2 INTO DATA(wa2) INDEX 1.
READ TABLE wa2      INTO DATA(wa3) INDEX 2.
DATA(num1) = wa3-col1.

* Reading the column with value 13 with chained table expressions
DATA(num2) = itab[ 2 ]-col2[ 1 ][ 2 ]-col1.
break pgrzadziel.
