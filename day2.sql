--Personel isminde bir tablo ouşturalım.

create table personel(
personel_id int,
isim varchar(30),
sehir varchar(30),	
maas int,
sirket varchar(20),
adres varchar(50)
);

--var olan personel tablosundan personel_id ,
--sehir, adres fiellarına sahip personel_adres adında yeni bir tablo oluşturalım

create table personel_adres
as
SELECT personel_id,sehir,adres FROM personel;

select * from personel

--DML-->Data Mnipulation Language
--INSERT
--UPDATE
--DELETE

--Tabloya veri ekleme, tablodan veri güncelleme ve silme işlemlerinde
--kullanılan komutlar
--INSERT
create table student
(
id varchar(4),
st_name varchar(30),
age int
);

INSERT into student VALUES('1001','Ali Can',25);
INSERT into student VALUES('1002','Veli Can',35);
INSERT into student VALUES('1003','Ayse Can',45);
INSERT into student VALUES('1004','Derya Can',55);

--Tabloya parcalı veri ekleme
insert into student (st_name,age) values ('Murat Can',65);

--DQL--> Data Query Lnguage select

select * from student;
select st_name from student;
--SELECT komutu WHERE kosulu


select * from student WHERE age>35;

--Transaction Control Language
--Begin Savepoint rollback commit

--Transaction veitabanı sistemlerinnde bir işlem basladığında baslar ve
--işlem bitince sona erer
--Bu işlemler veritabanı oluşturma veri silme ,ver güncelleme,
--veriyi getirme gibi işlemler olabilir.
CREATE TABLE ogrenciler2
(
id serial,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu real
);
Begin;

--anakayıt asagıdakıler , bunlar bozlmasın diye savepoınt koydum
insert into ogrenciler2 values (default,'Ali Can','Hasan Can',75.5);
insert into ogrenciler2 values (default,'Canan Gül','Ayse Gül',90.5);
savepoint x;
--erasmustan öğrenci geldi ekledim,sonra bu kayıtları silmem gerekince 
--analisteme dönmek için 
insert into ogrenciler2 values (default,'Kemal Gürbüz','zeynep Gürbüz',76.5);

rollback to x;

select * from ogrenciler2

commit;

--Transaction kullanımında SERİAL data türü kullanımı tavsiye edilmez
--savepointten sonra eklediğimiz veride sayac mantıgı ile calıştıgı için
--sayacta enson hangı sayıda kaldıysa ordan devam eder.
--commit kodu transactoın ı bitirir.

--Not:
--Postgre SQL de transaction kullanımı için BEGİN komutuyla baslarız
--sonra tekrar yanlış bir veriyi düzeltmek veya bizim için önemli olan
--verilerden sonra ekleme yapabilmek için savepoint  'adı' komutunu kullanırız.
--bu savepointe dönebilmek için rollback to; savepoint 'isim! komutunu kullanırız
--rollback to calıştırıldıgında savepoint yazdıgımız satırın üstündeki verileri 
--tabloda bize verir ve son olarak transaction ı sonlandırmak için mutlaka COMMİT KOMUTU kullanırız
--MySQL de transaction olmadan da kullanılır.

---------------------------------------------------------------------------------------------
--DML -DELETE-
--DELETE FROM tabloadı -->Tablonun tüm içeriğini siler.
--Veriyi secerek silmek için WHERE koşulu kullnılır.
--DELETE FROM tabloadı WHERE sütünadı = veri-->Tablodaki istedğimiz veriyi siler.


CREATE TABLE ogrenciler
(
id int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);

INSERT INTO ogrenciler VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler VALUES(127, 'Mustafa Bak', 'Ali', 99);

select * from ogrenciler;

--soru: ıd si 124 olan öğrenciyi siliniz.

delete from ogrenciler where id =124;

--soru2: ismi Kemal Yasa olan satırı siliniz.

delete from ogrenciler where isim ='KEMAL YASA';

--SORU3: İsmi NESİBE YILMAZ veya MUSTAFA BAK olan kayıtları silelim.

delete from ogrenciler where isim='nesibe yılmaz' OR isim='MUSTAFA BAK';

--soru:4 ismi Ali CAN VE İD Sİ 123 olan kaydı siliniz.

delete from ogrenciler where isim='Ali Can' or id=123;

--soru:5 tablodakı tüm verileri silelim

delete from ogrenciler;

--DELETE - TRUNCATE--
--TRUNCATE komutu DELETE komutu gibi ibr tablodakı verilerin
--tamamını siler ancak secmeli silme yapamaz.

select * from ogrenciler;

TRUNCATE table ogrenciler; 

--DDL-- Data Definition Lang
--Create, ALTER DROP
--ALTER TABLE tabloda ADD(ekleme) TYPE ,SET,RENAME(isim değiştirme) VEYA DROP(silme) COLUMN işlemleri için kullaılır.


--soru:Personel tablosuna cinsiyet varchar(20) ve yas int seklinde yeni sütunlar ekleyın.

create table personel(
personel_id int,
isim varchar(30),
sehir varchar(30),	
maas int,
sirket varchar(20),
adres varchar(50)
);

select * from isciler;

alter table personel add cinsiyet varchar(20), add yas int;

--soru: personel tablosundan şirket sütununu silelim

alter table personel drop column sirket;

--personel tablosundakı sehir sütununun adını ülke olarak değiştirelim

alter table personel rename column sehir to ülke;

--Personel tablosunun adını işçiler olarak değiştiriniz.

alter table personel rename to isciler;

--DDL DROP--KOMUTU tamamen siler

DROP TABLE isciler;


--CONSTRAINT(kısıtlamalar) --

--PRİMARY KEY; bir sütünun null içermemesini ve sutundakı verilerin benzersiz olmasını sağlar.(not null-unıqe)
--FOREIGN KEY; baska bir tablodakı PRİMARYKEY i referans göstermek için kullanılır.
--Böylelikle tablolar arasında ilişki kurmuş oluruz.
--UNIQUE ; bir sütundakı tüm değerlerin benzersiz yanı tek olmasnı sağlar.
--NOT NULL ; bir sütunun null içermemesini yani boş olmamamsını sağlar, 
--not null ksıtlaması için constraınt ismi tanımlanmaz.BU kısıtlama veri türünden hemen sonra yerleştirilir.
--CHECK; Bir sutuna yerleştirilebilecek değer aralıgını sınırlamak için kullanılır.

CREATE TABLE calisanlar
(
id CHAR(5) PRIMARY KEY, -- not null + unique
isim VARCHAR(50) UNIQUE,
maas int NOT NULL,
ise_baslama DATE
);

INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10010', Mehmet Yılmaz, 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12');
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14'); --NOT NULL
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');--
INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14');--
INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14');--
INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14');--


select * from calisanlar;


--FOREIGN KEY --
CREATE TABLE adresler(
adres_id char(5),
sokak varchar(20),
cadde varchar(30),	
sehir varchar(20),
CONSTRAINT id_fk FOREIGN KEY (adres_id) REFERENCES calisanlar(id)	

);
INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');


SELECT * FROM adresler;














