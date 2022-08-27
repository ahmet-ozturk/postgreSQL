-- IS NULL, IS NOT NULL, COALESCE --

-- IS NULL ve IS NOT NULL boolean operatörleridir
-- Bir ifadenin NULL olup olmadığını kontrol eder

-- COALESCE (birleştirme) ise bir fonksiyondur
-- ve içerisindeki parametrelerden NULL olmayan ilk ifadeyi döndürür


CREATE TABLE insanlar(
ssn CHAR(9),
isim VARCHAR(50),
adres VARCHAR(50));

-- Social Security Number
					   
INSERT INTO insanlar VALUES('123456789', 'Ali Can', 'Istanbul');
INSERT INTO insanlar VALUES('234567890', 'Veli Cem', 'Ankara');
INSERT INTO insanlar VALUES('345678901', 'Mine Bulut', 'Izmir');
INSERT INTO insanlar (ssn, adres) VALUES('456789012', 'Bursa');
INSERT INTO insanlar (ssn, adres) VALUES('567890123', 'Denizli');
INSERT INTO insanlar (adres) VALUES('Sakarya');
INSERT INTO insanlar (ssn) VALUES('999111222');


-- ismi null olanları sorgula

select * from insanlar where isim is null

-- ismi null olmayanları listele

select * from insanlar where isim is not null

-- ismi null olan kişilerin ismine no name atayınız

update insanlar
set isim='no name'
where isim is null

select * from insanlar

-- tabloyu eski haline geri getir

update insanlar
set isim='null'
where isim='no name'

-- NOT : Çoklu değişimde her değişim için SET ... WHERE isim IS NULL gibi 
-- ifade yazmamak için COALESCE (birleştirme) kullanılır


/* 
isim 'i NULL olanlara 'Henuz isim girilmedi'
adres 'i NULL olanlara 'Henuz adres girilmedi'
ssn 'i NULL olanlara ' no ssn' atayalım.
*/

UPDATE insanlar
SET isim = coalesce (isim, 'HENUZ ISIM GIRILMEDI'),
    adres = coalesce (adres, 'HENUZ ADRES GIRILMEDI'),
    ssn = coalesce (ssn, 'NO SSN');
    
select * from insanlar  
