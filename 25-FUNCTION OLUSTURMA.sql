-- function olusturma 

-- 1. Örnek: İki parametre ile çalışıp bu parametreleri toplayarak return yapan bir fonksiyon oluşturun.

create or replace function toplamaF(x numeric, y numeric)

returns numeric  -- return tipi

language plpgsql -- dil

as 

$$               -- baslangıc parantezi
begin            -- baslangıc 

return x+y;      -- islem

end              -- bitis
$$               -- bitis parantezi


select * from toplamaF (15,25)


-- 2. Örnek: Koninin hacmini hesaplayan bir function yazın.

create or replace function koniHacmiF(pi numeric, r numeric)

return numeric

language plpgsql

as

$$
begin
return ((pi*r*r)*/3);
end
$$
