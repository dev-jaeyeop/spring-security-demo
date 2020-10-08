create database spring_security_demo;
use spring_security_demo;

CREATE TABLE users
(
    username VARCHAR(50) PRIMARY KEY,
    password VARCHAR(50) NOT NULL,
    enable   TINYINT(1)  NOT NULL
);

CREATE TABLE authorities
(
    username  VARCHAR(50),
    authority VARCHAR(50) NOT NULL,
    FOREIGN KEY (username)
        REFERENCES users (username)
);

insert into users
values ('john', '{noop}password', 1),
       ('mary', '{noop}password', 1),
       ('susan', '{noop}password', 1);

insert into authorities
values ('john', 'ROLE_EMPLOYEE'),
       ('mary', 'ROLE_EMPLOYEE'),
       ('mary', 'ROLE_MANAGER'),
       ('susan', 'ROLE_EMPLOYEE'),
       ('susan', 'ROLE_ADMIN');