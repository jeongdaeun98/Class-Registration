DROP TABLE ENROLL;
DROP TABLE TEACH;
DROP TABLE COURSE;
DROP TABLE STUDENTS;
DROP TABLE PROFESSOR;

CREATE TABLE STUDENTS(
	s_id VARCHAR(10),
	s_pwd VARCHAR(30) NOT NULL,
	s_major VARCHAR(30) NOT NULL,
	s_name VARCHAR(10) NOT NULL,
	s_phone VARCHAR(30) NOT NULL UNIQUE,
	s_email VARCHAR(30) NOT NULL UNIQUE,
	CONSTRAINT pk_students PRIMARY KEY(s_id),
	CONSTRAINT ck_students CHECK(LENGTH(s_id) = 7)
);
INSERT INTO STUDENTS VALUES ('1400000', 'abcde', '��ǻ�Ͱ��а�', '������', '010-1234-5678', 'noon@sookmyung.ac.kr');
INSERT INTO STUDENTS VALUES ('1400001', 'abezcvsd', '��ǻ�Ͱ��а�', '������', '010-1748-3111', 'fvnkgsf9l@sookmyung.ac.kr');
INSERT INTO STUDENTS VALUES ('1400002', 'ab23esd', '��ǻ�Ͱ��а�', '���μ�', '010-1131-4567', 'i01pd@sookmyung.ac.kr');
INSERT INTO STUDENTS VALUES ('1100003', 'abdes', '��ǻ�Ͱ��а�', 'Ȳ����', '010-0621-1195', '853q2t7@sookmyung.ac.kr');
INSERT INTO STUDENTS VALUES ('1500004', 'gkx1sne', '��ǻ�Ͱ��а�', '���ϴ�', '010-8137-8441', 'b5t6fmc7@sookmyung.ac.kr');
INSERT INTO STUDENTS VALUES ('1300005', 'aaa3de', '��ǻ�Ͱ��а�', '�纸��', '010-9739-3259', 'fju856zo@sookmyung.ac.kr');
INSERT INTO STUDENTS VALUES ('1300006', 'gdsxce', '��ǻ�Ͱ��а�', '���ֿ�', '010-6250-4207', 'p4yjoz3@sookmyung.ac.kr');
INSERT INTO STUDENTS VALUES ('1400007', 'xcvae2e', '��ǻ�Ͱ��а�', '�̼���', '010-4992-2132', 'ojvg1@sookmyung.ac.kr');
INSERT INTO STUDENTS VALUES ('1400008', 'abes12d', '��ǻ�Ͱ��а�', '������', '010-7833-7028', 'b8jwi8lvbk@sookmyung.ac.kr');
INSERT INTO STUDENTS VALUES ('1500009', 'abdf3esd', '��ǻ�Ͱ��а�', '������', '010-6466-2165', '400vlk4t@sookmyung.ac.kr');
INSERT INTO STUDENTS VALUES ('1500010', 'abe32sd', '��ǻ�Ͱ��а�', '������', '010-9526-5812', 's8yogwu@sookmyung.ac.kr');
INSERT INTO STUDENTS VALUES ('1500011', 'a1dbee231sd', '��ǻ�Ͱ��а�', 'Ȳ����', '010-6249-9528', 'cp4dzurnw0@sookmyung.ac.kr');
INSERT INTO STUDENTS VALUES ('1500012', 'dsbxcx', '��ǻ�Ͱ��а�', '�ֺ���', '010-0522-5360', '2jo88t1@sookmyung.ac.kr');
INSERT INTO STUDENTS VALUES ('1500013', 'asadcxe', '��ǻ�Ͱ��а�', 'ȫ����', '010-6451-2021', 'wrbqykpsh@sookmyung.ac.kr');
INSERT INTO STUDENTS VALUES ('1700014', 'sdfaew', '��ǻ�Ͱ��а�', '�߰���', '010-9508-6596', 'o0hl6@sookmyung.ac.kr');
INSERT INTO STUDENTS VALUES ('1400015', 'adee', '��ǻ�Ͱ��а�', '������', '010-0855-3438', '3hyesn8h@sookmyung.ac.kr');
INSERT INTO STUDENTS VALUES ('1400016', 'cxzvbe', '��ǻ�Ͱ��а�', '������', '010-1281-0248', '0btnh@sookmyung.ac.kr');
INSERT INTO STUDENTS VALUES ('1400017', 'zbrwe32', '��ǻ�Ͱ��а�', 'Ź����', '010-8362-5216', 'pyyzbmrit@sookmyung.ac.kr');
INSERT INTO STUDENTS VALUES ('1500018', 'vcczha5', '��ǻ�Ͱ��а�', '���Ѽ�', '010-0512-9315', '4hzaugm@sookmyung.ac.kr');
INSERT INTO STUDENTS VALUES ('1500019', 'cvxczb1', '��ǻ�Ͱ��а�', '������', '010-2167-0977', 'le23zxdnuu@sookmyung.ac.kr');
INSERT INTO STUDENTS VALUES ('1500020', 'cxzvw1sfa', '��ǻ�Ͱ��а�', '�Ź̿�', '010-0966-6915', 'hfe5ewzxp9@sookmyung.ac.kr');
INSERT INTO STUDENTS VALUES ('1500021', 'xcvxgad', '��ǻ�Ͱ��а�', '��ΰ�', '010-1051-1282', 'xd6aun4@sookmyung.ac.kr');
INSERT INTO STUDENTS VALUES ('1600022', 'czbdga', '��ǻ�Ͱ��а�', '���ξ�', '010-1727-6517', '41ixmvwm@sookmyung.ac.kr');
INSERT INTO STUDENTS VALUES ('1600023', 'cvztea', '��ǻ�Ͱ��а�', '������', '010-8229-0367', 'vx3mt@sookmyung.ac.kr');
INSERT INTO STUDENTS VALUES ('1600024', 'cxvzehj', '��ǻ�Ͱ��а�', '�谡��', '010-5345-2808', '65vwd99op@sookmyung.ac.kr');
INSERT INTO STUDENTS VALUES ('1600025', 'kghvcb', '��ǻ�Ͱ��а�', 'Ȳȿ��', '010-3587-9669', 'q8vqs7w0l4@sookmyung.ac.kr');
INSERT INTO STUDENTS VALUES ('1700026', 'gdjgdh', '��ǻ�Ͱ��а�', 'õ����', '010-6872-3889', 'hh8cyjk1pk@sookmyung.ac.kr');
INSERT INTO STUDENTS VALUES ('1400027', 'bcxzeaw', '�濵�а�', '������', '010-7715-4030', 'ly6eqqwj@sookmyung.ac.kr');
INSERT INTO STUDENTS VALUES ('1500028', 'safdcxb', '�濵�а�', '������', '010-9599-5557', 'v6scjge@sookmyung.ac.kr');
INSERT INTO STUDENTS VALUES ('1500029', 'aeewa', '�濵�а�', '������', '010-4603-8656', 'jhjxcq05p@sookmyung.ac.kr');
INSERT INTO STUDENTS VALUES ('1000030', '123gdasf', '�濵�а�', '�����', '010-5302-4469', 'yexu2kjag@sookmyung.ac.kr');
INSERT INTO STUDENTS VALUES ('1100031', 'czv35da', '�濵�а�', '�����', '010-9444-3331', '1xxis1y@sookmyung.ac.kr');
INSERT INTO STUDENTS VALUES ('1200032', 'bzxa23', '�濵�а�', '�����', '010-6460-8516', '7p10md37l@sookmyung.ac.kr');
INSERT INTO STUDENTS VALUES ('1300033', 'bcxeae', '�濵�а�', '������', '010-7766-3013', 'j7bi83y6@sookmyung.ac.kr');


