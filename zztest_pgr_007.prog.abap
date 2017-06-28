*&---------------------------------------------------------------------*
*& Report ZZTEST_PGR_007
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZZTEST_PGR_007.

DATA(key) = 'LH'.
DATA(sql) = NEW cl_sql_statement( ).

sql->set_param( REF #( sy-mandt ) ).
*sql->set_param( REF #( key ) ).

DATA(result) = sql->execute_query(
      `SELECT carrname ` &&
      `FROM scarr ` &&
      `WHERE mandt  = ?` ).

DATA lv_name TYPE S_CARRNAME.
result->set_param( REF #( lv_name ) ).
result->next( ).
result->next( ).
break pgrzadziel.
