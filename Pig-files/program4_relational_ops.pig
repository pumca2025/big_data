A = LOAD '/home/hari/emp_det.txt' USING PigStorage(',') AS (id:int,name:chararray,age:int,salary:int);
DUMP A;

fewrecords = LIMIT A 3;
DUMP fewrecords;

agelimit = FILTER A BY age>25;
DUMP agelimit;

DESCRIBE A;

groupbyage = GROUP A BY age;
DUMP groupbyage;

maxage = FOREACH groupbyage GENERATE (A.id,A.age),MAX(A.age);
DUMP maxage;

allagevalue = GROUP A ALL;
DUMP allagevalue;

sumofsalary = FOREACH allagevalue GENERATE group,SUM(A.salary);
DUMP sumofsalary;

dist = DISTINCT A;
DUMP dist;