-- constraints 
-- 제약조건으로 테이블에 데이터가 입력되거나 수정될 때의
-- 규칙을 정의한다.

-- 1-1. not null
-- null 값을 허용하지 않는 제약조건

drop table if exists user_notnull;
create table if not exists user_notnull (
	user_no int not null,
    user_id varchar(255) not null,
    user_pwd varchar(255) not null,
    user_name varchar(255) not null,
    gender varchar(3), 
    phone varchar(255) not null,
    emaill varchar(255)

)ENGINE = INNODB;

describe user_notnull;


insert into user_notnull
(user_no, user_id , user_pwd , user_name, gender, phone, emaill)
values
(1,'user01','pass01', '홍길동', '남', '010-1234-5678' , 'hong@gmail.com'),
(2,'user02','pass02', '홍길', '남', '010-1234-5678' , 'hon@gmail.com');

select * from user_notnull;

-- not null 로 설정한 user pwd null 값을 넣어보기 
insert into user_notnull
(user_no, user_id , user_pwd , user_name, gender, phone, emaill)
values
(1,'user01',null, '홍길동', '남', '010-1234-5678' , 'hong@gmail.com');

-- unique
-- 중복값을 허용하지 않는 제약조건 

drop table if exists user_unique;
create table if not exists user_unique (
	user_no int not null unique,  -- << primary key 랑 같은의미입니다 
    user_id varchar(255) not null,
    user_pwd varchar(255) not null,
    user_name varchar(255) not null,
    gender varchar(3), 
    phone varchar(255) not null,
    email varchar(255),
	unique(phone)					-- primary key 는 한테이블에 두개가 존재할수없다.
)ENGINE = INNODB;

-- not null 조건과 unique 조건을 합친 것이 primary key 라는 것이다.!
describe user_unique;

insert into user_unique
(user_no, user_id , user_pwd , user_name, gender, phone, email)
values
(1,'user01','pass01', '홍길동', '남', '010-1234-5678' , 'hong@gmail.com'),
(2,'user02','pass02', '유관순', '여', '010-1234-5671' , 'hon@gmail.com');

select * from user_unique;

-- unique 제약조건 에러 (전화번호 중복 값 적용)
insert into user_nuique
(user_no, user_id , user_pwd , user_name, gender, phone, emaill)
values
(3,'user01',null, '홍길동', '남', '010-1234-5678' , 'hong@gmail.com');

-- primary key 
-- 테이블에서의 한 행의 정보를 찾기 위해 사용 할 컬럼을 의미한다.
-- 테이블에 대한 식별자 역할을 한다. (한 행씩 구분하는 역할)
-- not null + unique 제약조건의 의미
-- 한 테이블 당 1개만 설정이 가능하다.
-- 컬럼 레벨, 테이블 레벨 둘다 설정이 가능하다.       >>> 테이블 레벨 ()범위 ,  하나하나가 컬럼 레벨
-- 한 개 컬럼에 설정할 수도 있고 여러 개를 묶어서 설정할 수도 있다 (복합키)


drop table if exists user_primar;
create table if not exists user_primary(
 -- user_no int primary key ,             -- 컬럼 레벨 단위로 primary key 설정하기
    user_no int,  
    user_id varchar(255) not null,
    user_pwd varchar(255) not null,
    user_name varchar(255) not null,
    gender varchar(3), 
    phone varchar(255) not null,
    email varchar(255),
    primary key(user_no)                  -- 테이블 레벨 단위로 primary key 설정하기
)ENGINE = INNODB;

describe user_primary;

-- 
insert into user_primary
(user_no, user_id , user_pwd , user_name, gender, phone, email)
values
(1,'user01','pass01', '홍길동', '남', '010-1234-5678' , 'hong@gmail.com'),
(2,'user02','pass02', '유관순', '여', '010-1234-5671' , 'hon@gmail.com');


select * from user_primary;

