CREATE TABLE ShohinIns
(shohin_id CHAR(4) NOT NULL,
 shohin_mei VARCHAR(100) NOT NULL,
 shohin_bunrui VARCHAR(32) NOT NULL,
 hanbai_tanka INTEGER DEFAULT 0,
 shiire_tanka INTEGER ,
 torokubi DATE ,
     PRIMARY KEY (shohin_id));

INSERT INTO ShohinIns (shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka, shiire_tanka, torokubi)
VALUES ('0001', 'Tシャツ', '衣服', 1000, 500, '2009-09-20');

INSERT INTO ShohinIns (shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka)
VALUES ('0002', 'test2', 'test2', DEFAULT);

INSERT INTO ShohinIns (shohin_id, shohin_mei, shohin_bunrui)
VALUES ('0003', 'test3', 'test3');

INSERT INTO ShohinCopy
SELECT *
FROM Shohin;

INSERT INTO ShohinBunrui
SELECT shohin_bunrui, SUM(hanbai_tanka), SUM(shiire_tanka)
FROM Shohin
GROUP BY shohin_bunrui;

DELETE FROM Shohin
WHERE hanbai_tanka >= 4000;

UPDATE Shohin
SET torokubi = '2009-10-10';

UPDATE Shohin
SET hanbai_tanka = hanbai_tanka * 10
WHERE shohin_bunrui = 'キッチン用品';

UPDATE Shohin
SET torokubi = NULL
WHERE shohin_id = '0008';

UPDATE Shohin
SET hanbai_tanka = hanbai_tanka * 2,
    shiire_tanka = shiire_tanka / 2
WHERE shohin_bunrui = 'キッチン用品';

BEGIN TRANSACTION;

UPDATE Shohin
SET hanbai_tanka = hanbai_tanka - 1000
WHERE shohin_mei = 'カッターシャツ';
UPDATE Shohin
SET hanbai_tanka = hanbai_tanka + 1000
WHERE shohin_mei = 'Tシャツ';

COMMIT;

BEGIN TRANSACTION;

UPDATE Shohin
SET hanbai_tanka = hanbai_tanka - 1000
WHERE shohin_mei = 'カッターシャツ';
UPDATE Shohin
SET hanbai_tanka = hanbai_tanka + 1000
WHERE shohin_mei = 'Tシャツ';

ROLLBACK;

BEGIN TRANSACTION;

UPDATE Shohin
SET torokubi = NULL
WHERE shohin_id = '0001';
UPDATE Shohin
SET shohin_id = NULL
WHERE shohin_id = '0001';
UPDATE Shohin
SET torokubi = NULL
WHERE shohin_id = '0002';

COMMIT;

