  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "V_TMP_COUNTRY_DATA_RANKING" ("COUNTRY_CODE","DIM_INDICATOR_CODE", "INDICATOR_VALUE_YEAR_MINUS_10", "INDICATOR_VALUE_YEAR_MINUS_9", "INDICATOR_VALUE_YEAR_MINUS_8", "INDICATOR_VALUE_YEAR_MINUS_7", "INDICATOR_VALUE_YEAR_MINUS_6", "INDICATOR_VALUE_YEAR_MINUS_5", "INDICATOR_VALUE_YEAR_MINUS_4", "INDICATOR_VALUE_YEAR_MINUS_3", "INDICATOR_VALUE_YEAR_MINUS_2", "INDICATOR_VALUE_YEAR_MINUS_1", "DRNK10", "DRNK9", "DRNK8", "DRNK7", "DRNK6", "DRNK5", "DRNK4", "DRNK3", "DRNK2", "DRNK1") AS 
  Select 
         
          a.TMP_country_code,		
          a.tmp_country_indicator_code,
          sum(a.tmp_COUNTRY_YEAR_MINUS_10) as indicator_value_year_minus_10,
          sum(a.tmp_COUNTRY_YEAR_MINUS_9)  as indicator_value_year_minus_9,
          sum(a.tmp_COUNTRY_YEAR_MINUS_8)  as indicator_value_year_minus_8,
          sum(a.tmp_COUNTRY_YEAR_MINUS_7)  as indicator_value_year_minus_7,
          sum(a.tmp_COUNTRY_YEAR_MINUS_6)  as indicator_value_year_minus_6,
          sum(a.tmp_COUNTRY_YEAR_MINUS_5)  as indicator_value_year_minus_5,
          sum(a.tmp_COUNTRY_YEAR_MINUS_4)  as indicator_value_year_minus_4,
          sum(a.tmp_COUNTRY_YEAR_MINUS_3)  as indicator_value_year_minus_3,
          sum(a.tmp_COUNTRY_YEAR_MINUS_2)  as indicator_value_year_minus_2,
          sum(a.tmp_COUNTRY_YEAR_MINUS_1)  as indicator_value_year_minus_1,
          dense_rank () over (order by 
                            sum(nvl(tmp_COUNTRY_YEAR_MINUS_10,0)) desc) as DRnk10,
          dense_rank () over (order by 
                            sum(nvl(tmp_COUNTRY_YEAR_MINUS_9,0)) desc)  as DRnk9,
          dense_rank () over (order by 
                            sum(nvl(tmp_COUNTRY_YEAR_MINUS_8,0)) desc)  as DRnk8,
          dense_rank () over (order by 
                            sum(nvl(tmp_COUNTRY_YEAR_MINUS_7,0)) desc)  as DRnk7,                
          dense_rank () over (order by 
                            sum(nvl(tmp_COUNTRY_YEAR_MINUS_6,0)) desc)  as DRnk6,  
          dense_rank () over (order by 
                            sum(nvl(tmp_COUNTRY_YEAR_MINUS_5,0)) desc)  as DRnk5,                  
          dense_rank () over (order by 
                            sum(nvl(tmp_COUNTRY_YEAR_MINUS_4,0)) desc)  as DRnk4,
          dense_rank () over (order by 
                            sum(nvl(tmp_COUNTRY_YEAR_MINUS_3,0)) desc)  as DRnk3,
          dense_rank () over (order by 
                            sum(nvl(tmp_COUNTRY_YEAR_MINUS_2,0)) desc)  as DRnk2,
          dense_rank () over (order by 
                            sum(nvl(tmp_COUNTRY_YEAR_MINUS_1,0)) desc)  as DRnk1
                    from tmp_country_data a
                  
          
    group by a.tmp_country_code,
          a.tmp_country_indicator_code,
          a.tmp_COUNTRY_YEAR_MINUS_10,
          a.tmp_COUNTRY_YEAR_MINUS_9,
          a.tmp_COUNTRY_YEAR_MINUS_8,
          a.tmp_COUNTRY_YEAR_MINUS_7,
          a.tmp_COUNTRY_YEAR_MINUS_6,
          a.tmp_COUNTRY_YEAR_MINUS_5,
          a.tmp_COUNTRY_YEAR_MINUS_4,
          a.tmp_COUNTRY_YEAR_MINUS_3,
          a.tmp_COUNTRY_YEAR_MINUS_2,
          a.tmp_COUNTRY_YEAR_MINUS_1;
           