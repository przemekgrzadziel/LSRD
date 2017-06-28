*&---------------------------------------------------------------------*
*& Report ZZTEST_PGR_014
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZZTEST_PGR_014.

TRY.
    DATA(r1) = EXACT decfloat34( 3 / 2 ).
    cl_demo_output=>write( |Exact: { r1 }| ).
  CATCH cx_sy_conversion_rounding INTO DATA(e1).
    cl_demo_output=>write( |Not exact: { e1->value }| ).
ENDTRY.

TRY.
    DATA(r2) = EXACT decfloat34( 3 / 7 ).
    cl_demo_output=>write( |Exact: { r2 }| ).
  CATCH cx_sy_conversion_rounding INTO DATA(e2).
    cl_demo_output=>write( |Not exact: { e2->value }| ).
ENDTRY.

cl_demo_output=>display( ).
