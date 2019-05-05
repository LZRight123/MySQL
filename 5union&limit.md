#union 合并查询结果集
#案列：找出工作岗位是领导或者销售的员工
    select name, job from tablename where job='manager' or job='sal';
    select name, job from tablename where job in('manager', 'sal');
    下面这种写法要求列数相同
    select name, job from tablename where jbo='manager' 
    union
    select name, job from tablename where job='sal';

#limit分页查询 用来获取一张表中的一部分数据， 
#limit只有在MYSQL数据中存在，不通用 是MYSQL的数据库管理系统的特色
#案例: 找出员工表中前5条记录
    limit的使用语法格式 limit index, length 不指定index,则index=0
    select * from tablename limit 5;//limit 5代表从下标0开始 取5条。
    select * from tablename limit 5, 5;
#案例：找出公司中工资排名在前5名的员工
    select * from tablename order by sal desc limit 0, 5;
#案例: 找出公司中工资排名在前3-9名的员工
    select * from tablename order by sal desc limit 2, 7;

