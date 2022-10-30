Run the following table creation and update statements in the following order:

1. CREATE_USER.sql

Connect to the oracle DB using the newly created user : C##MCB

This is a common user. By default, a common user should begin with C##.

Note: Being in the container database (CDB) local user creation not allowed. 
Unable to switch to pluggable database (PDB) due to missing admin privileges on my machine, common user C##MCB was created for this project.

2. TABLE_SPACE_CREATION.sql
2. TMP_COUNTRY.sql
3. TMP_COUNTRY_DATA.sql
4. TMP_INDICATOR.sql
5. DIM_COUNTRY.sql
6. DIM_INDICATOR.sql
7. FACT_COUNTRY_DATA.sql
9. V_TMP_COUNTRY_RANKING_DATA.sql
9. INIT_MISSING_DATA.sql
