*&---------------------------------------------------------------------*
*& Report ZZTEST_PGR_019
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZZTEST_PGR_019.

CLASS mock_request DEFINITION FOR TESTING FINAL.
  PUBLIC SECTION.
    INTERFACES if_http_request.
ENDCLASS.

CLASS mock_request IMPLEMENTATION.
  METHOD if_http_request~get_form_field.
    value = SWITCH spfli-carrid( name WHEN 'carrid' THEN 'LH'
                                      ELSE space ).
  ENDMETHOD.

  METHOD if_http_entity~set_cdata.     ENDMETHOD.

  METHOD if_http_entity~set_data.      ENDMETHOD.

  METHOD if_http_entity~add_multipart. ENDMETHOD.

  METHOD if_http_entity~append_cdate.  ENDMETHOD.



ENDCLASS.
