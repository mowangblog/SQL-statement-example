#多行处理函数(分组函数)输入多行输出一行
#多行处理函数在使用时必须进行分组才能用
#没有分组整张表默认为一组
#五个 count计数 sum求和 avg平均值 max最大值 min最小值

#找出最高和最低工资
SELECT MAX(sal) FROM emp
SELECT MIN(sal) FROM emp

#计算工资和
SELECT SUM(sal) FROM emp

#计算员工数量
SELECT COUNT(*) FROM emp

#计算平均工资
SELECT AVG(sal) FROM emp

#注意事项1 分组函数会忽略null
SELECT COUNT(comm) FROM emp

#注意事项2 count（*）统计一共一共多少行，而count列只会统计不为空的
SELECT COUNT(*) FROM emp

#注意事项3 分组函数不能直接使用在where 子句中
SELECT * FROM emp WHERE sal > MIN(sal)

#分组查询非常重要
#计算每个部门的总工资
SELECT SUM(sal) AS 部门总工资,deptno AS 部门 FROM emp GROUP BY deptno

#计算每个岗位的平均工资
SELECT AVG(sal) AS avgSal,JOB FROM emp GROUP BY job

#计算每个岗位的工资和
SELECT SUM(sal) AS salSum,JOB FROM emp GROUP BY JOB

#如果有GROUP BY那么select 只能跟分组函数和参与分组的字段，其他字段没有意义

#找出每个部门不同岗位的最高工资
SELECT MAX(sal) AS 最高工资,deptno AS 部门,job  
FROM emp GROUP BY deptno,job 
ORDER BY deptno

#找出每个部门最高薪资，要求显示最高薪资大于3000的
SELECT MAX(sal) AS 最高工资,deptno AS 部门 
FROM emp WHERE sal>3000  GROUP BY deptno
ORDER BY deptno

SELECT MAX(sal) AS 最高工资,deptno AS 部门 
FROM emp GROUP BY deptno HAVING 最高工资>3000
ORDER BY deptno

#找出每个部门平均工资大于2500
SELECT AVG(sal) AS 平均工资,deptno AS 部门 
FROM emp GROUP BY deptno HAVING 平均工资>2500
ORDER BY deptno

#计算每个岗位的平均工资，大于1500的，除manager外，降序排
SELECT AVG(sal) AS avgSal,JOB
FROM emp 
WHERE job !='manager'
GROUP BY job HAVING avgSal > 1500
ORDER BY avgSal DESC