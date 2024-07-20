-- 4.1

-- 予想：コミットしていない変更のため、一行も表示されない

DELETE FROM Shohin;

BEGIN TRANSACTION;
INSERT INTO Shohin VALUES ('0001', 'Tシャツ', '衣服', 1000, 500, '2008-09-20');
INSERT INTO Shohin VALUES ('0002', '穴あけパンチ', '事務用品', 500, 320, '2008-09-11');
INSERT INTO Shohin VALUES ('0003', 'カッターシャツ', '衣服', 4000, 2800, NULL);

SELECT * FROM Shohin;

-- 4.2

-- 商品IDに主キー制約があるため、エラーが発生する

INSERT INTO Shohin
SELECT *
FROM Shohin;

-- 4.3

CREATE TABLE ShohinSaeki
(
    shohin_id CHAR(4) NOT NULL,
    shohin_mei VARCHAR(100) NOT NULL,
    hanbai_tanka INTEGER,
    shiire_tanka INTEGER,
    saeki INTEGER,
    PRIMARY KEY(shohin_id));

saeki = hanbai_tanka - shiire_tanka

INSERT INTO ShohinSaeki (shohin_id, shohin_mei, hanbai_tanka, shiire_tanka, saeki)
SELECT shohin_id, shohin_mei, hanbai_tanka, shiire_tanka, hanbai_tanka - shiire_tanka
FROM Shohin;

-- 4.4
BEGIN TRANSACTION;

UPDATE ShohinSaeki
SET hanbai_tanka = 3000
WHERE shohin_id = '0003';
UPDATE ShohinSaeki
SET saeki = hanbai_tanka - shiire_tanka
WHERE shohin_id = '0003';

COMMIT;

-- 正答数4/4