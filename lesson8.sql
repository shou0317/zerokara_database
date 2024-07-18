SELECT shohin_mei,shohin_bunrui,hanbai_tanka,
RANK () OVER (
    ORDER BY hanbai_tanka
    ) AS ranking
FROM Shohin;

SELECT
shohin_mei,shohin_bunrui,hanbai_tanka,
RANK () OVER (
    ORDER BY hanbai_tanka
    ) AS ranking
FROM Shohin;

SELECT shohin_mei,shohin_bunrui,hanbai_tanka,
RANK () OVER (
    ORDER BY hanbai_tanka
    ) AS ranking,
DENSE_RANK () OVER (
    ORDER BY hanbai_tanka
    ) AS dense_ranking,
ROW_NUMBER () OVER (
    ORDER BY hanbai_tanka
    ) AS row_num
FROM Shohin;

SELECT shohin_id, shohin_mei, hanbai_tanka,
SUM (hanbai_tanka) OVER (ORDER BY shohin_id) AS current_sum
FROM Shohin;

SELECT shohin_id, shohin_mei, hanbai_tanka,
AVG (hanbai_tanka) OVER (ORDER BY shohin_id) AS current_avg
FROM Shohin;

SELECT shohin_id, shohin_mei, hanbai_tanka,
AVG (hanbai_tanka) OVER (ORDER BY shohin_id
ROWS 2 PRECEDING) AS moving_avg
FROM Shohin;

SELECT shohin_id, shohin_mei, hanbai_tanka,
AVG (hanbai_tanka) OVER (ORDER BY shohin_id
ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING) AS moving_avg
FROM Shohin;

SELECT shohin_id, shohin_mei, hanbai_tanka,
AVG (hanbai_tanka) OVER (ORDER BY shohin_id
ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS moving_avg
FROM Shohin;

SELECT shohin_mei, shohin_bunrui, hanbai_tanka,
RANK () OVER (ORDER BY shohin_id) AS ranking
FROM Shohin
ORDER BY ranking;

SELECT shohin_bunrui, SUM(hanbai_tanka)
FROM Shohin
GROUP BY shohin_bunrui;

SELECT SUM(hanbai_tanka)
FROM Shohin;

SELECT '合計' AS shohin_bunrui, SUM(hanbai_tanka)
FROM Shohin
UNION ALL
SELECT shohin_bunrui, SUM(hanbai_tanka)
FROM Shohin
GROUP BY shohin_bunrui;

SELECT shohin_bunrui, SUM(hanbai_tanka) AS sum_tanka
FROM Shohin
GROUP BY ROLLUP(shohin_bunrui);

SELECT shohin_bunrui, torokubi, SUM(hanbai_tanka)
FROM Shohin
GROUP BY ROLLUP(shohin_bunrui, torokubi)
ORDER BY shohin_bunrui;

SELECT
    CASE
        WHEN GROUPING(shohin_bunrui) = 1
        THEN '商品分類 合計'
        ELSE shohin_bunrui
    END AS shohin_bunrui,
    CASE
        WHEN GROUPING(torokubi) = 1
        THEN '登録日 合計'
        ELSE CAST(torokubi AS VARCHAR(16))
    END AS torokubi,
    SUM(hanbai_tanka) AS sum_tanka
FROM Shohin
GROUP BY ROLLUP(shohin_bunrui, torokubi)
ORDER BY
    CASE
        WHEN GROUPING(shohin_bunrui) = 1
        THEN 0
        ELSE 1
    END,
    shohin_bunrui,
    CASE
        WHEN GROUPING(torokubi) = 1
        THEN 0
        ELSE 1
    END,
    torokubi;

SELECT
    CASE
        WHEN GROUPING(shohin_bunrui) = 1
        THEN '商品分類 合計'
        ELSE shohin_bunrui
    END AS shohin_bunrui,
    CASE
        WHEN GROUPING(torokubi) = 1
        THEN '登録日 合計'
        ELSE CAST(torokubi AS VARCHAR(16))
    END AS torokubi,
    SUM(hanbai_tanka) AS sum_tanka
FROM Shohin
GROUP BY CUBE(shohin_bunrui, torokubi)
ORDER BY
    CASE
        WHEN GROUPING(shohin_bunrui) = 1
        THEN 0
        ELSE 1
    END,
    shohin_bunrui,
    CASE
        WHEN GROUPING(torokubi) = 1
        THEN 0
        ELSE 1
    END,
    torokubi;

-- ROLLUPは組み合わせの粒度が大きくなる
-- CUBEは全ての組み合わせ、単価の合計を出力
-- 集約キーで切り分けたブロックを積み上げて立方体を作る

SELECT
    CASE
        WHEN GROUPING(shohin_bunrui) = 1
        THEN '商品分類 合計'
        ELSE shohin_bunrui
    END AS shohin_bunrui,
    CASE
        WHEN GROUPING(torokubi) = 1
        THEN '登録日 合計'
        ELSE CAST(torokubi AS VARCHAR(16))
    END AS torokubi,
    SUM(hanbai_tanka) AS sum_tanka
FROM Shohin
GROUP BY GROUPING SETS(shohin_bunrui, torokubi)
ORDER BY
    CASE
        WHEN GROUPING(shohin_bunrui) = 1
        THEN 0
        ELSE 1
    END,
    shohin_bunrui,
    CASE
        WHEN GROUPING(torokubi) = 1
        THEN 0
        ELSE 1
    END,
    torokubi;

-- GROUPING SETSは集約キーごとに切り分けた結果のみ出力
