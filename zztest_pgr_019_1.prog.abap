*&---------------------------------------------------------------------*
*& Report ZZTEST_PGR_019_1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZZTEST_PGR_019_1.

*Release 7.40

CLASS mock_request DEFINITION FOR TESTING FINAL.
  PUBLIC SECTION.
    INTERFACES if_http_request PARTIALLY IMPLEMENTED.
ENDCLASS.

CLASS mock_request IMPLEMENTATION.
  METHOD if_http_request~get_form_field.
    value = SWITCH spfli-carrid( name WHEN 'carrid' THEN 'LH'
                                      ELSE space ).
  ENDMETHOD.
ENDCLASS.
