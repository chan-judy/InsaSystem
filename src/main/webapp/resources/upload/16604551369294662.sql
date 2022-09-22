select * from insa order by sabun DESC;
select * from test;
DROP table insa;
DROP SEQUENCE sabun_seq;

delete from insa where sabun=12;
SELECT count(*) FROM insa WHERE sabun LIKE '2';
SELECT * FROM insa WHERE name LIKE '%��%';

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

-- ########## �Ի翩�� 01 joinGbnCode ########## --
INSERT INTO INSA_COM VALUES('01', '001', 'Y', '�Ի翩��');
INSERT INTO INSA_COM VALUES('01', '002', 'N', '�Ի翩��');

-- ########## ���� 02 sex  ########## --
INSERT INTO INSA_COM VALUES('02', '001', '����', '����');
INSERT INTO INSA_COM VALUES('02', '002', '����', '����');

-- ########## ���� 03 posGbnCode  ########## --
INSERT INTO INSA_COM VALUES('03', '001', '����', '����');
INSERT INTO INSA_COM VALUES('03', '002', '�븮', '����');
INSERT INTO INSA_COM VALUES('03', '003', '����', '����');
INSERT INTO INSA_COM VALUES('03', '004', '����', '����');
INSERT INTO INSA_COM VALUES('03', '005', '����', '����');

-- ########## �μ� 04 deptCode  ########## --
INSERT INTO INSA_COM VALUES('04', '001', '�λ�', '�μ�');
INSERT INTO INSA_COM VALUES('04', '002', '�ѹ�', '�μ�');
INSERT INTO INSA_COM VALUES('04', '003', '��ȹ', '�μ�');
INSERT INTO INSA_COM VALUES('04', '004', '����', '�μ�');
INSERT INTO INSA_COM VALUES('04', '005', 'ȸ��', '�μ�');

-- ########## ���� 05 jobType  ########## --
INSERT INTO INSA_COM VALUES('05', '001', '��ȹ�繫', '����');
INSERT INTO INSA_COM VALUES('05', '002', '�ѹ����λ�', '����');
INSERT INTO INSA_COM VALUES('05', '003', '�繫��ȸ��', '����');
INSERT INTO INSA_COM VALUES('05', '004', '���ꡤǰ������', '����');
INSERT INTO INSA_COM VALUES('05', '005', '����', '����');

-- ########## ���Կ��� 06 putYn  ########## --
INSERT INTO INSA_COM VALUES('06', '001', 'Y', '���Կ���');
INSERT INTO INSA_COM VALUES('06', '002', 'N', '���Կ���');

-- ########## �����з� 07 gartLevel  ########## --
INSERT INTO INSA_COM VALUES('07', '001', '�����л�����', '�����з�');
INSERT INTO INSA_COM VALUES('07', '002', '�л�����', '�����з�');
INSERT INTO INSA_COM VALUES('07', '003', '��������', '�����з�');
INSERT INTO INSA_COM VALUES('07', '004', '�ڻ�����', '�����з�');

-- ########## �������� 08  milYn  ########## --
INSERT INTO INSA_COM VALUES('08', '001', 'Y', '��������');
INSERT INTO INSA_COM VALUES('08', '002', 'N', '��������');

-- ########## ���� 09 milType  ########## --
INSERT INTO INSA_COM VALUES('09', '001', '����', '����');
INSERT INTO INSA_COM VALUES('09', '002', '�ر�', '����');
INSERT INTO INSA_COM VALUES('09', '003', '����', '����');

-- ########## ��� 10 milLevel  ########## --
INSERT INTO INSA_COM VALUES('10', '001', '�̵', '���');
INSERT INTO INSA_COM VALUES('10', '002', '�Ϻ�', '���');
INSERT INTO INSA_COM VALUES('10', '003', '��', '���');
INSERT INTO INSA_COM VALUES('10', '004', '����', '���');

-- ########## KOSA��� 11 kosaRegYn  ########## --
INSERT INTO INSA_COM VALUES('11', '001', 'Y', 'KOSA���');
INSERT INTO INSA_COM VALUES('11', '002', 'N', 'KOSA���');

-- ########## KOSA��� 12 kosaClassCode  ########## --
INSERT INTO INSA_COM VALUES('12', '001', '�ʱޱ�ɻ�', 'KOSA���');
INSERT INTO INSA_COM VALUES('12', '002', '�߱ޱ�ɻ�', 'KOSA���');
INSERT INTO INSA_COM VALUES('12', '003', '��ޱ�ɻ�', 'KOSA���');
INSERT INTO INSA_COM VALUES('12', '004', '�ʱޱ����', 'KOSA���');
INSERT INTO INSA_COM VALUES('12', '005', '�߱ޱ����', 'KOSA���');
INSERT INTO INSA_COM VALUES('12', '006', '��ޱ����', 'KOSA���');
INSERT INTO INSA_COM VALUES('12', '007', 'Ư�ޱ����', 'KOSA���');

SELECT * FROM INSA_COM ORDER by gubun;
COMMIT;
