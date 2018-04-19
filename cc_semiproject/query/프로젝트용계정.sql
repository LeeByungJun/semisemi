-- 유저 생성 쿼리, 관리자 계정에서 수행할 것! --
create user semi identified by semi;
grant connect,resource to semi;
-------------------------------------------
--방문자 수 누적하는 테이블
create table visit(
  v_date date not null
);

--예약 횟수 누적하는 테이블
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

COMMENT ON COLUMN GRADE.G_CODE IS '등급번호';
COMMENT ON COLUMN GRADE.G_RANK IS '등급명';
COMMENT ON COLUMN GRADE.G_RATE IS '할인율';
COMMENT ON COLUMN GRADE.G_COMMENTS IS '선정기준';
COMMENT ON COLUMN GRADE.G_COMMENTS2 IS '선정기준2';

INSERT INTO GRADE (G_CODE, G_RANK, G_RATE, G_COMMENTS) VALUES ('G1', 'GOLD', '30', '선정 : SILVER등급 5년 연속 유지 회원"<br>"유지 : GOLD등급 고객 중 연 9개월 이상 이용 회원');
INSERT INTO GRADE (G_CODE, G_RANK, G_RATE, G_COMMENTS) VALUES ('G2', 'SILVER', '20', '선정 : BRONZE 등급 3년 연속 유지 회원"<br>"유지 : SILVER등급 고객 중 연 6개월 이상 이용 회원');
INSERT INTO GRADE (G_CODE, G_RANK, G_RATE, G_COMMENTS) VALUES ('G3', 'BRONZE', '10', '선정 : 신규 회원 또는, 가입 유지 고객 중 5회 미만 이용 회원"<br>"유지 : BRONZE 등급 고객 중 연 3개월 이상 이용 회원');
INSERT INTO GRADE (G_CODE, G_RANK, G_RATE, G_COMMENTS) VALUES ('G4', 'BASIC', '0', '비회원 고객 전용 등급');

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

COMMENT ON COLUMN member.mem_num IS '회원번호';
COMMENT ON COLUMN member.email IS '이메일';
COMMENT ON COLUMN member.password IS '비밀번호';
COMMENT ON COLUMN member.name IS '회원이름';
COMMENT ON COLUMN member.birthday IS '생년월일';
COMMENT ON COLUMN member.phone IS '전화번호';
COMMENT ON COLUMN member.address IS '주소';
COMMENT ON COLUMN member.count IS '신고받은횟수';
COMMENT ON COLUMN member.cansell IS '판매가능유저유무';
COMMENT ON COLUMN member.g_code IS '등급코드';

insert into member values ((select max(mem_num)+1 from member),'abc@naver.com','12345678','상윤','940101','010-1234-4567','서울시 목동',default,default,'G2');
insert into member values ((select max(mem_num)+1 from member),'abc1@naver.com','12345678','클템','950101','010-1234-4567','서울시 서대문구 충현동',default,default,'G2');
insert into member values ((select max(mem_num)+1 from member),'abc2@naver.com','12345678','글자','930101','010-1234-4567','서울시 은평구 증산동',default,default,'G1');
insert into member values ((select max(mem_num)+1 from member),'abc3@naver.com','12345678','상혁','920101','010-1234-4567','서울시 마포구 상암동',default,default,'G1');
insert into member values ((select max(mem_num)+1 from member),'abc4@naver.com','12345678','소라카','910101','010-1234-4567','경기도 성남시',default,default,'G1');
insert into member values ((select max(mem_num)+1 from member),'abc5@naver.com','12345678','나미','900101','010-1234-4567','경기도 화성시',default,default,'G3');
insert into member values ((select max(mem_num)+1 from member),'abc6@naver.com','12345678','아이번','920204','010-1234-4567','경기도 의왕시',default,default,'G3');
insert into member values ((select max(mem_num)+1 from member),'abc7@naver.com','12345678','누누','921101','010-1234-4567','부산광역시 서구',default,default,'G3');
insert into member values ((select max(mem_num)+1 from member),'abc8@naver.com','12345678','카이사','990504','010-1234-4567','인천광역시 남구',default,default,'G3');
insert into member values ((select max(mem_num)+1 from member),'abc9@naver.com','12345678','가렌','890101','010-1234-4567','인천광역시 서구',default,default,'G4');
insert into member values ((select max(mem_num)+1 from member),'abc10@naver.com','12345678','말자하','880101','010-1234-4567','강원도 동해시',default,default,'G4');
insert into member values ((select max(mem_num)+1 from member),'abc11@naver.com','12345678','소나','870101','010-1234-4567','강원도 삼척시',default,default,'G4');
insert into member values ((select max(mem_num)+1 from member),'abc12@naver.com','12345678','스맵','891211','010-1234-4567','전라남도 광주',default,default,'G1');
insert into member values ((select max(mem_num)+1 from member),'abc13@naver.com','12345678','고동빈','950404','010-1234-4567','해남땅끝마을',default,default,'G1');
insert into member values ((select max(mem_num)+1 from member),'abc14@naver.com','12345678','데프트','910201','010-1234-4567','충정남도 천안시',default,default,'G2');
insert into member values ((select max(mem_num)+1 from member),'abc15@naver.com','12345678','조세형','930101','010-1234-4567','충청북도 청주시',default,default,'G2');
insert into member values ((select max(mem_num)+1 from member),'abc16@naver.com','12345678','유칼','940807','010-1234-4567','서울시 서대문구 창현동',default,default,'G3');
--판매가능유저
insert into member values ((select max(mem_num)+1 from member),'zzz123@naver.com','12345678','배준식','950419','010-1234-4567','경상북도',2,'Y','G2');
insert into member values ((select max(mem_num)+1 from member),'zz1423@naver.com','12345678','이영호','920706','010-1234-4567','서울시 강남구',default,'Y','G3');
insert into member values ((select max(mem_num)+1 from member),'abc19@naver.com','12345678','이제동','910112','010-1234-4567','서울시 강남구',default,'Y','G3');
insert into member values ((select max(mem_num)+1 from member),'abc20@naver.com','12345678','홍진호','851007','010-1234-4567','서울시 마포구 합정',1,'Y','G1');
--신고많이받은유저
insert into member values ((select max(mem_num)+1 from member),'badcustomer1@naver.com','12345678','에러남','890101','010-1234-4567','평양',3,'Y','G2');
insert into member values ((select max(mem_num)+1 from member),'badcustomer2@naver.com','12345678','에러녀','891231','010-1234-4567','개마고원',3,'Y','G2');

create table faq(
  f_no number(5) primary key,
  f_category varchar2(30) not null,
  f_title varchar2(150) not null,
  f_contents varchar2(1200) not null
);

insert into faq values ((select max(f_no)+1 from faq),'후후','후후','후후');
commit;

COMMENT ON COLUMN faq.f_no IS 'faq테이블번호';
COMMENT ON COLUMN faq.f_category IS '카테고리';
COMMENT ON COLUMN faq.f_title IS 'faq제목';
COMMENT ON COLUMN faq.f_contents IS '내용';

create sequence faq_no
minvalue 0 start with 1;

