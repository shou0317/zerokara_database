-- 5.1

hanbai_tanka >= 1000
torokubi = '2009-09-20'

CREATE VIEW ViewRenshu5_1 (shohin_mei, hanbai_tanka, torokubi)
AS
SELECT shohin_mei, hanbai_tanka, torokubi
FROM Shohin
WHERE hanbai_tanka >= 1000
AND torokubi = '2009-09-20';

SELECT * FROM ViewRenshu5_1;

-- 5.2

-- shohin_id, shohin_bunruiのNOT NULL制約のため、エラーになる

-- 5.3

SELECT shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka,
    (SELECT AVG(hanbai_tanka) FROM Shohin) AS hanbai_tanka_all
FROM Shohin;

--5.4

SELECT shohin_bunrui, AVG(hanbai_tanka)
FROM Shohin
GROUP BY shohin_bunrui;

-- 商品が属する商品分類の平均販売単価をデータに追加する

CREATE VIEW AvgTankaByBunrui
AS
SELECT shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka,
    (SELECT AVG(hanbai_tanka)
    FROM Shohin AS S2
    WHERE S1.shohin_bunrui = S2.shohin_bunrui) AS avg_hanbai_tanka
FROM Shohin AS S1;

SELECT * FROM AvgTankaByBunrui;

-- 解答ではWHERE句の後にGROUP BY句を記述していた