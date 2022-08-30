CREATE TABLE workers
(
  id CHAR(9),
  name VARCHAR(50),
  state VARCHAR(50),
  salary SMALLINT,
  company VARCHAR(20)
);
INSERT INTO workers VALUES(123456789, 'John Walker', 'Florida', 2500, 'IBM');
INSERT INTO workers VALUES(234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
INSERT INTO workers VALUES(345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
INSERT INTO workers VALUES(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO workers VALUES(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT');
INSERT INTO workers VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
INSERT INTO workers VALUES(123456710, 'Mark Stone', 'Pennsylvania', 2500, 'IBM');

SELECT * FROM workers;

--Toplam salary değeri 2500 üzeri olan her bir çalışan için salary toplamını bulun.

select name, sum(salary) as "Total Salary"
from workers
group by name
having sum(salary) >2500 -- "group by"ın ardından "where" KULLANILMAZ
                         -- "having" kullanılır
						 -- "having"den sonra "aggregate" (sum, avg, min, max vs... ) kullanılır


--Birden fazla çalışanı olan, her bir state için çalışan toplamlarını bulun.

select state, count (state) as "number of employees" 
from workers
group by state
having count (state) >1 -- having group by ardından filtreleme için kullanılır

--Her bir state için değeri 3000'den az olan maximum salary değerlerini bulun.

select state, max(salary) as "salary<3000 olanlar"
from workers
group by state
having max(salary) < 3000

--Her bir company için değeri 2000'den fazla olan minimum salary değerlerini bulun.

select company, min(salary) as "<2000 olanlar"
from workers
group by company
having min (salary) >2000

--Tekrarsız isimleri çağırın.

select DISTINCT name from workers -- distinct çağrılan terimlerden tekrarlı olanlardan 1. sini alır

--Name değerlerini company kelime uzunluklarına göre sıralayın.

select name, company , salary
from workers
order by LENGTH (company) 

-- Tüm name ve state değerlerini aynı sütunda çağırarak
-- her bir sütun değerinin uzunluğuna göre sıralayın.

-- CONCAT = birden fazla sütun veya string değerini birleştirmek için kullanılır

-- 1 . yol
select concat(name,' ',state) as "name & state"
from workers order by length (concat(name,' ',state))

-- 2 . yol
select concat(name,' ',state) as "name & state"
rom workers order by length (name) + length (state)

-- 3 . yol
select name || ' ' || state || ' ' || length(name) + length (state) as "name % states"
from workers
order by length (name) + length (state)

-- || işareti concat anlamına gelir

