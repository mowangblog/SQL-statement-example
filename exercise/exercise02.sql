#11，取得最后入职的五名员工
SELECT ename,hiredate
FROM emp
ORDER BY hiredate DESC
LIMIT 5

#12，取得每个薪水等级有多少员工
SELECT s.grade AS 薪水等级,COUNT(*) AS 员工个数
FROM emp e
JOIN salgrade s
ON e.sal BETWEEN s.losal AND s.hisal
GROUP BY s.grade

#13，列出所有员工及领导姓名
SELECT e.ename AS 员工,h.ename AS 领导
FROM emp e
LEFT JOIN emp h
ON e.mgr = h.empno

#14，列出受雇日期早与其直接上级的员工编号，姓名，部门名称
SELECT e.ename AS 员工,e.hiredate AS 入职时间,h.ename AS 领导,h.hiredate AS 领导入职时间,d.dname AS 部门
FROM emp e
JOIN emp h
ON e.mgr = h.empno AND e.hiredate < h.hiredate
JOIN dept d
ON d.deptno = e.deptno

#15，列出部门名称和这些部门的员工信息，同时列出哪些没有员工的部门
SELECT d.dname,e.*
FROM dept d
LEFT JOIN emp e
ON e.deptno = d.deptno
ORDER BY d.dname

#16，列出至少有五个员工的所有部门
SELECT e.deptno
FROM emp e
GROUP BY e.deptno 
HAVING COUNT(*) >= 5

#17，列出工资比Smith高的员工
SELECT ename,sal
FROM emp
WHERE sal > (SELECT sal FROM emp WHERE ename = 'smith')

#18，列出所有职务是clerk的姓名和部门名称，部门人数
SELECT e.ename,d.dname,(SELECT COUNT(*)
FROM emp
GROUP BY deptno  HAVING deptno = d.deptno) nums 
FROM emp e
JOIN dept d
ON d.deptno = e.deptno
WHERE e.job = 'clerk'

#19，列出最低工资大于1500的工作和从事这个工作的人数
SELECT job,COUNT(job) nums
FROM emp
GROUP BY job HAVING MIN(sal) >1500

#20，列出在销售部sales工作的员工姓名
SELECT e.ename,e.deptno
FROM emp e
WHERE e.deptno = (SELECT deptno FROM dept WHERE dname = 'sales')



