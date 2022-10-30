  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "V_TMP_COUNTRY_DATA_RANKING" AS
  Select 
         
          a.TMP_country_code,		
          a.tmp_country_indicator_code,
     
          dense_rank () over (partition by tmp_country_indicator_code  order by 
                            sum(nvl(tmp_COUNTRY_YEAR_MINUS_10,0)) desc) as DRnk10,
          dense_rank () over (partition by tmp_country_indicator_code  order by 
                            sum(nvl(tmp_COUNTRY_YEAR_MINUS_9,0)) desc)  as DRnk9,
          dense_rank () over (partition by tmp_country_indicator_code order by 
                            sum(nvl(tmp_COUNTRY_YEAR_MINUS_8,0)) desc)  as DRnk8,
          dense_rank () over (partition by tmp_country_indicator_code  order by 
                            sum(nvl(tmp_COUNTRY_YEAR_MINUS_7,0)) desc)  as DRnk7,                
          dense_rank () over (partition by tmp_country_indicator_code order by 
                            sum(nvl(tmp_COUNTRY_YEAR_MINUS_6,0)) desc)  as DRnk6,  
          dense_rank () over (partition by tmp_country_indicator_code  order by 
                            sum(nvl(tmp_COUNTRY_YEAR_MINUS_5,0)) desc)  as DRnk5,                  
          dense_rank () over (partition by tmp_country_indicator_code order by 
                            sum(nvl(tmp_COUNTRY_YEAR_MINUS_4,0)) desc)  as DRnk4,
          dense_rank () over (partition by tmp_country_indicator_code order by 
                            sum(nvl(tmp_COUNTRY_YEAR_MINUS_3,0)) desc)  as DRnk3,
          dense_rank () over (partition by tmp_country_indicator_code order by 
                            sum(nvl(tmp_COUNTRY_YEAR_MINUS_2,0)) desc)  as DRnk2,
          dense_rank () over (partition by tmp_country_indicator_code order by 
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
           COMMIT;