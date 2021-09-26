#查询表
SELECT * FROM emp 

#查询一个字段
SELECT e.ename FROM emp e

#条件查询 查询工资大于800的员工
SELECT * FROM emp WHERE sal > 800

#条件查询 查询津贴为空的员工
SELECT * FROM emp WHERE comm IS NULL

#条件查询 查询津贴不为空的员工
SELECT * FROM emp WHERE comm IS  NOT NULL

#条件查询 工作岗位是manager 并且工资大于2500的员工
SELECT * FROM emp WHERE job = 'manager' AND sal >2500

#条件查询 查询工资大于2500的员工部门是20h或10
SELECT * FROM emp WHERE sal >2500 AND (deptno = 20 OR deptno = 10)

#条件查询 查询工资是800或5000的员工
SELECT * FROM emp WHERE sal IN (800,5000);

#条件查询 查询工资不是800或5000的员工
SELECT * FROM emp WHERE sal NOT IN (800,5000);

#模糊查询 查询名字以t结尾的
SELECT * FROM emp WHERE ename LIKE '%T'

#模糊查询 查询名字含有o的
SELECT * FROM emp WHERE ename LIKE '%O%'

#模糊查询 查询名字以k开头的
SELECT * FROM emp WHERE ename LIKE 'K%'

#找出第二个字母是A的
SELECT * FROM emp WHERE ename LIKE '_A%'

#找出第三个字母是R的
SELECT * FROM emp WHERE ename LIKE '__R%'

#斜杠转义
SELECT * FROM emp WHERE ename LIKE '%\_%'