CREATE TABLE PROFESSOR (
  p_id VARCHAR(10),
  p_pwd VARCHAR(30) NOT NULL,
  p_name VARCHAR(30) NOT NULL,
  p_major VARCHAR(30) NOT NULL,
  p_phone VARCHAR(30) NOT NULL UNIQUE,
  p_email VARCHAR(30) NOT NULL UNIQUE,
  CONSTRAINT pk_professor PRIMARY KEY(p_id),
  CONSTRAINT ck_professor CHECK(LENGTH(p_id) = 5),
  CONSTRAINT uk_professor UNIQUE(p_phone, p_email)
);
INSERT INTO professor VALUES('00001', '12345', '����ȣ', '��ǻ�Ͱ��а�', '010-1675-2644', 'yb5xo4m@sookmyung.ac.kr');
INSERT INTO professor VALUES('00002', '12345', '������', '��ǻ�Ͱ��а�', '010-5442-3967', '67hpgu6@sookmyung.ac.kr');
INSERT INTO professor VALUES('00003', '12345', '������', '��ǻ�Ͱ��а�', '010-0845-8204', 'nknym4p0bv@sookmyung.ac.kr');
INSERT INTO professor VALUES('00004', '12345', '������', '��ǻ�Ͱ��а�', '010-7615-2035', 'ir6r33rv1@sookmyung.ac.kr');
INSERT INTO professor VALUES('00005', '12345', '�̱���', '��ǻ�Ͱ��а�', '010-7164-7787', 'ox5h8@sookmyung.ac.kr');
INSERT INTO professor VALUES('00006', '12345', '�ֿ���', '��ǻ�Ͱ��а�', '010-5680-4189', '5m6on@sookmyung.ac.kr');
INSERT INTO professor VALUES('00007', '12345', '�̼���', '����', '010-4250-0945', 'te2mkn@sookmyung.ac.kr');
INSERT INTO professor VALUES('00008', '12345', '���ֱ�', '��ǻ�Ͱ��а�', '010-9388-7281', 'dj6oxzlpi@sookmyung.ac.kr');
INSERT INTO professor VALUES('00009', '12345', '�̱��', '��ǻ�Ͱ��а�', '010-5988-9746', '6amuzsab@sookmyung.ac.kr');
INSERT INTO professor VALUES('00010', '12345', '�̻��', '��ǻ�Ͱ��а�', '010-1703-3016', 'ae4zr5c8@sookmyung.ac.kr');
INSERT INTO professor VALUES('00011', '12345', '������', '��ǻ�Ͱ��а�', '010-4012-7316', 'kwd0axoj@sookmyung.ac.kr');
INSERT INTO professor VALUES('00012', '12345', '�ڼ���', '��ǻ�Ͱ��а�', '010-4234-3359', 'o9xetbjv@sookmyung.ac.kr');
INSERT INTO professor VALUES('00013', '12345', '������', '�濵�а�', '010-9219-4067', 'msx27udl@sookmyung.ac.kr');
INSERT INTO professor VALUES('00014', '12345', '�ڻ���', '�濵�а�', '010-6934-6391', 'g1zqcynfqs@sookmyung.ac.kr');
INSERT INTO professor VALUES('00015', '12345', '�ȼ�ȯ', '�濵�а�', '010-2784-1378', 'nxu41w@sookmyung.ac.kr');
INSERT INTO professor VALUES('00016', '12345', '������', '�濵�а�', '010-0963-4037', 'x7647tlq5@sookmyung.ac.kr');
INSERT INTO professor VALUES('00017', '12345', '�ε���', '�濵�а�', '010-1706-9577', 'jcvoxb9@sookmyung.ac.kr');
INSERT INTO professor VALUES('00018', '12345', '�����', '�濵�а�', '010-8663-1231', 'szo3gffx0@sookmyung.ac.kr');

