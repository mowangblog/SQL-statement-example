## MySQL事务笔记

基于杜老师的笔记整理

### 事务特点

- 一个事务其实就是一个完整的业务逻辑。是一个最小的工作单元。不可再分。
- 什么是一个完整的业务逻辑？ 假设转账，从A账户向B账户中转账10000. 将A账户的钱减去10000（update语句） 将B账户的钱加上10000（update语句） 这就是一个完整的业务逻辑。
- 以上的操作是一个最小的工作单元，要么同时成功，要么同时失败，不可再分。这两个update语句要求必须同时成功或者同时失败，这样才能保证钱是正确的。
- insert delete update 只有以上的三个语句和事务有关系，其它都没有关系。
- 事务：就是**批量的DML语句同时成功，或者同时失败！**

### 事务的特性

| 四个特性   | 特性介绍                                                     |
| ---------- | :----------------------------------------------------------- |
| **原子性** | 说明事务是最小的工作单员，不可再分。                         |
| **一致性** | 对一个事务中的操作要求必须同时成功或者同时失败来保证事务的一致性**。** |
| **隔离性** | 不同事务之间具有隔离的特性，有不同的隔离级别，在下面会详细介绍。 |
| **持久性** | 事务的最终保障，事务提交之后将数据持久化到磁盘上。           |

### 事务隔离级别

事务有四个隔离级别

#### **读未提交：read uncommitted**

**（最低的隔离级别）《没有提交就读到了》**

- 事务A可以读取到事务B未提交的数据。
- 这种隔离级别存在的问题就是：**脏读现象**！(Dirty Read)我们称读到了脏数据。
- 这种隔离级别一般都是理论上的，大多数的数据库隔离级别都是二档起步！

#### **读已提交：read committed**

**《提交之后才能读到》**

- 事务A只能读取到事务B提交之后的数据。
- 这种隔离级别解决了解决了脏读的现象。
- 这种隔离级别不可重复读取数据。
  - 在事务开启之后，第一次读到的数据是3条，当前事务还没有结束，可能第二次再读取的时候，读到的数据是4条，3不等于4称为不可重复读取。
- 这种隔离级别是比较真实的数据，每一次读到的数据是绝对的真实。
- oracle数据库默认的隔离级别是：read committed

#### **可重复读：repeatable read**

**《提交之后也读不到，永远读取的都是刚开启事务时的数据》**

- 事务A开启之后，不管是多久，每一次在事务A中读取到的数据都是一致的。即使事务B将数据已经修改，并且提交了，事务A读取到的数据还是没有发生改变，这就是可重复读。
- 可重复读可能会出现幻影读。每一次读取到的数据都是幻象。不够真实！
- 早晨9点开始开启了事务，只要事务不结束，到晚上9点，读到的数据还是那样！读到的是假象。不够绝对的真实。
- mysql中默认的事务隔离级别就是这个！！！！！！！！！！！

#### **序列化/串行化：serializable**

**（最高的隔离级别）**

- 这是最高隔离级别，效率最低。解决了所有的问题。
- 这种隔离级别表示事务排队，不能并发！
- synchronized，线程同步（事务同步）每一次读取到的数据都是最真实的，并且效率是最低的。