#子查询 
#where 中的子查询，找出比最低工资高的员工
SELECT ename FROM emp
WHERE sal > (SELECT MIN(sal) FROM emp)

#from 中的子查询，可以把子查询的结果当成一张临时表
#找出每个岗位平均工资的工资等级
SELECT s.grade,a.avgsal,a.job
FROM salgrade s
JOIN (SELECT AVG(sal) AS avgsal,job FROM emp GROUP BY job) a 
ON a.avgsal BETWEEN s.losal AND s.hisal

#select 后的子查询
#找出每个员工名部门名
SELECT LOWER(e.ename) 员工,
(SELECT d.dname FROM dept d WHERE e.deptno = d.deptno) AS 部门
FROM emp e 

#union 结果集合并
#效率更高，union可以减少匹配次数还可以完成连个结果集拼接
#union要求两个结果集列数相同
#orcle 要求类型也要一致
SELECT * FROM emp WHERE job = 'manager'
UNION 
SELECT * FROM emp WHERE job = 'salesman'

#limit
#工资降序取前五
SELECT * FROM emp
ORDER BY sal DESC
LIMIT 5

#完整用法
#limit satrtindex length
#缺省用法
#limit len 去除len个
#下标从0开始
#工资降序取3-5
SELECT * FROM emp
ORDER BY sal DESC
LIMIT 2,3

#工资降序取5-9
SELECT * FROM emp
ORDER BY sal DESC
LIMIT 4,4

#分页
SELECT * FROM emp
ORDER BY sal DESC
LIMIT (pagesize*(pageno-1)),pagesize