CREATE TABLE COURSE (
  c_id VARCHAR(10),
  c_name VARCHAR(30) NOT NULL,
  c_unit VARCHAR(3) NOT NULL,
  c_credit NUMBER NOT NULL,
  c_type NUMBER NOT NULL,
  c_major VARCHAR(30) NOT NULL,
  CONSTRAINTS pk_course PRIMARY KEY(c_id, c_unit),
  CONSTRAINTS ck_course CHECK((LENGTH(c_unit) = 3) AND (c_type = 0 OR c_type = 1))
);
INSERT INTO course VALUES('21003183', '�����ͺ��̽����������', '001', 3, 1, '��ǻ�Ͱ��а�');
INSERT INTO course VALUES('21003183', '�����ͺ��̽����������', '002', 3, 1, '��ǻ�Ͱ��а�');
INSERT INTO course VALUES('21001710', '�����г�ȸ��', '001', 3, 1, '��ǻ�Ͱ��а�');
INSERT INTO course VALUES('21001710', '�����г�ȸ��', '002', 3, 1, '��ǻ�Ͱ��а�');
INSERT INTO course VALUES('21000555', '����Ʈ�������', '001', 3, 1, '��ǻ�Ͱ��а�');
INSERT INTO course VALUES('21000549', '�˰���', '001', 3, 1, '��ǻ�Ͱ��а�');
INSERT INTO course VALUES('21000557', '�ڹ����α׷���', '001', 3, 1, '��ǻ�Ͱ��а�');
INSERT INTO course VALUES('21000557', '�ڹ����α׷���', '002', 3, 1, '��ǻ�Ͱ��а�');
INSERT INTO course VALUES('21002147', '��ǻ�ͼ���', '001', 3, 1, '��ǻ�Ͱ��а�');

