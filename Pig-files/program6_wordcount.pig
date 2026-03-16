Input_data = LOAD '/home/hari/bigdata.txt' AS (line:chararray);
token = FOREACH Input_data GENERATE FLATTEN(TOKENIZE(line)) AS word;
group_data = GROUP token BY word;
count_word = FOREACH group_data GENERATE group AS word, COUNT(token) AS count;
order_data = ORDER count_word BY count DESC;
DUMP order_data;