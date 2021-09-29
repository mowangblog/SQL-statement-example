#21，列出薪水高于公司平均工资的所有员工，所在部门，上级领导，工资等级
SELECT e.ename AS 员工,e.sal AS 薪水,d.dname AS 部门,h.ename AS 上级领导,s.grade AS 工资等级
FROM emp e
LEFT JOIN dept d
ON d.deptno = e.deptno
LEFT JOIN emp h
ON e.mgr = h.empno
LEFT JOIN salgrade s
ON e.sal BETWEEN s.losal AND s.hisal
WHERE e.sal > (SELECT AVG(sal) FROM emp)

#22，列出所有和scott从事相同工作的所有员工和部门名称
SELECT e.ename,d.dname
FROM emp e
JOIN dept d
ON d.deptno = e.deptno
WHERE job = (SELECT job FROM emp WHERE ename = 'scott')
AND ename <> 'scott'

#23，列出薪水等于部门30中员工薪水的其他员工的姓名和薪水
SELECT e.ename,e.sal
FROM emp e
WHERE sal IN (SELECT sal FROM emp WHERE deptno = 30)
AND e.deptno <> 30

#24，列出薪水高于部门30中员工薪水的其他员工的姓名和薪水
SELECT e.ename,e.sal
FROM emp e
WHERE sal > (SELECT MAX(sal) FROM emp WHERE deptno = 30)
AND e.deptno <> 30

#25，列出在每个部门工作的员工数量，平均工资和平均服务期限
SELECT d.dname,COUNT(e.ename) COUNT,IFNULL(AVG(e.sal),0) avgSal,AVG(TIMESTAMPDIFF(YEAR,e.hiredate,NOW())) AS DATE
FROM dept d 
LEFT JOIN emp e
ON e.deptno = d.deptno
GROUP BY d.dname

#26，列出所有员工的姓名，部门和工资
SELECT e.ename,e.sal,t.dname
FROM emp e
LEFT JOIN dept t
ON t.deptno = e.deptno

#27，列出所有部门的详细信息和人数
SELECT d.*,COUNT(e.ename) nums
FROM dept d
LEFT JOIN emp e
ON e.deptno = d.deptno
GROUP BY d.deptno

#28，列出各种工作的最低工资和从事工作的员工姓名
SELECT t.minSal,t.job,e.ename
FROM 
(SELECT MIN(sal) minSal,job
FROM emp GROUP BY job) AS t
LEFT JOIN emp e
ON e.job  = t.job AND e.sal = t.minSal
ORDER BY job

#29，列出各个部门的领导的最低工资
SELECT MIN(sal) minSal,e.ename,e.job,d.dname
FROM dept d
JOIN emp e
ON e.deptno = d.deptno
WHERE e.job = 'manager'
GROUP BY d.dname

#30，列出多有员工的年工资，按照从低到高排序
SELECT (sal+IFNULL(comm,0))*12 yearSal,ename
FROM emp 
ORDER BY yearSal 

#31，求出员工领导薪水大于3000的员工名称和领导名称
SELECT e.ename,h.ename,h.sal
FROM emp e 
JOIN emp h
ON h.empno = e.mgr
WHERE h.sal > 3000

#32，求出部门名称中，带‘S’字符的部门的员工的工资合计，部门人数
SELECT SUM(e.sal) totalSal,d.dname,COUNT(e.ename) nums
FROM dept d
LEFT JOIN emp e
ON e.deptno = d.deptno
WHERE d.dname LIKE "%S%"
GROUP BY d.dname,d.deptno,d.loc

#33，给任职超过30年的员工加薪水10%
UPDATE emp 
SET sal = sal*1.1
WHERE TIMESTAMPDIFF(YEAR,hiredate,NOW()) > 30
	