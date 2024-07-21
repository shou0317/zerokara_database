-- 8.1

-- カレントレコードを基準にそれ以前の商品IDと比較し、その時点での最大値を表示する

SELECT shohin_id, shohin_mei, hanbai_tanka,
MAX (hanbai_tanka) OVER (ORDER BY shohin_id) AS current_max_tanka
FROM Shohin;

-- 8.2

shohin_id, shohin_mei, torokubi, sum(hanbai_tanka)

SELECT shohin_id, shohin_mei, torokubi,
    SUM (hanbai_tanka) OVER (ORDER BY torokubi NULLS FIRST) AS current_sum
FROM Shohin;

-- torokubiがNULLのときダミーの値に変更する

SELECT shohin_id, shohin_mei, torokubi,
    SUM (hanbai_tanka) OVER (ORDER BY COALESCE(torokubi, '0001-01-01'))AS current_sum
FROM Shohin;

SELECT shohin_id, shohin_mei, torokubi,
    SUM (hanbai_tanka) OVER (ORDER BY
        COALESCE(torokubi, CAST('0001-01-01' AS DATE)))
    AS current_sum
FROM Shohin;

-- NULLの時のデータのデータ型を変換する必要がある

正答数1/2