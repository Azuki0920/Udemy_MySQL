/* day_4_9_db を利用する */
use day_4_9_db;

/* 利用中のデータベースを表示する*/ 
select database();

/* データベース一覧を表示する */
show databases;

/* テーブル一覧を表示する */
show tables;

/* テーブルを作成する */
create table user {

/* テーブル定義を確認する */
describe customers;

/* テーブル名の変更 */
alter table users rename to users_table;

/* カラム（列）の削除 */
alter table users drop column class_no;

/* カラム（列）の追加 */
alter table users add new_column_name new_column_definition first;
alter table users add new_column_name new_column_definition after column_name;

/* 特定の行数だけ飛ばしたLimit */
select * from customers limit 10 offset 5;

/*　小数点以下を切り捨て */ 
select floor(3.14); # 3

/* 小数点以下を切り上げ */
select ceiling(3.14); # 4

/* 最初に登場するNULLでない値を返す関数 */
select coalesce(NULL, 'A', 'B'); # A

/* IF文を使ったSQLの例 */
select * , IF(birth_place = "日本", "日本人", "その他") AS "国籍" from users;

/* TRANSACTIONの開始　*/
START TRANSACTION;

/* ROLLBACK */
ROLLBACK;

/* COMMIT */
COMMIT;

/* テーブルロック　共有ロック　*/
select * from table_name FOR SHARE;

/* テーブルロック　排他ロック　*/
select * from table_name FOR UPDATE;

/* 行ロック　共有ロック */
select * from table_name where id = 1 FOR SHARE;
