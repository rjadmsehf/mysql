-- order by
-- order by 절은 select 문과 함께 사용하며
-- 결과 집합을 특정 열이나 열들의 값에 따라 정렬하는데 사용한다.

select
	menu_code,
	menu_name,
	menu_price
from tbl_menu
order by    		-- asc 는 기본값임
	menu_price ;    -- asc 는 오름차순, desc 는 내림차순이다.
    
select
	menu_code,
	menu_name,
	menu_price
from tbl_menu 
order by
	menu_price desc;
    
-- tbl_menu 에서 메뉴코드랑 메뉴이름, 메뉴가격을 조회해줘 근데 메뉴 이름 내림차순으로

select
	menu_code,
    menu_name,
    menu_price
from tbl_menu
order by
	menu_name desc;
    
-- 여러 열로 정렬 
select
	menu_code,
	menu_name,
	menu_price
from tbl_menu
order by
	menu_price desc,
	menu_name asc;
	
-- order by 절을 사용하여 연산 결과로 결과 집합 정렬 
select
	menu_code,
	menu_price,
	menu_code * menu_price
from
	tbl_menu
order by
	menu_code * menu_price desc;
 
select
	menu_code,
    menu_price,
    menu_code * menu_price as 연산결과
from tbl_menu
order by
	menu_code * menu_price desc;
    
select
	   menu_code
	 , menu_name
     , menu_price
  from
	  tbl_menu
order by 
		menu_name;

-- order by 절을 사용하여 사용자 지정 목록을 사용하여 데이타 정렬

-- 맨 왼쪽 값이 2번쨰 인자 이후의 값고 일치하면 해당 위치 값을 반환 
select field('c','a','b','c');


select
	field(orderable_status, 'N' , 'Y')    
from tbl_menu;

-- tbl_menu 테이블엫서 메뉴이름, 판매상태를 조회하는데 판매상태가 N 인 친구들이 위로 오게 
select
	menu_name,
    orderable_status
from tbl_menu
order by field(orderable_status, 'N' , 'Y');    

-- null 값이 있는 컬럼에 대한 정렬
select
	*
from tbl_category;    

-- 오름차순 시 null 값이 처음으로(default)
select
	category_code,
	category_name,
	ref_category_code
from tbl_category
order by
	ref_category_code asc;  -- desc 로 바꿔봄

-- 오름차순 시 null 값을 마지막으로 (is null asc)    
select
	category_code,
	category_name,
	ref_category_code
from tbl_category
order by	
	ref_category_code is null asc;
    
    
    
    