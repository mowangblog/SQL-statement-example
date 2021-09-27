#创建表 见名知义
CREATE TABLE test (
 NAME VARCHAR(100)
)CHARSET utf8

#删除
DROP TABLE IS EXISTS test 

#插入
INSERT INTO test(NAME) VALUES('李煊1');

#查询
SELECT * FROM test

#修改
UPDATE test SET NAME='魔王' 

#当前时间
SELECT DISTINCT	NOW() FROM emp 

#快速创建表
CREATE TABLE emp_dept AS SELECT e.ename,d.dname FROM emp e JOIN dept d WHERE e.deptno AND d.deptno

#执行sql脚本
SOURCE D://xxx.sql

#非空约束 不能为空
NOT NULL

#唯一性约束 不能重复 可以为null
UNIQUE #列级约束
#两个字段联合约束
#表级约束
UNIQUE(ename,email)

#主键
#没有主键表无效 
#一个字段叫单一主键，多个字段一起约束叫复合主键
#实际开发中不建议使用复合主键
PRIMARY KEY 
#自然主键 主键是自然数和业务没关系
#业务主键 和业务紧密关联 
#不建议使用业务主键 
AUTO_INCREMENT #自增auto_increment

#外键
FOREIGN KEY(did) REFERENCES t_class(id)

#存储引擎
ENGINE

#查询存储引擎
SHOW ENGINES \G

