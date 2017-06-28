*&---------------------------------------------------------------------*
*& Report ZZTEST_PGR_001
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zztest_pgr_001.

CLASS c1 DEFINITION.
  PUBLIC SECTION.
    TYPES: BEGIN OF t_struct,
             col1 TYPE i,
             col2 TYPE i,
           END OF t_struct.
    CLASS-METHODS m1 IMPORTING is_import TYPE t_struct.
ENDCLASS.

CLASS c1 IMPLEMENTATION.
  METHOD m1.
 break pgrzadziel.
  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.

  c1=>m1( VALUE #( COL1 = 1
                    COL2 = 2 ) ).