INSERT INTO course VALUES('21003184', '�����ͺ��̽����α׷���', '001', 3, 1, '��ǻ�Ͱ��а�');
INSERT INTO course VALUES('21003184', '�����ͺ��̽����α׷���', '002', 3, 1, '��ǻ�Ͱ��а�');
INSERT INTO course VALUES('21003759', '�Ӻ����ý���', '001', 3, 1, '��ǻ�Ͱ��а�');
INSERT INTO course VALUES('21000540', '�ڷᱸ��', '001', 3, 1, '��ǻ�Ͱ��а�');
INSERT INTO course VALUES('21002146', '���������α׷���', '001', 3, 1, '��ǻ�Ͱ��а�');
INSERT INTO course VALUES('21002146', '���������α׷���', '002', 3, 1, '��ǻ�Ͱ��а�');
INSERT INTO course VALUES('21003917', '����Ʈ����������', '001', 3, 1, '��ǻ�Ͱ��а�');

INSERT INTO course VALUES('21001083', '�濵�����ý���', '001', 3, 1, '�濵�а�');
INSERT INTO course VALUES('21001056', '�����ÿ���', '001', 3, 1, '�濵�а�');
INSERT INTO course VALUES('21001010', '�̽ð�����', '001', 3, 1, '�濵�а�');

INSERT INTO course VALUES('21001063', '�����濵��', '001', 3, 1, '�濵�а�');
INSERT INTO course VALUES('21001079', '����׿����', '001', 3, 1, '�濵�а�');
INSERT INTO course VALUES('21001052', '�繫����', '001', 3, 1, '�濵�а�');

INSERT INTO course VALUES('21002930', '���������ͱ۾���', '001', 2, 0, '����');
INSERT INTO course VALUES('21002931', '�������������', '001', 2, 0, '����');


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
INSERT INTO enroll VALUES('1400000', '21001710', '002', 2018, 2);

INSERT INTO enroll VALUES('1400000', '21003184', '002' , 2019, 1);
INSERT INTO enroll VALUES('1400000', '21003917', '001' , 2019, 1);
INSERT INTO enroll VALUES('1400000', '21002146', '001' , 2019, 1);

