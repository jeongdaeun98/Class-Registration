DROP TABLE ENROLL;
DROP TABLE TEACH;
DROP TABLE COURSE;
DROP TABLE STUDENTS;
DROP TABLE PROFESSOR;

CREATE TABLE STUDENTS(
	s_id VARCHAR(10),
	s_pwd VARCHAR(30) NOT NULL,
	s_major VARCHAR(30) NOT NULL,
	CONSTRAINT pk_students PRIMARY KEY(s_id),
	CONSTRAINT ck_students CHECK(LENGTH(s_id) = 7)
);
INSERT INTO STUDENTS VALUES ('1400000', 'abcde', '���а�');
INSERT INTO STUDENTS VALUES ('1400001', 'abezcvsd', '��ǰ�����а�');
INSERT INTO STUDENTS VALUES ('1400002', 'ab23esd', '�����а�');
INSERT INTO STUDENTS VALUES ('1100003', 'abdes', '�����а�');
INSERT INTO STUDENTS VALUES ('1500004', 'gkx1sne', '�����а�');
INSERT INTO STUDENTS VALUES ('1300005', 'aaa3de', '�����');
INSERT INTO STUDENTS VALUES ('1300006', 'gdsxce', '�����');
INSERT INTO STUDENTS VALUES ('1400007', 'xcvae2e', '�����');
INSERT INTO STUDENTS VALUES ('1400008', 'abes12d', '�����');
INSERT INTO STUDENTS VALUES ('1500009', 'abdf3esd', '�����');
INSERT INTO STUDENTS VALUES ('1500010', 'abe32sd', '�����');
INSERT INTO STUDENTS VALUES ('1500011', 'a1dbee231sd', '�����');
INSERT INTO STUDENTS VALUES ('1500012', 'dsbxcx', '�ѱ���к�');
INSERT INTO STUDENTS VALUES ('1500013', 'asadcxe', '����а�');
INSERT INTO STUDENTS VALUES ('1700014', 'sdfaew', '����а�');
INSERT INTO STUDENTS VALUES ('1400015', 'adee', '��ǻ�Ͱ��а�');
INSERT INTO STUDENTS VALUES ('1400016', 'cxzvbe', '��ǻ�Ͱ��а�');
INSERT INTO STUDENTS VALUES ('1400017', 'zbrwe32', '��ǻ�Ͱ��а�');
INSERT INTO STUDENTS VALUES ('1500018', 'vcczha5', '��ǻ�Ͱ��а�');
INSERT INTO STUDENTS VALUES ('1500019', 'cvxczb1', '��ǻ�Ͱ��а�');
INSERT INTO STUDENTS VALUES ('1500020', 'cxzvw1sfa', '��ǻ�Ͱ��а�');
INSERT INTO STUDENTS VALUES ('1500021', 'xcvxgad', '��ǻ�Ͱ��а�');
INSERT INTO STUDENTS VALUES ('1600022', 'czbdga', '��ǻ�Ͱ��а�');
INSERT INTO STUDENTS VALUES ('1600023', 'cvztea', '��ǻ�Ͱ��а�');
INSERT INTO STUDENTS VALUES ('1600024', 'cxvzehj', '��ǻ�Ͱ��а�');
INSERT INTO STUDENTS VALUES ('1600025', 'kghvcb', '��ǻ�Ͱ��а�');
INSERT INTO STUDENTS VALUES ('1700026', 'gdjgdh', '��ǻ�Ͱ��а�');
INSERT INTO STUDENTS VALUES ('1400027', 'bcxzeaw', '�����а�');
INSERT INTO STUDENTS VALUES ('1500028', 'safdcxb', '�����а�');
INSERT INTO STUDENTS VALUES ('1500029', 'aeewa', '�����а�');
INSERT INTO STUDENTS VALUES ('1000030', '123gdasf', '�۰��');
INSERT INTO STUDENTS VALUES ('1100031', 'czv35da', '�۰��');
INSERT INTO STUDENTS VALUES ('1200032', 'bzxa23', '�۰��');
INSERT INTO STUDENTS VALUES ('1300033', 'bcxeae', '�۰��');


CREATE TABLE PROFESSOR (
  p_id VARCHAR(10),
  p_pwd VARCHAR(30) NOT NULL,
  p_name VARCHAR(30) NOT NULL,
  CONSTRAINT pk_professor PRIMARY KEY(p_id),
  CONSTRAINT ck_professor CHECK(LENGTH(p_id) = 5)
);
INSERT INTO professor VALUES('00001', '12345', '����ȣ');
INSERT INTO professor VALUES('00002', '12345', '������');
INSERT INTO professor VALUES('00003', '12345', '������');
INSERT INTO professor VALUES('00004', '12345', '������');
INSERT INTO professor VALUES('00005', '12345', '�̱���');
INSERT INTO professor VALUES('00006', '12345', '�ֿ���');
INSERT INTO professor VALUES('00007', '12345', '�̼���');

