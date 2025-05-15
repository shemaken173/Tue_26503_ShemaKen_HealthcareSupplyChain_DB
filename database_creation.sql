Microsoft Windows [Version 10.0.19045.5854]
(c) Microsoft Corporation. All rights reserved.

C:\Users\USER>sqlplus sys as sysdba

SQL*Plus: Release 21.0.0.0.0 - Production on Thu May 15 11:47:56 2025
Version 21.3.0.0.0

Copyright (c) 1982, 2021, Oracle.  All rights reserved.

Enter password:

Connected to:
Oracle Database 21c Enterprise Edition Release 21.0.0.0.0 - Production
Version 21.3.0.0.0

SQL> show pdbs

    CON_ID CON_NAME                       OPEN MODE  RESTRICTED
---------- ------------------------------ ---------- ----------
         2 PDB$SEED                       READ ONLY  NO
         3 ORCLPDB                        READ WRITE NO
         4 TUE_26503_PDB_ASSI             READ WRITE NO
SQL> create pluggable database  tue_26503_shemaken_HealthcareSupplyChain_DB
  2  admin user ken identified by ken
  3  FILE_NAME_CONVERT =('D:\ORACLE21C\ORADATA\ORCL\pdbseed\','D:\ORACLE21C\ORADATA\ORCL\ORCLPDB\tue_26503_shemaken_HealthcareSupplyChain\');
create pluggable database  tue_26503_shemaken_HealthcareSupplyChain_DB
*
ERROR at line 1:
ORA-65005: missing or invalid file name pattern for file -
C:\SQL\ORADATA\ORCL\PDBSEED\SYSTEM01.DBF


SQL> create pluggable database  tue_26503_shemaken_HealthcareSupplyChain_DB
  2  admin user ken identified by ken
  3  FILE_NAME_CONVERT =('c:\ORACLE21C\ORADATA\ORCL\pdbseed\','c:\ORACLE21C\ORADATA\ORCL\ORCLPDB\tue_26503_shemaken_HealthcareSupplyChain\');
create pluggable database  tue_26503_shemaken_HealthcareSupplyChain_DB
*
ERROR at line 1:
ORA-65005: missing or invalid file name pattern for file -
C:\SQL\ORADATA\ORCL\PDBSEED\SYSTEM01.DBF


SQL> show con_name

CON_NAME
------------------------------
CDB$ROOT
SQL> select con_id, tablespace_name, file_name from
  2  cdb_data_files where con_id = 3;

    CON_ID TABLESPACE_NAME
---------- ------------------------------
FILE_NAME
--------------------------------------------------------------------------------
         3 SYSTEM
C:\SQL\ORADATA\ORCL\ORCLPDB\SYSTEM01.DBF

         3 SYSAUX
C:\SQL\ORADATA\ORCL\ORCLPDB\SYSAUX01.DBF

         3 UNDOTBS1
C:\SQL\ORADATA\ORCL\ORCLPDB\UNDOTBS01.DBF


    CON_ID TABLESPACE_NAME
---------- ------------------------------
FILE_NAME
--------------------------------------------------------------------------------
         3 USERS
C:\SQL\ORADATA\ORCL\ORCLPDB\USERS01.DBF


SQL> create pluggable database  tue_26503_shemaken_HealthcareSupplyChain_DB
  2  admin user ken identified by ken
  3  FILE_NAME_CONVERT =('C:\SQL\ORADATA\ORCL\pdbseed\','C:\SQL\ORADATA\ORCL\ORCLPDB\tue_26503_shemaken_HealthcareSupplyChain\');

Pluggable database created.

SQL> show pdbs

    CON_ID CON_NAME                       OPEN MODE  RESTRICTED
---------- ------------------------------ ---------- ----------
         2 PDB$SEED                       READ ONLY  NO
         3 ORCLPDB                        READ WRITE NO
         4 TUE_26503_PDB_ASSI             READ WRITE NO
         5 TUE_26503_SHEMAKEN_HEALTHCARES MOUNTED
           UPPLYCHAIN_DB

SQL> GRANT DBA TO shemaken;
GRANT DBA TO shemaken
             *
ERROR at line 1:
ORA-01917: user or role 'SHEMAKEN' does not exist


SQL> GRANT DBA TO ken;
GRANT DBA TO ken
             *
ERROR at line 1:
ORA-01917: user or role 'KEN' does not exist


SQL> create user
  2  ;

*
ERROR at line 2:
ORA-01935: missing user or role name


SQL> ALTER PLUGGABLE DATABASE  tue_26503_shemaken_HealthcareSupplyChain_DB OPEN;

Pluggable database altered.

SQL>  ALTER PLUGGABLE DATABASE tue_26503_shemaken_HealthcareSupplyChain_DB SAVE STATE;

Pluggable database altered.

SQL>  alter session set container =  tue_26503_shemaken_HealthcareSupplyChain_DB;

Session altered.

SQL> create user ken identified by ken;
create user ken identified by ken
            *
ERROR at line 1:
ORA-01920: user name 'KEN' conflicts with another user or role name


SQL> create user ken1 identified by ken;

User created.

SQL> GRANT DBA TO ken1;

Grant succeeded.
