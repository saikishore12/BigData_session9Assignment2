data_dictionery = LOAD 'data_dictionery.txt' USING PigStorage(',') AS (Name:chararray,Col_Undertaken:chararray, Dob:chararray,stream:chararray,Grade:float,state:chararray,city:chararray);
data_dictionery_no_header= filter data_dictionery by Name != 'Name';
dump data_dictionery_no_header;
data_dictionery_filter= foreach data_dictionery_no_header generate Name,state,Stream;
data_dictionery_filter1 = filter data_dictionery_filter by (state == 'Oregon' and Stream == 'BE');
dump data_dictionery_filter1;