select * from restaurant;
delete from restaurant;
delete from menu;
UPDATE AUTHORITY set AUTHORITY = 'ROLE_MEMBER' WHERE member_id = 'rlaghrb';
UPDATE AUTHORITY set AUTHORITY = 'ROLE_OWNER' WHERE business_id = '00000000';
select * from AUTHORITY;
select * from member;
select * from menu;
update MEMBER set drop_check = '0' where member_id = 'dldbfl';
insert into AUTHORITY values('dldbfl', 'ROLE_MEMBER');
UPDATE member set member_name = "dkssudgktpdy" WHERE member_id = '201234026';


		select res_date , sum(res_people) from RESERVATION where business_id = 'test-1' group by res_date
delete from restaurant where business_id = 'noddle';

select * from reservation;
select * from restaurant

insert into MEMBER(member_id, member_password, member_name, member_gender, member_tel, member_birthday, member_email) values('phj','phj','박현준','남','02132',sysdate,'djd' );
insert into RESTAURANT values('phj',1,8,18,2012121,'현준이네고기집','010212132',sysdate,sysdate,'ahffk','ahffk',30,5000);


select * from RESTAURANT;


select RESTAURANT.BUSINESS_ID, RESTAURANT.RT_HOLIDAY, RESTAURANT.RT_TERM, RESTAURANT.RT_FIELD, RESTAURANT.RT_NUM, RESTAURANT.RT_NAME, 
	   RESTAURANT.RT_TEL, RESTAURANT.RT_OPEN, RESTAURANT.RT_CLOSE, RESTAURANT.RT_PICTURE, RESTAURANT.RT_ADDRESS, RESTAURANT.RT_CAPACITY, RT_DEPOSIT,
	   holiday.Holiday_Name, holiday.Holiday_VAL, term.Term_name, term.Term_VAL, field.field_name, field.field_VAL
FROM RESTAURANT, holiday, field, term 
WHERE RESTAURANT.rt_holiday = holiday.holiday_name and 
	  RESTAURANT.rt_field = field.field_name and
	  RESTAURANT.rt_term = term.term_name and 
	  RESTAURANT.business_id = 'djaqnsghd';
	  
  
	  
	  
	  
-- 관리자 권한을 가지는 member  // selectMemberAuthorityAdmin
select MEMBER.member_id, MEMBER.member_password, MEMBER.member_name, MEMBER.member_gender, MEMBER.member_tel, MEMBER.member_birthday, MEMBER.member_email, MEMBER.drop_check
from MEMBER, AUTHORITY
where member.member_id = AUTHORITY.member_id and AUTHORITY.AUTHORITY = 'ROLE_ADMIN';
-- 일반 사용자 권한을 가지는 member // selectMemberAuthorityMember
select MEMBER.member_id, MEMBER.member_password, MEMBER.member_name, MEMBER.member_gender, MEMBER.member_tel, MEMBER.member_birthday, MEMBER.member_email, MEMBER.drop_check
from MEMBER, AUTHORITY
where member.member_id = AUTHORITY.member_id and AUTHORITY.AUTHORITY = 'ROLE_MEMBER';
-- 탈퇴한 회원 조회 // selectWithdrawMember
select MEMBER.member_id, MEMBER.member_password, MEMBER.member_name, MEMBER.member_gender, MEMBER.member_tel, MEMBER.member_birthday, MEMBER.member_email, MEMBER.drop_check
from MEMBER
where member.drop_Check = '1';
-- 식당 사업자 권한을 가지는 member // selectMemberAuthorityOwner
select MEMBER.member_id, MEMBER.member_password, MEMBER.member_name, MEMBER.member_gender, MEMBER.member_tel, MEMBER.member_birthday, MEMBER.member_email, MEMBER.drop_check
from MEMBER, AUTHORITY
where member.member_id = AUTHORITY.member_id and AUTHORITY.AUTHORITY = 'ROLE_OWNER';
-- 전체 식당 정보 조회 // selectAllRestaurant

select RESTAURANT.BUSINESS_ID, RESTAURANT.RT_HOLIDAY, RESTAURANT.RT_TERM, RESTAURANT.RT_FIELD, RESTAURANT.RT_NUM, RESTAURANT.RT_NAME, 
	   RESTAURANT.RT_TEL, RESTAURANT.RT_OPEN, RESTAURANT.RT_CLOSE, RESTAURANT.RT_PICTURE, RESTAURANT.RT_ADDRESS, RESTAURANT.RT_CAPACITY, RT_DEPOSIT,
	   holiday.Holiday_Name, holiday.Holiday_VAL, term.Term_name, term.Term_VAL, field.field_name, field.field_VAL
FROM RESTAURANT, holiday, field, term 
WHERE RESTAURANT.rt_holiday = holiday.holiday_name and 
	  RESTAURANT.rt_field = field.field_name and
	  RESTAURANT.rt_term = term.term_name
AND	  holiday.holiday_val != '월'
AND	  RESTAURANT.rt_address like '%서울%'

	  
select to_char(RT_OPEN,'hh24:mi')
from restaurant;
select * from BOARD order by board_time desc;

select * from TABLE_

select * from COMMEN;

/* 댓글 */
CREATE TABLE COMMEN (
   COMMEN_NUM NUMBER NOT NULL, /* 댓글일련번호 */
   COMMEN_ID VARCHAR2(16), /* 작성자아이디 */
   COMMEN_TEXT VARCHAR2(100), /* 댓글내용 */
   COMMEN_TIME DATE DEFAULT sysdate, /* 작성시간 */
   BOARD_NUM NUMBER, /* 글번호 */
   CONSTRAINT memo_mseq_pk PRIMARY KEY (COMMEN_NUM)
); 

insert into COMMEN values(commen_num_seq.nextval,'dlwltn','태경이를 때립시다',sysdate,11);
delete from commen;
insert into Commen(COMMEN_NUM, COMMEN_ID, COMMEN_TEXT, COMMEN_TIME, BOARD_NUM)
values(10, '21312', '45345', sysdate, '11')

		select count(*)
		from member
		where member_id = 'dbsehddnd';
		
		
		

		
		
insert into MEMBER values('guswnss','phj','박현준','남','01052441251',sysdate,'djddd@naver.com',1 );
insert into MEMBER values('tjdghks','phj','김성환','남','01052152122',sysdate,'djssd@naver.com',1 );
insert into MEMBER values('dbfl12','phj','이유리','남','033451215',sysdate,'djadsqed@naver.com',1 );
insert into MEMBER values('tncks','phj','정수찬','남','235166622',sysdate,'djdadsads@naver.com',1 );
insert into MEMBER values('wltn5215','phj','이지수','남','781513222',sysdate,'dq222jd@naver.com',1 );
insert into MEMBER values('ghrbapdlxm','phj','김호규','남','0102512222',sysdate,'2131djd@naver.com',1 );
insert into MEMBER values('rbtjrdldia','phj','윤규석','남','1235121322',sysdate,'djqe6634d@naver.com',1 );
insert into MEMBER values('xodmslsp','phj','최태은','남','0102315232',sysdate,'djd1321@naver.com',1 );






