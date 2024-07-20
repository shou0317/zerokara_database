SELECT COUNT(*)
FROM Shohin;

SELECT COUNT(shiire_tanka)
FROM Shohin;

CREATE TABLE NullTbl
(
    col_1 CHAR(3)
);

BEGIN TRANSACTION;
INSERT INTO NullTbl VALUES (NULL);
INSERT INTO NullTbl VALUES (NULL);
INSERT INTO NullTbl VALUES (NULL);
COMMIT;

SELECT COUNT(*), COUNT(col_1)
FROM NullTbl;

SELECT SUM(hanbai_tanka)
FROM Shohin;

SELECT SUM(hanbai_tanka), SUM(shiire_tanka)
FROM Shohin;

SELECT AVG(hanbai_tanka)
FROM Shohin;

SELECT shiire_tanka
FROM Shohin;

SELECT AVG(hanbai_tanka), AVG(shiire_tanka)
FROM Shohin;

SELECT AVG(hanbai_tanka), AVG(COALESCE(shiire_tanka, 0))
FROM Shohin;

SELECT MAX(hanbai_tanka), MIN(shiire_tanka)
FROM Shohin;

SELECT torokubi
FROM Shohin;

SELECT MAX(torokubi), MIN(torokubi)
FROM Shohin;

SELECT COUNT(DISTINCT shohin_bunrui)
FROM Shohin;

SELECT hanbai_tanka
FROM Shohin;

SELECT SUM(hanbai_tanka), SUM(DISTINCT hanbai_tanka)
FROM Shohin;

SELECT shohin_bunrui, COUNT(*)
FROM Shohin
GROUP BY shohin_bunrui;

SELECT shiire_tanka, COUNT(*)
FROM Shohin
GROUP BY shiire_tanka;

SELECT shiire_tanka, COUNT(*)
FROM Shohin
WHERE shohin_bunrui = '衣服'
GROUP BY shiire_tanka;

SELECT shohin_bunrui, COUNT(*)
FROM Shohin
GROUP BY shohin_bunrui

SELECT shohin_bunrui, AVG(hanbai_tanka)
FROM Shohin
GROUP BY shohin_bunrui
HAVING AVG(hanbai_tanka) >= 2500;

SELECT shohin_bunrui, COUNT(*)
FROM Shohin
GROUP BY shohin_bunrui
HAVING shohin_bunrui = '衣服';

SELECT shohin_bunrui, COUNT(*)
FROM Shohin
WHERE shohin_bunrui = '衣服'
GROUP BY shohin_bunrui;

SELECT shohin_id, shohin_mei, hanbai_tanka, shiire_tanka
FROM Shohin
ORDER BY hanbai_tanka;

SELECT shohin_id, shohin_mei, hanbai_tanka, shiire_tanka
FROM Shohin
ORDER BY hanbai_tanka DESC;

SELECT shohin_id, shohin_mei, hanbai_tanka, shiire_tanka
FROM Shohin
ORDER BY hanbai_tanka, shohin_id;

SELECT shohin_id, shohin_mei, hanbai_tanka, shiire_tanka
FROM Shohin
ORDER BY shiire_tanka;

SELECT shohin_id AS id, shohin_mei, hanbai_tanka AS ht, shiire_tanka
FROM Shohin
ORDER BY ht, id;

SELECT shohin_mei, hanbai_tanka, shiire_tanka
FROM Shohin
ORDER BY shohin_id;

SELECT shohin_bunrui, COUNT(*)
FROM Shohin
GROUP BY shohin_bunrui
ORDER BY COUNT(*);

SELECT shohin_id, shohin_mei, hanbai_tanka, shiire_tanka
FROM Shohin
ORDER BY hanbai_tanka DESC, shohin_id;

SELECT shohin_id, shohin_mei, hanbai_tanka, shiire_tanka
FROM Shohin
ORDER BY 3 DESC, 1;



