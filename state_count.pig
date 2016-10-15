data_dictionery = LOAD 'data_dictionery.txt' USING PigStorage(',') AS (Name:chararray,Col_Undertaken:chararray, Dob:chararray,Stream:chararray,Grade:float,state:chararray,city:chararray);
data_dictionery_no_header= filter data_dictionery by Name != 'Name';
data_dictionery_grade = FOREACH data_dictionery_no_header generate state;
data_dictionery_filter= filter data_dictionery_grade by state == 'alabama';
data_group= Group data_dictionery_filter All;
state_count = foreach data_group  Generate COUNT(data_dictionery_filter.state);
dump state_count;