# 당근마켓(프론트 따라해봄)

사용 기술 : 
Spring, Mybatis, jsp(jstl,EL), OracleDB, AJAX, JQuery


테이블구조부터 설계까지 만들어 보았습니다.
html만 참고하여 만들었습니다.
DB구조는 다음과 같습니다.





CREATE TABLE USERS (
EMAIL VARCHAR2(60) PRIMARY KEY,
encrypted_password VARCHAR2(300) NOT NULL,
NAME VARCHAR2(60) NULL,
created_at DATE NOT NULL,
updated_at DATE NOT NULL
)

CREATE TABLE PRODUCTS (
PRODUCTSEQ NUMBER PRIMARY KEY,
EMAIL VARCHAR2(60),
title VARCHAR2(300) NOT NULL,
category VARCHAR2(300) NOT NULL,
price NUMBER NOT NULL,
description VARCHAR2(3000) NOT NULL,
IMAGE VARCHAR2(3000) NOT NULL,
created_at DATE NOT NULL,
updated_at DATE NOT NULL,
 CONSTRAINT mailbind
    FOREIGN KEY (EMAIL)
    REFERENCES USERS (EMAIL)
)

CREATE TABLE CARS(
CARSEQ NUMBER PRIMARY KEY,
PRODUCTSEQ NUMBER,
MADEDATE VARCHAR2(15),
RANDISTANCE NUMBER,
ISSMOKE VARCHAR2(5),
 CONSTRAINT CARBIND
    FOREIGN KEY (PRODUCTSEQ)
    REFERENCES PRODUCTS (PRODUCTSEQ)
)
