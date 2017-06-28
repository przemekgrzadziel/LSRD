*&---------------------------------------------------------------------*
*& Report ZZTEST_PGR_031
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zztest_pgr_031.

CLASS my_class DEFINITION.
  PUBLIC SECTION.
    CLASS-METHODS get_lfa1 RETURNING VALUE(rs_lfa1) TYPE lfa1.
ENDCLASS.

CLASS my_class IMPLEMENTATION.
    METHOD get_lfa1.
    ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.
*Before 7.40
DATA: ls_lfa1  TYPE lfa1,
      lv_name1 TYPE lfa1-name1.
ls_lfa1  = my_class=>get_lfa1( ).
lv_name1 = ls_lfa1-name1.

*With 7.40
DATA(lv_name1_new) = my_class=>get_lfa1( )-name1.
