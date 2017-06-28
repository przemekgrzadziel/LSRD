*&---------------------------------------------------------------------*
*& Report ZZTEST_PGR_012
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZZTEST_PGR_012.

INTERFACE if.
ENDINTERFACE.

CLASS cl DEFINITION CREATE PRIVATE.
  PUBLIC SECTION.
    INTERFACES if.
    CLASS-METHODS factory RETURNING value(ref) TYPE REF TO cl.
ENDCLASS.

CLASS cl IMPLEMENTATION.
  METHOD factory.
    ref = NEW #( ).
  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.
  DATA(iref) = CAST if( cl=>factory( ) ).

  break pgrzadziel.
