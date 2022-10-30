CREATE TABLE FACT_COUNTRY_DATA (

FACT_COUNTRY_DATA_ID                NUMBER(15,0)  NOT NULL,
DIM_COUNTRY_ID                      NUMBER(15,0)  NOT NULL,
DIM_INDICATOR_ID                    NUMBER(15,0)  NOT NULL,
FACT_COUNTRY_YEAR_MINUS_10          NUMBER (38,5),
FACT_COUNTRY_YEAR_MINUS_9           NUMBER (38,5),
FACT_COUNTRY_YEAR_MINUS_8           NUMBER (38,5),
FACT_COUNTRY_YEAR_MINUS_7           NUMBER (38,5),
FACT_COUNTRY_YEAR_MINUS_6           NUMBER (38,5),
FACT_COUNTRY_YEAR_MINUS_5           NUMBER (38,5),
FACT_COUNTRY_YEAR_MINUS_4           NUMBER (38,5),
FACT_COUNTRY_YEAR_MINUS_3           NUMBER (38,5),
FACT_COUNTRY_YEAR_MINUS_2           NUMBER (38,5),
FACT_COUNTRY_YEAR_MINUS_1           NUMBER (38,5),
FACT_COUNTRY_RANK_YEAR_MINUS_10     NUMBER(15,0),
FACT_COUNTRY_RANK_YEAR_MINUS_9      NUMBER(15,0),
FACT_COUNTRY_RANK_YEAR_MINUS_8      NUMBER(15,0),
FACT_COUNTRY_RANK_YEAR_MINUS_7      NUMBER(15,0),
FACT_COUNTRY_RANK_YEAR_MINUS_6      NUMBER(15,0),
FACT_COUNTRY_RANK_YEAR_MINUS_5      NUMBER(15,0),
FACT_COUNTRY_RANK_YEAR_MINUS_4      NUMBER(15,0),
FACT_COUNTRY_RANK_YEAR_MINUS_3      NUMBER(15,0),
FACT_COUNTRY_RANK_YEAR_MINUS_2      NUMBER(15,0),
FACT_COUNTRY_RANK_YEAR_MINUS_1      NUMBER(15,0),
META_INSERTION_DATE                 DATE, 
META_DATA_SOURCE                    VARCHAR2(20),

CONSTRAINT PK_FACT_COUNTRY_DATA PRIMARY KEY (FACT_COUNTRY_DATA_ID)

using index TABLESPACE FAC_INDEX
) 
TABLESPACE FAC_DATA;

ALTER TABLE FACT_COUNTRY_DATA ADD CONSTRAINT FK_COUNTRY FOREIGN KEY (DIM_COUNTRY_ID) REFERENCES DIM_COUNTRY(COUNTRY_ID);
ALTER TABLE FACT_COUNTRY_DATA ADD CONSTRAINT FK_INDICATOR FOREIGN KEY (DIM_INDICATOR_ID) REFERENCES DIM_INDICATOR(DIM_INDICATOR_ID);

CREATE INDEX FK_DIM_COUNTRY_ID ON FACT_COUNTRY_DATA (DIM_COUNTRY_ID ASC) TABLESPACE FAC_INDEX;
CREATE INDEX FK_DIM_INDICATOR_ID ON FACT_COUNTRY_DATA (DIM_INDICATOR_ID ASC) TABLESPACE FAC_INDEX;


--INITIALIATION
INSERT INTO FACT_COUNTRY_DATA (FACT_COUNTRY_DATA_ID,
                               DIM_COUNTRY_ID,
							   DIM_INDICATOR_ID,
							   FACT_COUNTRY_YEAR_MINUS_10,
							   FACT_COUNTRY_YEAR_MINUS_9,
							   FACT_COUNTRY_YEAR_MINUS_8,
							   FACT_COUNTRY_YEAR_MINUS_7,
							   FACT_COUNTRY_YEAR_MINUS_6,
							   FACT_COUNTRY_YEAR_MINUS_5,
							   FACT_COUNTRY_YEAR_MINUS_4,
							   FACT_COUNTRY_YEAR_MINUS_3,
							   FACT_COUNTRY_YEAR_MINUS_2,
							   FACT_COUNTRY_YEAR_MINUS_1,
							   FACT_COUNTRY_RANK_YEAR_MINUS_10,
							   FACT_COUNTRY_RANK_YEAR_MINUS_9,
							   FACT_COUNTRY_RANK_YEAR_MINUS_8,
							   FACT_COUNTRY_RANK_YEAR_MINUS_7,
							   FACT_COUNTRY_RANK_YEAR_MINUS_6,
							   FACT_COUNTRY_RANK_YEAR_MINUS_5,
							   FACT_COUNTRY_RANK_YEAR_MINUS_4,
							   FACT_COUNTRY_RANK_YEAR_MINUS_3,
							   FACT_COUNTRY_RANK_YEAR_MINUS_2,
							   FACT_COUNTRY_RANK_YEAR_MINUS_1,
							   META_INSERTION_DATE,
							   META_DATA_SOURCE
							   )
VALUES (-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'01-01-1990','INIT');

CREATE SEQUENCE SEQ_FACT_COUNTRY_DATA
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

