*&---------------------------------------------------------------------*
*& Report ZZTEST_PGR_002
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZZTEST_PGR_002.

TYPES:  BEGIN OF t_col2,
           col1 TYPE i,
           col2 TYPE i,
        END OF t_col2.

TYPES: BEGIN OF t_struct,
         col1 TYPE i,
         col2 TYPE t_col2,
       END OF t_struct.

DATA: struct TYPE t_struct,
      col2 TYPE t_col2.

*1
struct = VALUE t_struct( col1      = 1
                         col2-col1 = 1
                         col2-col2 = 2 ).



*2

col2   = VALUE   t_col2( col1 = 1
                         col2 = 2 ).
struct = VALUE t_struct( col1 = 1
                         col2 = col2 ).

*3

struct = VALUE t_struct( col1 = 1
                         col2 = VALUE #( col1 = 1
                                         col2 = 2 ) ).
