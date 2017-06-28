*&---------------------------------------------------------------------*
*& Report ZZTEST_PGR_015
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZZTEST_PGR_015.

TYPES numtext TYPE n LENGTH 10.
cl_demo_output=>write( CONV numtext( '4 Apples + 2 Oranges' ) ).

TRY.
    DATA(number) = EXACT numtext( '4' + '2' ).
  CATCH cx_sy_conversion_error INTO DATA(exc).
  cl_demo_output=>write( exc->get_text( ) ).
ENDTRY.

cl_demo_output=>display( ).
