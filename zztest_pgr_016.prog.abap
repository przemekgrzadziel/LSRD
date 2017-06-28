*&---------------------------------------------------------------------*
*& Report ZZTEST_PGR_016
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZZTEST_PGR_016.

DATA(time) =
  COND string(
    WHEN sy-timlo < '120000' THEN
      |{ sy-timlo TIME = ISO } AM|
    WHEN sy-timlo > '120000' THEN
      |{ CONV t( sy-timlo - 12 * 3600 )
         TIME = ISO } PM|
    WHEN sy-timlo = '120000' THEN
      |High Noon|
    ELSE
      THROW CX_AXT_DATA( ) ).

break pgrzadziel.
