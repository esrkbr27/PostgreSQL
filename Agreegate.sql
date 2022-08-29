---AGREEGATE METOD KULLANIMI---
/*
Agreegate Metodları (SUM,COUNT,MIN,MAX,AVG)

-Subquery içinde kullanılır,ancak sorgu tek bir deger döndürüyor olmalıdır.
syntax;sum() seklinde olmalı

sum: toplama
count: say
mın: en kucuk
max:en buyuk
avg: ortalama
*/

select * from calisanlar2


--calısanlar2 tablosundakı en yuksek maas degerini listeleyınız

select max(maas) from calisanlar2;

--calisnalar2 tablosundakı maasların toplamını listeleyiniz

select sum(maas) from calisanlar2;

--calisnalar2 tablosundakı maas ortalamalarını listeleyiniz

select avg(maas) from calisanlar2;

select round(avg(maas)) from calisanlar2;--kusuratı atar.

select round(avg(maas),2) from calisanlar2

--calisnalar2 tablosundakı maas ortalamalarını listeleyiniz

select min(maas) from calisanlar2;


--calisnalar2 tablosundakı kac kısının maas aldıgını listeleyiniz

select count(maas) from calisanlar2;
select * from markalar
-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin toplam maaşini listeleyiniz

select marka_isim,calisan_sayisi,
(select sum(maas) from calisanlar2 where marka_isim=isyeri)
as toplam_maas from markalar

--ALİAS (AS) tabloda gecici isim vermek istersek koşuldan sonra 
--AS sutun_isim olarak verilir.

-- Her markanin ismini, calisan sayisini ve
--o markaya ait calisanlarin maksimum ve minumum maaşini listeleyen bir Sorgu yaziniz.

SELECT marka_isim,calisan_sayisi, (select max(maas) from calisanlar2 where marka_isim=isyeri)
as max_maas,                      (select min(maas) from calisanlar2 where marka_isim=isyeri)
as min_maas from markalar;

--Her markanin id’sini, ismini ve toplam kaç şehirde bulunduğunu listeleyen bir SORGU yaziniz.

select marka_id, marka_isim,select count(sehir) from calisanlar2 where marka_isim=isyeri)
as sehir_sayisi from markalar;

--Interview Question: En yüksek ikinci maas değerini çağırın.
SELECT max(maas) AS enyuksek_ikinci_maas from calisanlar2 -->en yüksek maas
WHERE maas < (SELECT max(maas) from calisanlar2)-->en yüksek 2. maas













