select * from insa order by sabun DESC;
select * from test;
DROP table insa;
DROP SEQUENCE sabun_seq;

delete from insa where sabun=12;
SELECT count(*) FROM insa WHERE sabun LIKE '2';
SELECT * FROM insa WHERE name LIKE '%김%';

SELECT sabun_seq.NEXTVAL FROM DUAL;
COMMIT;

select * from insa;

create table INSA(
sabun number(20) not null,
name varchar2(20) not null,
eng_name varchar2(20),
id varchar2(30) not null,
pwd varchar2(50) not null,
phone varchar2(20),
hp varchar2(20) not null,
reg_no varchar2(20) not null,
years varchar2(20),
sex varchar2(20),
email varchar2(50) not null,
zip  varchar2(20),
addr1 varchar2(100),
addr2 varchar2(100),
job_type varchar2(20),
pos_gbn_code varchar2(20),
dept_code varchar2(20),
salary  varchar2(20),
join_gbn_code varchar2(20),
gart_level varchar2(20),
put_yn varchar2(20),
mil_yn varchar2(20),
mil_type varchar2(20),
mil_level varchar2(20),
mil_startdate varchar2(20),
mil_enddate varchar2(20),
kosa_reg_yn varchar2(20),
kosa_class_code varchar2(20),
join_day varchar2(20) not null,
retire_day varchar2(20),
crm_name varchar2(50),
cmp_reg_no varchar2(20),
cmp_reg_image varchar2(100),
carrier varchar2(100),
profile varchar2(100),
self_intro varchar2(100),
profile_image varchar2(100),
carrier_image varchar2(100),
CONSTRAINT insa_pk PRIMARY KEY (sabun));












create table test(
sabun number not null,
name VARCHAR2(20) not null,
eng_name VARCHAR2(20),
id VARCHAR2(20) not null,
CONSTRAINT test_pk PRIMARY KEY (sabun));


CREATE SEQUENCE sabun_SEQ
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1;

       
CREATE Table INSA_COM (
    GUBUN VARCHAR2(20) NOT NULL,
    CODE VARCHAR2(20) NOT NULL,
    NAME1 VARCHAR2(20) NOT NULL,
    note VARCHAR2(20) NOT NULL,
    CONSTRAINT INSA_COM_PK PRIMARY KEY(GUBUN, CODE)
);

-- ########## 입사여부 01 joinGbnCode ########## --
INSERT INTO INSA_COM VALUES('01', '001', 'Y', '입사여부');
INSERT INTO INSA_COM VALUES('01', '002', 'N', '입사여부');

-- ########## 성별 02 sex  ########## --
INSERT INTO INSA_COM VALUES('02', '001', '남자', '성별');
INSERT INTO INSA_COM VALUES('02', '002', '여자', '성별');

-- ########## 직위 03 posGbnCode  ########## --
INSERT INTO INSA_COM VALUES('03', '001', '주임', '직위');
INSERT INTO INSA_COM VALUES('03', '002', '대리', '직위');
INSERT INTO INSA_COM VALUES('03', '003', '과장', '직위');
INSERT INTO INSA_COM VALUES('03', '004', '차장', '직위');
INSERT INTO INSA_COM VALUES('03', '005', '부장', '직위');

-- ########## 부서 04 deptCode  ########## --
INSERT INTO INSA_COM VALUES('04', '001', '인사', '부서');
INSERT INTO INSA_COM VALUES('04', '002', '총무', '부서');
INSERT INTO INSA_COM VALUES('04', '003', '기획', '부서');
INSERT INTO INSA_COM VALUES('04', '004', '영업', '부서');
INSERT INTO INSA_COM VALUES('04', '005', '회계', '부서');

-- ########## 직종 05 jobType  ########## --
INSERT INTO INSA_COM VALUES('05', '001', '기획사무', '직종');
INSERT INTO INSA_COM VALUES('05', '002', '총무·인사', '직종');
INSERT INTO INSA_COM VALUES('05', '003', '재무·회계', '직종');
INSERT INTO INSA_COM VALUES('05', '004', '생산·품질관리', '직종');
INSERT INTO INSA_COM VALUES('05', '005', '교육', '직종');

-- ########## 투입여부 06 putYn  ########## --
INSERT INTO INSA_COM VALUES('06', '001', 'Y', '투입여부');
INSERT INTO INSA_COM VALUES('06', '002', 'N', '투입여부');

-- ########## 최종학력 07 gartLevel  ########## --
INSERT INTO INSA_COM VALUES('07', '001', '전문학사학위', '최종학력');
INSERT INTO INSA_COM VALUES('07', '002', '학사학위', '최종학력');
INSERT INTO INSA_COM VALUES('07', '003', '석사학위', '최종학력');
INSERT INTO INSA_COM VALUES('07', '004', '박사학위', '최종학력');

-- ########## 군별여부 08  milYn  ########## --
INSERT INTO INSA_COM VALUES('08', '001', 'Y', '군별여부');
INSERT INTO INSA_COM VALUES('08', '002', 'N', '군별여부');

-- ########## 군별 09 milType  ########## --
INSERT INTO INSA_COM VALUES('09', '001', '육군', '군별');
INSERT INTO INSA_COM VALUES('09', '002', '해군', '군별');
INSERT INTO INSA_COM VALUES('09', '003', '공군', '군별');

-- ########## 계급 10 milLevel  ########## --
INSERT INTO INSA_COM VALUES('10', '001', '이등병', '계급');
INSERT INTO INSA_COM VALUES('10', '002', '일병', '계급');
INSERT INTO INSA_COM VALUES('10', '003', '상병', '계급');
INSERT INTO INSA_COM VALUES('10', '004', '병장', '계급');

-- ########## KOSA등록 11 kosaRegYn  ########## --
INSERT INTO INSA_COM VALUES('11', '001', 'Y', 'KOSA등록');
INSERT INTO INSA_COM VALUES('11', '002', 'N', 'KOSA등록');

-- ########## KOSA등급 12 kosaClassCode  ########## --
INSERT INTO INSA_COM VALUES('12', '001', '초급기능사', 'KOSA등급');
INSERT INTO INSA_COM VALUES('12', '002', '중급기능사', 'KOSA등급');
INSERT INTO INSA_COM VALUES('12', '003', '고급기능사', 'KOSA등급');
INSERT INTO INSA_COM VALUES('12', '004', '초급기술자', 'KOSA등급');
INSERT INTO INSA_COM VALUES('12', '005', '중급기술자', 'KOSA등급');
INSERT INTO INSA_COM VALUES('12', '006', '고급기술자', 'KOSA등급');
INSERT INTO INSA_COM VALUES('12', '007', '특급기술자', 'KOSA등급');

SELECT * FROM INSA_COM ORDER by gubun;
COMMIT;
