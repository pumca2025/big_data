REGISTER 'udf.py' USING jython AS pyudf;

A = LOAD '/home/hari/emp_det.txt' USING PigStorage(',');
B = FOREACH A GENERATE $0, pyudf.get_length($0);
DUMP B;

A = LOAD '/home/hari/emp_det.txt' USING PigStorage(',') 
AS (id:int,name:chararray,age:int,salary:int);

B = LOAD '/home/hari/emp_det2.txt' USING PigStorage(',') 
AS (id:int,location:chararray,qualification:chararray,designation:chararray);

join_data = JOIN A BY id, B BY id;

SPLIT A INTO X IF age==22, Y IF age>=23;
DUMP X;
DUMP Y;

grade_grp = GROUP A BY name;
grade_avg = FOREACH grade_grp GENERATE A.name,A.age,AVG(A.salary);
DUMP grade_avg;

cogroup_data = COGROUP A BY id, B BY id;
DUMP cogroup_data;

M = FOREACH A GENERATE TOMAP(name,age);
DUMP M;