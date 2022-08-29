--personel isminde bir tablo olusturalim
create table personel(
pers_id int,
isim varchar(30),
sehir varchar(30),
maas int,
sirket varchar(20),
adres varchar(50)
);
select * from personel;
--Varolan personel tablosundan pers_id,sehir,
--adres fieldlarına sahip personel_adres adında yeni tablo olusturalım
create table personel_adres
as
select pers_id, sehir, adres from personel;
select * from personel_adres

--DML DATA MANIPULATION LANGUAGE
--INSERT --UPDATE -- DELETE

insert into personel values (100, 'Esra Demirci', 'Ankara', 10000, 'ABC', 'Eda Mh. Ali Cd.');
insert into personel values (101, 'Huseyin Nohut', 'Izmir', 11000, 'DEF', 'XYS Mh. WER Cd.');
insert into personel values (102, 'Selim Deniz', 'Adana', 12000, 'TYR', 'GHT Mh. NJY Cd.');
insert into personel values (103, 'Gulsah Spring', 'Adana', 15000, 'DTR', 'TMK Mh. YHJ Cd.');
insert into personel values (104, 'Hatice Colak', 'Erzincan', 19000, 'BNG', 'KGJ Mh. KLP Cd.');
insert into personel values (105, 'Mert Demirci', 'Agri', 15000, 'ABC', 'HGT Mh. BNM Cd.');
select * from personel

insert into personel (isim, sehir)values('Ayse Erdem','Bursa')
delete from personel where maas=15000;
update personel
set maas=20000
where maas=15000;
--set maas'tan sonra tek deger oldugundan virgul yok, virgul koyarsak sytnax error veriyor
update personel
set maas=25000
where sehir='Adana'

--update yapisi yukaridaki gibi olacak,
--update table_name
--set column1=value1
--where condition
--update personel
--set maas=25000 dersek butun maaslar 25k olur sadece set ile de kullanilabilir

--DQL DATA QUERY LANGUAGE
--SELECT --WHERE
--delete from personel where maas=15000;
--where kosulundan sonra yazilan deger neyse tabloda o degerin bulundugu butun satirlar siliniyor


--DDL DATA DEFINITION LANGUAGE
--CREATE --ALTER --DROP --SET --RENAME --ADD
--Set, Rename ve Add ana 3 komutun (Create, Alter, Drop) alt komutlari gibi

create table fabrika(
pers_id serial,
isim varchar(20),
soyisim varchar(20),
brans varchar(20),
yas int,
maas int,
sehir varchar(20)
);
select * from fabrika
alter table fabrika add sigorta char(3), add rutbe char(10)
--guncelledik ve yeni 2 sutun ekledik
alter table fabrika rename column isim to ad
alter table fabrika rename column soyisim to soyad

alter table fabrika drop column rutbe
--drop ile sutun ya da drop table fabrika yazarak komple tabloyu silebiliriz

insert into fabrika values (105, 'Esra', 'Demirci', 'Boya', 33, 10000, 'Ankara');
insert into fabrika values (104, 'Huseyin', 'Nohut', 'Zimpara', 34, 11000, 'Van');
insert into fabrika values (101, 'Selim', 'Deniz', 'Ulastirma', 40, 12000, 'Ardahan');
insert into fabrika values (103, 'Gulsah', 'Spring', 'Elektrik',41, 15000, 'Sinop');
insert into fabrika values (100, 'Hatice', 'Colak', 'Tesisat', 35, 19000, 'Usak');
insert into fabrika values (102, 'Mert', 'Demirci', 'Yukleme', 45, 15000, 'Manisa');
delete from fabrika where brans='Tasima'
select * from fabrika
insert into fabrika values (101, 'Selim', 'Deniz', 'Ulastirma', 40, 12000, 'Ardahan');

--TCL - Transaction Control Lang.
--Begin - Savepoint - rollback - commit
--Transaction veritabanı sistemlerinde bir işlem başladığında başlar ve işlem bitince sona erer
--Bu işlemler veri tabanı oluşturma, veri silme, veri güncelleme, veriyi geri getirme gibi işlemler olabilir

Begin;
insert into fabrika values (default, 'Ayse','Erdem','Mus. Hizm.',40, 18000,'Konya');
insert into fabrika values (default, 'Avni','Sen','Boya',36, 15000,'Kastamonu');
savepoint x;
insert into fabrika values (default, 'Yasemin','Turker','Mus. Hizm.',30, 18000,'Yozgat');
insert into fabrika values (default, 'Cihan','Ciftci','Zimpara',36, 15000,'Edirne');
rollback to x;

select * from fabrika
commit;


-- CONSTRANINT -- Kısıtlamalar
-- Primary Key --> Bir sutunun NULL içermemesini ve sutundaki verilerin BENZERSİZ olmasını sağlar (NOT NULL - UNIQUE)
-- FOREGIN KEY --> Başka bir tablodaki PRİMARY KEY'i referans göstermek için kullanılır. 
-- Böylelikle, tablolar arasında ilişki kurmuş oluruz.
-- UNIQUE --> Bir sutundaki tüm değerlerin BENZERSİZ yani tek olmasını sağlar
-- NOT NULL --> Bir sutunun NULL içermemesini yani boş olmamasını sağlar
-- NOT NULL kısıtlaması için CONSTRAINT ismi tanımlanmaz. Bu kısıtlama veri türünden hemen sonra yerleştirilir
-- CHECK --> Bir sutuna yerleştirilebilecek değer aralığını sınırlamak için kullanılır.