INSERT INTO enroll VALUES('1500009', '21003183', '001', 2019, 2);
INSERT INTO enroll VALUES('1500010', '21003183', '001', 2019, 2);
INSERT INTO enroll VALUES('1500011', '21003183', '001', 2019, 2);
INSERT INTO enroll VALUES('1500012', '21003183', '002', 2019, 2);
INSERT INTO enroll VALUES('1500013', '21001710', '001', 2019, 2);
INSERT INTO enroll VALUES('1500013', '21001710', '001', 2019, 2);
INSERT INTO enroll VALUES('1500013', '21000555', '001', 2019, 2);
INSERT INTO enroll VALUES('1500018', '21000549', '001', 2019, 2);
INSERT INTO enroll VALUES('1500019', '21002147', '001', 2019, 2);
INSERT INTO enroll VALUES('1500019', '21002931', '001', 2019, 2);
INSERT INTO enroll VALUES('1500020', '21002931', '001', 2019, 2);
INSERT INTO enroll VALUES('1100031', '21001063', '001', 2019, 2);
INSERT INTO enroll VALUES('1200032', '21001052', '001', 2019, 2);
INSERT INTO enroll VALUES('1300033', '21001052', '001', 2019, 2);

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


INSERT INTO teach VALUES('00001', '21003184', '001', 2018, 1, 1, 5, 3, 5, 3, '��Ű� 409');
INSERT INTO teach VALUES('00003', '21003759', '001', 2018, 1, 2, 2, 4, 2, 3, '��Ű� 411');
INSERT INTO teach VALUES('00004', '21000540', '001', 2018, 1, 1, 2, 3, 2, 3, '��Ű� 309');
INSERT INTO teach VALUES('00005', '21002146', '001', 2018, 1, 1, 1, 3, 1, 3, '��Ű� 414');
INSERT INTO teach VALUES('00005', '21002146', '002', 2018, 1, 1, 2, 3, 2, 3, '��Ű� 414');
INSERT INTO teach VALUES('00006', '21003917', '001', 2018, 1, 2, 2, 4, 2, 3, '��Ű� 106');
INSERT INTO teach VALUES('00007', '21002930', '001', 2018, 1, 2, 2, NULL, NULL, 3, '����� 418');
INSERT INTO teach VALUES('00007', '21002931', '001', 2018, 1, 4, 3, NULL, NULL, 3, '��Ű� 606');
INSERT INTO teach VALUES('00013', '21001083', '001', 2018, 1, 2, 4, 4, 4, 3, '��Ű� 322');
INSERT INTO teach VALUES('00014', '21001056', '001', 2018, 1, 2, 5, 4, 5, 3, '���ð� 101');
INSERT INTO teach VALUES('00015', '21001010', '001', 2018, 1, 1, 6, 3, 6, 3, '���ð� 101');

INSERT INTO teach VALUES('00001', '21003183', '001', 2018, 2, 1, 2, 3, 2, 3, '��Ű� 309');
INSERT INTO teach VALUES('00001', '21003183', '002', 2018, 2, 1, 5, 3, 5, 3, '��Ű� 418');
INSERT INTO teach VALUES('00008', '21001710', '001', 2018, 2, 2, 5, 4, 5, 3, '��Ű� 413');
INSERT INTO teach VALUES('00008', '21001710', '002', 2018, 2, 2, 7, 3, 7, 3, '��Ű� 413');
INSERT INTO teach VALUES('00009', '21000555', '001', 2018, 2, 2, 5, 4, 5, 3, '��Ű� 420');
INSERT INTO teach VALUES('00010', '21000549', '001', 2018, 2, 2, 2, 4, 2, 3, '��Ű� 309');
INSERT INTO teach VALUES('00011', '21000557', '001', 2018, 2, 1, 4, 3, 4, 3, '��Ű� 413');
INSERT INTO teach VALUES('00012', '21000557', '002', 2018, 2, 2, 2, 4, 2, 3, '��Ű� 607');
INSERT INTO teach VALUES('00006', '21002147', '001', 2018, 2, 1, 2, 3, 2, 3, '��Ű� 313');
INSERT INTO teach VALUES('00007', '21002930', '001', 2018, 2, 2, 2, NULL, NULL, 3, '��Ű� 309');
INSERT INTO teach VALUES('00007', '21002931', '001', 2018, 2, 4, 3, NULL, NULL, 3, '��Ű� 308');
INSERT INTO teach VALUES('00016', '21001063', '001', 2018, 2, 1, 4, 3, 4, 3, '����� 319');
INSERT INTO teach VALUES('00017', '21001079', '001', 2018, 2, 1, 2, 3, 2, 3, '����� 214');
INSERT INTO teach VALUES('00018', '21001052', '001', 2018, 2, 2, 4, 4, 4, 3, '����� 319');

