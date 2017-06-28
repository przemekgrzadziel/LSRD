*&---------------------------------------------------------------------*
*& Report ZZTEST_PGR_017
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZZTEST_PGR_017.

CLASS cx_langu_not_supported DEFINITION INHERITING FROM cx_static_check.
ENDCLASS.

CLASS class DEFINITION.
  PUBLIC SECTION.
    METHODS meth IMPORTING iso_langu   TYPE string
                 RETURNING VALUE(text) TYPE string.
ENDCLASS.

CLASS class IMPLEMENTATION.
  METHOD meth.

  ENDMETHOD.
ENDCLASS.


START-OF-SELECTION.
  DATA(text) = NEW class( )->meth( SWITCH #( sy-langu WHEN 'D' THEN 'DE'
                                                      WHEN 'E' THEN 'EN'
                                                      ELSE THROW cx_langu_not_supported( ) ) ).

  break pgrzadziel.
