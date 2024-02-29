-- distinct
-- distinct 는 중복된 값을 제거하는데 사용된다.
-- 컬럼에 있는 컬럼값들의 종류를 파악할 수 있다.

select
	*
from
	tbl_menu
order by category_code;    

-- 단일 열(컬럼) 중복 제거
select
	-- menu_code  <<<<안됀다
	distinct category_code
from 
	tbl_menu
order by category_code;    

-- null 값을 포함한 열의 distinct 사용
select
	*
from 
	tbl_category;
    
select
	distinct ref_category_code
from    
	tbl_category;
    
-- 다중 열(컬럼) distinct 사용    
-- 다중열의 값들이 모두 동일하면 중복된 것으로 판별한다.
select
	category_code,
    orderable_status
from
	tbl_menu;
    
select distinct    -- << 이놈 중복 삭제 
    category_code,
    orderable_status
from
	tbl_menu;	
    
