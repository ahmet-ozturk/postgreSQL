
CREATE TABLE my_companies
(
  company_id CHAR(3),
  company_name VARCHAR(20)
);
INSERT INTO my_companies VALUES(100, 'IBM');
INSERT INTO my_companies VALUES(101, 'GOOGLE');
INSERT INTO my_companies VALUES(102, 'MICROSOFT');
INSERT INTO my_companies VALUES(103, 'APPLE');

SELECT * FROM my_companies;


CREATE TABLE orders
(
  company_id CHAR(3),
  order_id CHAR(3),
  order_date DATE
);
INSERT INTO orders VALUES(101, 11, '17-Apr-2020');
INSERT INTO orders VALUES(102, 22, '18-Apr-2020');
INSERT INTO orders VALUES(103, 33, '19-Apr-2020');
INSERT INTO orders VALUES(104, 44, '20-Apr-2020');
INSERT INTO orders VALUES(105, 55, '21-Apr-2020');

SELECT * FROM orders;

-- JOINS --

-- 1 ) INNER JOIN : ortak (common) datayı verir
-- 2 ) LEFT JOIN  : 1. table'ın tüm datasını ve 2. table ile ortak olanları verir
-- 3 ) RIGHT JOIN : 2. table'ın tüm datasını verir 1. table ile ortak olanları verir
-- 4 ) FULL JOIN  : iki table'ın da tüm datasını verir
-- 5 ) SELF JOIN  : tek table üzerinde çalışırken iki table varmış gibi çalışılır

-- INNER JOIN
-- Ortak companyler için company_name, order_id ve order_date değerlerini çağırın.

SELECT company_name, order_id, order_date
FROM my_companies INNER JOIN orders 
ON my_companies.company_id=orders.company_id

-- yeni isimlendirme yaparak aynısını yaptık

SELECT mc.company_name, o.order_id, o.order_date 
FROM my_companies MC INNER JOIN orders o
ON mc.company_id=o.company_id

-- LEFT JOIN
--my_companies table'ındaki companyler için order_id ve order_date değerlerini çağırın.

SELECT mc.company_name, o.order_id, o.order_date
FROM my_companies mc LEFT JOIN orders o
ON mc.company_id=O.company_id

-- RIGHT JOIN
-- Orders table'ındaki company'ler için company_name, company_id ve order_date değerlerini çağırın.

SELECT mc.company_name, o.company_id, o.order_date
FROM  my_companies mc RIGHT JOIN orders o
ON mc.company_id=o.company_id

-- FULL JOIN
-- İki table'dan da company_name, order_id ve order_date değerlerini çağırın.

SELECT mc.company_name, o.order_id, o.order_date
FROM orders o FULL JOIN my_companies mc
ON mc.company_id=o.company_id

--SELF JOIN

CREATE TABLE workers
(
  id CHAR(2),
  name VARCHAR(20),
  title VARCHAR(60),
  manager_id CHAR(2)
);
INSERT INTO workers VALUES(1, 'Ali Can', 'SDET', 2);
INSERT INTO workers VALUES(2, 'John Walker', 'QA', 3);
INSERT INTO workers VALUES(3, 'Angie Star', 'QA Lead', 4);
INSERT INTO workers VALUES(4, 'Amy Sky', 'CEO', 5);

SELECT * FROM workers;

--workers tablosunu kullanarak çalışanların yöneticilerini gösteren bir tablo hazırlayın.

select employee.name, manager.name
from workers employee JOIN workers manager  -- TEKRARSIZ VERİR
on employee.manager_id=manager.id

select employee.name as employee, manager.name as manager
from workers employee FULL JOIN workers manager -- TEKRARLI VERİR -- BU DAHA MANTIKLI
on employee.manager_id=manager.id