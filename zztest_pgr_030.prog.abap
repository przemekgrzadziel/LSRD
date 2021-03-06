*&---------------------------------------------------------------------*
*& Report ZZTEST_PGR_030
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zztest_pgr_030.

TYPES: BEGIN OF ty_employee,
  name TYPE char30,
  role    TYPE char30,
  age    TYPE i,
END OF ty_employee,

ty_employee_t TYPE STANDARD TABLE OF ty_employee WITH KEY name.

DATA(gt_employee) = VALUE ty_employee_t(
( name = 'John'   role = 'ABAP guru'      age = 34 )
( name = 'Alice'  role = 'FI Consultant'  age = 42 )
( name = 'Barry'  role = 'ABAP guru'      age = 54 )
( name = 'Mary'   role = 'FI Consultant'  age = 37 )
( name = 'Arthur' role = 'ABAP guru'      age = 34 )
( name = 'Mandy'  role = 'SD Consultant'  age = 64 ) ).

DATA: gv_tot_age TYPE i,
      gv_avg_age TYPE decfloat34.

"Loop with grouping on Role
LOOP AT gt_employee INTO DATA(ls_employee)
  GROUP BY ( role  = ls_employee-role
             size  = GROUP SIZE
             index = GROUP INDEX )
  ASCENDING
  ASSIGNING FIELD-SYMBOL(<group>).

  CLEAR: gv_tot_age.
  "Output info at group level
  WRITE: / |Group: { <group>-index } Role: { <group>-role WIDTH = 15 }|
         & |     Number in this role: { <group>-size }|.

   "Loop at members of the group
   LOOP AT GROUP <group> ASSIGNING FIELD-SYMBOL(<ls_member>).
      gv_tot_age = gv_tot_age + <ls_member>-age.
      WRITE: /13 <ls_member>-name.
   ENDLOOP.

   "Average age
   gv_avg_age = gv_tot_age / <group>-size.
   WRITE: / |Average age: { gv_avg_age }|.
   SKIP.
ENDLOOP.

break pgrzadziel.
