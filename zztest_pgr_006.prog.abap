*&---------------------------------------------------------------------*
*& Report ZZTEST_PGR_006
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZZTEST_PGR_006.

CLASS class DEFINITION.
  PUBLIC SECTION.
    METHODS meth
      IMPORTING p1 TYPE string
                p2 TYPE i.
ENDCLASS.

CLASS class IMPLEMENTATION.
  METHOD meth.

  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.

  DATA(arg1) = `blah`.
  DATA(arg2) = 111.

  DATA(ptab) = VALUE abap_parmbind_tab(
    ( name = 'P1' kind = cl_abap_objectdescr=>exporting value = REF #( arg1 ) )
    ( name = 'P2' kind = cl_abap_objectdescr=>exporting value = REF #( arg2 ) ) ).

  DATA(oref) = NEW class( ).
  CALL METHOD oref->('METH')
    PARAMETER-TABLE ptab.
