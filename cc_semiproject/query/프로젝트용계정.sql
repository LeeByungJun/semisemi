-- ���� ���� ����, ������ �������� ������ ��! --
create user semi identified by semi;
grant connect,resource to semi;
-------------------------------------------
--�湮�� �� �����ϴ� ���̺�
create table visit(
  v_date date not null
);

--���� Ƚ�� �����ϴ� ���̺�
create table reservationcount(
  rc_date date not null
);

insert into reservationcount values (sysdate);

CREATE TABLE GRADE(
  G_CODE VARCHAR2(2) PRIMARY KEY,
  G_RANK VARCHAR2(20) not null,
  G_RATE NUMBER(3) not null,
  G_COMMENTS varchar2(500) not null,
  G_COMMENTS2 varchar2(500)
);

COMMENT ON COLUMN GRADE.G_CODE IS '��޹�ȣ';
COMMENT ON COLUMN GRADE.G_RANK IS '��޸�';
COMMENT ON COLUMN GRADE.G_RATE IS '������';
COMMENT ON COLUMN GRADE.G_COMMENTS IS '��������';
COMMENT ON COLUMN GRADE.G_COMMENTS2 IS '��������2';

INSERT INTO GRADE (G_CODE, G_RANK, G_RATE, G_COMMENTS) VALUES ('G1', 'GOLD', '30', '���� : SILVER��� 5�� ���� ���� ȸ��"<br>"���� : GOLD��� �� �� �� 9���� �̻� �̿� ȸ��');
INSERT INTO GRADE (G_CODE, G_RANK, G_RATE, G_COMMENTS) VALUES ('G2', 'SILVER', '20', '���� : BRONZE ��� 3�� ���� ���� ȸ��"<br>"���� : SILVER��� �� �� �� 6���� �̻� �̿� ȸ��');
INSERT INTO GRADE (G_CODE, G_RANK, G_RATE, G_COMMENTS) VALUES ('G3', 'BRONZE', '10', '���� : �ű� ȸ�� �Ǵ�, ���� ���� �� �� 5ȸ �̸� �̿� ȸ��"<br>"���� : BRONZE ��� �� �� �� 3���� �̻� �̿� ȸ��');
INSERT INTO GRADE (G_CODE, G_RANK, G_RATE, G_COMMENTS) VALUES ('G4', 'BASIC', '0', '��ȸ�� �� ���� ���');

create table member(
  mem_num number(5) primary key,
  email varchar2(50) unique,
  password varchar2(250) not null,
  name varchar2(20) not null,
  birthday varchar2(15) not null,
  phone varchar2(30) not null,
  address varchar2(300) not null,
  count number(3) default 0,
  cansell char(1) default 'N',
  g_code varchar2(2) not null,
  FOREIGN key (g_code) references grade(g_code)
);

COMMENT ON COLUMN member.mem_num IS 'ȸ����ȣ';
COMMENT ON COLUMN member.email IS '�̸���';
COMMENT ON COLUMN member.password IS '��й�ȣ';
COMMENT ON COLUMN member.name IS 'ȸ���̸�';
COMMENT ON COLUMN member.birthday IS '�������';
COMMENT ON COLUMN member.phone IS '��ȭ��ȣ';
COMMENT ON COLUMN member.address IS '�ּ�';
COMMENT ON COLUMN member.count IS '�Ű����Ƚ��';
COMMENT ON COLUMN member.cansell IS '�ǸŰ�����������';
COMMENT ON COLUMN member.g_code IS '����ڵ�';

insert into member values ((select max(mem_num)+1 from member),'abc@naver.com','12345678','����','940101','010-1234-4567','����� ��',default,default,'G2');
insert into member values ((select max(mem_num)+1 from member),'abc1@naver.com','12345678','Ŭ��','950101','010-1234-4567','����� ���빮�� ������',default,default,'G2');
insert into member values ((select max(mem_num)+1 from member),'abc2@naver.com','12345678','����','930101','010-1234-4567','����� ���� ���굿',default,default,'G1');
insert into member values ((select max(mem_num)+1 from member),'abc3@naver.com','12345678','����','920101','010-1234-4567','����� ������ ��ϵ�',default,default,'G1');
insert into member values ((select max(mem_num)+1 from member),'abc4@naver.com','12345678','�Ҷ�ī','910101','010-1234-4567','��⵵ ������',default,default,'G1');
insert into member values ((select max(mem_num)+1 from member),'abc5@naver.com','12345678','����','900101','010-1234-4567','��⵵ ȭ����',default,default,'G3');
insert into member values ((select max(mem_num)+1 from member),'abc6@naver.com','12345678','���̹�','920204','010-1234-4567','��⵵ �ǿս�',default,default,'G3');
insert into member values ((select max(mem_num)+1 from member),'abc7@naver.com','12345678','����','921101','010-1234-4567','�λ걤���� ����',default,default,'G3');
insert into member values ((select max(mem_num)+1 from member),'abc8@naver.com','12345678','ī�̻�','990504','010-1234-4567','��õ������ ����',default,default,'G3');
insert into member values ((select max(mem_num)+1 from member),'abc9@naver.com','12345678','����','890101','010-1234-4567','��õ������ ����',default,default,'G4');
insert into member values ((select max(mem_num)+1 from member),'abc10@naver.com','12345678','������','880101','010-1234-4567','������ ���ؽ�',default,default,'G4');
insert into member values ((select max(mem_num)+1 from member),'abc11@naver.com','12345678','�ҳ�','870101','010-1234-4567','������ ��ô��',default,default,'G4');
insert into member values ((select max(mem_num)+1 from member),'abc12@naver.com','12345678','����','891211','010-1234-4567','���󳲵� ����',default,default,'G1');
insert into member values ((select max(mem_num)+1 from member),'abc13@naver.com','12345678','����','950404','010-1234-4567','�س���������',default,default,'G1');
insert into member values ((select max(mem_num)+1 from member),'abc14@naver.com','12345678','����Ʈ','910201','010-1234-4567','�������� õ�Ƚ�',default,default,'G2');
insert into member values ((select max(mem_num)+1 from member),'abc15@naver.com','12345678','������','930101','010-1234-4567','��û�ϵ� û�ֽ�',default,default,'G2');
insert into member values ((select max(mem_num)+1 from member),'abc16@naver.com','12345678','��Į','940807','010-1234-4567','����� ���빮�� â����',default,default,'G3');
--�ǸŰ�������
insert into member values ((select max(mem_num)+1 from member),'zzz123@naver.com','12345678','���ؽ�','950419','010-1234-4567','���ϵ�',2,'Y','G2');
insert into member values ((select max(mem_num)+1 from member),'zz1423@naver.com','12345678','�̿�ȣ','920706','010-1234-4567','����� ������',default,'Y','G3');
insert into member values ((select max(mem_num)+1 from member),'abc19@naver.com','12345678','������','910112','010-1234-4567','����� ������',default,'Y','G3');
insert into member values ((select max(mem_num)+1 from member),'abc20@naver.com','12345678','ȫ��ȣ','851007','010-1234-4567','����� ������ ����',1,'Y','G1');
--�Ű��̹�������
insert into member values ((select max(mem_num)+1 from member),'badcustomer1@naver.com','12345678','������','890101','010-1234-4567','���',3,'Y','G2');
insert into member values ((select max(mem_num)+1 from member),'badcustomer2@naver.com','12345678','������','891231','010-1234-4567','�������',3,'Y','G2');

create table faq(
  f_no number(5) primary key,
  f_category varchar2(30) not null,
  f_title varchar2(150) not null,
  f_contents varchar2(1200) not null
);

insert into faq values ((select max(f_no)+1 from faq),'����','����','����');
commit;

COMMENT ON COLUMN faq.f_no IS 'faq���̺��ȣ';
COMMENT ON COLUMN faq.f_category IS 'ī�װ�';
COMMENT ON COLUMN faq.f_title IS 'faq����';
COMMENT ON COLUMN faq.f_contents IS '����';

create sequence faq_no
minvalue 0 start with 1;

