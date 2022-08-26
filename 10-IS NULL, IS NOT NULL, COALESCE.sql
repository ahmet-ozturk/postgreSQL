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