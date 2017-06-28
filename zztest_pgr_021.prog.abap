*&---------------------------------------------------------------------*
*& Report ZZTEST_PGR_021
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZZTEST_PGR_021.

TYPES itab TYPE STANDARD TABLE OF string WITH EMPTY KEY.

DATA(itab) = VALUE itab(
  ( `I’m going slightly mad` )
  ( `I’m going slightly mad` )
  ( `It finally happened – happened` )
  ( `It finally happened – ooh woh` ) ).
