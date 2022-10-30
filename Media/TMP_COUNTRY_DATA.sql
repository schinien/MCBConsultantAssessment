CREATE TABLE TMP_COUNTRY_DATA (

TMP_COUNTRY_DATA_ID                NUMBER(15,0)  NOT NULL,
TMP_COUNTRY_CODE                   VARCHAR2(100) NOT NULL,
TMP_COUNTRY_INDICATOR_CODE         VARCHAR2(100),
TMP_COUNTRY_YEAR_MINUS_10          NUMBER (38,5),
TMP_COUNTRY_YEAR_MINUS_9           NUMBER (38,5),
TMP_COUNTRY_YEAR_MINUS_8           NUMBER (38,5),
TMP_COUNTRY_YEAR_MINUS_7           NUMBER (38,5),
TMP_COUNTRY_YEAR_MINUS_6           NUMBER (38,5),
TMP_COUNTRY_YEAR_MINUS_5           NUMBER (38,5),
TMP_COUNTRY_YEAR_MINUS_4           NUMBER (38,5),
TMP_COUNTRY_YEAR_MINUS_3           NUMBER (38,5),
TMP_COUNTRY_YEAR_MINUS_2           NUMBER (38,5),
TMP_COUNTRY_YEAR_MINUS_1           NUMBER (38,5),
TMP_COUNTRY_DATA_SOURCE            VARCHAR2(20),

CONSTRAINT PK_TMP_COUNTRY_DATA PRIMARY KEY (TMP_COUNTRY_DATA_ID)
using index TABLESPACE DIM_INDEX
) 
TABLESPACE DIM_DATA;


--INITIALIATION
INSERT INTO TMP_COUNTRY_DATA (TMP_COUNTRY_DATA_ID,
TMP_COUNTRY_CODE,TMP_COUNTRY_INDICATOR_CODE,TMP_COUNTRY_YEAR_MINUS_10,
TMP_COUNTRY_YEAR_MINUS_9,TMP_COUNTRY_YEAR_MINUS_8,TMP_COUNTRY_YEAR_MINUS_7,TMP_COUNTRY_YEAR_MINUS_6,TMP_COUNTRY_YEAR_MINUS_5,TMP_COUNTRY_YEAR_MINUS_4,TMP_COUNTRY_YEAR_MINUS_3,TMP_COUNTRY_YEAR_MINUS_2,TMP_COUNTRY_YEAR_MINUS_1,TMP_COUNTRY_DATA_SOURCE)
VALUES (-1,'#NA','#NA',-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'INIT');

CREATE SEQUENCE SEQ_TMP_COUNTRY_DATA
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

COMMENT ON TABLE  TMP_COUNTRY_DATA                                   IS  'TABLE OF TMP_COUNTRY_DATA';
COMMENT ON COLUMN TMP_COUNTRY_DATA.TMP_COUNTRY_DATA_ID               IS  'TECHNICAL UNIQUE IDENTIFIER OF COUNTRY DATA';
COMMENT ON COLUMN TMP_COUNTRY_DATA.TMP_COUNTRY_CODE                  IS  'COUNTRY CODE';
COMMENT ON COLUMN TMP_COUNTRY_DATA.TMP_COUNTRY_INDICATOR_CODE        IS  'COUNTRY INDICATOR CODE';
COMMENT ON COLUMN TMP_COUNTRY_DATA.TMP_COUNTRY_YEAR_MINUS_10         IS  'CURRENT YEAR MINUS 10';
COMMENT ON COLUMN TMP_COUNTRY_DATA.TMP_COUNTRY_YEAR_MINUS_9          IS  'COUNTRY YEAR_MINUS_9';
COMMENT ON COLUMN TMP_COUNTRY_DATA.TMP_COUNTRY_YEAR_MINUS_8          IS  'COUNTRY YEAR_MINUS_8';
COMMENT ON COLUMN TMP_COUNTRY_DATA.TMP_COUNTRY_YEAR_MINUS_7          IS  'COUNTRY YEAR_MINUS_7';
COMMENT ON COLUMN TMP_COUNTRY_DATA.TMP_COUNTRY_YEAR_MINUS_6          IS  'COUNTRY YEAR_MINUS_6';
COMMENT ON COLUMN TMP_COUNTRY_DATA.TMP_COUNTRY_YEAR_MINUS_5          IS  'COUNTRY YEAR_MINUS_5';
COMMENT ON COLUMN TMP_COUNTRY_DATA.TMP_COUNTRY_YEAR_MINUS_4          IS  'COUNTRY YEAR_MINUS_4';
COMMENT ON COLUMN TMP_COUNTRY_DATA.TMP_COUNTRY_YEAR_MINUS_3          IS  'COUNTRY YEAR_MINUS_3';
COMMENT ON COLUMN TMP_COUNTRY_DATA.TMP_COUNTRY_YEAR_MINUS_2          IS  'COUNTRY YEAR_MINUS_2';
COMMENT ON COLUMN TMP_COUNTRY_DATA.TMP_COUNTRY_YEAR_MINUS_1          IS  'COUNTRY YEAR_MINUS_1';

CREATE OR REPLACE TRIGGER TMP_COUNTRY_DATA_ON_INSERT
BEFORE INSERT ON TMP_COUNTRY_DATA
FOR EACH ROW

BEGIN
SELECT SEQ_TMP_COUNTRY_DATA.NEXTVAL
INTO :NEW.TMP_COUNTRY_DATA_ID
FROM DUAL;
END;
/