-- build in functions
-- MySQL 은 문자열 , 숫자 , 날짜 , 시간에 관한 다양한 작업 수행에 많은
-- 내장 함수를 제공하고 있다.

-- concat(문자열 1, 문자열2, ...)
-- concat_ws (구분자 , 문자열 1 , 문자열 2 , ...)

select concat('호랑이' , '기린' , '토끼' );
select concat_ws('-', '2024', '03','04');

-- elt : 해당 위치의 문자열 반환
-- field : 찾을 문자열 위치 반환
-- find_in_set : 찾을 문자열의 위치 반환
-- instr : 기준 문자열에서 부분 문자열의 시작 위치 반환 
-- locate : instr 과 동일하고 순서만 반대

select
	elt(2, '사과', '딸기', '바나나'),
    field('딸기', '사과' ,'딸기','바나나'),
    find_in_set('바나나' , '사과,딸기,바나나'),
    instr('사과딸기바나나','딸기'),
    locate('딸기', '사과딸기바나나');
    
-- format(숫자, 소수점 자리수)    
-- 1000 단위마다 콤마(,) 표시를 해주며 소수점 아래 자릿수 까지 반올림 표현한다.
select format(1231231231231.123124124124, 3);


-- insert(기준 문자열, 위치, 길이, 삽입할 문자열)
select insert('내 이름은 아무개 입니다.', 7 , 3,'전준규');

-- left, right 
-- left : 왼쪽에서 문자열의 길이만큼을 반환
-- right : 오른쪽에서 문자열의 길이만큼을 반환
select left('Hello World',3), right('Hello Worlds' ,3);

-- upper , lower 해당하는 문자열을 대소문자로 변환
select upper('Hello World!') , lower('Hello World!');


-- 자주쓰이는 것들 * *

-- lpad(문자열, 길이, 채울 문자열) , rpad(문자열, 길이 , 채울 문자열)
-- lpad = 문자열 길이만큼 왼쪽으로 늘린 후에 빈 곳을 문자열로 채운다.
-- 010524-3******
select lpad('왼쪽',6,'@'), rpad('오른쪽' , 6 , '@');
-- rpad = 문자열 길이만큼 오른쪽으로 늘린 후에 빈 곳을 문자열로 채운다.

-- ltrim(문자열) , rtrim(문자열)
-- 왼쪽 공백 제거, 오른쪽 공백 제거
select ltrim('                  왼쪽');
select rtrim('오른쪽                 ');

-- trim(문자열), trim(방향  자를문자열   from  문자열)
-- 방향 : leading (앞) , both(양쪽) , trailing(뒤) 해당 방향에 대한 지정한 문자열을 제거할 수 있다.

select trim(both '@' from '@@@MySQL@@@@@@@');

-- repeat (문자열 , 횟수) , replace(문자열, 찾을 문자열, 바꿀 문자열), reverse(문자열)  마이를 > My 로 치원하겟다
select replace('마이SQL' ,'마이','My');

-- substring(문자열, 시작위치 , 길이 )
-- 시작 위치부터 길이 만큼의 문자를 반환(길이를 생략하면 시작 위치부터 끝까지 반환) 
select substring('안녕하세요 반가워요.',7,2) , substring('안녕하세요 반가워요.',7);

-- substring_index(문자열, 구분자, 횟수)
-- 구분자가 왼쪽부터 횟수 번째 나오면 그 이후의 오른쪽은 버린다.
-- 횟수가 음수일 떄는 오른쪽부터 세고 왼쪽을 버린다.
select substring_index('hong.test@gmail.com','.', 2);   -- 2 일때 앞에서부터 hong.test@gmail.com 2번째 .부터 뒤는 버린다.
														-- -2 일때는 뒤에서부터 hong.test@gmail.com 2번째 .부터 앞에는 버린다.
    
-- 수학 관련 함수alter
-- abs(숫자) : 절대값 반환
select abs(-1234);    
    
-- ceiling(숫자) : 올림값 반환  //반올림이 아닌 올림값이다
-- floor(숫자) :  버림값 반환
-- round(숫자) : 반올림값 반환   
select ceiling(1234.01), floor(1234.56), round(1234.56);
    
-- mod(숫자1, 숫자2) or 숫자1 % 숫자2 or 숫자1 mod 숫자2
-- 숫자 1을 숫자 2로 나눈 나머지 추출   

select mod(75,10), 75 % 10 , 75 mod 10;

-- pow(숫자1, 숫자2) : 거듭제곱값
-- sqrt(숫자) : 제곱근을 추출

select pow(2, 4) , sqrt(16);

-- rand() : 0 이상 1 미만의 실수를 구한다.
-- m <= 임의의 정수 < n 을 구하고 싶다면 
-- floor( (rand() *(n - m) + n )
-- 1 부터 10까지 난수 : floor(rand()* (11 - 1 ) + 1 )

select rand(), floor(rand() * (11 - 1 ) + 1);

select floor(rand()*(10) + 1);

-- sign(숫자)
-- 양수면 1, 0이면, 0, 음수면 -1 을 반환 
select sign(10.1), sign(0), sign(-10);


-- truncate(숫자(소수점포함), 정수);
-- 소수점을 기준으로 정수 위치까지 구하고 나머지 버림 
select truncate(12345.1235 , 2);

select truncate(12345.1235 , -2); --  자세한건 출력값 봐보셈 

-- 날짜 및 시간 관련 함수
-- adddate(날짜, 차이) : 날짜를 기준으로 차이를 더함
-- subdate(날짜, 차이) : 날짜를 기준으로 날짜를 뻄
select adddate('2024-03-04' , interval 30 day);
select adddate('2024-03-04' , interval 6 month);
select adddate('2024-03-04' , interval 6 year );

select subdate('2024-03-04' , interval 30 day);

-- addtime(날짜/시간, 시간)
-- subtime(날짜/시간, 시간)

select addtime('2024-03-04 17:42:00', '0:30:00');
select subtime('2024-03-04 17:42:00', '0:30:00');

-- curdate : 현재 연-월-일
-- curtime : 현재 시:분:초
-- now() or sysdate() : 현재 연-월-일 시:분:초

select curdate(), curtime(), now(), sysdate();


-- year(날짜), month(날짜) , day(날짜)
-- 연 월 일 시 분 초 밀리초
select year(curdate()), month(curdate()), microsecond(curdate());


-- datediff(날짜 1, 날짜 2)
-- timediff(날짜 1 or 시간 1, 날짜  2 )
-- darediff : 날짜 1 - 날짜 2의 일수를 반환
-- timediff : 시간 1 - 시간 2의 결과


select datediff('2024-03-07' , now()), timediff('17:05:11', '13:00:10');

-- dayofweek(날짜) : 요일 반환 (일요일이 1)
-- monthname : 해당 달의 이름 반환
-- dayofyear : 해당 년도에서 몇 일이 흘렀는 지

select dayofweek(curdate()), monthname(curdate()), dayofyear(curdate());

-- last_day(날짜)
-- 해당 날짜의 달에서 마지막 날의 날짜를 구한다.
select last_day(curdate());

 
-- quarter(날짜) : 해당 날짜의 분기를 구한다.
select quarter(curdate()); 

-- time_to_sec(시간) : 시간을 초 단위로 구함 
select time_to_sec('1:1:1');

