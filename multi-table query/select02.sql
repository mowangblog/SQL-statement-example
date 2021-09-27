#内连接完成能匹配条件查询出来 两张表没有主次关系
SELECT LOWER(d.dname) 部门,LOWER(e.ename) 员工 
FROM dept d INNER JOIN emp e 
ON e.deptno = d.deptno

#外连接 左连接 
SELECT LOWER(d.dname) 部门,LOWER(e.ename) 员工 
FROM dept d LEFT JOIN emp e 
ON e.deptno = d.deptno

#右连接
SELECT LOWER(d.dname) 部门,LOWER(e.ename) 员工 
FROM emp e RIGHT JOIN dept d 
ON e.deptno = d.deptno

#任何一个左右连接都可以互相转换
#查询员工的领导，显示所有员工名和领导名 
SELECT e.ename 员工,h.ename 领导 
FROM emp e
LEFT JOIN emp h
ON e.mgr = h.empno

#找出每个员工部门名以及工资等级，显示员工名，部门名，工资等级
SELECT e.ename 员工,e.sal 工资,h.ename 领导名,d.dname 部门,s.grade 工资等级
FROM emp e
LEFT JOIN emp h
ON e.mgr = h.empno
JOIN dept d
ON e.deptno = d.deptno
JOIN `salgrade` s
ON e.sal BETWEEN s.losal AND s.hisal