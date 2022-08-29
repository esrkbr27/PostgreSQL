--SELECT -SIMILAR TO -REGEX(Regular Expression)--
/*
SIMILAR   TO :daha karmasık pattern ile sorgulama işlemi için
sımılar to kullanılabilir.

sadece postgre sql de kullanılır.Buyuk kucuk harf önemlidir.

REGEX : Herhangi bir kod metin içerisinde istenen yazı veya kod parcasının aranıp bulunmasını sağlayan
kendine özgü bir söz dizimi olan bir yapıdır.MySQL de (REGEXP_LİKE)olarak kullanılır.

PostgreSQL de "~" karakteri ile kullanılır.

LIKE : ~~ (altgr+ü) kısayolu ile ~~ işareti yapılır.
ILIKE : ~~*
NOT LIKE : !~~
NOT ILIKE :!~~*

*/

CREATE TABLE kelimeler
(
id int,
kelime VARCHAR(50),
harf_sayisi int
);

INSERT INTO kelimeler VALUES (1001, 'hot', 3);
   INSERT INTO kelimeler VALUES (1002, 'hat', 3);
   INSERT INTO kelimeler VALUES (1003, 'hit', 3);
   INSERT INTO kelimeler VALUES (1004, 'hbt', 3);
   INSERT INTO kelimeler VALUES (1005, 'hct', 3);
   INSERT INTO kelimeler VALUES (1006, 'adem', 4);
   INSERT INTO kelimeler VALUES (1007, 'selim', 5);
   INSERT INTO kelimeler VALUES (1008, 'yusuf', 5);
   INSERT INTO kelimeler VALUES (1009, 'hip', 3);
   INSERT INTO kelimeler VALUES (1010, 'HOT', 3);
   INSERT INTO kelimeler VALUES (1011, 'hOt', 3);
   INSERT INTO kelimeler VALUES (1012, 'h9t', 3);
   INSERT INTO kelimeler VALUES (1013, 'hoot', 4);
   INSERT INTO kelimeler VALUES (1014, 'haaat', 5);
   INSERT INTO kelimeler VALUES (1015, 'hooooot', 5);
   INSERT INTO kelimeler VALUES (1016, 'booooot', 5);
   INSERT INTO kelimeler VALUES (1017, 'bolooot', 5);
   
   
   select * from kelimeler
   
   --  İçerisinde 'ot' veya 'at' bulunan kelimeleri listeleyiniz
   
   --similar to ile
   select * from kelimeler where kelime similar to '%(at|ot)%'
   
   --like ile
   select * from kelimeler where kelime ILIKE '%at%' or kelime ILIKE '%ot%'
   
   select * from kelimeler where kelime ~~*'%at' or kelime ~~* '%ot%'
   
   --regex ile
   select * from kelimeler where kelime ~* 'ot' or kelime ~* 'at';
   --sadece ~ yaparsak sadece küçük harf ile ot at getirir
   --  ~* yaparsam büyük küçük harf getirir.
   
   
   -- 'ho' veya 'hi' ile başlayan kelimeleri listeleyeniz
   --regex ile (Regexde "." bir karakteri gösterir.)
   --regexde ikinci karakter için köşeli parantez kullanılır,2. harf o veya i olabilir
   select * from kelimeler where kelime ~*'h[oi](.*)' or kelime ~* 'hi%'
   --similar to ile
   select * from kelimeler where kelime similar to 'ho%|hi%'
   --like ile
   select * from kelimeler where kelime ILIKE 'ho%' or kelime ILIKE 'hi%'
   
   --Sonu 't' veya 'm' ile bitenleri listeleyeniz
   select from kelimeler where kelime similar to 
   
   --$ işareti burda bitir anlamına geliyor.
   select from kelimeler where kelime ~* '(.*)[tm]$'
   
   -- h ile başlayıp t ile biten 3 harfli kelimeleri listeleyeniz
   
--[] h den sonra [] içine harfler, rakamlar gelebilir demek   
select from kelimeler where kelime similar to 'h[a-z,A-Z,0-9]t';

--like ile 
select * from kelimeler where kelime ~~* 'h_t';

--
select * from kelimeler where kelime ~* 'h[a-z,A-Z,0-9]t'


--İlk karakteri 'h', son karakteri 't' ve ikinci karakteri 'a'dan 'e'ye 
--herhangi bir karakter olan “kelime" değerlerini çağırın.

--similar to ile
select * from kelimeler where kelime similar to 'h[a-e]%t';

--regex ile 
select * from kelimeler where kelime ~* 'h[a-e](.*)t';

--İlk karakteri 's', 'a' veya 'y' olan "kelime" değerlerini çağırın.
-- ^işareti baslangıcı temsil eder. 
select * from kelimeler where kelime ~ '^[say](.*)'

--Son karakteri 'm', 'a' veya 'f' olan "kelime" değerlerini çağıRIN

SELECT * FROM kelimeler WHERE kelime ~ '(.*)[maf]$'
--İlk harfi h, son harfi t olup 2.harfi a veya i olan 3 harfli kelimelerin tüm bilgilerini sorgulayalım.

select * from kelimeler where kelime similar to 'h[a|i]t'

select * from kelimeler where kelime ILIKE 'hat' or kelime ILIKE 'hit'

select * from kelimeler where kelime ~ '^h[ai]t$'

--İlk harfi 'b' dan ‘s' ye bir karakter olan ve ikinci harfi herhangi bir karakter olup 
--üçüncü harfi ‘l' olan “kelime" değerlerini çağırın.


-- . herhengi bir karakteri, (.*) ne gelirse gelsin anlamındadır.
select * from kelimeler where kelime ~ '^[b-s].l(.*)'



--içerisinde en az 2 adet oo barıdıran kelimelerin tüm bilgilerini listeleyiniz.

select * from kelimeler where kelime similar to '%[o][o]%'

select * from kelimeler where kelime similar to '%[o]{2}'

select * from kelimeler where kelime ~ '(.*)[o][o](.*)'

--içerisinde en az 4 adet oooo barıdıran kelimelerin tüm bilgilerini listeleyiniz.

select * from kelimeler where kelime similar to '%[o]{4}%'

select * from kelimeler where kelime ~ '(.*)[o]{4}(.*)'

--'a', 's' yada 'y' ile başlayan VE 'm' yada 'f' ile biten "kelime" değerlerini çağırın.

select * from kelimeler where kelime ~ '^[asy](.*)[mf]$'
select * from kelimeler where kelime ~ '^[a|s|y](.*)[m|f]$'