-- not null 적용 확인 
insert into user_primary (user_no, user_id , user_pwd , user_name, gender, phone, email)
values
( null ,'user01','pass01', '홍길동', '남', '010-1234-5678' , 'hong@gmail.com');

-- unique 적용 확인 
insert into user_primary (user_no, user_id , user_pwd , user_name, gender, phone, email)
values
( 2 ,'user01','pass01', '홍길동', '남', '010-1234-5678' , 'hong@gmail.com');

-- foreign key 
-- 참조 된 다른 테이블에서 제공하는 값만 사용할 수 있다.
-- foreign key 제약조건에 의해 테이블 간의 관계(relationship) 가 형성 된다.
-- 제공되는 값 외에는 null 을 사용할 수 있다.

-- 부모 테이블 
drop table if exists user_grade;
create table if not exists user_grade (
	grade_code int not null unique,
	grade_name varchar(255) not null
) ENGINE = InnoDB;
				
describe user_grade;

insert user_grade
values
(10,'일반회원'),
(20,'우수회원'),
(30,'특별회원');

select * from user_grade;

-- 자식 테이블
drop table if exists user_foreignkey1;
create table if not exists user_foreignkey1
(
    user_no int primary key ,              
    user_id varchar(255) not null,
    user_pwd varchar(255) not null,
    user_name varchar(255) not null,
    gender varchar(3), 
    phone varchar(255) not null,
    email varchar(255),
    grade_code int,
    foreign key(grade_code)
    references user_grade(grade_code)
)ENGINE = INNODB;


describe user_foreignkey1;

insert into user_foreignkey1
(user_no, user_id , user_pwd , user_name, gender, phone, email , grade_code)
values
(1,'user01','pass01', '홍길동', '남', '010-1234-5678' , 'hong@gmail.com'),
(2,'user02','pass02', '유관순', '여', '010-1234-5671' , 'hon@gmail.com' ),
(3,'user03','pass03', '유관순1', '여', '010-1234-5671' , 'hon@gmail.com', 10 ),
(4,'user04','pass04', '유관순2', '여', '010-1234-5671' , 'hon@gmail.com', 20 );



select * from user_foreignkey1;
select * from user_grade;

insert into user_foreignkey1
(user_no, user_id , user_pwd , user_name, gender, phone, email , grade_code)
values 
(5,'user05','pass05', '유관순3', '여', '010-1234-5671' , 'hon@gmail.com', 50 );

-- check 
-- check 제약 조건 : 위반 시 허용하지 않는다. (입력안됌)
drop table if exists user_check;
create table if not exists user_check (
user_no int auto_increment primary key,
user_name varchar(255) not null,
gender varchar(3) check (gender in ('남', '여')),              -- 성별은 남,여만 가능 
age int check(age >= 19)                                      -- 나이는 19세이상
) ENGINE=InooDB;

describe user_check;

insert into user_check
values 
(null ,'홍길동' , '남', 25 ),
(null ,'이순신' , '남', 33 );

select * from user_check;

-- check 제약조건 성별 위반
insert into user_check
values 
(null ,'홍길동' , '남성', 25 );

-- check 제약조건 나이 위반 
insert into user_check
values 
(null ,'유관순' , '여', 17 );


-- default 
-- 컬럼에 null 대신 기본값을 적용 
-- date 주의 사항 
-- 컬럼 타입이 date 일 시 curreny_date 만 가능
-- 컬럼 타입이 datetime 일 시 current_time 과 current_timestamp, now () 모두 사용 가능 

drop table if exists tbl_country;
create table if not exists tbl_country (
	country_code int auto_increment primary key,
	country_name varchar(255) default '한국',
    population varchar(255) default '0명' ,
    add_day date default (current_date),
    add_time datetime default (current_time)
) ENGINE = InnoDB;

describe tbl_country;

select * from tbl_country;

-- default 설정이 되어있는 컬럼들에 default 값이 들어갈 수 있도록 한다.

insert into tbl_country 
values (null, default, default, default ,default);

select * from tbl_country;










