/*
DDL - DATA DEFINITION LANGUAGE

CREATE- ALTER- DROP
*/

--CREATE -TABLO OLUŞTURMA

CREATE table ogrenci(
ogr_numara int,
ogr_isimsoyisim VARCHAR (30),
notlar	real,
yas int,
adres varchar(50),
kayıt_tarih DATE	
	ABORT
					);
	
--VAROLAN TABLODAN YENİ BİR TABLO OLUŞTURMA	
					
					
create table ogrenci_notlari
AS
SELECT ogr_numara,notlar from ogrenci;

SELECT * FROM ogrenci;

select * from ogrenci_notlari;

