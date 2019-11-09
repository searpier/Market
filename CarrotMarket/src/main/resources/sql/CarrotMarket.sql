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

CREATE SEQUENCE PRODUCTSEQ
CREATE SEQUENCE CARSEQ
