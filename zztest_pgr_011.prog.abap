*&---------------------------------------------------------------------*
*& Report ZZTEST_PGR_011
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZZTEST_PGR_011.

*Before release 7.40
DATA structdescr TYPE REF TO cl_abap_structdescr.
structdescr ?= cl_abap_typedescr=>describe_by_name( 'T100' ).

DATA components  TYPE abap_compdescr_tab.
components = structdescr->components.

*With release 7.40
DATA(lt_components) = CAST cl_abap_structdescr( cl_abap_typedescr=>describe_by_name( 'T100' ) )->components.
*DATA(lt_components) = cl_abap_structdescr( cl_abap_typedescr=>describe_by_name( 'T100' ) )->components.

break pgrzadziel.