COMMENT ON TABLE  FACT_COUNTRY_DATA                                    IS  'TABLE OF FACT_COUNTRY_DATA';
COMMENT ON COLUMN FACT_COUNTRY_DATA.FACT_COUNTRY_DATA_ID               IS  'TECHNICAL UNIQUE IDENTIFIER OF COUNTRY DATA';
COMMENT ON COLUMN FACT_COUNTRY_DATA.DIM_COUNTRY_ID                     IS  'FOREIGN KEY OF COUNTRY ID';
COMMENT ON COLUMN FACT_COUNTRY_DATA.DIM_INDICATOR_ID                   IS  'FOREIGN KEY OF INDICATOR ID';
COMMENT ON COLUMN FACT_COUNTRY_DATA.FACT_COUNTRY_YEAR_MINUS_10         IS  'INDICATOR VALUE FOR CURRENT YEAR MINUS 10';
COMMENT ON COLUMN FACT_COUNTRY_DATA.FACT_COUNTRY_YEAR_MINUS_9          IS  'INDICATOR VALUE FOR CURRENT YEAR_MINUS_9';
COMMENT ON COLUMN FACT_COUNTRY_DATA.FACT_COUNTRY_YEAR_MINUS_8          IS  'INDICATOR VALUE FOR CURRENT YEAR_MINUS_8';
COMMENT ON COLUMN FACT_COUNTRY_DATA.FACT_COUNTRY_YEAR_MINUS_7          IS  'INDICATOR VALUE FOR CURRENT YEAR_MINUS_7';
COMMENT ON COLUMN FACT_COUNTRY_DATA.FACT_COUNTRY_YEAR_MINUS_6          IS  'INDICATOR VALUE FOR CURRENT YEAR_MINUS_6';
COMMENT ON COLUMN FACT_COUNTRY_DATA.FACT_COUNTRY_YEAR_MINUS_5          IS  'INDICATOR VALUE FOR CURRENT YEAR_MINUS_5';
COMMENT ON COLUMN FACT_COUNTRY_DATA.FACT_COUNTRY_YEAR_MINUS_4          IS  'INDICATOR VALUE FOR CURRENT YEAR_MINUS_4';
COMMENT ON COLUMN FACT_COUNTRY_DATA.FACT_COUNTRY_YEAR_MINUS_3          IS  'INDICATOR VALUE FOR CURRENT YEAR_MINUS_3';
COMMENT ON COLUMN FACT_COUNTRY_DATA.FACT_COUNTRY_YEAR_MINUS_2          IS  'INDICATOR VALUE FOR CURRENT YEAR_MINUS_2';
COMMENT ON COLUMN FACT_COUNTRY_DATA.FACT_COUNTRY_YEAR_MINUS_1          IS  'INDICATOR VALUE FOR CURRENT YEAR_MINUS_1';
COMMENT ON COLUMN FACT_COUNTRY_DATA.FACT_COUNTRY_RANK_YEAR_MINUS_10    IS  'INDICATOR RANK  FOR CURRENT YEAR MINUS 10';
COMMENT ON COLUMN FACT_COUNTRY_DATA.FACT_COUNTRY_RANK_YEAR_MINUS_9     IS  'INDICATOR RANK  FOR CURRENT YEAR MINUS 9';
COMMENT ON COLUMN FACT_COUNTRY_DATA.FACT_COUNTRY_RANK_YEAR_MINUS_8     IS  'INDICATOR RANK  FOR CURRENT YEAR MINUS 8';
COMMENT ON COLUMN FACT_COUNTRY_DATA.FACT_COUNTRY_RANK_YEAR_MINUS_7     IS  'INDICATOR RANK  FOR CURRENT YEAR MINUS 7';
COMMENT ON COLUMN FACT_COUNTRY_DATA.FACT_COUNTRY_RANK_YEAR_MINUS_6     IS  'INDICATOR RANK  FOR CURRENT YEAR MINUS 6';
COMMENT ON COLUMN FACT_COUNTRY_DATA.FACT_COUNTRY_RANK_YEAR_MINUS_5     IS  'INDICATOR RANK  FOR CURRENT YEAR MINUS 5';
COMMENT ON COLUMN FACT_COUNTRY_DATA.FACT_COUNTRY_RANK_YEAR_MINUS_4     IS  'INDICATOR RANK  FOR CURRENT YEAR MINUS 4';
COMMENT ON COLUMN FACT_COUNTRY_DATA.FACT_COUNTRY_RANK_YEAR_MINUS_3     IS  'INDICATOR RANK  FOR CURRENT YEAR MINUS 3';
COMMENT ON COLUMN FACT_COUNTRY_DATA.FACT_COUNTRY_RANK_YEAR_MINUS_2     IS  'INDICATOR RANK  FOR CURRENT YEAR MINUS 1';
COMMENT ON COLUMN FACT_COUNTRY_DATA.META_INSERTION_DATE                IS  'META_INSERTION_DATE';
COMMENT ON COLUMN FACT_COUNTRY_DATA.META_DATA_SOURCE                   IS  'META_DATA_SOURCE';


CREATE OR REPLACE TRIGGER FACT_COUNTRY_DATA_ON_INSERT
BEFORE INSERT ON FACT_COUNTRY_DATA
FOR EACH ROW

BEGIN
SELECT SEQ_FACT_COUNTRY_DATA.NEXTVAL
INTO :NEW.FACT_COUNTRY_DATA_ID
FROM DUAL;
END;
/