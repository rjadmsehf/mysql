-- grouping
-- group by 절은 결과 집합을 특정 열의 값에 따라 그룹화 하는데 사용된다.

select
	
    
	*
from	
	tbl_menu;
select
	category_code
from tbl_menu
group by category_code;

-- count() : 개수를 세준다.
select
	category_code,
    count(*)
from	
	tbl_menu
group by category_code;   

-- sum() : 합계
select
	category_code,
    sum(menu_price)
from
	tbl_menu
group by
	category_code;
    
-- avg() : 평균
select
	category_code,
    avg(menu_price)
from 
	tbl_menu
group by category_code;    

-- 2개 이상의 그룹 생성
select	
	menu_price,
    category_code
from
	tbl_menu
group by    
	menu_price,
    category_code;
    
-- rollup
-- 컬럼들의 총합을 구하는 방식
select
	category_code,
    sum(menu_price)
from
	tbl_menu
group by
	category_code
with rollup;    
    
select
	menu_price,
    category_code,
    sum(menu_price)
from
	tbl_menu
group by
	menu_price,
    category_code
with rollup;    
    
-- select
-- 	category_code,
--     menu_price
-- from
-- 	tbl_menu
-- where
-- 	category_code =
--     and 
--     menu_price = 5000;
    
    
    
    