*&---------------------------------------------------------------------*
*& Report ZZTEST_PGR_024
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zztest_pgr_024.
*--------------------------------------------------------------------*
*Before 7.40
*--------------------------------------------------------------------*
DATA: itab   TYPE TABLE OF scarr,
      wa     LIKE LINE OF itab,
      output TYPE string.

SELECT * FROM scarr INTO TABLE itab.

READ TABLE itab WITH KEY carrid = 'LH' INTO wa.

CONCATENATE 'Carrier:' wa-carrname INTO output SEPARATED BY space.

cl_demo_output=>display( output ).

*--------------------------------------------------------------------*
*With 7.40
*--------------------------------------------------------------------*
SELECT * FROM scarr INTO TABLE @DATA(lt_scarr).
  TRY .


cl_demo_output=>display( |Carrier: { lt_scarr[ carrid = 'CC' ]-carrname }|  ).
  CATCH cx_sy_itab_line_not_found.

  ENDTRY.
BREAK pgrzadziel.
