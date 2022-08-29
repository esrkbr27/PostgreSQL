--LİMİT--

CREATE TABLE kisiler 
(
id int PRIMARY KEY,
ssn CHAR(9) ,
isim VARCHAR(50), 
soyisim VARCHAR(50), 
maas int,
adres VARCHAR(50) 
);
    
INSERT INTO kisiler VALUES(1, 123456789, 'Ali','Can', 3000,'Istanbul');
INSERT INTO kisiler VALUES(2, 234567890, 'Veli','Cem', 2890,'Ankara');
INSERT INTO kisiler VALUES(3, 345678901, 'Mine','Bulut',4200,'Adiyaman');
INSERT INTO kisiler VALUES(4, 256789012, 'Mahmut','Bulut',3150,'Adana');
INSERT INTO kisiler VALUES (5, 344678901, 'Mine','Yasa', 5000,'Ankara');
INSERT INTO kisiler VALUES (6, 345458901, 'Veli','Yilmaz',7000,'Istanbul');
INSERT INTO kisiler VALUES(7,113456789, 'Ali','Can', 3000,'Istanbul');
INSERT INTO kisiler VALUES(8,224567890, 'Veli','Cem', 2890,'Ankara');
INSERT INTO kisiler VALUES(9,335678901, 'Mine','Bulut',4200,'Ankara');
INSERT INTO kisiler VALUES(10,446789012, 'Mahmut','Bulut',3150,'Istanbul');
INSERT INTO kisiler VALUES (11,554678901, 'Mine','Yasa', 5000,'Ankara');
INSERT INTO kisiler VALUES (12,665458901, 'Veli','Yilmaz',7000,'Istanbul');

select * from kisiler

-- Kişiler tablosundan ilk 5 veriyi listeleyiniz
select * from kisiler limit 5;

--ilk 2 veriden sonra 5 veriyi listeleyin

select * from kisiler limit 5 offset 2;

--id degeri 5 ten buyuk olan ilk iki veriyi listeleyınız

select * from kisiler where id>5 limit 2

--maaşı en çok olandan sıralayıp onun ilk 3 verisini listeleyiniz

select * from kisiler order by maas desc limit 3;

--En yüksek maaşı alan 4. 5.  6. kişilerin bilgilerini listeleyiniz

select * from kisiler order by maas desc limit 3 offset 3 -->offset ilk 3 ten sonra yapıyor




