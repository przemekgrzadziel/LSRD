*&---------------------------------------------------------------------*
*& Report ZZTEST_PGR_008
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZZTEST_PGR_008.

*Before release 7.40
DATA text TYPE c LENGTH 255.
DATA helper TYPE string.
DATA xstr   TYPE xstring.

helper = text.
xstr = cl_abap_codepage=>convert_to( source = helper ).

*With release 7.40
DATA lv_text TYPE c LENGTH 255.
DATA(lv_xstr) = cl_abap_codepage=>convert_to( source = CONV string( lv_text ) ).

*even simpler to write

DATA lv_text2 TYPE c LENGTH 255.
DATA(lv_xstr2) = cl_abap_codepage=>convert_to( source = CONV #( lv_text2 ) ).

break pgrzadziel.
