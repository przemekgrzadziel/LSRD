*&---------------------------------------------------------------------*
*& Report ZZTEST_PGR_022
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zztest_pgr_022.

TYPES: BEGIN OF ty_ship,
           tknum TYPE tknum,
           name  TYPE ernam,
           city  TYPE ort01,
           route TYPE route,
       END OF ty_ship.
TYPES: ty_ships TYPE SORTED TABLE OF ty_ship WITH UNIQUE KEY tknum.
TYPES: ty_citys TYPE STANDARD TABLE OF ort01 WITH EMPTY KEY.

DATA: gt_ships TYPE ty_ships,
      ls_ships  TYPE ty_ship.
*1
ls_ships-tknum = '001'.
ls_ships-name  = 'John'.
ls_ships-city  = 'Melbourne'.
ls_ships-route = 'R0001'.

APPEND ls_ships TO gt_ships[].

*2
ls_ships-tknum = '002'.
ls_ships-name  = 'Gavin'.
ls_ships-city  = 'Sydney'.
ls_ships-route = 'R0003'.

APPEND ls_ships TO gt_ships[].
*3
ls_ships-tknum = '003'.
ls_ships-name  = 'Lucy'.
ls_ships-city  = 'Adelaide'.
ls_ships-route = 'R0001'.

APPEND ls_ships TO gt_ships[].
*4
ls_ships-tknum = '004'.
ls_ships-name  = 'Elaine'.
ls_ships-city  = 'Perth'.
ls_ships-route = 'R0003'.

APPEND ls_ships TO gt_ships[].

*--------------------------------------------------------------------*
*Before 7.40
*--------------------------------------------------------------------*
DATA: gt_citys TYPE ty_citys,
      gs_ship  TYPE ty_ship,
      gs_city  TYPE ort01.

LOOP AT gt_ships INTO gs_ship.
  gs_city =  gs_ship-city.
  APPEND gs_city TO gt_citys.
ENDLOOP.

*--------------------------------------------------------------------*
*With 7.40
*--------------------------------------------------------------------*
DATA(gt_citys_2) = VALUE ty_citys( FOR ls_ship IN gt_ships ( ls_ship-city ) ).


*--------------------------------------------------------------------*
*Before 7.40
*--------------------------------------------------------------------*
LOOP AT gt_ships INTO gs_ship WHERE route = 'R0001'.
  gs_city =  gs_ship-city.
  APPEND gs_city TO gt_citys.
ENDLOOP.

*--------------------------------------------------------------------*
*With 7.40
*--------------------------------------------------------------------*
DATA(gt_citys_3) = VALUE ty_citys( FOR ls_ship_3 IN gt_ships
                               WHERE ( route = 'R0001' ) ( ls_ship_3-city ) ).

break pgrzadziel.
