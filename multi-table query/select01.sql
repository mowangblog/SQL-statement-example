#去除重复数据
SELECT DISTINCT job,deptno FROM emp

#统计工作岗位数量
SELECT COUNT(DISTINCT job) FROM emp

#连接查询.没有条件限制会发生笛卡尔积现象，查询出15*4条数据
#92语法 #等值连接
SELECT LOWER(d.dname) 部门,LOWER(e.ename) 员工 
FROM dept d,emp e 
WHERE e.deptno = d.deptno

#99语法
SELECT LOWER(d.dname) 部门,LOWER(e.ename) 员工 
FROM dept d INNER JOIN emp e 
ON e.deptno = d.deptno

#找出每个员工的薪资等级，显示员工姓名，薪资，薪资等级
#非等值连接
SELECT e.ename,e.sal,s.grade FROM emp e
INNER JOIN salgrade s
ON e.sal BETWEEN s.losal AND s.hisal

#查询员工的领导，显示员工名和领导名 #自连接
SELECT e.ename 员工,h.ename 领导 
FROM emp e
INNER JOIN emp h
ON e.mgr = h.empno
