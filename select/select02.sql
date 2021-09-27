#排序，默认是升序asc 降序desc
SELECT * FROM emp ORDER BY sal DESC

#排序，按照工资升序排，如果一样按照名字排
SELECT * 
FROM emp 
ORDER BY sal ASC,ename ASC

#排序根据第二列,不建议在开发中这么写
SELECT * 
FROM emp 
ORDER BY 2 DESC

#查找排序，工资1250-3000之前的员工按照薪水降序排序
SELECT * 
FROM emp 
WHERE sal>=1250 AND sal<=3000
ORDER BY sal DESC 

SELECT * 
FROM emp 
WHERE sal BETWEEN 1250 AND 3000
ORDER BY sal DESC 
