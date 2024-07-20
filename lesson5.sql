CREATE VIEW ShohinSum (shohin_bunrui, cnt_shohin)
AS
SELECT shohin_bunrui, COUNT(*)
FROM Shohin
GROUP BY shohin_bunrui;

SELECT shohin_bunrui, cnt_shohin
FROM ShohinSum;

CREATE VIEW ShohinSumJim (shohin_bunrui, cnt_shohin)
AS
SELECT shohin_bunrui, cnt_shohin
FROM ShohinSum
WHERE shohin_bunrui = '事務用品';

CREATE VIEW TestShohinSumJim (shohin_bunrui, cnt_shohin)
AS
SELECT shohin_bunrui, COUNT(*)
FROM Shohin
WHERE shohin_bunrui = '事務用品'
GROUP BY shohin_bunrui;

DROP VIEW ShohinSum;

DROP VIEW ShohinSum CASCADE;

DELETE
FROM Shohin
WHERE shohin_id = '0009';

CREATE VIEW ShohinSum (shohin_bunrui, cnt_shohin)
AS
SELECT shohin_bunrui, COUNT(*)
FROM Shohin
GROUP BY shohin_bunrui;

SELECT shohin_bunrui, cnt_shohin
FROM (SELECT shohin_bunrui, COUNT(*) AS cnt_shohin
FROM Shohin
GROUP BY shohin_bunrui) AS ShohinSum;

-- サブクエリを使って実行
-- 商品分類ごとにレコード数の合計を抽出
-- レコード数が4のレコードを抽出
-- 仮想テーブルに含まれる全ての行を抽出

SELECT shohin_bunrui, cnt_shohin
FROM (SELECT shohin_bunrui, cnt_shohin
    FROM (SELECT shohin_bunrui, COUNT(*) AS cnt_shohin
        FROM Shohin
        GROUP BY shohin_bunrui) AS ShohinSum
    WHERE cnt_shohin = 4) AS ShohinSum2;

-- 凄まじく見づらい

SELECT shohin_id, shohin_mei, hanbai_tanka
FROM Shohin
WHERE hanbai_tanka > AVG(hanbai_tanka);

SELECT shohin_id, shohin_mei, hanbai_tanka
FROM Shohin
WHERE hanbai_tanka > (SELECT AVG(hanbai_tanka)
    FROM Shohin);

SELECT shohin_id, shohin_mei, hanbai_tanka,
    (SELECT AVG(hanbai_tanka) FROM Shohin) AS avg_tanka
FROM Shohin;

SELECT shohin_bunrui, AVG(hanbai_tanka)
FROM Shohin
GROUP BY shohin_bunrui
HAVING AVG(hanbai_tanka) > (SELECT AVG(hanbai_tanka) FROM Shohin);

SELECT shohin_bunrui, AVG(hanbai_tanka)
FROM Shohin
GROUP BY shohin_bunrui;

/* 各商品の販売単価をその商品が属する商品分類の平均単価と比較し、
平均単価より販売単価が高いものを抽出する */

SELECT shohin_bunrui, shohin_mei, hanbai_tanka
FROM Shohin
WHERE hanbai_tanka > (SELECT AVG(hanbai_tanka)
    FROM Shohin
    GROUP BY shohin_bunrui);

-- スカラサブクエリの値が単一でないため、エラーになる

SELECT shohin_bunrui, shohin_mei, hanbai_tanka
FROM Shohin AS S1
WHERE hanbai_tanka > (SELECT AVG(hanbai_tanka)
    FROM Shohin AS s2
    WHERE S1.shohin_bunrui = S2.shohin_bunrui);
    -- GROUP BY shohin_bunrui);

-- この場合WHERE句で商品分類ごとにグループ分けするためGROUP BY句は不要