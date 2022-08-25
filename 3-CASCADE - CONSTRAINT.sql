CREATE TABLE calisanlar
(
id CHAR(5) PRIMARY KEY, -- not null + unique
isim VARCHAR(50) UNIQUE, -- UNIQUE --> Bir sutundaki tüm değerlerin BENZERSİZ yani tek olmasını sağlar
maas int NOT NULL, -- NOT NULL --> Bir sutunun NULL içermemesini yani boş olmamasını sağlar
ise_baslama DATE
);

INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
--INSERT INTO calisanlar VALUES('10010', Mehmet Yılmaz, 5000, '2018-04-14'); --Unique
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
--INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12'); --NOT NULL
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
--INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14'); --UNIQUE
--INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14'); --NOT NULL
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');
--INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14'); --PRIMARY KEY
--INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14'); --PRIMARY KEY
--INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14'); -- PRIMARY KEY

-- FOREIGN KEY--
CREATE TABLE adresler
(
adres_id char(5) ,
sokak varchar(20),
cadde varchar(30),
sehir varchar(20),
CONSTRAINT fk FOREIGN KEY (adres_id) REFERENCES calisanlar(id)
);
INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');
select * from adresler;
INSERT INTO adresler VALUES('10012','Ağa Sok', '30.Cad.','Antep');
--Parent tabloda olmayan id ile child tabloya ekleme yapamayız
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Antep');
--Calısanlar id ile adresler tablosundaki adres_id ile eşlesenlere bakmak için
select * from calisanlar,adresler WHERE calisanlar.id = adresler.adres_id;
DROP table calisanlar
--Parant tabloyu yani primary key olan tabloyu silmek istediğimizde tabloyu silmez
--Önce child tabloyu silmemiz gerekir
delete from calisanlar where id='10002' -- parent olduğu için silmez
delete from adresler where adres_id ='10002'   -- child olduğu için siler
 
-- ON DELETE CASCADE --
--Her defasında önce child tablodaki verileri silmek yerine
--ON DELETE CASCADE silme özelliğini aktif hale getirebiliriz
--Bunun için FK olan satırın en sonuna ON DELETE CASCADE komutunu yazmamız yeterli
CREATE TABLE talebeler
(
id CHAR(3) primary key,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);
INSERT INTO talebeler VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO talebeler VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO talebeler VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO talebeler VALUES(126, 'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO talebeler VALUES(127, 'Mustafa Bak', 'Can',99);
CREATE TABLE notlar(
talebe_id char(3),
ders_adi varchar(30),
yazili_notu int,
CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) REFERENCES talebeler(id)
on delete cascade -- bunu ekleyerek direct olarak parent tabloyu silebiliriz
);
INSERT INTO notlar VALUES ('123','kimya',75);
INSERT INTO notlar VALUES ('124', 'fizik',65);
INSERT INTO notlar VALUES ('125', 'tarih',90);
INSERT INTO notlar VALUES ('126', 'Matematik',90);

select * from talebeler

select * from notlar

delete from notlar where talebe_id='123'; -- child table

delete from talebeler where id='126'; -- parent table -- ON DELETE CASCADE kullandığımız için parent table dan direk silebildik
                                      -- parent table dan sildiğimiz için child table dan da silinmiş olur
									  
delete from talebeler -- herşeyi siler

drop table talebeler -- hata verir - bağlantılı olduğu için

drop table talebeler cascade -- parent tabloyu kaldırmak istersek drop table tablo_adı'ndan sonra cascade komutunu kullanırız

-- talebeler tablosundaki isim sütununa NOT NULL kısıtlmaması ekleyiniz ve veri tipini VARCHAR(30) olarak değiştiriniz

alter table talebeler
alter column isim type varchar(30), -- type -> data türünü değiştirir
alter column isim set not null;     -- set  -> not null ekler

-- talebeler tablosundaki yazili_notu sütununa 60 dan büyük rakam girilebilsin

alter table talebeler
add constraint sinir check (yazili_notu>60);
-- check kısıtlaması ile tablodaki istediğimiz sütunu sınırlandırabiliriz

INSERT INTO talebeler VALUES(128, 'Mustafa Can', '.hasan',45); -- ekleme yapmaz çünkü not < 60

