*&---------------------------------------------------------------------*
*& Report ZZTEST_PGR_005
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZZTEST_PGR_005.

TYPES t_date_tab TYPE TABLE OF string  WITH EMPTY KEY.

DATA(date_tab) = VALUE t_date_tab(
  ( |{ CONV d( sy-datlo - 1 ) DATE = ENVIRONMENT }| )
  ( |{         sy-datlo       DATE = ENVIRONMENT }| )
  ( |{ CONV d( sy-datlo + 1 ) DATE = ENVIRONMENT }| ) ).

break pgrzadziel.
