create database spring_security_demo;
use spring_security_demo;

CREATE TABLE users
(
    username VARCHAR(50) PRIMARY KEY,
    password VARCHAR(68) NOT NULL,
    enabled   TINYINT(1)  NOT NULL
);

CREATE TABLE authorities
(
    username  VARCHAR(50),
    authority VARCHAR(50) NOT NULL,
    FOREIGN KEY (username)
        REFERENCES users (username)
);

insert into users
values ('john', '{bcrypt}$2a$10$fvyB06mK2eu1DTC5htPsS.V/r0yWvFvXNuTWJ8GwbTkpfk3Vi.kWi', 1),
       ('mary', '{bcrypt}$2a$10$fvyB06mK2eu1DTC5htPsS.V/r0yWvFvXNuTWJ8GwbTkpfk3Vi.kWi', 1),
       ('susan', '{bcrypt}$2a$10$fvyB06mK2eu1DTC5htPsS.V/r0yWvFvXNuTWJ8GwbTkpfk3Vi.kWi', 1);

insert into authorities
values ('john', 'ROLE_EMPLOYEE'),
       ('mary', 'ROLE_EMPLOYEE'),
       ('mary', 'ROLE_MANAGER'),
       ('susan', 'ROLE_EMPLOYEE'),
       ('susan', 'ROLE_ADMIN');