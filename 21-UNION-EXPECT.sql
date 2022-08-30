-- UNION operator

-- 1 : iki sorgu sonucunu birleştirmek için kullanılır
-- 2 : tekrarsız (unique) record(satır)ları verir
-- 3 : tek bir sütuna çok sütun koyabiliriz
-- 4 : tek bir sütuna çok sütun koyarken mevcut data durumuna dikkat etmek gerekir



-- salary değeri 3000'den yüksek olan state değerlerini ve 
-- salary değeri 2000'den küçük olan name değerlerini tekrarsız olarak bulun.

select state as "name & state", salary -- 'name&state' yeni isim verdik
from workers
where salary >3000

UNION -- üstteki sorgu ile alttaki sorguyu aynı anda yapar tek tabloda verir

select name, salary
from workers
where salary < 2000

-- salary değeri 3000'den yüksek olan state değerlerini ve
-- 2000'den küçük olan name değerlerini TEKRARLI olarak bulun.

select state as "name & state", salary 
from workers
where salary >3000

UNION ALL-- union ile aynı işi yapar ancak TEKRARLI değerleri de verir

select name, salary
from workers
where salary < 2000

--salary değeri 1000'den yüksek, 2000'den az olan "ORTAK" name değerlerini bulun.

select name 
from workers
where salary > 1000

INTERSECT -- İKİ SORGU SONUCUNUN ORTAK VE TEKRARSIZ DEĞERLERİNİ VERİR

select name
from workers
where salary < 2000

-- salary değeri 2000'den az olan ve company değeri  IBM, APPLE yada MICROSOFT olan 
-- ortak "name" değerlerini bulun.

select name
from workers
where salary < 2000

intersect

select name
from workers
where company in ('IBM','APPLE','MICROSOFT')

-- EXCEPT Operator : Bir sorgu sonucundan başka bir sorgu sonucunu çıkarmak için kullanılır.
-- Unique(tekrarsız) recordları verir.


--salary değeri 3000'den az ve GOOGLE'da çalışmayan name değerlerini bulun.

select name
from workers
where salary < 3000

EXCEPT -- 2. sorgudakiler hariç 1. sorgudakileri verir except=hariç

select name
from workers
where company='GOOGLE'

--------------------------------------------------------------------