create table ogrenciler(
id int,
isim varchar(45),
adres varchar(100),
sinav_notu int
);
Create table ogrenci_adres
AS
SELECT id, adres from ogrenciler;

select * from ogrenciler
select * from ogrenci_adres

-- tablodaki bir sütuna PRIMARY KEY ekleme

alter table ogrenciler
add primary key (id);

-- primary key oluşturmada 2. yol

alter table ogrenciler
add constraint pk_id primary key (id);

-- Primary keyden sonra foreign key ataması

alter table ogrenci_adres
add foreign key (id) references ogrenciler;-- child tabloyu parent tablodan oluşturduğumuz için column adı vermedik

-- PRIMARY KEY'DEKİ CONSTRAINT'İ SİLME

alter table ogrenci_adres drop constraint ogrenci_adres_id_fkey; -- önce child table'ı sileriz

alter table ogrenciler drop constraint pk_id; -- sonra parent table'ı sileriz

-- yazılı notu 85 ' ten büyük olan talebe bilgilerini getirin

select * from talebeler where yazili_notu>85;

-- ismi mustafa bak olan talebenin tüm bilgilerini getirin

select * from talebeler where isim='Mustafa Bak';

-- SELECT komutunda -- BETWEEN koşulu --

-- Between belirttiğimiz 2 veri arasındaki bilgileri listeler 
-- Between'de belirttiğimiz değerlerde listelemeye dahildir

create table personel
(
id char(4),
isim varchar(50),
maas int
);

insert into personel values('1001', 'Ali Can', 70000);
insert into personel values('1002', 'Veli Mert', 85000);
insert into personel values('1003', 'Ayşe Tan', 65000);
insert into personel values('1004', 'Derya Soylu', 95000);
insert into personel values('1005', 'Yavuz Bal', 80000);
insert into personel values('1006', 'Sena Beyaz', 100000);

select * from personel


-- AND (ve) --> belirtilen şartların her ikiside gerçekleşiyorsa o kayıt listelenir
-- bir tanesi gerçekleşiyorsa listelemez
-- select * from matematik sinav1 > 50 AND sinav2 > 50 
-- hem sinav1 hemde sinav2 alanı 50'den büyük olan kayıtları listeler
-- OR (veya) --> belirtilen şartlardan biri gerçekleşirse kayıt listelenir
-- select * from matematik sinav1 > 50 OR sinav2 > 50
-- sinav1 veya sinav2 alani 50'den büyük olan kayıtları listeler

-- id'si 1003 ile 1005 arasinda olan personel bilgisini listeleyiniz

select * from personel where id between '1003' and '1005';

-- 2. yol

select * from personel where id>='1003' and id<='1005'; -- yukarıdakinin aynısı

-- derya soylu ile yavuz bal arasındaki personel blgisini listeleyiniz

select * from personel where isim between 'Derya Soylu' and 'Yavuz Bal';

-- maaşı 70000 ve ismi Sena olan personeli listele

select * from personel where maas = 70000 or isim='Sena Beyaz';

-- IN --> birden fazla mantıksal ifade ile tanımlayabileceğimiz durumları tek komutla yazabilme imkanı verir
-- farklı sütunlar için IN kullanılamaz

-- id'si 1001 , 1002 ve 1004 olan personelin bilgilerini listele

select * from personel where id='1001' or id='1002' or id = '1004';

-- 2. yol

select * from personel where id in ('1001','1002','1004');

-- maaşı sadece 70000,100000 olan personeli listele

select * from personel where maas in ('70000','100000');

-- SELECT - LIKE KOŞULU --

-- LIKE --> sorgulama yaparken belirli kalıp ifadeleri kullanbilmemizi sağlar
-- ILIKE --> sorgulama yaparken büyük-küçük hafe duyarsiz hale getirir
-- LIKE için ~~
-- ILIKE için ~~*
-- NOT LIKE için !~~
-- NOT ILIKE için !~~*
-- % --> 0 veya daha fazla karakteri belirtir
-- _ --> tek bir karakteri belirtir

-- ismi A harfi ile başlayan personeli listele

select * from personel where isim like 'A%';

-- ismi 'T' harfi ile biten personeli listele

select * from personel where isim like '%t';

-- isminin 2. harfi 'e' olan personeli listeleyiniz

select * from personel where isim like '_e%';

--- 3. gün sonu ---