CREATE TABLE COURSE (
  c_id VARCHAR(10),
  c_name VARCHAR(30) NOT NULL,
  c_unit VARCHAR(3) NOT NULL,
  c_credit NUMBER NOT NULL,
  c_type NUMBER NOT NULL,
  CONSTRAINTS pk_course PRIMARY KEY(c_id, c_unit),
  CONSTRAINTS ck_course CHECK((LENGTH(c_unit) = 3) AND (c_type = 0 OR c_type = 1))
);
INSERT INTO course VALUES('21003184', '�����ͺ��̽����α׷���', '001', 3, 1);
INSERT INTO course VALUES('21003184', '�����ͺ��̽����α׷���', '002', 3, 1);
INSERT INTO course VALUES('21003759', '�Ӻ����ý���', '001', 3, 1);
INSERT INTO course VALUES('21000540', '�ڷᱸ��', '001', 3, 1);
INSERT INTO course VALUES('21002146', '���������α׷���', '001', 3, 1);
INSERT INTO course VALUES('21002146', '���������α׷���', '002', 3, 1);
INSERT INTO course VALUES('21003917', '����Ʈ����������', '001', 3, 1);
INSERT INTO course VALUES('21002930', '���������ͱ۾���', '001', 2, 0);
INSERT INTO course VALUES('21002931', '�������������', '001', 2, 0);

CREATE TABLE ENROLL(
  s_id VARCHAR(10) NOT NULL,
  c_id VARCHAR(10) NOT NULL,
  c_unit VARCHAR(3) NOT NULL,
  e_year NUMBER NOT NULL,
  e_semester NUMBER NOT NULL,
  CONSTRAINT fk_enroll_s FOREIGN KEY (s_id) REFERENCES STUDENTS(s_id) ON DELETE CASCADE,
  CONSTRAINT fk_enroll_c FOREIGN KEY (c_id, c_unit) REFERENCES COURSE(c_id, c_unit) ON DELETE CASCADE,
  CONSTRAINTS ck_enroll CHECK((LENGTH(c_unit) = 3) AND (e_semester = 1 OR  e_semester = 2)) 
);
INSERT INTO enroll VALUES('1500009', '21003184', '001', 2019, 2);
INSERT INTO enroll VALUES('1500010', '21003184', '001', 2019, 2);
INSERT INTO enroll VALUES('1500011', '21003184', '001', 2019, 2);
INSERT INTO enroll VALUES('1500012', '21003184', '002', 2019, 2);
INSERT INTO enroll VALUES('1500013', '21003759', '001', 2019, 2);
INSERT INTO enroll VALUES('1500013', '21000540', '001', 2019, 2);
INSERT INTO enroll VALUES('1500013', '21002146', '001', 2019, 2);
INSERT INTO enroll VALUES('1500018', '21002146', '002', 2019, 2);
INSERT INTO enroll VALUES('1500019', '21003917', '001', 2019, 2);
INSERT INTO enroll VALUES('1500019', '21002931', '001', 2019, 2);
INSERT INTO enroll VALUES('1500020', '21002931', '001', 2019, 2);

CREATE TABLE TEACH (
  p_id VARCHAR(10),
  c_id VARCHAR(10) NOT NULL,
  c_unit VARCHAR(3) NOT NULL,
  t_year NUMBER NOT NULL,
  t_semester NUMBER NOT NULL,
  t_day1 NUMBER NOT NULL,
  t_time1 NUMBER NOT NULL,
  t_day2 NUMBER,
  t_time2 NUMBER,
  t_personnel NUMBER NOT NULL,
  t_location VARCHAR(30) NOT NULL,
  CONSTRAINT fk_teach_p FOREIGN KEY (p_id) REFERENCES PROFESSOR(p_id) ON DELETE CASCADE,
  CONSTRAINT fk_teach_c FOREIGN KEY (c_id, c_unit) REFERENCES COURSE(c_id, c_unit) ON DELETE CASCADE,
  CONSTRAINTS ck_teach CHECK((LENGTH(c_unit) = 3) AND (t_semester = 1 OR  t_semester = 2) AND (t_time1 >= 1 AND t_time1 <= 9) AND (t_time2 >= 1 AND t_time2 <= 9) AND (t_day1 >= 0 AND t_day1 <= 6) AND (t_day2 >= 0 AND t_day2 <= 6) )
);
INSERT INTO teach VALUES('00001', '21003184', '001', 2019, 2, 1, 5, 3, 5, 3, '��Ű� 408');
INSERT INTO teach VALUES('00002', '21003184', '002', 2019, 2, 1, 4, 1, 5, 3, '��Ű� 409');
INSERT INTO teach VALUES('00003', '21003759', '001', 2019, 2, 2, 2, 4, 2, 3, '��Ű� 413');
INSERT INTO teach VALUES('00004', '21000540', '001', 2019, 2, 1, 2, 3, 2, 3, '�����Ӱ� 203');
INSERT INTO teach VALUES('00005', '21002146', '001', 2019, 2, 1, 1, 3, 1, 3, '��Ű� 413');
INSERT INTO teach VALUES('00005', '21002146', '002', 2019, 2, 1, 2, 3, 2, 3, '��Ű� 413');
INSERT INTO teach VALUES('00006', '21003917', '001', 2019, 2, 2, 2, 4, 2, 3, '��Ű� 103');
INSERT INTO teach VALUES('00007', '21002930', '001', 2019, 2, 2, 2, NULL, NULL, 3, '����� 418');
INSERT INTO teach VALUES('00007', '21002931', '001', 2019, 2, 4, 3, NULL, NULL, 3, '��Ű� 606');