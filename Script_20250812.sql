/* 演習問題　0（準備） */
select * from employee_enrollment where RETIREMENT_DATE is null;

update employee_enrollment set RETIREMENT_DATE = "9999-12-31"
where RETIREMENT_DATE is null;

select * from employee_enrollment;

alter table employee_enrollment modify column RETIREMENT_DATE DATE not null;

describe employee_enrollment;

select * from employee_career_hst where FINISH_DATE is null;

update employee_career_hst set FINISH_DATE = "9999-12-31"
where FINISH_DATE is null;

select * from employee_career_hst;

alter table employee_career_hst modify column FINISH_DATE DATE not null;

describe employee_career_hst;

/* 演習問題１　*/
select 
	MST.employee_id,
	MST.EMPLOYEE_NM,
	ENR.ENTERING_DATE
from employee_mst AS MST
INNER JOIN employee_enrollment AS ENR
ON MST.employee_id = ENR.employee_id
order by MST.employee_id;

/* 演習問題２ */
select 
	MST.employee_id,
	MST.EMPLOYEE_NM,
	MST.SEX
from employee_mst AS MST
INNER JOIN employee_enrollment AS ENR
ON MST.employee_id = ENR.employee_id
where 
	ENR.RETIRED_FLG = 0 and
	MST.sex = 1
order by MST.EMPLOYEE_ID;

/* 演習問題３　*/
select EMPLOYEE_ID , EMPLOYEE_NM , BIRTH_DATE 
from employee_mst 
where timestampdiff(YEAR, birth_date, "2017/04/01") <= 40
order by BIRTH_DATE desc, EMPLOYEE_ID ;

/* 演習問題４ */
select MST.EMPLOYEE_ID , MST.EMPLOYEE_NM , MST.BIRTH_DATE
from employee_mst AS MST
inner join employee_enrollment AS ENR
ON MST.employee_id = ENR.employee_id
where 
	(timestampdiff(YEAR, MST.birth_date, "2017/04/01") between 20 and 29 or
	timestampdiff(YEAR, MST.birth_date, "2017/04/01") between 50 and 59) and 
	ENR.RETIRED_FLG = 0 
order by MST.BIRTH_DATE, MST.EMPLOYEE_ID ;

/* 演習問題５ */
select EMPLOYEE_ID , EMPLOYEE_NM 
from employee_mst 
where EMPLOYEE_NM like "%田%"
order by EMPLOYEE_ID ;

/* 演習問題６ */
select MST.BIRTH_DATE , MST.EMPLOYEE_NM,
timestampdiff(MONTH, EMR.ENTERING_DATE , "2017/04/01") AS ENROLLMENT_PERIOD_YM
from employee_mst AS MST
inner join employee_enrollment AS EMR
ON MST.EMPLOYEE_ID = EMR.EMPLOYEE_ID 
where EMR.RETIRED_FLG = 0
order by ENROLLMENT_PERIOD_YM , MST.EMPLOYEE_ID ; 

/* 演習問題７ */
select MST.EMPLOYEE_ID, MST.EMPLOYEE_NM, div2.DIVISION_NM 
from employee_mst AS MST
inner join employee_career_hst AS CAR
ON MST.EMPLOYEE_ID = CAR.EMPLOYEE_ID
inner join division_mst AS div2
ON CAR.DIVISION_CD = div2.DIVISION_CD
inner join employee_enrollment AS ENR
ON MST.EMPLOYEE_ID = ENR.EMPLOYEE_ID
where
	CAR.start_date < DATE("2017-04-01") and 
	CAR.finish_date > DATE("2017-04-01") and 
	ENR.RETIRED_FLG = 0
order by MST.EMPLOYEE_ID 
;

/* 演習問題８　*/
select em.EMPLOYEE_ID , em.EMPLOYEE_NM, 
	case when dm.DIVISION_NM IS null then 0
	else 1
	end AS MANAGER_FLAG
from employee_mst em 
inner join employee_career_hst ech  
on em.EMPLOYEE_ID = ech.EMPLOYEE_ID
inner join employee_enrollment ee 
on em.EMPLOYEE_ID = ee.EMPLOYEE_ID 
left join division_mst dm 
on em.EMPLOYEE_ID = dm.MANAGER_ID 
where ee.RETIRED_FLG = 0 and 
	(ech.EMPLOYEE_ID , ech.START_DATE ) 
	IN (select EMPLOYEE_ID, max(START_DATE) from employee_career_hst group by EMPLOYEE_ID);

/* 演習問題９ */
select count(*) AS COUNT_EMPLOYEE,
	MIN(em.BIRTH_DATE ) AS BIRTH_DATE_OLDEST,
	MAX(em.BIRTH_DATE ) AS BIRTH_DATE_YNGEST,
	ROUND(AVG(
		timestampdiff(year, em.BIRTH_DATE , "2017/04/01")
	),1) AS AVERAGE_AGE
from employee_mst em 
inner join employee_enrollment ee 
on em.EMPLOYEE_ID = ee.EMPLOYEE_ID 
where ee.RETIRED_FLG = 0;


/* 演習問題１０ */


/* 演習問題１１ */


/* 演習問題１２ */


/* 演習問題１３ */
