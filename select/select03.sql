#单行处理函数

#字符转小写lower 大写upper
SELECT LOWER(ename),LOWER(job) 
FROM emp 

#截取字符串
SELECT SUBSTR(ename,1,3) 
FROM emp

#截取字符串 首字母大写
SELECT CONCAT(UPPER(SUBSTR(ename,1,1)),SUBSTR(ename,2,LENGTH(ename))) 
FROM emp

#trim 去空格
SELECT * 
FROM emp 
WHERE ename = TRIM('   KING')

#生成随机数
SELECT ROUND(RAND()*100) AS RAND 
FROM emp

#四舍五入 后面的数字表示保留多少小数
SELECT ROUND(sal,1) 
FROM emp

#ifnull 如果有空则替代
SELECT IFNULL(comm,0) salary 
FROM emp

#计算年薪
SELECT (IFNULL(sal,0)+IFNULL(comm,0))*12 年薪,ename 
FROM emp 

#case whenm then else end
SELECT ename,sal AS oldsal,job,
(CASE job WHEN 'manager' THEN sal*1.1 WHEN 'SALESMAN' THEN sal*1.4 ELSE sal END) 
AS newsal 
FROM emp

