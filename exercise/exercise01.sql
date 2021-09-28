#1,取得每个部门最高薪水的人员名称
SELECT e.ename,t.*
FROM emp e
JOIN (SELECT deptno,MAX(sal) maxSal FROM emp GROUP BY sal) AS t
ON t.deptno = e.deptno AND t.maxSal = e.sal

#2,哪些人的薪水在部门的平均薪水之上
SELECT e.ename,e.sal,t.avgSal,t.deptno
FROM emp e
JOIN (SELECT AVG(sal) avgSal,deptno FROM emp GROUP BY deptno) t
ON t.deptno = e.deptno AND e.sal > t.avgSal 

#3,取得部门中所有人的平均薪水等级
SELECT d.dname,AVG(s.grade)
FROM emp e 
JOIN salgrade s
ON e.sal BETWEEN s.losal AND s.hisal
JOIN dept d ON d.deptno = e.deptno
GROUP BY e.deptno

#4，不准用max,取得最高薪水，两种方案
SELECT sal
FROM emp 
ORDER BY sal DESC
LIMIT 1

SELECT sal 
FROM emp WHERE sal 
NOT IN(
SELECT DISTINCT e.sal
FROM emp e
JOIN emp t
ON e.sal < t.sal)

#5，取得平均薪资最高部门的部门编号
SELECT AVG(sal) avgSal,deptno
FROM emp 
GROUP BY deptno 
ORDER BY avgSal DESC 
LIMIT 1

SELECT AVG(sal) avgSal,deptno
FROM emp 
GROUP BY deptno HAVING avgSal = (
SELECT MAX(avgSal) FROM (
SELECT AVG(sal) avgSal,deptno
FROM emp 
GROUP BY deptno) e )

#6，取得平均薪资最高部门的部门名称
SELECT AVG(e.sal) avgSal,t.dname
FROM emp e
JOIN dept t ON t.deptno = e.deptno
GROUP BY t.dname 
ORDER BY avgSal DESC 
LIMIT 1

#7，取得平均薪资最低部门的部门名称
SELECT d.*,s.grade
FROM (
SELECT AVG(e.sal) avgSal,t.dname
FROM emp e
JOIN dept t ON t.deptno = e.deptno
GROUP BY t.dname) d
JOIN salgrade s
ON d.avgSal BETWEEN s.losal AND s.hisal
WHERE s.grade = (SELECT grade FROM salgrade WHERE (SELECT AVG(e.sal) avgSal
FROM emp e
GROUP BY deptno ORDER BY avgSal ASC LIMIT 1) BETWEEN losal AND hisal )

#取得比普通员工（不在mgr）的最高薪水还要高的领导人姓名
SELECT e.ename,e.sal
FROM emp e
WHERE e.sal > (
SELECT MAX(sal)
FROM emp 
WHERE empno NOT IN(SELECT IFNULL(mgr,0) FROM emp))





