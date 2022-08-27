-- GROUP BY ve HAVING KULLANIMI --

-- HAVING ifadesinin işlevi WHERE ifadesininkine çok benziyor
-- ancak kümeleme fonksiyonları ile WHERE ifadesi birlikte kullanılmadığından 
-- HAVING ifadesine ihtiyac duyulmustur
-- GROUP BY ile kullanılır
-- Gruplamadan sonraki şart için Group By'dan sonra HAVING kullanılır

--Maaş ortalaması 3000’den fazla olan ülkelerdeki erkek çalışanların maaş ortalaması.

select ulke , round(avg(maas)) from personel 
where cinsiyet='E'
group by ulke 
having avg(maas)>3000

select ulke,round(avg(maas),2)as maas_ortalamasi from personel -- 2. yontem
where cinsiyet='E'and maas>3000
group by ulke

--Erkek çalışanların sayısı 1’den fazla olan ülkelerin maaş ortalamasını getiren sorgu

select ulke, round(avg(maas)) as "maas ortalaması", count(*) as "calisan sayisi"
from personel where cinsiyet='E'
group by ulke HAVING count(*) > 1