insert into faq values (faq_no.nextval,'자주찾는질문','사고 고장 발생 시 어떻하면 되나요?','사고, 고장이 발생하셨습니까? 당황하지 마시고,1544-1600로 전화 주세요. 1번 사고, 고장 접수를 누르세요. 저희 CNC렌터카는 24시간 연중무휴 컨택센터를 운영하며 고객님들의 편의를 보장하고 있습니다. 차량에 문제가 있을 경우 당황하지 마시고 언제라도 컨텍센터로 연락주시기 바랍니다. 바로 해결해 드리겠습니다.');
insert into faq values (faq_no.nextval,'자주찾는질문','CNC 렌터카에서 전 연령차량을 대여할 수 있나요?','당사에는 전 연령차량은 보유하고 있지 않습니다. 차량 사고는 경제적인 피해가 클 뿐더러, 자칫 인명 피해로 이어질 수 있어 고객의 안전을 위해 차종별로 대여 가능 최소 연령을 규정해 놓았습니다. 물론 연령이 안전운전의 절대적인 척도일 수는 없지만 최소한의 안전 조치이니 이점 양해부탁 드립니다.');
insert into faq values (faq_no.nextval,'자주찾는질문','사정상 계약 시간보다 초과해서 사용하게 될 경우 비용은 어떻게 되나요?','우선, 사정상 계약을 연장하셔야 한다면 반드시 약속된 반납 시간 이전에 계약 지점에 연락을 하셔서 사전 동의를 받아야 합니다. 사전 동의 시 초과사용에 대한 비용과 차량손해면책제도(자차보험) 자동연장여부에 대해서도 반드시 당사 직원과 협의하시기 바랍니다. 차량손해면책제도는 1일 단위로 자동 연장되오니 이점 확인하신 후 연장을 원치 않으실 경우 반드시 CNC렌터카 직원에게 사전에 말씀해 주셔야 합니다. 사전 동의 없이 임의로 연장사용 하실 경우, 보험과 차량손해에 대해서 보상 및 면책을 받지 못할 수 있으니 유념하시기 바랍니다.');
insert into faq values (faq_no.nextval,'자주찾는질문','보험보상 및 차량손해 면책제도에 대해 알고 싶습니다.','전차량이 자동차종합보험(대인,대물,자손)에 가입되어있으며, 등록하신 제2운전자까지 보험대상에 포함됩니다. 대인 : 무한대 / 자손 : 인당 15,000,000원 까지 / 대물 : 건당 20,000,000원 까지 (단, 계약서상 등록되지 않은 운전자의 경우, 종합보험 및 자차손해면책제도의 보험혜택을 받으실 수 없습니다.) * 자차손해면책제도 : 운전자의 과실에 의한 대여차량 손해는 임차인의 책임이나, 본 제도에 가입함으로써 보상 받으실 수 있습니다.');
insert into faq values (faq_no.nextval,'사이트이용','회원가입을 하면 어떤 혜택이 있나요?','저희 CNC렌터카 회원에는 4가지 등급이 있습니다. 일반, 브론즈, 실버, 골드. CNC 회원은 각 등급에 따라 10% ~ 30%까지의 할인혜택을 제공받을 수 있으며, 수시로 각종할인쿠폰, 무료이용 및 업그레이드 등의 혜택과 대한항공 마일리지 적립까지 받으실 수 있습니다. 자세한 내용과 가입은 ‘My Page’를 통해 직접 확인 하실 수 있습니다.');
insert into faq values (faq_no.nextval,'사이트이용','홈페이지 ID와 PASSWORD를 분실했습니다.','홈페이지 우측 상단의 로그인 버튼을 눌러 아이디/비밀번호 찾기를 진행해주세요. 재설정이 가능합니다.');
insert into faq values (faq_no.nextval,'회원제도','회원가입을 하면 바로 혜택 적용이 가능한건가요?','네, 물론입니다. 온라인 회원가입을 통해서 다양한 회원 혜택을 누리세요');
insert into faq values (faq_no.nextval,'회원제도','회원가입 이전에 사용한 실적도 포인트 적립이 가능한가요?','회원 포인트는 회원 가입 이후의 실적에 대해서만 적립 가능합니다. 물론 대한항공 마일리지의 경우에도 지난 실적에 대해서는 소급 적립이 불가능 하오니, 차량 대여 시 회원 포인트 적립여부를 담당 직원에게 확인해 보실 것을 권해드립니다.');
insert into faq values (faq_no.nextval,'장기대여','장기대여의 장점은 무엇인가요?','1)구매 대비 저렴한 월간 비용 
2) LPG 사용으로 인한 연료비 절감 효과 및 환경 보호 
3) 차량 운용 측면에서 월간 대여료가 전부인 투명한 비용 
4) 법인 차량 렌탈 대체로 자산 감소, 부채 비율 감소 
5) 차량 관리 정직원 불필요에 따른 인건비 절감과 인력관리 효율성 제고 
6) 대차 서비스 및 전국 정비망을 통한 편리하고 즉각적인 사고 및 고장처리 
7) 제세금, 공과금, 보험 및 정비비용 등 차량에 관한 제비용을 월간 대여료에 포함 비용처리함으로 세제효과 극대화 
8) 초기 차량 구매에 소요되는 자본금의 효율적 활용 
9) 10부제 또는 차고지 증명제 등의 각종 규제 대상에서 제외 
10) 실속/합리/안정을 의미하는 변화된 ‘허’자 이미지 
11) 계획적인 차량 유지 배정 및 보험율 인상에 구애 받지 않는 재보험 성격 
12) 순회 서비스 차량을 이용한 정기적인 점검 및 안전교육 실시로 안전보장 서비스 
13) 일반 렌터카 할인 서비스 및 공항 주차 서비스 등의 부가 서비스');
insert into faq values (faq_no.nextval,'장기대여','장기대여와 리스와의 차이점은 무엇인가요?','가장 큰 차이점으로 장기대여는 렌터카 회사의 상품이지만, 리스는 금융상품으로 각 캐피탈사들이 금리의 변동에 따라 운영되는 할부/금융리스/운용리스 상품이라는 점입니다. 
그래서 리스는 계약 집행 및 보증 관계를 엄격하게 규정하고 있어 절차가 복잡하며, 차량 인도시까지만 고객으로 범위를 규정하고 있어 고객의 범위가 다릅니다.');



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

COMMENT ON COLUMN p2p.p_num IS 'p2p고객번호';
COMMENT ON COLUMN p2p.mem_num IS '회원번호';
COMMENT ON COLUMN p2p.g_code IS '등급번호';
COMMENT ON COLUMN p2p.p_board IS '게시판번호';
COMMENT ON COLUMN p2p.p_sysdate IS '작성일';
COMMENT ON COLUMN p2p.p_title IS '제목';
COMMENT ON COLUMN p2p.p_context IS '설명';
COMMENT ON COLUMN p2p.p_original_filename IS '첨부파일';
COMMENT ON COLUMN p2p.p_rename_filename IS '선정기준';
--insert into p2p values (1,1,'G1',1,sysdate,'안녕하세요 차 일주일동안빌려드려요','몇년식 이고 블라브라',

create table PurchasePage(
i_num number(5) primary key,
p_num number(5) not null, 
FOREIGN key (p_num) references p2p(p_num)
);

COMMENT ON COLUMN PurchasePage.i_num IS '아이템번호';
COMMENT ON COLUMN PurchasePage.p_num IS '아이템타입';




create table message(
m_num number(5) primary key,
p_num number(5) not null,
m_sysdate date,
m_title varchar2(150) not null,
m_context varchar2(1200) not null,
FOREIGN key(p_num) references p2p(p_num)
);

COMMENT ON COLUMN message.m_num IS '쪽지번호';
COMMENT ON COLUMN message.p_num IS 'p2p고객번호';
COMMENT ON COLUMN message.m_sysdate IS '작성일';
COMMENT ON COLUMN message.m_title IS '쪽지제목';
COMMENT ON COLUMN message.m_context IS '쪽지내용';

create table item(
i_num number(5) not null,
i_item varchar2(90) not null,
i_itemname varchar2(100) not null,
i_sysdate date,
FOREIGN key (i_num) references PurchasePage(i_num)
);

COMMENT ON COLUMN item.i_num IS '아이템번호';
COMMENT ON COLUMN item.i_item IS '아이템타입';
COMMENT ON COLUMN item.i_itemname IS '아이템명';
COMMENT ON COLUMN item.i_sysdate IS '날짜';


 --New공지사항 수정테이블생성
create table newnotice(
     n_no number(3) primary key, 
     n_title varchar2(150) not null,
     n_writer varchar2(60), 
     n_contents varchar2(4000) not null, 
     n_sysdate Date, 
     readcount number(4) default 0
 );
 
 COMMENT ON COLUMN NEWNOTICE.N_NO IS '공지사항 번호';
 COMMENT ON COLUMN NEWNOTICE.N_TITLE IS '공지사항 타이틀';
 COMMENT ON COLUMN NEWNOTICE.N_WRITER IS '공지사항 작성자';
 COMMENT ON COLUMN NEWNOTICE.N_CONTENTS IS '공지사항 내용';
 COMMENT ON COLUMN NEWNOTICE.N_SYSDATE IS '공지사항 작성일';
 COMMENT ON COLUMN NEWNOTICE.READCOUNT IS '조회수';
 
--insert문 샘플구문 
insert into newnotice values(1, '★CnC렌터카 홈페이지 오픈안내!★', 'Administrator', 
'안녕하세요!!
대한민국 최고의 차별화된 렌트를 제공하는 CnC렌터카 싸이트가 오픈 되었습니다.! 
각종 다양한 이벤트와 만족스러운 최상의서비스로 고객님께 보답드리겠습니다. 
항상 고객님의 의견에 관하여 최선을다하여 응하겠습니다. 
감사합니다.!.!', sysdate, default);


insert into newnotice values(2, '홈페이지 서버점검 안내', 'Administrator', 
'안녕하세요 고객님의 마음까지 렌트해드리는 CnC렌터카입니다. 
당사 홈페이지 서버 점검으로 인해 하기와 같이 일부 시간 홈페이지 접속이 불가합니다. 

- 일시 : 2013년 5월 21일 오후 11시 ~ 5월 22일 오전 6시 

- 사유 : 홈페이지 서버 점검 안정적인 시스템 제공을 위한 작업으로 
  다소 불편하시더라도 고객 여러분의 많은 이해와 양해바랍니다. 감사합니다.', sysdate, default);


insert into newnotice values(3, '차량 대여요금 변경 안내 (내륙지역)', 'Administrator', 
'안녕하세요 고객님의 마음까지 렌트해드리는 CnC렌터카입니다. 
고객님께 좀더 나은 서비스를 제공하기 위하여. 2018년 4월 4일부터 내륙지역 일부 차량의 대여요금이 변경되오니 
이용에 참고하여 주시기 바랍니다. 

항상 최상의 서비스와 고객 감동을 목표로 최선을 다하도록 노력하겠습니다. 

1) 적용지역 : 내륙 전 지점 

2) 변경일자 : 2018년 4월 4일(수) 09:00 이후 예약 접수분부터 적용 

3) 문의 : 컨택센터 1544-1600 (내선2) 

* 2018년 X월X일 09:00 이전까지 접수된 예약은 변경 전 차량대여요금이 적용 됩니다. 
* 2018년 X월X일 09:00 이후에는 “예약확인” 메뉴에서 현재 예약 현황 확인 시 변경 된 요금으로 
  조회될 수 있으나, 변경 전 예약 접수분은 지점 대여 시 변경 전 요금이 적용되오니 참고하여 주시기 바랍니다.', sysdate, default);


insert into newnotice values(4, '★★★~하and호 번호판 출시 기념 하하호호 즐거운 이벤트~~★★★' , 'Administrator', 
'안녕하세요 고객님의 마음까지 렌트해드리는 CnC렌터카 입니다. 
먼저 저희 CnC렌터카 장기렌터카를 찾아주신 모든 고객분께 감사의 말씀을 전합니다. 

“ 하and호 번호판 출시 기념 하하호호 즐거운 이벤트 ” 당첨자(10명) 발표합니다. 
이름 : 권준* 핸드폰뒷자리 : 3916  이름 : 안상* 핸드폰뒷자리 : 1268 
이름 : 임인* 핸드폰뒷자리 : 1050  이름 : 김문* 핸드폰뒷자리 : 5029  
이름 : 유창* 핸드폰뒷자리 : 1982  이름 : 정광* 핸드폰뒷자리 : 2515 
이름 : 김수* 핸드폰뒷자리 : 2040  이름 : 유태* 핸드폰뒷자리 : 7209 
이름 : 정봉* 핸드폰뒷자리 : 7982  이름 : 김영* 핸드폰뒷자리 : 3121 

경품 내용 : SK상품권 5만원권 

경품 수령 방법 : 
1    이메일로 당첨 안내 메일 전달 (10월 13일 발송 예정) 
2    메일 확인 후 경품 받으실 수령 주소 회신 (10월 25일 마감) 
3    보내주신 당첨자분의 주소로 경품 발송 경품 발송 

마감일자 : 10월 25일', sysdate, default);

insert into newnotice values(5, '연말고객감사 선물대축제 이벤트 당첨자 발표!', 'Administrator',
'안녕하세요 고객님의 마음까지 렌트해드리는 CnC렌터카 입니다. 
지난 한달 남짓 동안 진행한 <CnC렌터카, CnC셀카 연말고객 감사 으르렁 이벤트> 당첨자를 발표해드립니다. 
<당첨자 안내> 
이벤트 하나. 덧글 이벤트 http://blog.naver.com/ajnyou/130184234826 
이벤트 둘. 겨울사진,소망 이벤트 http://blog.naver.com/ajnyou/130184248937 

참여해주신 모든 고객분께 감동 받은 뜻 깊은 이벤트였습니다. 
고객님 여러분께 다시 한 번 진심으로 감사드립니다.', sysdate, default);

insert into newnotice values(6, '2월 고객 설문 이벤트 당첨자를 발표합니다~~~~~~~~~~~♪', 'Administrator', 

'안녕하세요 고객님의 마음까지 렌트해드리는 CnC렌터카 입니다. 
2월 한 달 간 저희 CnC렌터카를 이용해 주신 고객님들을 대상으로 진행했던 사용 후기 이벤트의 당첨자를 발표합니다. 


응모 해 주신 모든 회원님들께 진심으로 감사를 드리며, 
여러분의 의견 하나하나를 저희의 서비스 개선을 위해 적극적으로 활용하여 더욱 발전하는 CnC렌터카를 만들겠습니다. 

* 중형차 24시간 무료 이용권 (5명) - 김법규(kla***) / 강재성(jes***) / 하지수(hjs***) / 고영일(kyi***) / 김예원(sjl***) 

* 소형차 24시간 무료 이용권 (5명) - 김상백(ksb***) / 김현철(ura***) / 김종현(kjo***) / 이승용(yon***) / 정병철(zxz***) 

* 렌터카 20,000원 할인권 (10명) - 강정훈(nal***) / 최웅주(pou***) / 신일동(gno***) / 국정호(mcs***) / 강정석(hel***) /조윤나(joy***) / 
            김경규(kgg***) / 정영구(zer***) / 신명재(jin***) / 원달웅(gir***) 

* 렌터카 10,000원 할인권 (10명) - 김종화(mck***) / 이경해(lkh***) / 김영진(new***) / 안종선(jse***) / 유영승(zen***) / 최윤락(lak***) / 
             박민선(dlo***) / 오상호(IVE***) / 황현주(hhw***) / 김태현(tlz***) 



* 할인권의 원활한 우편 발송을 위해, 고객님의 개인정보(수령주소)를 확인 및 수정 부탁 드립니다. 
* 개인 정보 수정/변경 사항이 없는 경우, 가입 시 회원 정보에 의거하여 할인권을 발송해드립니다. (쿠폰은 5월 20일(화)부터 발송됩니다.) 
* 할인권 우편 발송은 당사 사정에 따라 조정 및 변경될 수 있습니다. * 발송 중에 분실되는 사고에 대해서는 당사에서 책임지지 않습니다.', sysdate, default);

insert into newnotice values(7, '▣ 타임스퀘어지점 신규 오픈 안내 ▣', 'Administrator', 
'▣ 타임스퀘어지점 신규 오픈안내 ▣ 
안녕하세요 고객님의 마음까지 렌트해드리는 CnC렌터카 입니다. 

CnC렌터카가 고객 여러분들의 성원에 힘입어 타임스퀘어지점을 신규 오픈을 합니다~ 
새로 오픈하는 타임스퀘어지점 많은 이용바랍니다. 감사합니다. 


<타임스퀘어지점> 

+ 주소 : 서울시 영등포구 영등포동4가 442 타임스퀘어 지하 2층 203호  

+ 지하철 : 1호선 영등포역 지하통로로 연결 / 5호선 영등포시장역 4번출구 / 2호선 문래역 4번출구 

+ 버스 : 간선 160,260,503,600,660A,660B / 지선 5614,5615,5714,6512,6513,6637,6640 / 일반 11,11-2,88,92', sysdate, default); 


insert into newnotice values(8, '3월 고객 설문 이벤트 당첨자를 발표합니다~~~~~~~~~~~♪', 'Administrator', 
'안녕하세요 고객님의 마음까지 렌트해드리는 CnC렌터카 입니다. 
2015년 3월 한 달 간 저희 CnC렌터카를 이용해 주신 고객님들을 대상으로 진행했던 사용 후기 이벤트의 당첨자를 발표합니다. 

응모 해 주신 모든 회원님들께 진심으로 감사를 드리며,  
여러분의 의견 하나하나를 저희의 서비스 개선을 위해 적극적으로 활용하여  더욱 발전하는 CnC렌터카를 만들겠습니다. 


* 중형차 24시간 무료 이용권 (5명) - 이중길(ljg0***) / 김진규(bns***) / 홍웅기(q***) / 심창보(scb8***) / 정애림(dofla0***) 


* 소형차 24시간 무료 이용권 (5명)- 오정식(ojs0***) / 정정호(wjdgh7***) / 박용준(gar***) / 채혜민(cuty1***) / 조병래(cbr2***) 


* 렌터카 20,000원 할인권 (10명) - 이슬아(nicew***) / 박준수(dhkdlz***) / 김민욱(tngb***) / 배인성(is***) / 이인섭(weer***) / 
            박민욱(ipmuk***) / 이재용(lalal***) / 김대희(vkghsrj***) / 문신국(mimi***) / 이숙희(laf***) 


* 렌터카 10,000원 할인권 (10명) - 이주연(rz***) / 정진규(jkjun***) / 박태정(lanian2***) / 노평국(temt***) / 제대남(yepba***) / 
                박형식(holyst***) / 이숙준(sooks***) / 유상태(nextage***) / 박철호(techn***) / 성실(susilk9***) 

* 이용권의 원활한 우편 발송을 위해, 고객님의 개인정보(주소,연락처)를 확인 및 수정 부탁 드립니다. 
* 개인 정보 수정/변경 사항이 없는 경우, 가입 시 회원 정보에 의거하여 할인권을 발송해드립니다. (무료 이용권은 2016년 1월 11일(월)부터 우편 발송되며, 할인권의 경우 MMS로 발송 됩니다.) 
* 이용권 우편 발송은 당사 사정에 따라 조정 및 변경될 수 있습니다. * 발송 중에 분실되는 사고에 대해서는 당사에서 책임지지 않습니다.', sysdate, default); 

insert into newnotice values(9, '4월 고객 설문 이벤트 당첨자를 발표합니다~~~~~~~~~~~♪', 'Administrator', 
'안녕하세요 고객님의 마음까지 렌트해드리는 CnC렌터카 입니다. 
2016년 4월 한 달 간 저희 CnC렌터카를 이용해 주신 고객님들을 대상으로 진행했던 사용 후기 이벤트의 당첨자를 발표합니다. 

응모 해 주신 모든 회원님들께 진심으로 감사를 드리며, 
여러분의 의견 하나하나를 저희의 서비스 개선을 위해 적극적으로 활용하여 더욱 발전하는 CnC렌터카를 만들겠습니다. 

* 중형차 24시간 무료 이용권 (5명) -  이석주(gra***) / 신영(puhaha1***) / 임태상(green***) / 임영민(khb***) / 김윤정(i***) 

* 소형차 24시간 무료 이용권 (5명) - 김소민(goldja***) /박은혜(w821***) / 박종영(mus***) / 이경동(loverd***) / 정민구(akill***) 

* 렌터카 20,000원 할인권 (10명) - 김종보(wlgml***) / 이주영(best5***) / 정성현(arun***) / 윤경구(revers***) / 김철민(femin***) 
             안현민(neversa***) / 조영민(kis***) / 이운범(bonole***) / 임정림(sweetyl***) / 김선민(kim_sun***) 

* 렌터카 10,000원 할인권 (10명) - 송종안(jant***) / 박종대(kom***) / 하준성(hjs8***) / 안기정(keej***) / 김성수(drki***) 윤정필(feele***) / 
             박수희(insimp***) / 유진우(bikeh***) / 김희웅(eoajfle***) / 황나래(cart***) 

* 이용권의 원활한 우편 발송을 위해, 고객님의 개인정보(주소,연락처)를 확인 및 수정 부탁 드립니다. 
* 개인 정보 수정/변경 사항이 없는 경우, 가입 시 회원 정보에 의거하여 할인권을 발송해드립니다. (무료 이용권은 2016년 3월 14일(월)부터 우편 발송되며, 할인권의 경우 MMS로 발송 됩니다.) 
* 이용권 우편 발송은 당사 사정에 따라 조정 및 변경될 수 있습니다. * 발송 중에 분실되는 사고에 대해서는 당사에서 책임지지 않습니다.', sysdate, default); 

insert into newnotice values(10, '▣ 광주지점 확장 이전 안내 ▣', 'Administrator', 
'▣ 광주지점 확장 이전 안내 ▣ 
CnC렌터카가 고객 여러분들의 성원에 힘입어 광주지점이 확장 이전 합니다.. 
새로 이전하는 광주지점 많은 이용바랍니다. 감사합니다. 

■ 지점이전 : 2015년 6월 15일 이후 

■ 지점정보 
-  주소 : 광주 광역시 광산구 송정동 1358,1359 
-  전화번호 : T. 062-373-7113 / F. 062-373-7165  
-  영업시간 : 월~금: 08:30 ~ 19:30 / 토~일(공휴일) : 09:00 ~ 18:00 

■ 교통정보 
- 지하철 : 1호선 광주송정에서 하차후 광주 공항 방면으로 200M 직진 

<버스 : 광산구청에서 하차후 도보 5M ~.> 
- 지선 버스 : 송정93번 송정96번 송정97번 송정99번 송정100번 
- 간선 버스 : 상무22 송정19번 송정29번 송정98번  
- 마을 버스 : 광산720-1번 평동701번 송정700번 광산720번', sysdate, default); 

insert into newnotice values(11, '홈페이지 서버점검 안내', 'Administrator', 
'안녕하세요 고객님의 마음까지 렌트해드리는 CnC렌터카입니다. 
당사 홈페이지 서버 점검으로 인해 하기와 같이 일부 시간 홈페이지 접속이 불가합니다. 

- 일시 : 2018년 X월 X일 오후 11시 ~ 5월 22일 오전 6시 
- 사유 : 홈페이지 서버 점검 안정적인 시스템 제공을 위한 작업으로 다소 불편하시더라도 고객 여러분의 많은 이해와 양해바랍니다. 감사합니다.', sysdate, default);

insert into newnotice values(12, '차량 대여요금 변경 안내 (내륙지역)', 'Administrator', 
'안녕하세요 고객님의 마음까지 렌트해드리는 CnC렌터카입니다. 
고객님께 좀더 나은 서비스를 제공하기 위하여 2018년 X월 X일부터 내륙지역 일부 차량의 대여요금이 변경되오니 이용에 참고하여 주시기 바랍니다. 
항상 최상의 서비스와 고객 감동을 목표로 최선을 다하도록 노력하겠습니다. 

1) 적용지역 : 내륙 전 지점 

2) 변경일자 : 2018년 4월 4일(수) 09:00 이후 예약 접수분부터 적용 

3) 문의 : 컨택센터 1544-1600 (내선2) 

* 2018년 4월 4일 09:00 이전까지 접수된 예약은 변경 전 차량대여요금이 적용 됩니다. 
* 2018년 4월 4일 09:00 이후에는 “예약확인” 메뉴에서 현재 예약 현황 확인 시 변경 된 요금으로 조회될 수 있으나, 
변경 전 예약 접수분은 지점 대여 시 변경 전 요금이 적용되오니 참고하여 주시기 바랍니다.', sysdate, default);

insert into newnotice values(13, '★★★~하and호 번호판 출시 기념 하하호호 즐거운 이벤트~~★★★' , 'Administrator', 
'안녕하세요 고개님의 마음까지 렌트해드리는 CnC렌터카 입니다. 
먼저 저희 CnC렌터카 장기렌터카를 찾아주신 모든 고객분께 감사의 말씀을 전합니다. 

“ 하and호 번호판 출시 기념 하하호호 즐거운 이벤트 ” 당첨자(10명) 발표합니다. 

이름 : 권준* 핸드폰뒷자리 : 3916 이름 : 안상* 핸드폰뒷자리 : 1268 
이름 : 임인* 핸드폰뒷자리 : 1050 이름 : 김문* 핸드폰뒷자리 : 5029 
이름 : 유창* 핸드폰뒷자리 : 1982 이름 : 정광* 핸드폰뒷자리 : 2515 
이름 : 김수* 핸드폰뒷자리 : 2040 이름 : 유태* 핸드폰뒷자리 : 7209 
이름 : 정봉* 핸드폰뒷자리 : 7982 이름 : 김영* 핸드폰뒷자리 : 3121 

■ 경품 내용 : SK상품권 5만원권 경품 

■ 수령 방법 
1    이메일로 당첨 안내 메일 전달 (10월 13일 발송 예정) 
2    메일 확인 후 경품 받으실 수령 주소 회신 (10월 25일 마감) 
3    보내주신 당첨자분의 주소로 경품 발송 경품 발송 마감일자 : 10월 25일', sysdate, default);

insert into newnotice values(14, '연말고객감사 선물대축제 이벤트 당첨자 발표!', 'Administrator', 
'안녕하세요 고개님의 마음까지 렌트해드리는 CnC렌터카 입니다.  
지난 한달 남짓 동안 진행한 <CnC렌터카, CnC셀카 연말고객 감사 으르렁 이벤트> 당첨자를 발표해드립니다. 

<당첨자 안내> 
■ 이벤트 하나. 덧글 이벤트 http://blog.naver.com/ajnyou/130184234826 

■ 이벤트 둘. 겨울사진,소망 이벤트 http://blog.naver.com/ajnyou/130184248937 
    참여해주신 모든 고객분께 감동 받은 뜻 깊은 이벤트였습니다. 

고객님 여러분께 다시 한 번 진심으로 감사드립니다.', sysdate, default);

insert into newnotice values(15, '2월 고객 설문 이벤트 당첨자를 발표합니다~~~~~~~~~~~♪', 'Administrator', 
'안녕하세요 고객님의 마음까지 렌트해드리는 CnC렌터카입니다. 
2월 한 달 간 저희 CnC렌터카를 이용해 주신 고객님들을 대상으로 진행했던 사용 후기 이벤트의 당첨자를 발표합니다. 

응모 해 주신 모든 회원님들께 진심으로 감사를 드리며, 여러분의 의견 하나하나를 저희의 서비스 개선을 위해 적극적으로 활용하여 
더욱 발전하는 CnC렌터카를 만들겠습니다. 

* 중형차 24시간 무료 이용권 (5명) - 김법규(kla***) / 강재성(jes***) / 하지수(hjs***) / 고영일(kyi***) / 김예원(sjl***) 


* 소형차 24시간 무료 이용권 (5명) - 김상백(ksb***) / 김현철(ura***) / 김종현(kjo***) / 이승용(yon***) / 정병철(zxz***) 


* 렌터카 20,000원 할인권 (10명) - 강정훈(nal***) / 최웅주(pou***) / 신일동(gno***) / 국정호(mcs***) / 강정석(hel***) /
             조윤나(joy***) / 김경규(kgg***) / 정영구(zer***) / 신명재(jin***) / 원달웅(gir***) 


* 렌터카 10,000원 할인권 (10명) - 김종화(mck***) / 이경해(lkh***) / 김영진(new***) / 안종선(jse***) / 유영승(zen***) / 최윤락(lak***) / 박민선(dlo***) / 오상호(IVE***) / 황현주(hhw***) / 김태현(tlz***) * 할인권의 원활한 우편 발송을 위해, 고객님의 개인정보(수령주소)를 확인 및 수정 부탁 드립니다. * 개인 정보 수정/변경 사항이 없는 경우, 가입 시 회원 정보에 의거하여 할인권을 발송해드립니다. (쿠폰은 5월 20일(화)부터 발송됩니다.) * 할인권 우편 발송은 당사 사정에 따라 조정 및 변경될 수 있습니다. * 발송 중에 분실되는 사고에 대해서는 당사에서 책임지지 않습니다.', sysdate, default);

insert into newnotice values(16, '▣ 타임스퀘어지점 신규 오픈 안내 ▣', 'Administrator', 
'▣ 타임스퀘어지점 신규 오픈안내 ▣ 
안녕하세요 고객님의 마음까지 렌트해드리는 CnC렌터카 입니다. 

CnC렌터카가 고객 여러분들의 성원에 힘입어 타임스퀘어지점을 신규 오픈을 합니다~ 
새로 오픈하는 타임스퀘어지점 많은 이용바랍니다. 감사합니다. 


<타임스퀘어지점> 

+ 주소 : 서울시 영등포구 영등포동4가 442 타임스퀘어 지하 2층 203호  

+ 지하철 : 1호선 영등포역 지하통로로 연결 / 5호선 영등포시장역 4번출구 / 2호선 문래역 4번출구 

+ 버스 : 간선 160,260,503,600,660A,660B / 지선 5614,5615,5714,6512,6513,6637,6640 / 일반 11,11-2,88,92', sysdate, default); 
insert into newreport_comment values(1,1,'semicolon92@naver.com','Test용 댓글달기1',sysdate);

--불량고객신고 테이블생성(게시판) NEWREPORT
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

 COMMENT ON COLUMN NEWREPORT.R_NO IS '게시판 글 번호';
 COMMENT ON COLUMN NEWREPORT.EMAIL IS '게시글 작성자';
 COMMENT ON COLUMN NEWREPORT.R_TITLE IS '게시글 제목';
 COMMENT ON COLUMN NEWREPORT.R_CONTENTS IS '게시글 내용';
 COMMENT ON COLUMN NEWREPORT.R_ORIGIN_FILE IS '게시글 원본이름';
 COMMENT ON COLUMN NEWREPORT.R_RE_FILE IS '게시글 수정본이름';
 COMMENT ON COLUMN NEWREPORT.R_SYSDATE IS '작성일';
 COMMENT ON COLUMN NEWREPORT.COUNT IS '조횟수';

--불량고객신고 댓글테이블생성(게시판) NEWREPORT_COMMENT
create table newreport_comment(
rc_no number(5) primary key,
r_no number(5) not null,
email varchar2(50),
rc_contents varchar2(400),
rc_sysdate Date,
foreign key (r_no) references newreport(r_no),
foreign key (email) references Member(email)
);

 COMMENT ON COLUMN NEWREPORT_COMMENT.RC_NO IS '댓글 번호';
 COMMENT ON COLUMN NEWREPORT_COMMENT.R_NO IS '게시글 번호';
 COMMENT ON COLUMN NEWREPORT_COMMENT.EMAIL IS '댓글 작성자';
 COMMENT ON COLUMN NEWREPORT_COMMENT.RC_CONTENTS IS '댓글내용';
 COMMENT ON COLUMN NEWREPORT_COMMENT.RC_SYSDATE IS '댓글 작성일';
 
 insert into newreport values(1, 'abc@naver.com','불법튜닝된 렌트차량 신고합니다.', '안녕하세요 (abc@naver.com)입니다.
P2P게시판에 X월X일 거래자 (mamamu@nate.com)님께서 본인 XX차량의 렌트를 하신다는 글을보고 
렌트를 신청하였고  차주께서는 그날 바로 연락을 주었으며.. X월X일~X월X일 이틀간 렌트를 하기로 결정후 
X월X일 오전 10시경 차주께서 렌트차량을 가져다주었습니다. 

주행전 렌트차량을 유심히 살펴보니  
차량 여러곳에 불법튜닝의 흔적이 있어 렌트차량의 사진증거물을 글과 함께 첨부합니다. 

불법튜닝 차량은 거래가되면 안될거 같다 판단되어 신고게시판에 글을 남깁니다. 
내용을 잘 살피시어 XX차량 거래자에 대한 확인, 처리 부탁드립니다.', null, null, sysdate, default);

insert into newreport values(2, 'abc1@naver.com','CnC업체 렌터차량 외부적 결함 신고.. ', '안녕하세요 CnC운영자님 
저는 X월X일 XX차량 렌트에 관하여 상담드린 (abc1@naver.com)입니다. 
연락드렸던 X월XX일날 차량정보, 렌트비용에대한 상담과 결제를 진행후 바로 
다음날 X월X일 오전XX시 경에 CnC렌터카 XX직원분께서 렌트한 차량을 가져다 주셨고,
 차량의 상태에 관하여 직원분께서 너무 긍정적으로 답변해주시어 믿어 의심치않고
 
그날 바로 주행하였습니다. 서울=>경기도 고양시 일산으로가는 자유로 길 한복판에서 현재 
렌트하고있는 차량 바퀴자체에 심각한 결함이 있어 주행을 멈춘상태입니다. 
자세한것은 글과 함께 업로드한 첨부파일을 확인부탁드리오며, 즉시 이 상황에 대하여 처리를.. 부탁드립니다.   ', null, null, sysdate, default);

insert into newreport values(3, 'abc2@naver.com','XX거래자의 심각한 접촉사고관련 신고.. ', '안녕하세요 XX차량의 소유자 (abc2@naver.com)XX입니다. 
X월X일 고객거래 게시판에 저의 차량을 등록하여  렌트를 신청한 (power456@korea.com)분께 렌트 하여주었습니다. 
그분께서는 사전에 보험을 신청하지도 않았으며 저의 차를 첨부드린 사진과같이 심한접촉사고와 함께.. 
심각하게 파손시켰습니다.(사진자료 첨부..)

power456@korea.com분께서는 일전에도 이와 비슷한 접촉사고에 관하여 여러번 행하여
신고되었던 적이 있었습니다. 다른 거래자 분께서는 이점 참고하시어 P2P렌트 거래시 유의해주세요..ㅠㅠ', null, null, sysdate, default);

insert into newreport values(4, 'abc3@naver.com','주차단속구간에 주차(운영자님 확인하시고 연락바랍니다.)', '안녕하세요 CnC운영자님 ?
첨부드린 사진과 같이 렌트한 XX차량은 주차하면 안되는 구역에 무단으로 주차를하여 
제가 영업하고있는 가게에 피해를 끼쳤습니다. 차앞 유리문쪽에 차주연락처도 기재하지 않았으며 
다만, 이 차량이 CnC렌터카에서 거래하고있는 차량이란 정보가 확인이되어 홈페이지 신고 게시판에 글을 남깁니다. 

CnC렌터카 운영진분께서는 렌트를 한 고객분과 연락을 취하시어 XXX-XXXX-XXXX으로 
최대한 빠르게..피드백을 좀 부탁드리겠습니다. 
지금 주자해놓은 공간에 꼭 자리를 비워야 개인적인 중요한 일 처리가 가능합니다. 연락기다리겠습니다.감사합니다.
(첨부파일 있음) ', null, null, sysdate, default);

insert into newreport values(5, 'abc4@naver.com','너무 화나고 어처구니가 없습니다. ㅡㅡ', '거래서 체크리스트에 차량 상태에 관하여 체크 다 해놓고 
반납할 때 스크래치 났다고 돈 내놓으라고 하는 

거래자 (Zeozoo@naver.com)를 신고하려 합니다. 

먼저, 아래 첨부파일에 출발 전 차량상태 사진 입니다.

분명 그림에서 앞 뒤 옆 할 것 없이 사방에 스크래치입니다.
앞 뒷 좌우 장난 아닙니다.
이 차를 받으면서 이렇게 스크래치 난 걸 안 고치고 
왜 이렇게 버젓이 대여하는가 싶었습니다.

바쁜일상속 어려운 시간 내서 왔고 새 차 달라며 진상부리기 싫어서 
기스가 있지만 조금 저렴한 가격으로 렌트를 하고싶어 진행을하였고,
분명 체크리스트에도 표시했으니까 문제가 안 되겠지 했습니다.

근데 차를 반납할 때 앞범퍼 우측에 막 문질러서 흰 가루 긁어 내더니 
‘여기 방지턱 걸려서 다 긁혔네’ 하면서 시작되었습니다.
그래서 앞범퍼 왼측에 제가 문지르고 여긴 왜 괜찮냐고 
방지턱을 오르면 당연히 밑에 양측이 비슷 하지 않냐고 하니까 갑자기 말 바꾸면서
‘방지턱이 아니라 뭐 어디 박았겠죠.’
이러면서 10만원에다가 휴차보상료 모닝 7만 6천원에 50%해서 3만 8천원.
총 13만 8천원 달라는 겁니다.
차 빌릴 때부터 스크래치도 많고 말나오겠다 싶어서 
속도 다지키고 방지턱 다 지키면서 차 몰았는데 이렇게 우겨버리니 
너무 어이가 없고 속이 상하네요.

다른 차로 바꿔달라고 하려다가 장마라서 비도 오고 해서 이랬다 저랬다하면 일하시는 분 
고생한신다고 여자 친구 말 듣고 체크리스트 하나 믿고 탔는데 이걸로 발목 잡아버리네요.
참으면 호구되는 세상입니다 정말.

위에 체크리스트 무시하고 억지 부리는 것도 문제지만 
홈페이지에 버젓이 판매가 1만 9천원인데
작정하고 휴차 보상료를 정상가 7만 6천원..

딱 봐도 반납할 때 여자친구가 계약서 꺼내들고 어려보이니 
꼬투리 잡는 게 보였습니다. 너무 화가 나서 여자 친구한테 수속절차 밟으라 하고 소비자보호원에 신고까지 했습니다.
-
그러니까 자기네들은 뭐 일일이 이런거 안지우고 대응 안한다고..
대응 안하는 게 아니라 대응 못하시겠죠..이게 짭짤한 부수입 일텐데...
분명 이 전에 타셨던 분들한테도 차 수리비로 돈 받으셨을 텐데 
차가 앞 뒤 양측 모두 이지경이 되도록 왜 수리를 안 하고 나두셨을까요?

돈 13만원 기분 상하기 싫어서 그냥 드릴 수도 있는데 
저 같은 사람 너무 많고 또 넘어가면 분명 안고치고 또 이런 식으로 다른분 농락할 겁니다. 
다른 분들은 저 같은 피해사례가 없었으면 합니다. ', null, null, sysdate, default);

insert into newreport values(6, 'abc5@naver.com','렌터카 차량기스 견적문의드립니다..(사진첨부)', '렌터카 차량기스 견적문의드립니다..(사진첨부)

안녕하세요 저희가 (이메일)XX분 차량을 렌트하여..이틀사용하구 기스가 총 3군데 낫습니다 

한군데는 잘보이지도않아요 고속도로에서 돌튀겨서 기스 난정도예요(사진첨부할게요)

저희가 가격이 궁금해서 일반공업사에 물어보니.. 도색만벗겨져서 
35만원정도면 될거같다하더라구요 

안심하고갔는데 터무니없는 380만원을 불르는겁니다.. 

게다가 그날 밤 9시에 반납을했는데 오늘안에 해결하면 200만원에 해준단겁니다 
참고로 저는 20살 남자친구는 22살이예요 이거 신고가능할까요 
잘아시는분들 꼭좀 답변좀 부탁드릴게요.. 억울해서 울고싶은 마음입니다....', null, null, sysdate, default);

insert into newreport values(7, 'abc6@naver.com','차에 긁힌 자국이 생겼는데 어떻게 대처를 해야될까요..(사진첨부)', '차에 긁힌 자국이 생겼는데 어떻게 대처를 해야될까요..(사진첨부)

내용 - 안녕하세요.. 이번에 렌트를 생전 처음해보는 사람입니다.ㅜㅠㅠㅠㅠ 
언제 생긴건지 모르겠는데 반납전에 차량을 확인해보니 3Cm정도 긁힌 자국이 생겨있네요.. 
자동차보험에 가입이 되어있지않는데 어떻게 ... 
처리하는것이 좋을까요 금전적으로 비용이 많이 발생될거 같아 너무 큰 걱정입니다. 

비슷한 경험이 있으신분들 조언 좀 부탁드립니다..', null, null, sysdate, default);

insert into newreport values(8, 'abc7@naver.com','P2P거래중 본인차량 부품변경이 된거같습니다?..(타이어)', '안녕하세요 CnC 꾸준히 거래하고있는 (abc7@naver.com)입니다. (speedstar@hanmail.net)님께
X월X일 부터 ~ X월X일까지 거래가 확정되어 본인 XX차량을 렌트해주었습니다. 

X월X일 차량을 반납받아서 점검을 진행하는 도중에 자동차 타이어가 기존에 장착된 타이어와 다르다는 것을 
발견하였습니다. 거래자는 이러한 상황에대해서 전혀 연관이없으며 모르는 상황이라고 그렇적이 없다고 
강조합니다. CnC운영진분께서는 확인, 조취 부탁드립니다. . . . . . ', null, null, sysdate, default);

insert into newreport values(9, 'abc8@naver.com','너무 화가나고 기가막히네요 . . ', 'P2P 거래를 처음이용한 ID(abc8@naver.com)입니다. 
몇일전 저의 차량에 대한 렌트정보를 게시판에 공지하여 ID(sosori@hanmail.net)여성분과 
거래를하게되었으며, 저의 차량을 X월X일~X월X일까지 약 3일간 대여하는것으로 결정되었습니다.

이 여성분께서는 운전면허가 없음애도 불구하고 면허증을 위조하여 저에게 보여주었으며..

현재, 저의 차량은 사진에 첨부된 거 와 같이 소중한 저의 차량이 개 박살이 났습니다. 
더이상 피혜자가 나타나지 않기를 바라며, 신고게시판에 글을 남깁니다. 

거래하실때.. 꼭 운전면허증이 렌트자것이 맞는지 확실하게 확인후 진행하세요.', null, null, sysdate, default);

insert into newreport values(10, 'abc9@naver.com','업체차량 상태가 너무 이상해요  . .', '안녕하세요 어제 XX차량에 관하여 CnC렌터카 XX직원분과 상담드렸던 ID(abc9@naver.com)입니다.
다름이 아니라 

CnC렌터카에서 렌트한 회사차량이 렌트하기전에 홈페이지에서 차량정보를 봤었던 것과 
외관적/기능적으로 너무 상태가 너무 다른거같습니다. 

오전에 CnC렌터카 직원분께서 차량을 가져다 주셨는데요 
시간적인 여유가없어 웬만하면 기대감에 조금 못 미치더라도 차량을 이용하려고 생각했었습니다. 
그런데 이건 기대감 그 이상으로 상태가 너무 안좋습니다. 렌트차량을 운행도중에 왼쪽 깜빡이가 정상적으로 
작동이 잘 되지 않았구요, 저녁에는 오른쪽 라이트가 깜빡깜빡하여 자칫하면 큰 사고로 이어질 뻔했습니다. 

저의 운전실력을 믿고 보험도 들지않았는데, 정말 큰일이 날뻔했네요 어이가없어서 글을 올립니다. 
차의상태를 제대로 점검 안하시고 고객에게 렌트를 해 주시는건가요? 운전은 사람의생명입니다. 
다시는 이런상태의차량을 렌트받고싶지않네요, 반납드린 차량 상태를 꼼꼼히 점검하셔야겠습니다. 
저는 기분이 많이 상한 상태입니다. . .', null, null, sysdate, default);

insert into nomemberreservation values (1,10,1,'홍길동',20,'M','abcd@naver.com','1234','010-1234-1234',sysdate,sysdate,sysdate,default,20000);

--한진이형--
-- 차종
CREATE TABLE carCategory (
   carType_No number PRIMARY key, -- 차종번호
  car_Type varchar2(10)          -- 차종타입
);

-- 차종
COMMENT ON COLUMN carCategory.carType_No IS '차종번호';
COMMENT ON COLUMN carCategory.car_Type IS '차종타입';
------------------------------------------------------------------------
-- 차종류
CREATE TABLE carType (
  car_Serial_Number number primary key, -- 차종고유번호
   carType_No number, -- 차종번호
   carName      VARCHAR(20),     -- 차량이름
   carNum       number,     -- 차량댓수
   carPrice     number,     -- 차량가격
   carInformation       VARCHAR2(100),     -- 차량설명
  carCompany        VARCHAR2(18),         --제조사
  FOREIGN key (carType_No) references carCategory(carType_No)--차종
);

-- 차종류
COMMENT ON TABLE carType IS '차종류';
-- 차종고유번호
COMMENT ON COLUMN carType.car_Serial_Number IS '차종고유번호';
-- 차종번호
COMMENT ON COLUMN carType.carType_No IS '차종번호';
-- 차량이름
COMMENT ON COLUMN carType.carName IS '차량이름';
-- 차량댓수
COMMENT ON COLUMN carType.carNum IS '차량댓수';
-- 차량가격
COMMENT ON COLUMN carType.carPrice IS '차량가격';
-- 차량설명
COMMENT ON COLUMN carType.carInformation IS '차량설명';
-- 제조사
COMMENT ON COLUMN carType.carCompany  IS '제조사';

-------------------------------------------------------------------------
-- 보험
CREATE TABLE carInsurance (
   carInsurance_no   number PRIMARY key, -- 보험번호
   carInsurance_Name VARCHAR(20) not null,     -- 보험이름
   carInsurance_Information VARCHAR2(500) not null,     -- 보험설명
   carInsurance_Price number not null     -- 보험금액
);

-- 보험
COMMENT ON TABLE carInsurance_no IS '보험';
-- 보험번호
COMMENT ON COLUMN carInsurance.carInsurance_no IS '보험번호';
-- 보험이름
COMMENT ON COLUMN carInsurance.carInsurance_Name IS '보험이름';
-- 보험설명
COMMENT ON COLUMN carInsurance.carInsurance_Information IS '보험설명';
-- 보험금액
COMMENT ON COLUMN carInsurance.carInsurance_Price IS '보험금액';

-----------------------------------------------------------------------
-- 비회원예약
CREATE TABLE noMemberReservation (
   noReservationNumber number PRIMARY key, -- 비회원 예약번호
   car_serial_number       number NOT NULL, -- 차종
   carInsurance_no  number, -- 보험번호
   noMemberName      VARCHAR(20) NOT NULL,     -- 이름
   noMemberAge       number,     -- 나이
   noMemberGender    VARCHAR(20),     -- 성별
   noMemberEmail     VARCHAR(50) NOT NULL,     -- 이메일
   noMemberNumber    VARCHAR(50) NOT NULL,     -- 식별번호
   noMemberTell      VARCHAR(20),     -- 연락처
   carStartDate      DATE,     -- 대여일
   carEndDate        DATE,     -- 반납일
  carSysDate        DATE,     -- 예약등록날짜
  carNote           VARCHAR2(500),  --특이사항
   carPrice          number,      -- 가격
  FOREIGN key (car_serial_number) references cartype(car_serial_number),--차종
  FOREIGN key (carInsurance_no) references carInsurance(carInsurance_no)--보험
);

-- 비회원예약
COMMENT ON TABLE noMemberReservation IS '비회원예약';
-- 비회원 예약번호
COMMENT ON COLUMN noMemberReservation.reservationNumber IS '비회원 예약번호';
-- 차종
COMMENT ON COLUMN noMemberReservation.car_Serial_Number IS '차량번호';
-- 보험번호
COMMENT ON COLUMN noMemberReservation.carInsurance_no IS '보험번호';
-- 이름
COMMENT ON COLUMN noMemberReservation.noMemberName IS '이름';
-- 나이
COMMENT ON COLUMN noMemberReservation.noMemberAge IS '나이';
-- 성별
COMMENT ON COLUMN noMemberReservation.noMemberGender IS '성별';
-- 이메일
COMMENT ON COLUMN noMemberReservation.noMemberEmail IS '이메일';
-- 식별번호
COMMENT ON COLUMN noMemberReservation.noMemberNumber IS '식별번호';
-- 연락처
COMMENT ON COLUMN noMemberReservation.noMemberTell IS '연락처';
-- 대여일
COMMENT ON COLUMN noMemberReservation.carStartDate IS '대여일';
-- 반납일
COMMENT ON COLUMN noMemberReservation.carEndDate IS '반납일';
-- 반납일
COMMENT ON COLUMN noMemberReservation.carSysDate IS '예약등록날짜';
-- 가격
COMMENT ON COLUMN noMemberReservation.carPrice IS '가격';
-- 가격
COMMENT ON COLUMN noMemberReservation.carNote IS '특이사항';
-----------------------------------------------------------------------
-------------------------------------------------------------------------
-- 예약 리스트
CREATE TABLE reservationList (
   reservationNumber  number primary key, -- 예약번호
   noReservationNumber number null, -- 비회원 예약번호
   car_serial_number        number not null, -- 차종
   carInsurance_no  number, -- 보험번호
   mem_num            number(5) not null, -- 회원번호
   g_code             VARCHAR2(2) not null, -- 등급번호
   carStartDate       DATE,     -- 대여일
   carEndDate         DATE,     -- 반납일
  carSysDate        DATE,     -- 예약등록날짜
   carBranch          VARCHAR(100),     -- 대여지점
  carNote           VARCHAR2(500),  --특이사항
   carPrice           number,      -- 대여금액
  FOREIGN key (noReservationNumber) references noMemberReservation(noReservationNumber), -- 비회원 예약번호
  FOREIGN key (car_serial_number) references cartype(car_serial_number), -- 차종
  FOREIGN key (carInsurance_no) references carInsurance(carInsurance_no), -- 보험번호
  FOREIGN key (mem_num) references member(mem_num), -- 회원번호
  FOREIGN key (g_code) references grade(g_code) -- 등급번호
  
);

-- 예약 리스트
COMMENT ON TABLE reservationList IS '예약 리스트';
-- 예약번호
COMMENT ON COLUMN reservationList.reservationNumber IS '예약번호';
-- 비회원 예약번호
COMMENT ON COLUMN reservationList.noReservationNumber IS '비회원 예약번호';
-- 차종
COMMENT ON COLUMN reservationList.car_Serial_Number IS '차량번호';
-- 보험번호
COMMENT ON COLUMN reservationList.carInsurance_no IS '보험번호';
-- 회원번호
COMMENT ON COLUMN reservationList.mem_num IS '회원번호';
-- 등급번호
COMMENT ON COLUMN reservationList.g_code IS '등급번호';
-- 대여일
COMMENT ON COLUMN reservationList.carStartDate IS '대여일';
-- 반납일
COMMENT ON COLUMN reservationList.carEndDate IS '반납일';
-- 예약등록날짜
COMMENT ON COLUMN reservationList.carSysDate IS '예약등록날짜';
-- 대여지점
COMMENT ON COLUMN reservationList.carBranch IS '대여지점';
-- 대여금액
COMMENT ON COLUMN reservationList.carPrice IS '대여금액';
-- 특이사항
COMMENT ON COLUMN reservationList.carNote IS '특이사항';
---------------------------------------------------------
----------------------------차 카테고리
insert into carcategory values(1,'경차');
insert into carcategory values(2,'소형');
insert into carcategory values(3,'준중형');
insert into carcategory values(4,'중형');
insert into carcategory values(5,'SUV');
insert into carcategory values(6,'대형');
-----------------------------
-----------------------------차량정보
insert into cartype values (10,1,'모닝',10,40000,'아침을 여는차 ','기아');
insert into cartype values (11,1,'스파크',10,40000,'깜짝 튀는 차 ','쉐보레');
insert into cartype values (12,1,'레이',10,40000,'작은차지만 마음큰차 ','기아');

insert into cartype values (20,2,'프라이드',10,50000,'귀엽고 깜찍한 차 프라이드','기아');
insert into cartype values (21,2,'엑센트',10,50000,'작지만 강한차 엑센트','현대');
insert into cartype values (22,2,'아베오',10,50000,'깜찍하고 귀여운 아베오','쉐보레');

insert into cartype values (30,3,'벨로스터',10,60000,'도로의 무법자의 차','현대');
insert into cartype values (31,3,'아반떼',10,60000,'20대들이 선호하는 차','현대');
insert into cartype values (32,3,'K3',10,60000,'스포티한 20대들이 선호하는 차','기아'); 
insert into cartype values (33,3,'SM3',10,60000,'가격 대비 최고인 차','르노삼성'); 
insert into cartype values (34,3,'i30',10,60000,'달라달라 다른 차 ','현대'); 
insert into cartype values (35,3,'G70',10,60000,'스포티한 무법자의 차  ','현대'); 
insert into cartype values (36,3,'크루즈',10,60000,'한정판 차','쉐보레'); 
insert into cartype values (37,3,'소울',10,60000,'마음대로 색을 고를수 있는 차 ','기아'); 

insert into cartype values (40,4,'소나타',11,70000,'중형이지만 대형같은차 소나타','현대');
insert into cartype values (41,4,'K5',11,70000,'스포티한 중형 K5','기아');
insert into cartype values (42,4,'말리부',11,70000,'질리지 않는 스타일 차 ','쉐보레');
insert into cartype values (43,4,'스팅어',11,70000,'스포티한 질주본능을 일으키는 차','기아');
insert into cartype values (44,4,'SM5',11,70000,'준중형가격에 중형 차인차 ','르노삼성');
insert into cartype values (45,4,'SM6',11,70000,'잘나온 디지인 SM6','르노삼성');
insert into cartype values (46,4,'i40',11,70000,'유럽이 인정한 차','현대');

insert into cartype values (50,5,'스토닉',11,70000,'가격대비 소형 같지않은 SUV','기아');
insert into cartype values (51,5,'코나',11,70000,'가격은 비싸지만 중형기능이 있는 차','현대');
insert into cartype values (52,5,'티볼리',11,70000,'쌍용이 밀고있는 티볼리','쌍용');
insert into cartype values (53,5,'투싼',11,80000,'출력을 느끼고 싶다면 투싼','현대');
insert into cartype values (54,5,'스포티지',11,80000,'스포티한 디자인과 출력을 느끼는차 ','기아');
insert into cartype values (55,5,'쏘렌토',11,90000,'캠핑족들이 즐겨탈수있는 차','기아');
insert into cartype values (56,5,'싼타페',11,90000,'넉넉한 실내 출력이 좋은차','현대');
insert into cartype values (57,5,'캡티바',11,90000,'기본 이 다져진 차','쉐보레');
insert into cartype values (58,5,'QM6',11,90000,'스타일이 멋진 SUV차','르노삼성');
insert into cartype values (59,5,'모하비',11,100000,'멋진차','기아');

insert into cartype values (60,6,'그랜져',11,110000,'세련됨과 고급의 환상조화 그랜져','현대');
insert into cartype values (61,6,'아슬란',11,110000,'고급진 차 ','현대');
insert into cartype values (62,6,'G80',11,110000,'스포티에 NO.1차 ','현대');
insert into cartype values (63,6,'K7',11,110000,'최고의 편안함을 제공하는 차 ','기아');
insert into cartype values (64,6,'K9',11,120000,'세련된 CEO 가 탈수있는 차','기아');
insert into cartype values (65,6,'EQ900',11,120000,'대한민국 NO.1 이 있는 차','현대');
insert into cartype values (66,6,'체어맨',11,120000,'전문 경영진들이 타고싶은차','쌍용');
-----------------------------
-----------------------------보험
insert into CARINSURANCE values (1,'운전자보험','운전자만 보상가능',10000);
insert into CARINSURANCE values (2,'대인무한보험','차량탑승 인원 모두 보상',30000);
insert into CARINSURANCE values (3,'모두보장보험','차량탑승 인원 모두 보상,차량비용 보상',50000);
insert into CARINSURANCE values (4,'보험선택안함','선택안함',0);
-----------------------------
-----------------------------비회원 예약테이블
insert into nomemberreservation values (1,10,1,'홍길동',20,'M','abcd@naver.com','1234','010-1234-1234',sysdate,sysdate,sysdate,default,20000);

-----------------------------단,장기 예약테이블
insert into reservationlist values(1,null,(select car_serial_number from cartype where carname='스파크'),(select carinsurance_no from carinsurance where carinsurance_name='운전자보험'),1,(select g_code from grade where g_code='G4'),sysdate,sysdate,sysdate,null,'특이사항없음',20000);

insert into reservationlist values((select max(reservationnumber)+1 from reservationlist),null,
  (select car_serial_number from cartype where carname='티볼리'),
  (select carinsurance_no from carinsurance where carinsurance_name='운전자보험'),2,
  (select g_code from grade where g_code='G4'),
  '18/04/13','18/04/15',sysdate,null,'특이사항없음',60000);
  
insert into reservationlist values((select max(reservationnumber)+1 from reservationlist),null,
  (select car_serial_number from cartype where carname='그랜져'),
  (select carinsurance_no from carinsurance where carinsurance_name='운전자보험'),2,
  (select g_code from grade where g_code='G4'),
  '18/04/20','18/04/30',sysdate,null,'특이사항없음',1000000);
  
insert into reservationlist values((select max(reservationnumber)+1 from reservationlist),null,
  (select car_serial_number from cartype where carname='스팅어'),
  (select carinsurance_no from carinsurance where carinsurance_name='운전자보험'),2,
  (select g_code from grade where g_code='G4'),
  '18/03/22','18/03/31',sysdate,null,'특이사항없음',400000);

insert into reservationlist values((select max(reservationnumber)+1 from reservationlist),null,
  (select car_serial_number from cartype where carname='말리부'),
  (select carinsurance_no from carinsurance where carinsurance_name='모두보장보험'),4,
  (select g_code from grade where g_code='G2'),
  '18/04/13','18/04/16',sysdate,null,'특이사항없음',120000);

insert into reservationlist values((select max(reservationnumber)+1 from reservationlist),null,
  (select car_serial_number from cartype where carname='스팅어'),
  (select carinsurance_no from carinsurance where carinsurance_name='운전자보험'),10,
  (select g_code from grade where g_code='G3'),
  '18/04/14','18/04/17',sysdate,null,'특이사항없음',105000);

insert into reservationlist values((select max(reservationnumber)+1 from reservationlist),null,
  (select car_serial_number from cartype where carname='체어맨'),
  (select carinsurance_no from carinsurance where carinsurance_name='대인무상보험'),21,
  (select g_code from grade where g_code='G2'),
  '18/04/11','18/04/18',sysdate,null,'특이사항없음',400000);

insert into reservationlist values((select max(reservationnumber)+1 from reservationlist),null,
  (select car_serial_number from cartype where carname='그랜져'),
  (select carinsurance_no from carinsurance where carinsurance_name='보험선택안함'),22,
  (select g_code from grade where g_code='G3'),
  '18/04/21','18/04/25',sysdate,null,'특이사항없음',280000);

insert into reservationlist values((select max(reservationnumber)+1 from reservationlist),null,
  (select car_serial_number from cartype where carname='티볼리'),
  (select carinsurance_no from carinsurance where carinsurance_name='운전자보험'),7,
  (select g_code from grade where g_code='G1'),
  '18/04/20','18/04/22',sysdate,null,'특이사항없음',90000);

 -- 동국형꺼 ---
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

COMMENT ON COLUMN RentReview.rr_num IS '후기번호';
COMMENT ON COLUMN RentReview.rr_subject IS '제목';
COMMENT ON COLUMN RentReview.rr_writer IS '작성자';
COMMENT ON COLUMN RentReview.rr_content IS '내용';
COMMENT ON COLUMN RentReview.rr_original_filename IS '첨부파일1';
COMMENT ON COLUMN RentReview.rr_rename_filename IS '첨부파일2';
COMMENT ON COLUMN RentReview.rr_hits IS '조회수';
COMMENT ON COLUMN RentReview.rr_date IS '작성일';

create table ReviewComment (
rc_num number(5) primary key,
rc_writer varchar2(21) not null,
rc_content varchar2(600) not null,
rc_date Date not null,
rc_parent_num number(5)
);

COMMENT ON COLUMN ReviewComment.rc_num IS '댓글번호';
COMMENT ON COLUMN ReviewComment.rc_writer IS '작성자';
COMMENT ON COLUMN ReviewComment.rc_content IS '내용';
COMMENT ON COLUMN ReviewComment.rc_date IS '작성일';
COMMENT ON COLUMN ReviewComment.rc_parent_num IS '참조용 컬럼';

create table FreeBoard (
fb_num number(5) primary key,
fb_subject varchar2(150) not null,
fb_writer varchar2(100) not null,
fb_content varchar2(4000) not null,
fb_hits number(3) default 0,
fb_date DATE not null
);

COMMENT ON COLUMN FreeBoard.fb_num IS '자유글번호';
COMMENT ON COLUMN FreeBoard.fb_subject IS '제목';
COMMENT ON COLUMN FreeBoard.fb_writer IS '작성자';
COMMENT ON COLUMN FreeBoard.fb_content IS '내용';
COMMENT ON COLUMN FreeBoard.fb_hits IS '조회수';
COMMENT ON COLUMN FreeBoard.fb_date IS '작성일';


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

COMMENT ON COLUMN p2p.p_num IS 'p2p고객번호';
COMMENT ON COLUMN p2p.mem_num IS '회원번호';
COMMENT ON COLUMN p2p.g_code IS '등급번호';
COMMENT ON COLUMN p2p.p_board IS '게시판번호';
COMMENT ON COLUMN p2p.p_sysdate IS '작성일';
COMMENT ON COLUMN p2p.p_title IS '제목';
COMMENT ON COLUMN p2p.p_context IS '설명';
COMMENT ON COLUMN p2p.p_original_filename IS '첨부파일';
COMMENT ON COLUMN p2p.p_rename_filename IS '선정기준';
COMMENT ON COLUMN p2p.p_image IS '이미지';

insert into p2p values(1, 1, sysdate, 'test upload', 'test자동차 입니다.', null, null, '/cs/p2p_pic/자동차1.jpg', 2, 'G1');

commit;



-- 요기부턴 아직 커밋 안함 --



-----------------------------------------------------

    