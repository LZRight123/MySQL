-- 34道练习题 
-- 表emp  人员表
-- 表salgrade 薪水级别表
-- 表 
-- 1.取得每个部门最高薪水的人员名称
    -- 第一步：取得每个部门最高薪水【按照部门分组求最大值】
    SELECT deptno, max(sal) AS maxsal FROM emp GROUP by deptno;
    -- 第二步:将上面的查询结果当做临时表t, t表和 emp e表进行表连接
    -- 条件: t.deptno=e.deptno and tmaxsal=e.sal
    SELECT e.ename, t.*
    FROM emp e
    JOIN (SELECT deptno, max(sal) AS maxsal FROM emp GROUP by deptno) t
    ON t.deptno=e.deptno AND t.maxsal=e.sal;


-- 2.哪些人薪水在部门的平均薪水之上
    -- 第一步：找出部门的平均薪水[按部门编号分组求薪水平均值]
    SELECT deptno, avg(sal) AS avgsal FROM emp GROUP BY deptno;
    -- 第二步：找出部门内部人员的薪水在这个值之上
    SELECT e.ename, e.scal, t.*
    FROM emp e
    JOIN
        (SELECT deptno, avg(sal) AS avgsal FROM emp GROUP BY deptno) t
    ON
        e.deptno=t.deptno AND e.sal>t.avgsal;

-- 3.取得部门中所有人的 平均的薪水等级
    -- 第一步： 求部门平均薪水
    SELECT deptno, avg(sal) AS avgsal FROM emp GROUP by deptno;
    -- 第二步：将上表的结果当作t，和salgrade s进行连接
    SELECT t.deptno, s.level
    FROM salgrade s
    JOIN 
        (SELECT deptno, avg(sal) AS avgsal FROM emp GROUP by deptno) t
    ON
        t.avgsal BETWEEN s.min AND s.max;
    -- 扩展，每一个员工的薪水等级 把这个表拿到 求 s.level的平均值
    SELECT e.deptno, avg(s.level)
    FROM emp es
    JOIN
        salgrade 
    ON
        e.sal BETWEEN s.min AND s.max
    GROUP by
        e.deptno;