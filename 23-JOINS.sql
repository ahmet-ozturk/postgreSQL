CREATE TABLE sirketler
(
	sirket_id int, -- ORTAK
	sirket_isim VARCHAR(20)
);
INSERT INTO sirketler VALUES(100, 'Toyota');
INSERT INTO sirketler VALUES(101, 'Honda');
INSERT INTO sirketler VALUES(102, 'Ford');
INSERT INTO sirketler VALUES(103, 'Hyundai');

CREATE TABLE siparisler
(
	siparis_id int,
	sirket_id int, --ORTAK
	siparis_tarihi DATE
);
INSERT INTO siparisler VALUES(11, 101, '2022-04-17');
INSERT INTO siparisler VALUES(22, 102, '2022-04-18');
INSERT INTO siparisler VALUES(33, 103, '2022-04-19');
INSERT INTO siparisler VALUES(44, 104, '2022-04-20');
INSERT INTO siparisler VALUES(55, 105, '2022-04-21');

select * from sirketler;

select * from siparisler;

-- şirket id'ler aynı olduğu için buradan bağlantı kurulacak

-- SORU 1: Iki Tabloda sirket_id’si ayni olanlarin; 
-- sirket_ismi, siparis_id, şirket_id ve
-- siparis_tarihleri listeleyen bir sorgu yaziniz

select a.sirket_id, a.sirket_isim, b.siparis_id, b.siparis_tarihi 

from siparisler as b

inner join sirketler as a 

on a.sirket_id=b.sirket_id

-- SORU 2: sirketler tablosundaki tum sirketleri ve bu sirketlere ait olan
-- siparis_id ve siparis_tarihleri listeleyen bir sorgu yaziniz.

select a.sirket_id, a.sirket_isim, b.siparis_id, b.siparis_tarihi 

from siparisler as b

right join sirketler as a

on a.sirket_id=b.sirket_id

-- SORU 3: siparisler tablosundaki tum siparis_id ve siparis_tarihleri ile
-- bunlara karşılık gelen sirket_isimlerini listeleyen bir sorgu yaziniz.

select b.sirket_id, b.sirket_isim, a.siparis_id, a.siparis_tarihi 

from siparisler as a

full join sirketler as b

on a.sirket_id=b.sirket_id
