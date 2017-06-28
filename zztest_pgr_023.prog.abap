*&---------------------------------------------------------------------*
*& Report ZZTEST_PGR_023
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zztest_pgr_023.

TYPES: BEGIN OF ty_line,
    col1 TYPE i,
    col2 TYPE i,
    col3 TYPE i,
  END OF ty_line,
  ty_tab TYPE STANDARD TABLE OF ty_line WITH EMPTY KEY.

*--------------------------------------------------------------------*
*Before 7.40
*--------------------------------------------------------------------*
  DATA: gt_itab TYPE ty_tab,
        j       TYPE i.
FIELD-SYMBOLS <ls_tab> TYPE ty_line.

j = 1.
DO.
j = j + 1.
IF j > 4000000. EXIT. ENDIF.
APPEND INITIAL LINE TO gt_itab ASSIGNING <ls_tab>.
<ls_tab>-col1 = j.
<ls_tab>-col2 = j + 1.
<ls_tab>-col3 = j + 2.
ENDDO.
*--------------------------------------------------------------------*
*With 7.40
*--------------------------------------------------------------------*
DATA(gt_itab_2) = VALUE ty_tab( FOR j_2 = 1 THEN j_2 + 1 UNTIL j_2 > 4000000
                            ( col1 = j_2 col2 = j_2 + 1 col3 = j_2 + 2  ) ).


break pgrzadziel.
