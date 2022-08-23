/*
DDL - DATA DEFINITION LANG.DATA
CREATE - ALTER - DROP
*/
-- CREATE TABLO OLUSTURMA -
CREATE table ogrenci(
ogr_no int,
ogr_isimsoyisim varchar(30),
notlar real,
yas int,
adres varchar(50),
kayit_tarih date
);
-- VAR OLAN TABLODAN YENİ BİR TABLO OLUŞTURMA
CREATE table ogr_notlari
AS
SELECT ogr_no, notlar FROM ogrenci;

SELECT * FROM ogrenci;
SELECT * FROM ogr_notlari;