INSERT INTO teach VALUES('00001', '21003184', '001', 2019, 1, 1, 5, 3, 5, 3, '��Ű� 408');
INSERT INTO teach VALUES('00002', '21003184', '002', 2019, 1, 1, 4, 1, 5, 3, '��Ű� 409');
INSERT INTO teach VALUES('00003', '21003759', '001', 2019, 1, 2, 2, 4, 2, 3, '��Ű� 413');
INSERT INTO teach VALUES('00004', '21000540', '001', 2019, 1, 1, 2, 3, 2, 3, '�����Ӱ� 203');
INSERT INTO teach VALUES('00005', '21002146', '001', 2019, 1, 1, 1, 3, 1, 3, '��Ű� 413');
INSERT INTO teach VALUES('00005', '21002146', '002', 2019, 1, 1, 2, 3, 2, 3, '��Ű� 413');
INSERT INTO teach VALUES('00006', '21003917', '001', 2019, 1, 2, 2, 4, 2, 3, '��Ű� 103');
INSERT INTO teach VALUES('00007', '21002930', '001', 2019, 1, 2, 2, NULL, NULL, 3, '����� 418');
INSERT INTO teach VALUES('00007', '21002931', '001', 2019, 1, 4, 3, NULL, NULL, 3, '��Ű� 606');
INSERT INTO teach VALUES('00013', '21001083', '001', 2019, 1, 2, 4, 4, 4, 3, '��Ű� 322');
INSERT INTO teach VALUES('00014', '21001056', '001', 2019, 1, 2, 5, 4, 5, 3, '���ð� 101');
INSERT INTO teach VALUES('00015', '21001010', '001', 2019, 1, 1, 6, 3, 6, 3, '���ð� 101');

INSERT INTO teach VALUES('00001', '21003183', '001', 2019, 2, 1, 2, 3, 2, 3, '��Ű� 308');
INSERT INTO teach VALUES('00008', '21001710', '001', 2019, 2, 2, 5, 4, 5, 3, '��Ű� 420');
INSERT INTO teach VALUES('00008', '21001710', '002', 2019, 2, 2, 7, 3, 7, 3, '��Ű� 413');
INSERT INTO teach VALUES('00009', '21000555', '001', 2019, 2, 2, 5, 4, 5, 3, '��Ű� 413');
INSERT INTO teach VALUES('00010', '21000549', '001', 2019, 2, 2, 2, 4, 2, 3, '��Ű� 308');
INSERT INTO teach VALUES('00011', '21000557', '001', 2019, 2, 1, 4, 3, 4, 3, '��Ű� 415');
INSERT INTO teach VALUES('00006', '21002147', '001', 2019, 2, 1, 2, 3, 2, 3, '��Ű� 313');
INSERT INTO teach VALUES('00007', '21002930', '001', 2019, 2, 2, 2, NULL, NULL, 3, '��Ű� 204');
INSERT INTO teach VALUES('00007', '21002931', '001', 2019, 2, 4, 3, NULL, NULL, 3, '��Ű� 203');
INSERT INTO teach VALUES('00016', '21001063', '001', 2019, 2, 1, 4, 3, 4, 3, '����� 319');
INSERT INTO teach VALUES('00017', '21001079', '001', 2019, 2, 1, 2, 3, 2, 3, '����� 214');
INSERT INTO teach VALUES('00018', '21001052', '001', 2019, 2, 2, 4, 4, 4, 3, '����� 319');