insert into faq values (faq_no.nextval,'����ã������','��� ���� �߻� �� ��ϸ� �ǳ���?','���, ������ �߻��ϼ̽��ϱ�? ��Ȳ���� ���ð�,1544-1600�� ��ȭ �ּ���. 1�� ���, ���� ������ ��������. ���� CNC����ī�� 24�ð� ���߹��� ���ü��͸� ��ϸ� ���Ե��� ���Ǹ� �����ϰ� �ֽ��ϴ�. ������ ������ ���� ��� ��Ȳ���� ���ð� ������ ���ؼ��ͷ� �����ֽñ� �ٶ��ϴ�. �ٷ� �ذ��� �帮�ڽ��ϴ�.');
insert into faq values (faq_no.nextval,'����ã������','CNC ����ī���� �� ���������� �뿩�� �� �ֳ���?','��翡�� �� ���������� �����ϰ� ���� �ʽ��ϴ�. ���� ���� �������� ���ذ� Ŭ �Ӵ���, ��ĩ �θ� ���ط� �̾��� �� �־� ���� ������ ���� �������� �뿩 ���� �ּ� ������ ������ ���ҽ��ϴ�. ���� ������ ���������� �������� ô���� ���� ������ �ּ����� ���� ��ġ�̴� ���� ���غ�Ź �帳�ϴ�.');
insert into faq values (faq_no.nextval,'����ã������','������ ��� �ð����� �ʰ��ؼ� ����ϰ� �� ��� ����� ��� �ǳ���?','�켱, ������ ����� �����ϼž� �Ѵٸ� �ݵ�� ��ӵ� �ݳ� �ð� ������ ��� ������ ������ �ϼż� ���� ���Ǹ� �޾ƾ� �մϴ�. ���� ���� �� �ʰ���뿡 ���� ���� �������ظ�å����(��������) �ڵ����忩�ο� ���ؼ��� �ݵ�� ��� ������ �����Ͻñ� �ٶ��ϴ�. �������ظ�å������ 1�� ������ �ڵ� ����ǿ��� ���� Ȯ���Ͻ� �� ������ ��ġ ������ ��� �ݵ�� CNC����ī �������� ������ ������ �ּž� �մϴ�. ���� ���� ���� ���Ƿ� ������ �Ͻ� ���, ����� �������ؿ� ���ؼ� ���� �� ��å�� ���� ���� �� ������ �����Ͻñ� �ٶ��ϴ�.');
insert into faq values (faq_no.nextval,'����ã������','���躸�� �� �������� ��å������ ���� �˰� �ͽ��ϴ�.','�������� �ڵ������պ���(����,�빰,�ڼ�)�� ���ԵǾ�������, ����Ͻ� ��2�����ڱ��� ������ ���Ե˴ϴ�. ���� : ���Ѵ� / �ڼ� : �δ� 15,000,000�� ���� / �빰 : �Ǵ� 20,000,000�� ���� (��, ��༭�� ��ϵ��� ���� �������� ���, ���պ��� �� �������ظ�å������ ���������� ������ �� �����ϴ�.) * �������ظ�å���� : �������� ���ǿ� ���� �뿩���� ���ش� �������� å���̳�, �� ������ ���������ν� ���� ������ �� �ֽ��ϴ�.');
insert into faq values (faq_no.nextval,'����Ʈ�̿�','ȸ�������� �ϸ� � ������ �ֳ���?','���� CNC����ī ȸ������ 4���� ����� �ֽ��ϴ�. �Ϲ�, �����, �ǹ�, ���. CNC ȸ���� �� ��޿� ���� 10% ~ 30%������ ���������� �������� �� ������, ���÷� ������������, �����̿� �� ���׷��̵� ���� ���ð� �����װ� ���ϸ��� �������� ������ �� �ֽ��ϴ�. �ڼ��� ����� ������ ��My Page���� ���� ���� Ȯ�� �Ͻ� �� �ֽ��ϴ�.');
insert into faq values (faq_no.nextval,'����Ʈ�̿�','Ȩ������ ID�� PASSWORD�� �н��߽��ϴ�.','Ȩ������ ���� ����� �α��� ��ư�� ���� ���̵�/��й�ȣ ã�⸦ �������ּ���. �缳���� �����մϴ�.');
insert into faq values (faq_no.nextval,'ȸ������','ȸ�������� �ϸ� �ٷ� ���� ������ �����Ѱǰ���?','��, �����Դϴ�. �¶��� ȸ�������� ���ؼ� �پ��� ȸ�� ������ ��������');
insert into faq values (faq_no.nextval,'ȸ������','ȸ������ ������ ����� ������ ����Ʈ ������ �����Ѱ���?','ȸ�� ����Ʈ�� ȸ�� ���� ������ ������ ���ؼ��� ���� �����մϴ�. ���� �����װ� ���ϸ����� ��쿡�� ���� ������ ���ؼ��� �ұ� ������ �Ұ��� �Ͽ���, ���� �뿩 �� ȸ�� ����Ʈ �������θ� ��� �������� Ȯ���� ���� ���� ���ص帳�ϴ�.');
insert into faq values (faq_no.nextval,'���뿩','���뿩�� ������ �����ΰ���?','1)���� ��� ������ ���� ��� 
2) LPG ������� ���� ����� ���� ȿ�� �� ȯ�� ��ȣ 
3) ���� ��� ���鿡�� ���� �뿩�ᰡ ������ ������ ��� 
4) ���� ���� ��Ż ��ü�� �ڻ� ����, ��ä ���� ���� 
5) ���� ���� ������ ���ʿ信 ���� �ΰǺ� ������ �η°��� ȿ���� ���� 
6) ���� ���� �� ���� ������� ���� ���ϰ� �ﰢ���� ��� �� ����ó�� 
7) ������, ������, ���� �� ������ �� ������ ���� ������� ���� �뿩�ῡ ���� ���ó�������� ����ȿ�� �ش�ȭ 
8) �ʱ� ���� ���ſ� �ҿ�Ǵ� �ں����� ȿ���� Ȱ�� 
9) 10���� �Ǵ� ������ ������ ���� ���� ���� ��󿡼� ���� 
10) �Ǽ�/�ո�/������ �ǹ��ϴ� ��ȭ�� ���㡯�� �̹��� 
11) ��ȹ���� ���� ���� ���� �� ������ �λ� ���� ���� �ʴ� �纸�� ���� 
12) ��ȸ ���� ������ �̿��� �������� ���� �� �������� �ǽ÷� �������� ���� 
13) �Ϲ� ����ī ���� ���� �� ���� ���� ���� ���� �ΰ� ����');
insert into faq values (faq_no.nextval,'���뿩','���뿩�� �������� �������� �����ΰ���?','���� ū ���������� ���뿩�� ����ī ȸ���� ��ǰ������, ������ ������ǰ���� �� ĳ��Ż����� �ݸ��� ������ ���� ��Ǵ� �Һ�/��������/��븮�� ��ǰ�̶�� ���Դϴ�. 
�׷��� ������ ��� ���� �� ���� ���踦 �����ϰ� �����ϰ� �־� ������ �����ϸ�, ���� �ε��ñ����� ������ ������ �����ϰ� �־� ���� ������ �ٸ��ϴ�.');



create table p2p(
p_num number(5) primary key,
p_board number(5),
p_sysdate date,
p_title varchar2(150),
p_context varchar2(1200),
p_original_filename varchar2(100),
p_rename_filename varchar2(100),
mem_num number(5),
g_code varchar2(2),
FOREIGN key (mem_num) references member(mem_num),
FOREIGN key (g_code) references grade(g_code)
);

COMMENT ON COLUMN p2p.p_num IS 'p2p����ȣ';
COMMENT ON COLUMN p2p.mem_num IS 'ȸ����ȣ';
COMMENT ON COLUMN p2p.g_code IS '��޹�ȣ';
COMMENT ON COLUMN p2p.p_board IS '�Խ��ǹ�ȣ';
COMMENT ON COLUMN p2p.p_sysdate IS '�ۼ���';
COMMENT ON COLUMN p2p.p_title IS '����';
COMMENT ON COLUMN p2p.p_context IS '����';
COMMENT ON COLUMN p2p.p_original_filename IS '÷������';
COMMENT ON COLUMN p2p.p_rename_filename IS '��������';
--insert into p2p values (1,1,'G1',1,sysdate,'�ȳ��ϼ��� �� �����ϵ��Ⱥ��������','���� �̰� �����',

create table PurchasePage(
i_num number(5) primary key,
p_num number(5) not null, 
FOREIGN key (p_num) references p2p(p_num)
);

COMMENT ON COLUMN PurchasePage.i_num IS '�����۹�ȣ';
COMMENT ON COLUMN PurchasePage.p_num IS '������Ÿ��';




create table message(
m_num number(5) primary key,
p_num number(5) not null,
m_sysdate date,
m_title varchar2(150) not null,
m_context varchar2(1200) not null,
FOREIGN key(p_num) references p2p(p_num)
);

COMMENT ON COLUMN message.m_num IS '������ȣ';
COMMENT ON COLUMN message.p_num IS 'p2p����ȣ';
COMMENT ON COLUMN message.m_sysdate IS '�ۼ���';
COMMENT ON COLUMN message.m_title IS '��������';
COMMENT ON COLUMN message.m_context IS '��������';

create table item(
i_num number(5) not null,
i_item varchar2(90) not null,
i_itemname varchar2(100) not null,
i_sysdate date,
FOREIGN key (i_num) references PurchasePage(i_num)
);

COMMENT ON COLUMN item.i_num IS '�����۹�ȣ';
COMMENT ON COLUMN item.i_item IS '������Ÿ��';
COMMENT ON COLUMN item.i_itemname IS '�����۸�';
COMMENT ON COLUMN item.i_sysdate IS '��¥';


 --New�������� �������̺����
create table newnotice(
     n_no number(3) primary key, 
     n_title varchar2(150) not null,
     n_writer varchar2(60), 
     n_contents varchar2(4000) not null, 
     n_sysdate Date, 
     readcount number(4) default 0
 );
 
 COMMENT ON COLUMN NEWNOTICE.N_NO IS '�������� ��ȣ';
 COMMENT ON COLUMN NEWNOTICE.N_TITLE IS '�������� Ÿ��Ʋ';
 COMMENT ON COLUMN NEWNOTICE.N_WRITER IS '�������� �ۼ���';
 COMMENT ON COLUMN NEWNOTICE.N_CONTENTS IS '�������� ����';
 COMMENT ON COLUMN NEWNOTICE.N_SYSDATE IS '�������� �ۼ���';
 COMMENT ON COLUMN NEWNOTICE.READCOUNT IS '��ȸ��';
 
--insert�� ���ñ��� 
insert into newnotice values(1, '��CnC����ī Ȩ������ ���¾ȳ�!��', 'Administrator', 
'�ȳ��ϼ���!!
���ѹα� �ְ��� ����ȭ�� ��Ʈ�� �����ϴ� CnC����ī ����Ʈ�� ���� �Ǿ����ϴ�.! 
���� �پ��� �̺�Ʈ�� ���������� �ֻ��Ǽ��񽺷� ���Բ� ����帮�ڽ��ϴ�. 
�׻� ������ �ǰ߿� ���Ͽ� �ּ������Ͽ� ���ϰڽ��ϴ�. 
�����մϴ�.!.!', sysdate, default);


insert into newnotice values(2, 'Ȩ������ �������� �ȳ�', 'Administrator', 
'�ȳ��ϼ��� ������ �������� ��Ʈ�ص帮�� CnC����ī�Դϴ�. 
��� Ȩ������ ���� �������� ���� �ϱ�� ���� �Ϻ� �ð� Ȩ������ ������ �Ұ��մϴ�. 

- �Ͻ� : 2013�� 5�� 21�� ���� 11�� ~ 5�� 22�� ���� 6�� 

- ���� : Ȩ������ ���� ���� �������� �ý��� ������ ���� �۾����� 
  �ټ� �����Ͻô��� �� �������� ���� ���ؿ� ���عٶ��ϴ�. �����մϴ�.', sysdate, default);


insert into newnotice values(3, '���� �뿩��� ���� �ȳ� (��������)', 'Administrator', 
'�ȳ��ϼ��� ������ �������� ��Ʈ�ص帮�� CnC����ī�Դϴ�. 
���Բ� ���� ���� ���񽺸� �����ϱ� ���Ͽ�. 2018�� 4�� 4�Ϻ��� �������� �Ϻ� ������ �뿩����� ����ǿ��� 
�̿뿡 �����Ͽ� �ֽñ� �ٶ��ϴ�. 

�׻� �ֻ��� ���񽺿� �� ������ ��ǥ�� �ּ��� ���ϵ��� ����ϰڽ��ϴ�. 

1) �������� : ���� �� ���� 

2) �������� : 2018�� 4�� 4��(��) 09:00 ���� ���� �����к��� ���� 

3) ���� : ���ü��� 1544-1600 (����2) 

* 2018�� X��X�� 09:00 �������� ������ ������ ���� �� �����뿩����� ���� �˴ϴ�. 
* 2018�� X��X�� 09:00 ���Ŀ��� ������Ȯ�Ρ� �޴����� ���� ���� ��Ȳ Ȯ�� �� ���� �� ������� 
  ��ȸ�� �� ������, ���� �� ���� �������� ���� �뿩 �� ���� �� ����� ����ǿ��� �����Ͽ� �ֽñ� �ٶ��ϴ�.', sysdate, default);


insert into newnotice values(4, '�ڡڡ�~��andȣ ��ȣ�� ��� ��� ����ȣȣ ��ſ� �̺�Ʈ~~�ڡڡ�' , 'Administrator', 
'�ȳ��ϼ��� ������ �������� ��Ʈ�ص帮�� CnC����ī �Դϴ�. 
���� ���� CnC����ī ��ⷻ��ī�� ã���ֽ� ��� ���в� ������ ������ ���մϴ�. 

�� ��andȣ ��ȣ�� ��� ��� ����ȣȣ ��ſ� �̺�Ʈ �� ��÷��(10��) ��ǥ�մϴ�. 
�̸� : ����* �ڵ������ڸ� : 3916  �̸� : �Ȼ�* �ڵ������ڸ� : 1268 
�̸� : ����* �ڵ������ڸ� : 1050  �̸� : �蹮* �ڵ������ڸ� : 5029  
�̸� : ��â* �ڵ������ڸ� : 1982  �̸� : ����* �ڵ������ڸ� : 2515 
�̸� : ���* �ڵ������ڸ� : 2040  �̸� : ����* �ڵ������ڸ� : 7209 
�̸� : ����* �ڵ������ڸ� : 7982  �̸� : �迵* �ڵ������ڸ� : 3121 

��ǰ ���� : SK��ǰ�� 5������ 

��ǰ ���� ��� : 
1    �̸��Ϸ� ��÷ �ȳ� ���� ���� (10�� 13�� �߼� ����) 
2    ���� Ȯ�� �� ��ǰ ������ ���� �ּ� ȸ�� (10�� 25�� ����) 
3    �����ֽ� ��÷�ں��� �ּҷ� ��ǰ �߼� ��ǰ �߼� 

�������� : 10�� 25��', sysdate, default);

insert into newnotice values(5, '���������� ���������� �̺�Ʈ ��÷�� ��ǥ!', 'Administrator',
'�ȳ��ϼ��� ������ �������� ��Ʈ�ص帮�� CnC����ī �Դϴ�. 
���� �Ѵ� ���� ���� ������ <CnC����ī, CnC��ī ������ ���� ������ �̺�Ʈ> ��÷�ڸ� ��ǥ�ص帳�ϴ�. 
<��÷�� �ȳ�> 
�̺�Ʈ �ϳ�. ���� �̺�Ʈ http://blog.naver.com/ajnyou/130184234826 
�̺�Ʈ ��. �ܿ����,�Ҹ� �̺�Ʈ http://blog.naver.com/ajnyou/130184248937 

�������ֽ� ��� ���в� ���� ���� �� ���� �̺�Ʈ�����ϴ�. 
���� �����в� �ٽ� �� �� �������� ����帳�ϴ�.', sysdate, default);

insert into newnotice values(6, '2�� �� ���� �̺�Ʈ ��÷�ڸ� ��ǥ�մϴ�~~~~~~~~~~~��', 'Administrator', 

'�ȳ��ϼ��� ������ �������� ��Ʈ�ص帮�� CnC����ī �Դϴ�. 
2�� �� �� �� ���� CnC����ī�� �̿��� �ֽ� ���Ե��� ������� �����ߴ� ��� �ı� �̺�Ʈ�� ��÷�ڸ� ��ǥ�մϴ�. 


���� �� �ֽ� ��� ȸ���Ե鲲 �������� ���縦 �帮��, 
�������� �ǰ� �ϳ��ϳ��� ������ ���� ������ ���� ���������� Ȱ���Ͽ� ���� �����ϴ� CnC����ī�� ����ڽ��ϴ�. 

* ������ 24�ð� ���� �̿�� (5��) - �����(kla***) / ���缺(jes***) / ������(hjs***) / ����(kyi***) / �迹��(sjl***) 

* ������ 24�ð� ���� �̿�� (5��) - ����(ksb***) / ����ö(ura***) / ������(kjo***) / �̽¿�(yon***) / ����ö(zxz***) 

* ����ī 20,000�� ���α� (10��) - ������(nal***) / �ֿ���(pou***) / ���ϵ�(gno***) / ����ȣ(mcs***) / ������(hel***) /������(joy***) / 
            ����(kgg***) / ������(zer***) / �Ÿ���(jin***) / ���޿�(gir***) 

* ����ī 10,000�� ���α� (10��) - ����ȭ(mck***) / �̰���(lkh***) / �迵��(new***) / ������(jse***) / ������(zen***) / ������(lak***) / 
             �ڹμ�(dlo***) / ����ȣ(IVE***) / Ȳ����(hhw***) / ������(tlz***) 



* ���α��� ��Ȱ�� ���� �߼��� ����, ������ ��������(�����ּ�)�� Ȯ�� �� ���� ��Ź �帳�ϴ�. 
* ���� ���� ����/���� ������ ���� ���, ���� �� ȸ�� ������ �ǰ��Ͽ� ���α��� �߼��ص帳�ϴ�. (������ 5�� 20��(ȭ)���� �߼۵˴ϴ�.) 
* ���α� ���� �߼��� ��� ������ ���� ���� �� ����� �� �ֽ��ϴ�. * �߼� �߿� �нǵǴ� ��� ���ؼ��� ��翡�� å������ �ʽ��ϴ�.', sysdate, default);

insert into newnotice values(7, '�� Ÿ�ӽ��������� �ű� ���� �ȳ� ��', 'Administrator', 
'�� Ÿ�ӽ��������� �ű� ���¾ȳ� �� 
�ȳ��ϼ��� ������ �������� ��Ʈ�ص帮�� CnC����ī �Դϴ�. 

CnC����ī�� �� �����е��� ������ ���Ծ� Ÿ�ӽ����������� �ű� ������ �մϴ�~ 
���� �����ϴ� Ÿ�ӽ��������� ���� �̿�ٶ��ϴ�. �����մϴ�. 


<Ÿ�ӽ���������> 

+ �ּ� : ����� �������� ��������4�� 442 Ÿ�ӽ����� ���� 2�� 203ȣ  

+ ����ö : 1ȣ�� �������� ������η� ���� / 5ȣ�� ���������忪 4���ⱸ / 2ȣ�� ������ 4���ⱸ 

+ ���� : ���� 160,260,503,600,660A,660B / ���� 5614,5615,5714,6512,6513,6637,6640 / �Ϲ� 11,11-2,88,92', sysdate, default); 


insert into newnotice values(8, '3�� �� ���� �̺�Ʈ ��÷�ڸ� ��ǥ�մϴ�~~~~~~~~~~~��', 'Administrator', 
'�ȳ��ϼ��� ������ �������� ��Ʈ�ص帮�� CnC����ī �Դϴ�. 
2015�� 3�� �� �� �� ���� CnC����ī�� �̿��� �ֽ� ���Ե��� ������� �����ߴ� ��� �ı� �̺�Ʈ�� ��÷�ڸ� ��ǥ�մϴ�. 

���� �� �ֽ� ��� ȸ���Ե鲲 �������� ���縦 �帮��,  
�������� �ǰ� �ϳ��ϳ��� ������ ���� ������ ���� ���������� Ȱ���Ͽ�  ���� �����ϴ� CnC����ī�� ����ڽ��ϴ�. 


* ������ 24�ð� ���� �̿�� (5��) - ���߱�(ljg0***) / ������(bns***) / ȫ����(q***) / ��â��(scb8***) / ���ָ�(dofla0***) 


* ������ 24�ð� ���� �̿�� (5��)- ������(ojs0***) / ����ȣ(wjdgh7***) / �ڿ���(gar***) / ä����(cuty1***) / ������(cbr2***) 


* ����ī 20,000�� ���α� (10��) - �̽���(nicew***) / ���ؼ�(dhkdlz***) / ��ο�(tngb***) / ���μ�(is***) / ���μ�(weer***) / 
            �ڹο�(ipmuk***) / �����(lalal***) / �����(vkghsrj***) / ���ű�(mimi***) / �̼���(laf***) 


* ����ī 10,000�� ���α� (10��) - ���ֿ�(rz***) / ������(jkjun***) / ������(lanian2***) / ����(temt***) / ���볲(yepba***) / 
                ������(holyst***) / �̼���(sooks***) / ������(nextage***) / ��öȣ(techn***) / ����(susilk9***) 

* �̿���� ��Ȱ�� ���� �߼��� ����, ������ ��������(�ּ�,����ó)�� Ȯ�� �� ���� ��Ź �帳�ϴ�. 
* ���� ���� ����/���� ������ ���� ���, ���� �� ȸ�� ������ �ǰ��Ͽ� ���α��� �߼��ص帳�ϴ�. (���� �̿���� 2016�� 1�� 11��(��)���� ���� �߼۵Ǹ�, ���α��� ��� MMS�� �߼� �˴ϴ�.) 
* �̿�� ���� �߼��� ��� ������ ���� ���� �� ����� �� �ֽ��ϴ�. * �߼� �߿� �нǵǴ� ��� ���ؼ��� ��翡�� å������ �ʽ��ϴ�.', sysdate, default); 

insert into newnotice values(9, '4�� �� ���� �̺�Ʈ ��÷�ڸ� ��ǥ�մϴ�~~~~~~~~~~~��', 'Administrator', 
'�ȳ��ϼ��� ������ �������� ��Ʈ�ص帮�� CnC����ī �Դϴ�. 
2016�� 4�� �� �� �� ���� CnC����ī�� �̿��� �ֽ� ���Ե��� ������� �����ߴ� ��� �ı� �̺�Ʈ�� ��÷�ڸ� ��ǥ�մϴ�. 

���� �� �ֽ� ��� ȸ���Ե鲲 �������� ���縦 �帮��, 
�������� �ǰ� �ϳ��ϳ��� ������ ���� ������ ���� ���������� Ȱ���Ͽ� ���� �����ϴ� CnC����ī�� ����ڽ��ϴ�. 

* ������ 24�ð� ���� �̿�� (5��) -  �̼���(gra***) / �ſ�(puhaha1***) / ���»�(green***) / �ӿ���(khb***) / ������(i***) 

* ������ 24�ð� ���� �̿�� (5��) - ��ҹ�(goldja***) /������(w821***) / ������(mus***) / �̰浿(loverd***) / ���α�(akill***) 

* ����ī 20,000�� ���α� (10��) - ������(wlgml***) / ���ֿ�(best5***) / ������(arun***) / ���汸(revers***) / ��ö��(femin***) 
             ������(neversa***) / ������(kis***) / �̿��(bonole***) / ������(sweetyl***) / �輱��(kim_sun***) 

* ����ī 10,000�� ���α� (10��) - ������(jant***) / ������(kom***) / ���ؼ�(hjs8***) / �ȱ���(keej***) / �輺��(drki***) ������(feele***) / 
             �ڼ���(insimp***) / ������(bikeh***) / �����(eoajfle***) / Ȳ����(cart***) 

* �̿���� ��Ȱ�� ���� �߼��� ����, ������ ��������(�ּ�,����ó)�� Ȯ�� �� ���� ��Ź �帳�ϴ�. 
* ���� ���� ����/���� ������ ���� ���, ���� �� ȸ�� ������ �ǰ��Ͽ� ���α��� �߼��ص帳�ϴ�. (���� �̿���� 2016�� 3�� 14��(��)���� ���� �߼۵Ǹ�, ���α��� ��� MMS�� �߼� �˴ϴ�.) 
* �̿�� ���� �߼��� ��� ������ ���� ���� �� ����� �� �ֽ��ϴ�. * �߼� �߿� �нǵǴ� ��� ���ؼ��� ��翡�� å������ �ʽ��ϴ�.', sysdate, default); 

insert into newnotice values(10, '�� �������� Ȯ�� ���� �ȳ� ��', 'Administrator', 
'�� �������� Ȯ�� ���� �ȳ� �� 
CnC����ī�� �� �����е��� ������ ���Ծ� ���������� Ȯ�� ���� �մϴ�.. 
���� �����ϴ� �������� ���� �̿�ٶ��ϴ�. �����մϴ�. 

�� �������� : 2015�� 6�� 15�� ���� 

�� �������� 
-  �ּ� : ���� ������ ���걸 ������ 1358,1359 
-  ��ȭ��ȣ : T. 062-373-7113 / F. 062-373-7165  
-  �����ð� : ��~��: 08:30 ~ 19:30 / ��~��(������) : 09:00 ~ 18:00 

�� �������� 
- ����ö : 1ȣ�� ���ּ������� ������ ���� ���� ������� 200M ���� 

<���� : ���걸û���� ������ ���� 5M ~.> 
- ���� ���� : ����93�� ����96�� ����97�� ����99�� ����100�� 
- ���� ���� : ��22 ����19�� ����29�� ����98��  
- ���� ���� : ����720-1�� ��701�� ����700�� ����720��', sysdate, default); 

insert into newnotice values(11, 'Ȩ������ �������� �ȳ�', 'Administrator', 
'�ȳ��ϼ��� ������ �������� ��Ʈ�ص帮�� CnC����ī�Դϴ�. 
��� Ȩ������ ���� �������� ���� �ϱ�� ���� �Ϻ� �ð� Ȩ������ ������ �Ұ��մϴ�. 

- �Ͻ� : 2018�� X�� X�� ���� 11�� ~ 5�� 22�� ���� 6�� 
- ���� : Ȩ������ ���� ���� �������� �ý��� ������ ���� �۾����� �ټ� �����Ͻô��� �� �������� ���� ���ؿ� ���عٶ��ϴ�. �����մϴ�.', sysdate, default);

insert into newnotice values(12, '���� �뿩��� ���� �ȳ� (��������)', 'Administrator', 
'�ȳ��ϼ��� ������ �������� ��Ʈ�ص帮�� CnC����ī�Դϴ�. 
���Բ� ���� ���� ���񽺸� �����ϱ� ���Ͽ� 2018�� X�� X�Ϻ��� �������� �Ϻ� ������ �뿩����� ����ǿ��� �̿뿡 �����Ͽ� �ֽñ� �ٶ��ϴ�. 
�׻� �ֻ��� ���񽺿� �� ������ ��ǥ�� �ּ��� ���ϵ��� ����ϰڽ��ϴ�. 

1) �������� : ���� �� ���� 

2) �������� : 2018�� 4�� 4��(��) 09:00 ���� ���� �����к��� ���� 

3) ���� : ���ü��� 1544-1600 (����2) 

* 2018�� 4�� 4�� 09:00 �������� ������ ������ ���� �� �����뿩����� ���� �˴ϴ�. 
* 2018�� 4�� 4�� 09:00 ���Ŀ��� ������Ȯ�Ρ� �޴����� ���� ���� ��Ȳ Ȯ�� �� ���� �� ������� ��ȸ�� �� ������, 
���� �� ���� �������� ���� �뿩 �� ���� �� ����� ����ǿ��� �����Ͽ� �ֽñ� �ٶ��ϴ�.', sysdate, default);

insert into newnotice values(13, '�ڡڡ�~��andȣ ��ȣ�� ��� ��� ����ȣȣ ��ſ� �̺�Ʈ~~�ڡڡ�' , 'Administrator', 
'�ȳ��ϼ��� ������ �������� ��Ʈ�ص帮�� CnC����ī �Դϴ�. 
���� ���� CnC����ī ��ⷻ��ī�� ã���ֽ� ��� ���в� ������ ������ ���մϴ�. 

�� ��andȣ ��ȣ�� ��� ��� ����ȣȣ ��ſ� �̺�Ʈ �� ��÷��(10��) ��ǥ�մϴ�. 

�̸� : ����* �ڵ������ڸ� : 3916 �̸� : �Ȼ�* �ڵ������ڸ� : 1268 
�̸� : ����* �ڵ������ڸ� : 1050 �̸� : �蹮* �ڵ������ڸ� : 5029 
�̸� : ��â* �ڵ������ڸ� : 1982 �̸� : ����* �ڵ������ڸ� : 2515 
�̸� : ���* �ڵ������ڸ� : 2040 �̸� : ����* �ڵ������ڸ� : 7209 
�̸� : ����* �ڵ������ڸ� : 7982 �̸� : �迵* �ڵ������ڸ� : 3121 

�� ��ǰ ���� : SK��ǰ�� 5������ ��ǰ 

�� ���� ��� 
1    �̸��Ϸ� ��÷ �ȳ� ���� ���� (10�� 13�� �߼� ����) 
2    ���� Ȯ�� �� ��ǰ ������ ���� �ּ� ȸ�� (10�� 25�� ����) 
3    �����ֽ� ��÷�ں��� �ּҷ� ��ǰ �߼� ��ǰ �߼� �������� : 10�� 25��', sysdate, default);

insert into newnotice values(14, '���������� ���������� �̺�Ʈ ��÷�� ��ǥ!', 'Administrator', 
'�ȳ��ϼ��� ������ �������� ��Ʈ�ص帮�� CnC����ī �Դϴ�.  
���� �Ѵ� ���� ���� ������ <CnC����ī, CnC��ī ������ ���� ������ �̺�Ʈ> ��÷�ڸ� ��ǥ�ص帳�ϴ�. 

<��÷�� �ȳ�> 
�� �̺�Ʈ �ϳ�. ���� �̺�Ʈ http://blog.naver.com/ajnyou/130184234826 

�� �̺�Ʈ ��. �ܿ����,�Ҹ� �̺�Ʈ http://blog.naver.com/ajnyou/130184248937 
    �������ֽ� ��� ���в� ���� ���� �� ���� �̺�Ʈ�����ϴ�. 

���� �����в� �ٽ� �� �� �������� ����帳�ϴ�.', sysdate, default);

insert into newnotice values(15, '2�� �� ���� �̺�Ʈ ��÷�ڸ� ��ǥ�մϴ�~~~~~~~~~~~��', 'Administrator', 
'�ȳ��ϼ��� ������ �������� ��Ʈ�ص帮�� CnC����ī�Դϴ�. 
2�� �� �� �� ���� CnC����ī�� �̿��� �ֽ� ���Ե��� ������� �����ߴ� ��� �ı� �̺�Ʈ�� ��÷�ڸ� ��ǥ�մϴ�. 

���� �� �ֽ� ��� ȸ���Ե鲲 �������� ���縦 �帮��, �������� �ǰ� �ϳ��ϳ��� ������ ���� ������ ���� ���������� Ȱ���Ͽ� 
���� �����ϴ� CnC����ī�� ����ڽ��ϴ�. 

* ������ 24�ð� ���� �̿�� (5��) - �����(kla***) / ���缺(jes***) / ������(hjs***) / ����(kyi***) / �迹��(sjl***) 


* ������ 24�ð� ���� �̿�� (5��) - ����(ksb***) / ����ö(ura***) / ������(kjo***) / �̽¿�(yon***) / ����ö(zxz***) 


* ����ī 20,000�� ���α� (10��) - ������(nal***) / �ֿ���(pou***) / ���ϵ�(gno***) / ����ȣ(mcs***) / ������(hel***) /
             ������(joy***) / ����(kgg***) / ������(zer***) / �Ÿ���(jin***) / ���޿�(gir***) 


* ����ī 10,000�� ���α� (10��) - ����ȭ(mck***) / �̰���(lkh***) / �迵��(new***) / ������(jse***) / ������(zen***) / ������(lak***) / �ڹμ�(dlo***) / ����ȣ(IVE***) / Ȳ����(hhw***) / ������(tlz***) * ���α��� ��Ȱ�� ���� �߼��� ����, ������ ��������(�����ּ�)�� Ȯ�� �� ���� ��Ź �帳�ϴ�. * ���� ���� ����/���� ������ ���� ���, ���� �� ȸ�� ������ �ǰ��Ͽ� ���α��� �߼��ص帳�ϴ�. (������ 5�� 20��(ȭ)���� �߼۵˴ϴ�.) * ���α� ���� �߼��� ��� ������ ���� ���� �� ����� �� �ֽ��ϴ�. * �߼� �߿� �нǵǴ� ��� ���ؼ��� ��翡�� å������ �ʽ��ϴ�.', sysdate, default);

insert into newnotice values(16, '�� Ÿ�ӽ��������� �ű� ���� �ȳ� ��', 'Administrator', 
'�� Ÿ�ӽ��������� �ű� ���¾ȳ� �� 
�ȳ��ϼ��� ������ �������� ��Ʈ�ص帮�� CnC����ī �Դϴ�. 

CnC����ī�� �� �����е��� ������ ���Ծ� Ÿ�ӽ����������� �ű� ������ �մϴ�~ 
���� �����ϴ� Ÿ�ӽ��������� ���� �̿�ٶ��ϴ�. �����մϴ�. 


<Ÿ�ӽ���������> 

+ �ּ� : ����� �������� ��������4�� 442 Ÿ�ӽ����� ���� 2�� 203ȣ  

+ ����ö : 1ȣ�� �������� ������η� ���� / 5ȣ�� ���������忪 4���ⱸ / 2ȣ�� ������ 4���ⱸ 

+ ���� : ���� 160,260,503,600,660A,660B / ���� 5614,5615,5714,6512,6513,6637,6640 / �Ϲ� 11,11-2,88,92', sysdate, default); 
insert into newreport_comment values(1,1,'semicolon92@naver.com','Test�� ��۴ޱ�1',sysdate);

--�ҷ����Ű� ���̺����(�Խ���) NEWREPORT
create table newreport (
  r_no number(4) primary key,
  email varchar2(50) not null,
  r_title varchar2(90) not null,
  r_contents varchar2(4000) not null,
  r_origin_file varchar2(90),
  r_re_file varchar2(90),
  r_sysdate date,
  count number(3) default 0,
  foreign key(email) references Member(email)
);

 COMMENT ON COLUMN NEWREPORT.R_NO IS '�Խ��� �� ��ȣ';
 COMMENT ON COLUMN NEWREPORT.EMAIL IS '�Խñ� �ۼ���';
 COMMENT ON COLUMN NEWREPORT.R_TITLE IS '�Խñ� ����';
 COMMENT ON COLUMN NEWREPORT.R_CONTENTS IS '�Խñ� ����';
 COMMENT ON COLUMN NEWREPORT.R_ORIGIN_FILE IS '�Խñ� �����̸�';
 COMMENT ON COLUMN NEWREPORT.R_RE_FILE IS '�Խñ� �������̸�';
 COMMENT ON COLUMN NEWREPORT.R_SYSDATE IS '�ۼ���';
 COMMENT ON COLUMN NEWREPORT.COUNT IS '��Ƚ��';

--�ҷ����Ű� ������̺����(�Խ���) NEWREPORT_COMMENT
create table newreport_comment(
rc_no number(5) primary key,
r_no number(5) not null,
email varchar2(50),
rc_contents varchar2(400),
rc_sysdate Date,
foreign key (r_no) references newreport(r_no),
foreign key (email) references Member(email)
);

 COMMENT ON COLUMN NEWREPORT_COMMENT.RC_NO IS '��� ��ȣ';
 COMMENT ON COLUMN NEWREPORT_COMMENT.R_NO IS '�Խñ� ��ȣ';
 COMMENT ON COLUMN NEWREPORT_COMMENT.EMAIL IS '��� �ۼ���';
 COMMENT ON COLUMN NEWREPORT_COMMENT.RC_CONTENTS IS '��۳���';
 COMMENT ON COLUMN NEWREPORT_COMMENT.RC_SYSDATE IS '��� �ۼ���';
 
 insert into newreport values(1, 'abc@naver.com','�ҹ�Ʃ�׵� ��Ʈ���� �Ű��մϴ�.', '�ȳ��ϼ��� (abc@naver.com)�Դϴ�.
P2P�Խ��ǿ� X��X�� �ŷ��� (mamamu@nate.com)�Բ��� ���� XX������ ��Ʈ�� �ϽŴٴ� �������� 
��Ʈ�� ��û�Ͽ���  ���ֲ����� �׳� �ٷ� ������ �־�����.. X��X��~X��X�� ��Ʋ�� ��Ʈ�� �ϱ�� ������ 
X��X�� ���� 10�ð� ���ֲ��� ��Ʈ������ �������־����ϴ�. 

������ ��Ʈ������ ������ ���캸��  
���� �������� �ҹ�Ʃ���� ������ �־� ��Ʈ������ �������Ź��� �۰� �Բ� ÷���մϴ�. 

�ҹ�Ʃ�� ������ �ŷ����Ǹ� �ȵɰ� ���� �ǴܵǾ� �Ű�Խ��ǿ� ���� ����ϴ�. 
������ �� ���ǽþ� XX���� �ŷ��ڿ� ���� Ȯ��, ó�� ��Ź�帳�ϴ�.', null, null, sysdate, default);

insert into newreport values(2, 'abc1@naver.com','CnC��ü �������� �ܺ��� ���� �Ű�.. ', '�ȳ��ϼ��� CnC��ڴ� 
���� X��X�� XX���� ��Ʈ�� ���Ͽ� ���帰 (abc1@naver.com)�Դϴ�. 
������ȴ� X��XX�ϳ� ��������, ��Ʈ��뿡���� ���� ������ ������ �ٷ� 
������ X��X�� ����XX�� �濡 CnC����ī XX�����в��� ��Ʈ�� ������ ������ �ּ̰�,
 ������ ���¿� ���Ͽ� �����в��� �ʹ� ���������� �亯���ֽþ� �Ͼ� �ǽ�ġ�ʰ�
 
�׳� �ٷ� �����Ͽ����ϴ�. ����=>��⵵ ���� �ϻ����ΰ��� ������ �� �Ѻ��ǿ��� ���� 
��Ʈ�ϰ��ִ� ���� ������ü�� �ɰ��� ������ �־� ������ ��������Դϴ�. 
�ڼ��Ѱ��� �۰� �Բ� ���ε��� ÷�������� Ȯ�κ�Ź�帮����, ��� �� ��Ȳ�� ���Ͽ� ó����.. ��Ź�帳�ϴ�.   ', null, null, sysdate, default);

insert into newreport values(3, 'abc2@naver.com','XX�ŷ����� �ɰ��� ���˻����� �Ű�.. ', '�ȳ��ϼ��� XX������ ������ (abc2@naver.com)XX�Դϴ�. 
X��X�� ���ŷ� �Խ��ǿ� ���� ������ ����Ͽ�  ��Ʈ�� ��û�� (power456@korea.com)�в� ��Ʈ �Ͽ��־����ϴ�. 
�׺в����� ������ ������ ��û������ �ʾ����� ���� ���� ÷�ε帰 ���������� �������˻��� �Բ�.. 
�ɰ��ϰ� �ļս��׽��ϴ�.(�����ڷ� ÷��..)

power456@korea.com�в����� �������� �̿� ����� ���˻�� ���Ͽ� ������ ���Ͽ�
�Ű�Ǿ��� ���� �־����ϴ�. �ٸ� �ŷ��� �в����� ���� �����Ͻþ� P2P��Ʈ �ŷ��� �������ּ���..�Ф�', null, null, sysdate, default);

insert into newreport values(4, 'abc3@naver.com','�����ܼӱ����� ����(��ڴ� Ȯ���Ͻð� �����ٶ��ϴ�.)', '�ȳ��ϼ��� CnC��ڴ� ?
÷�ε帰 ������ ���� ��Ʈ�� XX������ �����ϸ� �ȵǴ� ������ �������� �������Ͽ� 
���� �����ϰ��ִ� ���Կ� ���ظ� ���ƽ��ϴ�. ���� �������ʿ� ���ֿ���ó�� �������� �ʾ����� 
�ٸ�, �� ������ CnC����ī���� �ŷ��ϰ��ִ� �����̶� ������ Ȯ���̵Ǿ� Ȩ������ �Ű� �Խ��ǿ� ���� ����ϴ�. 

CnC����ī ����в����� ��Ʈ�� �� ���а� ������ ���Ͻþ� XXX-XXXX-XXXX���� 
�ִ��� ������..�ǵ���� �� ��Ź�帮�ڽ��ϴ�. 
���� �����س��� ������ �� �ڸ��� ����� �������� �߿��� �� ó���� �����մϴ�. ������ٸ��ڽ��ϴ�.�����մϴ�.
(÷������ ����) ', null, null, sysdate, default);

insert into newreport values(5, 'abc4@naver.com','�ʹ� ȭ���� ��ó���ϰ� �����ϴ�. �Ѥ�', '�ŷ��� üũ����Ʈ�� ���� ���¿� ���Ͽ� üũ �� �س��� 
�ݳ��� �� ��ũ��ġ ���ٰ� �� ��������� �ϴ� 

�ŷ��� (Zeozoo@naver.com)�� �Ű��Ϸ� �մϴ�. 

����, �Ʒ� ÷�����Ͽ� ��� �� �������� ���� �Դϴ�.

�и� �׸����� �� �� �� �� �� ���� ��濡 ��ũ��ġ�Դϴ�.
�� �� �¿� �峭 �ƴմϴ�.
�� ���� �����鼭 �̷��� ��ũ��ġ �� �� �� ��ġ�� 
�� �̷��� ������ �뿩�ϴ°� �;����ϴ�.

�ٻ��ϻ�� ����� �ð� ���� �԰� �� �� �޶�� ����θ��� �Ⱦ 
�⽺�� ������ ���� ������ �������� ��Ʈ�� �ϰ�;� �������Ͽ���,
�и� üũ����Ʈ���� ǥ�������ϱ� ������ �� �ǰ��� �߽��ϴ�.

�ٵ� ���� �ݳ��� �� �չ��� ������ �� �������� �� ���� �ܾ� ������ 
������ ������ �ɷ��� �� �����ס� �ϸ鼭 ���۵Ǿ����ϴ�.
�׷��� �չ��� ������ ���� �������� ���� �� �����İ� 
�������� ������ �翬�� �ؿ� ������ ��� ���� �ʳİ� �ϴϱ� ���ڱ� �� �ٲٸ鼭
���������� �ƴ϶� �� ��� �ھҰ���.��
�̷��鼭 10�������ٰ� ��������� ��� 7�� 6õ���� 50%�ؼ� 3�� 8õ��.
�� 13�� 8õ�� �޶�� �̴ϴ�.
�� ���� ������ ��ũ��ġ�� ���� �������ڴ� �; 
�ӵ� ����Ű�� ������ �� ��Ű�鼭 �� ���Ҵµ� �̷��� ��ܹ����� 
�ʹ� ���̰� ���� ���� ���ϳ׿�.

�ٸ� ���� �ٲ�޶�� �Ϸ��ٰ� �帶�� �� ���� �ؼ� �̷��� �������ϸ� ���Ͻô� �� 
����ѽŴٰ� ���� ģ�� �� ��� üũ����Ʈ �ϳ� �ϰ� ���µ� �̰ɷ� �߸� ��ƹ����׿�.
������ ȣ���Ǵ� �����Դϴ� ����.

���� üũ����Ʈ �����ϰ� ���� �θ��� �͵� �������� 
Ȩ�������� ������ �ǸŰ� 1�� 9õ���ε�
�����ϰ� ���� ����Ḧ ���� 7�� 6õ��..

�� ���� �ݳ��� �� ����ģ���� ��༭ ������� ������̴� 
������ ��� �� �������ϴ�. �ʹ� ȭ�� ���� ���� ģ������ �������� ������ �ϰ� �Һ��ں�ȣ���� �Ű���� �߽��ϴ�.
-
�׷��ϱ� �ڱ�׵��� �� ������ �̷��� ������� ���� ���Ѵٰ�..
���� ���ϴ� �� �ƴ϶� ���� ���Ͻð���..�̰� ¬©�� �μ��� ���ٵ�...
�и� �� ���� Ÿ�̴� �е����׵� �� ������� �� �������� �ٵ� 
���� �� �� ���� ��� �������� �ǵ��� �� ������ �� �ϰ� ���μ������?

�� 13���� ��� ���ϱ� �Ⱦ �׳� �帱 ���� �ִµ� 
�� ���� ��� �ʹ� ���� �� �Ѿ�� �и� �Ȱ�ġ�� �� �̷� ������ �ٸ��� ����� �̴ϴ�. 
�ٸ� �е��� �� ���� ���ػ�ʰ� �������� �մϴ�. ', null, null, sysdate, default);

insert into newreport values(6, 'abc5@naver.com','����ī �����⽺ �������ǵ帳�ϴ�..(����÷��)', '����ī �����⽺ �������ǵ帳�ϴ�..(����÷��)

�ȳ��ϼ��� ���� (�̸���)XX�� ������ ��Ʈ�Ͽ�..��Ʋ����ϱ� �⽺�� �� 3���� �����ϴ� 

�ѱ����� �ߺ��������ʾƿ� ��ӵ��ο��� ��Ƣ�ܼ� �⽺ ����������(����÷���ҰԿ�)

���� ������ �ñ��ؼ� �Ϲݰ����翡 �����.. �������������� 
35���������� �ɰŰ����ϴ��󱸿� 

�Ƚ��ϰ��µ� �͹��Ͼ��� 380������ �Ҹ��°̴ϴ�.. 

�Դٰ� �׳� �� 9�ÿ� �ݳ����ߴµ� ���þȿ� �ذ��ϸ� 200������ ���ش̴ܰϴ� 
����� ���� 20�� ����ģ���� 22���̿��� �̰� �Ű����ұ�� 
�߾ƽôºе� ���� �亯�� ��Ź�帱�Կ�.. ����ؼ� ������ �����Դϴ�....', null, null, sysdate, default);

insert into newreport values(7, 'abc6@naver.com','���� ���� �ڱ��� ����µ� ��� ��ó�� �ؾߵɱ��..(����÷��)', '���� ���� �ڱ��� ����µ� ��� ��ó�� �ؾߵɱ��..(����÷��)

���� - �ȳ��ϼ���.. �̹��� ��Ʈ�� ���� ó���غ��� ����Դϴ�.�̤ФФФ� 
���� ������� �𸣰ڴµ� �ݳ����� ������ Ȯ���غ��� 3Cm���� ���� �ڱ��� �����ֳ׿�.. 
�ڵ������迡 ������ �Ǿ������ʴµ� ��� ... 
ó���ϴ°��� ������� ���������� ����� ���� �߻��ɰ� ���� �ʹ� ū �����Դϴ�. 

����� ������ �����źе� ���� �� ��Ź�帳�ϴ�..', null, null, sysdate, default);

insert into newreport values(8, 'abc7@naver.com','P2P�ŷ��� �������� ��ǰ������ �ȰŰ����ϴ�?..(Ÿ�̾�)', '�ȳ��ϼ��� CnC ������ �ŷ��ϰ��ִ� (abc7@naver.com)�Դϴ�. (speedstar@hanmail.net)�Բ�
X��X�� ���� ~ X��X�ϱ��� �ŷ��� Ȯ���Ǿ� ���� XX������ ��Ʈ���־����ϴ�. 

X��X�� ������ �ݳ��޾Ƽ� ������ �����ϴ� ���߿� �ڵ��� Ÿ�̾ ������ ������ Ÿ�̾�� �ٸ��ٴ� ���� 
�߰��Ͽ����ϴ�. �ŷ��ڴ� �̷��� ��Ȳ�����ؼ� ���� �����̾����� �𸣴� ��Ȳ�̶�� �׷����� ���ٰ� 
�����մϴ�. CnC����в����� Ȯ��, ���� ��Ź�帳�ϴ�. . . . . . ', null, null, sysdate, default);

insert into newreport values(9, 'abc8@naver.com','�ʹ� ȭ������ �Ⱑ�����׿� . . ', 'P2P �ŷ��� ó���̿��� ID(abc8@naver.com)�Դϴ�. 
������ ���� ������ ���� ��Ʈ������ �Խ��ǿ� �����Ͽ� ID(sosori@hanmail.net)�����а� 
�ŷ����ϰԵǾ�����, ���� ������ X��X��~X��X�ϱ��� �� 3�ϰ� �뿩�ϴ°����� �����Ǿ����ϴ�.

�� �����в����� �������㰡 �����ֵ� �ұ��ϰ� �������� �����Ͽ� ������ �����־�����..

����, ���� ������ ������ ÷�ε� �� �� ���� ������ ���� ������ �� �ڻ��� �����ϴ�. 
���̻� �����ڰ� ��Ÿ���� �ʱ⸦ �ٶ��, �Ű�Խ��ǿ� ���� ����ϴ�. 

�ŷ��ϽǶ�.. �� ������������ ��Ʈ�ڰ��� �´��� Ȯ���ϰ� Ȯ���� �����ϼ���.', null, null, sysdate, default);

insert into newreport values(10, 'abc9@naver.com','��ü���� ���°� �ʹ� �̻��ؿ�  . .', '�ȳ��ϼ��� ���� XX������ ���Ͽ� CnC����ī XX�����а� ����ȴ� ID(abc9@naver.com)�Դϴ�.
�ٸ��� �ƴ϶� 

CnC����ī���� ��Ʈ�� ȸ�������� ��Ʈ�ϱ����� Ȩ���������� ���������� �þ��� �Ͱ� 
�ܰ���/��������� �ʹ� ���°� �ʹ� �ٸ��Ű����ϴ�. 

������ CnC����ī �����в��� ������ ������ �̴ּµ��� 
�ð����� ���������� �����ϸ� ��밨�� ���� �� ��ġ���� ������ �̿��Ϸ��� �����߾����ϴ�. 
�׷��� �̰� ��밨 �� �̻����� ���°� �ʹ� �������ϴ�. ��Ʈ������ ���൵�߿� ���� �����̰� ���������� 
�۵��� �� ���� �ʾұ���, ���ῡ�� ������ ����Ʈ�� ���������Ͽ� ��ĩ�ϸ� ū ���� �̾��� ���߽��ϴ�. 

���� �����Ƿ��� �ϰ� ���赵 �����ʾҴµ�, ���� ū���� �����߳׿� ���̰���� ���� �ø��ϴ�. 
���ǻ��¸� ����� ���� ���Ͻð� ������ ��Ʈ�� �� �ֽô°ǰ���? ������ ����ǻ����Դϴ�. 
�ٽô� �̷������������� ��Ʈ�ް�����ʳ׿�, �ݳ��帰 ���� ���¸� �Ĳ��� �����ϼž߰ڽ��ϴ�. 
���� ����� ���� ���� �����Դϴ�. . .', null, null, sysdate, default);

insert into nomemberreservation values (1,10,1,'ȫ�浿',20,'M','abcd@naver.com','1234','010-1234-1234',sysdate,sysdate,sysdate,default,20000);

--��������--
-- ����
CREATE TABLE carCategory (
   carType_No number PRIMARY key, -- ������ȣ
  car_Type varchar2(10)          -- ����Ÿ��
);

-- ����
COMMENT ON COLUMN carCategory.carType_No IS '������ȣ';
COMMENT ON COLUMN carCategory.car_Type IS '����Ÿ��';
------------------------------------------------------------------------
-- ������
CREATE TABLE carType (
  car_Serial_Number number primary key, -- ����������ȣ
   carType_No number, -- ������ȣ
   carName      VARCHAR(20),     -- �����̸�
   carNum       number,     -- �������
   carPrice     number,     -- ��������
   carInformation       VARCHAR2(100),     -- ��������
  carCompany        VARCHAR2(18),         --������
  FOREIGN key (carType_No) references carCategory(carType_No)--����
);

-- ������
COMMENT ON TABLE carType IS '������';
-- ����������ȣ
COMMENT ON COLUMN carType.car_Serial_Number IS '����������ȣ';
-- ������ȣ
COMMENT ON COLUMN carType.carType_No IS '������ȣ';
-- �����̸�
COMMENT ON COLUMN carType.carName IS '�����̸�';
-- �������
COMMENT ON COLUMN carType.carNum IS '�������';
-- ��������
COMMENT ON COLUMN carType.carPrice IS '��������';
-- ��������
COMMENT ON COLUMN carType.carInformation IS '��������';
-- ������
COMMENT ON COLUMN carType.carCompany  IS '������';

-------------------------------------------------------------------------
-- ����
CREATE TABLE carInsurance (
   carInsurance_no   number PRIMARY key, -- �����ȣ
   carInsurance_Name VARCHAR(20) not null,     -- �����̸�
   carInsurance_Information VARCHAR2(500) not null,     -- ���輳��
   carInsurance_Price number not null     -- ����ݾ�
);

-- ����
COMMENT ON TABLE carInsurance_no IS '����';
-- �����ȣ
COMMENT ON COLUMN carInsurance.carInsurance_no IS '�����ȣ';
-- �����̸�
COMMENT ON COLUMN carInsurance.carInsurance_Name IS '�����̸�';
-- ���輳��
COMMENT ON COLUMN carInsurance.carInsurance_Information IS '���輳��';
-- ����ݾ�
COMMENT ON COLUMN carInsurance.carInsurance_Price IS '����ݾ�';

-----------------------------------------------------------------------
-- ��ȸ������
CREATE TABLE noMemberReservation (
   noReservationNumber number PRIMARY key, -- ��ȸ�� �����ȣ
   car_serial_number       number NOT NULL, -- ����
   carInsurance_no  number, -- �����ȣ
   noMemberName      VARCHAR(20) NOT NULL,     -- �̸�
   noMemberAge       number,     -- ����
   noMemberGender    VARCHAR(20),     -- ����
   noMemberEmail     VARCHAR(50) NOT NULL,     -- �̸���
   noMemberNumber    VARCHAR(50) NOT NULL,     -- �ĺ���ȣ
   noMemberTell      VARCHAR(20),     -- ����ó
   carStartDate      DATE,     -- �뿩��
   carEndDate        DATE,     -- �ݳ���
  carSysDate        DATE,     -- �����ϳ�¥
  carNote           VARCHAR2(500),  --Ư�̻���
   carPrice          number,      -- ����
  FOREIGN key (car_serial_number) references cartype(car_serial_number),--����
  FOREIGN key (carInsurance_no) references carInsurance(carInsurance_no)--����
);

-- ��ȸ������
COMMENT ON TABLE noMemberReservation IS '��ȸ������';
-- ��ȸ�� �����ȣ
COMMENT ON COLUMN noMemberReservation.reservationNumber IS '��ȸ�� �����ȣ';
-- ����
COMMENT ON COLUMN noMemberReservation.car_Serial_Number IS '������ȣ';
-- �����ȣ
COMMENT ON COLUMN noMemberReservation.carInsurance_no IS '�����ȣ';
-- �̸�
COMMENT ON COLUMN noMemberReservation.noMemberName IS '�̸�';
-- ����
COMMENT ON COLUMN noMemberReservation.noMemberAge IS '����';
-- ����
COMMENT ON COLUMN noMemberReservation.noMemberGender IS '����';
-- �̸���
COMMENT ON COLUMN noMemberReservation.noMemberEmail IS '�̸���';
-- �ĺ���ȣ
COMMENT ON COLUMN noMemberReservation.noMemberNumber IS '�ĺ���ȣ';
-- ����ó
COMMENT ON COLUMN noMemberReservation.noMemberTell IS '����ó';
-- �뿩��
COMMENT ON COLUMN noMemberReservation.carStartDate IS '�뿩��';
-- �ݳ���
COMMENT ON COLUMN noMemberReservation.carEndDate IS '�ݳ���';
-- �ݳ���
COMMENT ON COLUMN noMemberReservation.carSysDate IS '�����ϳ�¥';
-- ����
COMMENT ON COLUMN noMemberReservation.carPrice IS '����';
-- ����
COMMENT ON COLUMN noMemberReservation.carNote IS 'Ư�̻���';
-----------------------------------------------------------------------
-------------------------------------------------------------------------
-- ���� ����Ʈ
CREATE TABLE reservationList (
   reservationNumber  number primary key, -- �����ȣ
   noReservationNumber number null, -- ��ȸ�� �����ȣ
   car_serial_number        number not null, -- ����
   carInsurance_no  number, -- �����ȣ
   mem_num            number(5) not null, -- ȸ����ȣ
   g_code             VARCHAR2(2) not null, -- ��޹�ȣ
   carStartDate       DATE,     -- �뿩��
   carEndDate         DATE,     -- �ݳ���
  carSysDate        DATE,     -- �����ϳ�¥
   carBranch          VARCHAR(100),     -- �뿩����
  carNote           VARCHAR2(500),  --Ư�̻���
   carPrice           number,      -- �뿩�ݾ�
  FOREIGN key (noReservationNumber) references noMemberReservation(noReservationNumber), -- ��ȸ�� �����ȣ
  FOREIGN key (car_serial_number) references cartype(car_serial_number), -- ����
  FOREIGN key (carInsurance_no) references carInsurance(carInsurance_no), -- �����ȣ
  FOREIGN key (mem_num) references member(mem_num), -- ȸ����ȣ
  FOREIGN key (g_code) references grade(g_code) -- ��޹�ȣ
  
);

-- ���� ����Ʈ
COMMENT ON TABLE reservationList IS '���� ����Ʈ';
-- �����ȣ
COMMENT ON COLUMN reservationList.reservationNumber IS '�����ȣ';
-- ��ȸ�� �����ȣ
COMMENT ON COLUMN reservationList.noReservationNumber IS '��ȸ�� �����ȣ';
-- ����
COMMENT ON COLUMN reservationList.car_Serial_Number IS '������ȣ';
-- �����ȣ
COMMENT ON COLUMN reservationList.carInsurance_no IS '�����ȣ';
-- ȸ����ȣ
COMMENT ON COLUMN reservationList.mem_num IS 'ȸ����ȣ';
-- ��޹�ȣ
COMMENT ON COLUMN reservationList.g_code IS '��޹�ȣ';
-- �뿩��
COMMENT ON COLUMN reservationList.carStartDate IS '�뿩��';
-- �ݳ���
COMMENT ON COLUMN reservationList.carEndDate IS '�ݳ���';
-- �����ϳ�¥
COMMENT ON COLUMN reservationList.carSysDate IS '�����ϳ�¥';
-- �뿩����
COMMENT ON COLUMN reservationList.carBranch IS '�뿩����';
-- �뿩�ݾ�
COMMENT ON COLUMN reservationList.carPrice IS '�뿩�ݾ�';
-- Ư�̻���
COMMENT ON COLUMN reservationList.carNote IS 'Ư�̻���';
---------------------------------------------------------
----------------------------�� ī�װ�
insert into carcategory values(1,'����');
insert into carcategory values(2,'����');
insert into carcategory values(3,'������');
insert into carcategory values(4,'����');
insert into carcategory values(5,'SUV');
insert into carcategory values(6,'����');
-----------------------------
-----------------------------��������
insert into cartype values (10,1,'���',10,40000,'��ħ�� ������ ','���');
insert into cartype values (11,1,'����ũ',10,40000,'��¦ Ƣ�� �� ','������');
insert into cartype values (12,1,'����',10,40000,'���������� ����ū�� ','���');

insert into cartype values (20,2,'�����̵�',10,50000,'�Ϳ��� ������ �� �����̵�','���');
insert into cartype values (21,2,'����Ʈ',10,50000,'������ ������ ����Ʈ','����');
insert into cartype values (22,2,'�ƺ���',10,50000,'�����ϰ� �Ϳ��� �ƺ���','������');

insert into cartype values (30,3,'���ν���',10,60000,'������ �������� ��','����');
insert into cartype values (31,3,'�ƹݶ�',10,60000,'20����� ��ȣ�ϴ� ��','����');
insert into cartype values (32,3,'K3',10,60000,'����Ƽ�� 20����� ��ȣ�ϴ� ��','���'); 
insert into cartype values (33,3,'SM3',10,60000,'���� ��� �ְ��� ��','����Ｚ'); 
insert into cartype values (34,3,'i30',10,60000,'�޶�޶� �ٸ� �� ','����'); 
insert into cartype values (35,3,'G70',10,60000,'����Ƽ�� �������� ��  ','����'); 
insert into cartype values (36,3,'ũ����',10,60000,'������ ��','������'); 
insert into cartype values (37,3,'�ҿ�',10,60000,'������� ���� ���� �ִ� �� ','���'); 

insert into cartype values (40,4,'�ҳ�Ÿ',11,70000,'���������� ���������� �ҳ�Ÿ','����');
insert into cartype values (41,4,'K5',11,70000,'����Ƽ�� ���� K5','���');
insert into cartype values (42,4,'������',11,70000,'������ �ʴ� ��Ÿ�� �� ','������');
insert into cartype values (43,4,'���þ�',11,70000,'����Ƽ�� ���ֺ����� ����Ű�� ��','���');
insert into cartype values (44,4,'SM5',11,70000,'���������ݿ� ���� ������ ','����Ｚ');
insert into cartype values (45,4,'SM6',11,70000,'�߳��� ������ SM6','����Ｚ');
insert into cartype values (46,4,'i40',11,70000,'������ ������ ��','����');

insert into cartype values (50,5,'�����',11,70000,'���ݴ�� ���� �������� SUV','���');
insert into cartype values (51,5,'�ڳ�',11,70000,'������ ������� ��������� �ִ� ��','����');
insert into cartype values (52,5,'Ƽ����',11,70000,'�ֿ��� �а��ִ� Ƽ����','�ֿ�');
insert into cartype values (53,5,'����',11,80000,'����� ������ �ʹٸ� ����','����');
insert into cartype values (54,5,'����Ƽ��',11,80000,'����Ƽ�� �����ΰ� ����� �������� ','���');
insert into cartype values (55,5,'���',11,90000,'ķ�������� ���Ż���ִ� ��','���');
insert into cartype values (56,5,'��Ÿ��',11,90000,'�˳��� �ǳ� ����� ������','����');
insert into cartype values (57,5,'ĸƼ��',11,90000,'�⺻ �� ������ ��','������');
insert into cartype values (58,5,'QM6',11,90000,'��Ÿ���� ���� SUV��','����Ｚ');
insert into cartype values (59,5,'���Ϻ�',11,100000,'������','���');

insert into cartype values (60,6,'�׷���',11,110000,'���õʰ� ����� ȯ����ȭ �׷���','����');
insert into cartype values (61,6,'�ƽ���',11,110000,'����� �� ','����');
insert into cartype values (62,6,'G80',11,110000,'����Ƽ�� NO.1�� ','����');
insert into cartype values (63,6,'K7',11,110000,'�ְ��� ������� �����ϴ� �� ','���');
insert into cartype values (64,6,'K9',11,120000,'���õ� CEO �� Ż���ִ� ��','���');
insert into cartype values (65,6,'EQ900',11,120000,'���ѹα� NO.1 �� �ִ� ��','����');
insert into cartype values (66,6,'ü���',11,120000,'���� �濵������ Ÿ�������','�ֿ�');
-----------------------------
-----------------------------����
insert into CARINSURANCE values (1,'�����ں���','�����ڸ� ���󰡴�',10000);
insert into CARINSURANCE values (2,'���ι��Ѻ���','����ž�� �ο� ��� ����',30000);
insert into CARINSURANCE values (3,'��κ��庸��','����ž�� �ο� ��� ����,������� ����',50000);
insert into CARINSURANCE values (4,'���輱�þ���','���þ���',0);
-----------------------------
-----------------------------��ȸ�� �������̺�
insert into nomemberreservation values (1,10,1,'ȫ�浿',20,'M','abcd@naver.com','1234','010-1234-1234',sysdate,sysdate,sysdate,default,20000);

-----------------------------��,��� �������̺�
insert into reservationlist values(1,null,(select car_serial_number from cartype where carname='����ũ'),(select carinsurance_no from carinsurance where carinsurance_name='�����ں���'),1,(select g_code from grade where g_code='G4'),sysdate,sysdate,sysdate,null,'Ư�̻��׾���',20000);

insert into reservationlist values((select max(reservationnumber)+1 from reservationlist),null,
  (select car_serial_number from cartype where carname='Ƽ����'),
  (select carinsurance_no from carinsurance where carinsurance_name='�����ں���'),2,
  (select g_code from grade where g_code='G4'),
  '18/04/13','18/04/15',sysdate,null,'Ư�̻��׾���',60000);
  
insert into reservationlist values((select max(reservationnumber)+1 from reservationlist),null,
  (select car_serial_number from cartype where carname='�׷���'),
  (select carinsurance_no from carinsurance where carinsurance_name='�����ں���'),2,
  (select g_code from grade where g_code='G4'),
  '18/04/20','18/04/30',sysdate,null,'Ư�̻��׾���',1000000);
  
insert into reservationlist values((select max(reservationnumber)+1 from reservationlist),null,
  (select car_serial_number from cartype where carname='���þ�'),
  (select carinsurance_no from carinsurance where carinsurance_name='�����ں���'),2,
  (select g_code from grade where g_code='G4'),
  '18/03/22','18/03/31',sysdate,null,'Ư�̻��׾���',400000);

insert into reservationlist values((select max(reservationnumber)+1 from reservationlist),null,
  (select car_serial_number from cartype where carname='������'),
  (select carinsurance_no from carinsurance where carinsurance_name='��κ��庸��'),4,
  (select g_code from grade where g_code='G2'),
  '18/04/13','18/04/16',sysdate,null,'Ư�̻��׾���',120000);

insert into reservationlist values((select max(reservationnumber)+1 from reservationlist),null,
  (select car_serial_number from cartype where carname='���þ�'),
  (select carinsurance_no from carinsurance where carinsurance_name='�����ں���'),10,
  (select g_code from grade where g_code='G3'),
  '18/04/14','18/04/17',sysdate,null,'Ư�̻��׾���',105000);

insert into reservationlist values((select max(reservationnumber)+1 from reservationlist),null,
  (select car_serial_number from cartype where carname='ü���'),
  (select carinsurance_no from carinsurance where carinsurance_name='���ι�����'),21,
  (select g_code from grade where g_code='G2'),
  '18/04/11','18/04/18',sysdate,null,'Ư�̻��׾���',400000);

insert into reservationlist values((select max(reservationnumber)+1 from reservationlist),null,
  (select car_serial_number from cartype where carname='�׷���'),
  (select carinsurance_no from carinsurance where carinsurance_name='���輱�þ���'),22,
  (select g_code from grade where g_code='G3'),
  '18/04/21','18/04/25',sysdate,null,'Ư�̻��׾���',280000);

insert into reservationlist values((select max(reservationnumber)+1 from reservationlist),null,
  (select car_serial_number from cartype where carname='Ƽ����'),
  (select carinsurance_no from carinsurance where carinsurance_name='�����ں���'),7,
  (select g_code from grade where g_code='G1'),
  '18/04/20','18/04/22',sysdate,null,'Ư�̻��׾���',90000);

 -- �������� ---
 create table RentReview (
rr_num number(5) primary key,
rr_subject varchar2(250) not null,
rr_writer varchar2(250) not null,
rr_content varchar2(4000) not null,
rr_original_filename varchar2(100) ,
rr_rename_filename varchar2(100),
rr_hits number(3) default 0,
rr_date DATE not null
);

COMMENT ON COLUMN RentReview.rr_num IS '�ı��ȣ';
COMMENT ON COLUMN RentReview.rr_subject IS '����';
COMMENT ON COLUMN RentReview.rr_writer IS '�ۼ���';
COMMENT ON COLUMN RentReview.rr_content IS '����';
COMMENT ON COLUMN RentReview.rr_original_filename IS '÷������1';
COMMENT ON COLUMN RentReview.rr_rename_filename IS '÷������2';
COMMENT ON COLUMN RentReview.rr_hits IS '��ȸ��';
COMMENT ON COLUMN RentReview.rr_date IS '�ۼ���';

create table ReviewComment (
rc_num number(5) primary key,
rc_writer varchar2(21) not null,
rc_content varchar2(600) not null,
rc_date Date not null,
rc_parent_num number(5)
);

COMMENT ON COLUMN ReviewComment.rc_num IS '��۹�ȣ';
COMMENT ON COLUMN ReviewComment.rc_writer IS '�ۼ���';
COMMENT ON COLUMN ReviewComment.rc_content IS '����';
COMMENT ON COLUMN ReviewComment.rc_date IS '�ۼ���';
COMMENT ON COLUMN ReviewComment.rc_parent_num IS '������ �÷�';

create table FreeBoard (
fb_num number(5) primary key,
fb_subject varchar2(150) not null,
fb_writer varchar2(100) not null,
fb_content varchar2(4000) not null,
fb_hits number(3) default 0,
fb_date DATE not null
);

COMMENT ON COLUMN FreeBoard.fb_num IS '�����۹�ȣ';
COMMENT ON COLUMN FreeBoard.fb_subject IS '����';
COMMENT ON COLUMN FreeBoard.fb_writer IS '�ۼ���';
COMMENT ON COLUMN FreeBoard.fb_content IS '����';
COMMENT ON COLUMN FreeBoard.fb_hits IS '��ȸ��';
COMMENT ON COLUMN FreeBoard.fb_date IS '�ۼ���';


create table p2p(
p_num number(5) primary key,
p_board number(5),
p_sysdate date,
p_title varchar2(150),
p_context varchar2(1200),
p_original_filename varchar2(100),
p_rename_filename varchar2(100),
p_image varchar2(100),
mem_num number(5),
g_code varchar2(2),
FOREIGN key (mem_num) references member(mem_num),
FOREIGN key (g_code) references grade(g_code)
);

COMMENT ON COLUMN p2p.p_num IS 'p2p����ȣ';
COMMENT ON COLUMN p2p.mem_num IS 'ȸ����ȣ';
COMMENT ON COLUMN p2p.g_code IS '��޹�ȣ';
COMMENT ON COLUMN p2p.p_board IS '�Խ��ǹ�ȣ';
COMMENT ON COLUMN p2p.p_sysdate IS '�ۼ���';
COMMENT ON COLUMN p2p.p_title IS '����';
COMMENT ON COLUMN p2p.p_context IS '����';
COMMENT ON COLUMN p2p.p_original_filename IS '÷������';
COMMENT ON COLUMN p2p.p_rename_filename IS '��������';
COMMENT ON COLUMN p2p.p_image IS '�̹���';

insert into p2p values(1, 1, sysdate, 'test upload', 'test�ڵ��� �Դϴ�.', null, null, '/cs/p2p_pic/�ڵ���1.jpg', 2, 'G1');

commit;



-- ������ ���� Ŀ�� ���� --



-----------------------------------------------------

    