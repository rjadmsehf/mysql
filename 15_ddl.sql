-- DDL(Data DEfinution Language)
-- DDL 은 데이터베이스의 스키마(테이블)를 정의하거나 수정하는데 사용되는 
-- SQL 의 한 부분이다.

-- 1 - 1 create
-- 테이블 생성을 위한 구문
-- IF NOT EXISTS 를 적용하면 기존에 존재하는 테이블이라도 에러가 발생하지 않는다.

-- 테이블의 컬럼 설정 방법
-- 컬럼이름 데이터타입(길이) [not null] [deault value] [auto_increament] colum_contraint;

-- tb1 예시 테이블 생성하기
CREATE TABLE IF NOT EXISTS tb1 (
	pk int primary key ,
    fk int,
    col1 varchar(255)
    check(col1 in ('Y','N'))
) ENGINE=INNODB; 

-- ENGINE=INNODB; : 테이블을 innodb 라고 불리는 스토리지 엔진으로 생성하겠다는 의미(mysql 에서)

describe tb1;

insert into tb1 values (1, 10 , 'Y');   -- pk 가있어서 1 <- 자리에 null 값을 넣을수없다

select * from tb1; 

-- auto_increment
-- insert 시 primary 키에 해당하는 컬럼에 자동으로 번호를 발생(중복되지 않게) 시켜 저장할 수 있다.

CREATE TABLE IF NOT EXISTS tb2 (
	pk int auto_increment primary key ,  -- << auto_increment 는 자동으로 숫자를 추가 해준다 
    fk int,
    col1 varchar(255)
    check(col1 in ('Y','N'))
) ENGINE=INNODB; 

describe tb2;

insert tb2 values(null, 10 , 'Y');
insert tb2 values(null, 10 , 'Y');

select * from tb2;

-- alter
-- 테이블에 추가/변경/수정/삭제 하는 모든 것은 alter 명령어를 사용하여 적용한다.

-- 열 추가
-- alter table 테이블명 add 컬럼명 컬럼정의
-- tb2 테이블에 col2 라는 컬럼 추가(int 형, not null 제약조건 존재)
alter table tb2
add col2 int not null; 

describe tb2;

-- 열 삭제
-- alter table 테이블명 drop column 컬럼명 

alter table tb2 drop col2;

-- 열 이름 및 데이터 형식 변경
-- alter table 테이블명 chaneg column  기존컬럼명 바꿀컬럼명 컬럼정의 
-- fk -> chang_fk 컬럼으로 변경 not null 제약조건 추가

alter table tb2 change fk chang_fk int not null;

describe tb2; 

-- 열 제약 조건 추가 및 삭제 
-- alter table 테이블명 drop 제약조건 
-- tb1 테이블의 primary key 제약조건 제거 

alter table tb2 
drop primary key;

-- auto_increment 가 걸려 있는 컬럼은 primary key 제거가 안 된다.
-- 따라서 modify 명령어로 제거한다
alter table tb2
modify pk int;

describe tb2; 

-- 수정 후 primary key 삭제
alter table tb2 
drop primary key;

describe tb2; 

-- tb2 테이블 pk 컬럼에 primary key 추가하기
-- add
alter table tb2 
add primary key(pk);

describe tb2;

-- 컬럼 여러 개 추가하기
alter table tb2
add col3 date not null,
add col4 tinyint not null;

-- date 형이 추가가 안 되는 것은 MySQL 이 5.7 버전 이후 
-- 0으로 채워진 date 컬럼이 존재하면 안 되기 때문이다

select @@global.sql_mode;                   -- << 전역변수같은 느낌

describe tb2;

-- 테이블을 삭제하기 위한구문 
CREATE TABLE IF NOT EXISTS tb3 (
	pk int auto_increment primary key ,  -- << auto_increment 는 자동으로 숫자를 추가 해준다 
    fk int,
    col1 varchar(255)
    check(col1 in ('Y','N'))
) ENGINE=INNODB; 


-- drop table tb3 
drop table if exists tb3; 

drop table if exists tb1,tb2;    --  << 여러개 삭제하는법

-- truncate
-- 논리적으로는 where 절이 없는 delete 구문과 큰 차이가 없어 보인다.
-- 하지만 어차피 데이터를 다 삭제할 경우 행마다 하나씩 지워지는 delete 보다 
-- drop 이후 바로 테이블을 재생성 해주는 truncate 가 훨씬 효율적으로
-- 한 번에 테이블을 초기화 시켜준다.
create table if not exists tb1 (
	pk int auto_increment primary key, -- 자동 번호 발생 구문 추가 
    fk int,
    col1 varchar(255),
    check(col1 in ('Y','N')) -- col1 을 'Y' 'N' 으로 체크
) ENGINE = INNODB;

insert into tb1 values (null, 10, 'Y');
insert into tb1 values (null, 20, 'Y');
insert into tb1 values (null, 30, 'Y');
insert into tb1 values (null, 40, 'Y');

select * from tb1;

-- 테이블을 초기화
truncate table tb1;
truncate tb1; -- table 키워드 생략 가능






















