*&---------------------------------------------------------------------*
*& Report ZZTEST_PGR_018
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZZTEST_PGR_018.

CLASS class DEFINITION.
  PUBLIC SECTION.
    CLASS-METHODS do_something IMPORTING p1 TYPE i
                                         p2 TYPE i
                               EXPORTING p3 TYPE i
                                         p4 TYPE i
                               RETURNING VALUE(r) TYPE i.
ENDCLASS.

CLASS class IMPLEMENTATION.
    METHOD do_something.
    ENDMETHOD.
ENDCLASS.


START-OF-SELECTION.

DATA: a1 TYPE i,
      a2 TYPE i.


IF  ( class=>do_something( EXPORTING p1 = 333
                                     p2 = 444
                           IMPORTING p3 = a1
                                     p4 = a2 ) ) = 0.

ENDIF.
