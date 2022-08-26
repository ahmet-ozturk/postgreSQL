-- SELECT - LIKE KOŞULU --

-- LIKE --> sorgulama yaparken belirli kalıp ifadeleri kullanbilmemizi sağlar
-- ILIKE --> sorgulama yaparken büyük-küçük hale duyarsiz hale getirir
-- LIKE için ( ~~ )
-- ILIKE için ( ~~* )
-- NOT LIKE için ( !~~ )
-- NOT ILIKE için ( !~~* )
-- ( % ) --> 0 veya daha fazla karakteri belirtir
-- ( _ ) --> tek bir karakteri belirtir

-- ismi A harfi ile başlayan personeli listele

select * from personel where isim like 'A%';

-- ismi 't' harfi ile biten personeli listele

select * from personel where isim like '%t';

-- isminin 2. harfi 'e' olan personeli listeleyiniz

select * from personel where isim like '_e%';

-- 'a' ile başlayıp 'n' ile biten personel isimlerini listeleyiniz

select * from personel where isim ilike 'a%n'; -- alttakiyle aynı sonucu verir

select isim from personel where isim like 'A%' and isim like '%n'; -- üsttekiyle aynı sonucu verir

-- ikinci karakteri 'a' ve dördüncü karakteri 'u' olan personel isimlerini listeleyiniz

select isim from personel where isim ilike '_a_u%';

-- İçinde 'e' ve 'r' bulunan personel isimlerini listeleyiniz

select isim from personel where isim ~~* '%e%' and isim ~~* '%r%'; -- and her 2 harf olanları getirir

select isim from personel where isim ~~* '%e%' or isim ~~* '%r%';  -- or sadece 1 harf varsa onları getirir

-- 2. harfi e olup diğer harflerinde y olan personeli listeleyiniz

select * from personel where isim like '_e%y%';

-- a harfi olmayan personeli listeleyin

select * from personel where isim not ilike '%a%';

-- 1. harfi A ve 7. harfi a olan personeli listeleyin

select * from personel where isim like 'A_____a%';

--Sondan ikinci karakteri 'r' olan "isim" değerlerini listeleyiniz.

select isim from personel where isim like '%r_';
