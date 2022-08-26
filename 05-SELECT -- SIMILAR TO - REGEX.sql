-- SELECT - SIMILER TO - REGEX ( Regular Expressions ) --

-- SIMILAR TO daha karmaşık pattern kalıp ile sprgulama işlemi için similar to kullanılabilir
-- sadece postgreSQL'de kullanılır, büyük küçük harf önemlidir

-- REGEX herhangi bir kod, metin içerisinde istenen yazı veya kod parçasının aranıp bulunmasını sağlayan
-- kendine ait bir söz dizimi olan bir yapıdır
-- MySQL'de ( REGEX_LIKE ) olarak kullanılır
-- PostgreSQL'de "~" karakteri ile kullanılır

-- ***** UNUTMA *****
-- LIKE : ~~
-- ILIKE : ~~*
-- NOT LIKE : !~~
-- NOT ILIKE :!~~*


CREATE TABLE kelimeler
(
id int,
kelime VARCHAR(50),
harf_sayisi int
);

   INSERT INTO kelimeler VALUES (1001, 'hot', 3);
   INSERT INTO kelimeler VALUES (1002, 'hat', 3);
   INSERT INTO kelimeler VALUES (1003, 'hit', 3);
   INSERT INTO kelimeler VALUES (1004, 'hbt', 3);
   INSERT INTO kelimeler VALUES (1005, 'hct', 3);
   INSERT INTO kelimeler VALUES (1006, 'adem', 4);
   INSERT INTO kelimeler VALUES (1007, 'selim', 5);
   INSERT INTO kelimeler VALUES (1008, 'yusuf', 5);
   INSERT INTO kelimeler VALUES (1009, 'hip', 3);
   INSERT INTO kelimeler VALUES (1010, 'HOT', 3);
   INSERT INTO kelimeler VALUES (1011, 'hOt', 3);
   INSERT INTO kelimeler VALUES (1012, 'h9t', 3);
   INSERT INTO kelimeler VALUES (1013, 'hoot', 4);
   INSERT INTO kelimeler VALUES (1014, 'haaat', 5);
   INSERT INTO kelimeler VALUES (1015, 'hooooot', 5);
   INSERT INTO kelimeler VALUES (1016, 'booooot', 5);
   INSERT INTO kelimeler VALUES (1017, 'bolooot', 5);
   
select * from kelimeler

--  İçerisinde 'ot' veya 'at' bulunan kelimeleri listeleyiniz

-- SIMILAR TO İLE YAPIMI

select * from kelimeler where kelime similar to '%(at|ot)%'; 

-- veya işlemi için ( | ) kullanılır

-- LIKE İLE YAPIMI

select * from kelimeler where kelime ilike '%at%' or kelime ilike '%ot%'; -- ilike ile yapımı

select * from kelimeler where kelime ~~* '%at%' or kelime ~~* '%ot%'; -- ilike simgesi ile yapımı

-- REGEX İLE YAPIMI

select * from kelimeler where kelime ~* 'ot' or kelime ~* 'at';

-- : 'ho' veya 'hi' ile başlayan kelimeleri listeleyeniz

select * from kelimeler where kelime ilike 'ho%' or kelime ilike 'hi%';

select * from kelimeler where kelime similar to 'ho%|hi%';

select * from kelimeler where kelime ~* 'h[oi](.*)'; -- regex'te .(nokta) 1 karakter demektir

-- Sonu 't' veya 'm' ile bitenleri listeleyeniz

select * from kelimeler where kelime ilike '%t' or kelime ilike '%m'; -- ilike

select * from kelimeler where kelime similar to '%t|%m'; -- similar to

select * from kelimeler where kelime ~* '(.*)[tm]$'; -- regex  ( $ bitişi gösterir )

-- h ile başlayıp t ile biten 3 harfli kelimeleri listeleyeniz

select * from kelimeler where kelime similar to 'h[a-z,A-Z,0-9]t'; -- similar to

select * from kelimeler where kelime ~~* 'h_t'; -- ilike simge

select * from kelimeler where kelime ilike 'h_t'; -- ilike

select * from kelimeler where kelime ~* 'h[a-z,A-Z,0-9]t' -- regex

--İlk karakteri 'h', son karakteri 't' ve ikinci karakteri 'a'dan 'e'ye herhangi bir karakter olan
--“kelime" değerlerini çağırın.

select kelime from kelimeler where kelime similar to 'h[a-e](.*)%t'; -- similar to

select kelime from kelimeler where kelime ~* 'h[a-e](.*)t'; -- regex

--İlk karakteri 's', 'a' veya 'y' olan "kelime" değerlerini çağırın.

select kelime from kelimeler where kelime ~ '^[say](.*)'; -- ( ^ ) başlangıcı temsil eder

--Son karakteri 'm', 'a' veya 'f' olan "kelime" değerlerini çağırın.

select * from kelimeler where kelime ~ '(.*)[maf]$';

--İlk harfi h, son harfi t olup 2.harfi a veya i olan 3 harfli kelimelerin tüm bilgilerini sorgulayalım.

select * from kelimeler where kelime ~* 'h[a|i]t'; -- regex

select * from kelimeler where kelime similar to 'h[a|i]t'; -- similar to 

--İlk harfi 'b' dan ‘s' ye bir karakter olan ve ikinci harfi herhangi bir karakter olup 
--üçüncü harfi ‘l' olan “kelime" değerlerini çağırın.

select * from kelimeler where kelime ~* '^[b-s].l(.*)'; 

select * from kelimeler where kelime similar to '[b-s]_l%';

--içerisinde en az 2 adet oo barıdıran kelimelerin tüm bilgilerini listeleyiniz.

select * from kelimeler where kelime similar to '%[o][o]%';

select * from kelimeler where kelime similar to '%[o]{2}%'; 

-- süslü parantez içindeki rakam bir önceki köşeli parantez içinde kaç tane olduğunu belirtir

--içerisinde en az 4 adet oooo barıdıran kelimelerin tüm bilgilerini listeleyiniz.

select * from kelimeler where kelime similar to '%[o]{4}%'; 

--'a', 's' yada 'y' ile başlayan VE 'm' yada 'f' ile biten "kelime" değerlerini çağırın.

select kelime from kelimeler where kelime ~ '^[a|s|y](.*)[m|f]$'; 

