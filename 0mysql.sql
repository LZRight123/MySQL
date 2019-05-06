drop table if exists t_user;

CREATE TABLE t_user(
    id VARCHAR(128) PRIMARY KEY,
    name VARCHAR(32) NOT NULL,
    email VARCHAR(64)
);