A = LOAD '/home/hari/minMax.txt' USING PigStorage(',') AS (year:int,temp:int);
B = GROUP A BY year;
C = FOREACH B GENERATE group,MAX(A.temp),MIN(A.temp);
DUMP C;