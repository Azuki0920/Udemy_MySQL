/* セクション8　43演習問題 1 */
select name, age from customers 
where age between 28 and 40
and name like "%子"
order by age desc limit 5;


/* セクション8　43演習問題 2 */
insert into receipts (
	id,
	customer_id,
	store_name,
	price
)
values(
	301,
	100,
	"StoreX",
	10000
)

/* セクション8　43演習問題 3 */
delete from receipts where 
customer_id = 100 and 
store_name = "StoreX" and 
price = 10000;

/* セクション8　43演習問題 4 */
delete from prefectures where 
name = "" or
name is null;

/* セクション8　43演習問題 5 */
update customers set age = age + 1
where id between 20 and 50;

/* セクション8　43演習問題 6 */
update students set class_no = ceiling(rand() * 5)
where class_no = 6;

/* セクション8　43演習問題 7 */
select * from students where 
height < ALL(select height + 10 from students where class_no in (3, 4)) and 
class_no = 1;

/* セクション8　43演習問題 8 */
update employees set department = trim(department);

/* セクション8　43演習問題 9 */
update employees set salary = case
	when salary >= 5000000 then round(salary * 0.9)
	else round(salary * 1.1)
	end;

/* セクション8　43演習問題 10 */
insert into customers (
	id,
	name,
	age,
	birth_day
) values (
	301,
	"名無権兵衛",
	0,
	CURDATE()
);

/* セクション8　43演習問題 11 */
alter table customers add name_length INT;
update customers set name_length = char_length(name);

/* セクション8　43演習問題 12 */
alter table tests_score add score INT;
select COALESCE(test_score_1, test_score_2, test_score_3 ) from tests_score;

select *, case 
	when COALESCE(test_score_1, test_score_2, test_score_3 ) >= 900
	then floor(COALESCE(test_score_1, test_score_2, test_score_3 ) * 1.2)
	when COALESCE(test_score_1, test_score_2, test_score_3 ) <= 600
	then ceiling(COALESCE(test_score_1, test_score_2, test_score_3 ) * 0.8)
	else COALESCE(test_score_1, test_score_2, test_score_3 )
end as sa
from tests_score;

update tests_score set score = case
when COALESCE(test_score_1, test_score_2, test_score_3 ) >= 900
	then floor(COALESCE(test_score_1, test_score_2, test_score_3 ) * 1.2)
	when COALESCE(test_score_1, test_score_2, test_score_3 ) <= 600
	then ceiling(COALESCE(test_score_1, test_score_2, test_score_3 ) * 0.8)
	else COALESCE(test_score_1, test_score_2, test_score_3 )
end

select * from tests_score;

/* セクション8　43演習問題 13 */
select * from employees 
order by case department 
when "マーケティング部" then 1 
when "研究部"　then 2
when "開発部"　then 3
when "総務部"　then 4
when "営業部"　then 5
when "経理部"　then 6
end
;

select * from employees;
