-- 8.1
-- 予想：カレントレコードを基準にそれまでのレコードのうち、最も大きい値を表示する
SELECT shohin_id, shohin_mei, hanbai_tanka,
    MAX(hanbai_tanka) OVER (ORDER BY shohin_id) AS current_max_tanka
FROM Shohin;

-- 8.2
SELECT
   CASE
        WHEN torokubi IS NULL
        THEN ''
        ELSE CAST(torokubi AS VARCHAR(16))
    END,
    shohin_mei,
    hanbai_tanka,
    SUM(hanbai_tanka) OVER (ORDER BY torokubi) AS current_sum_tanka
FROM Shohin
ORDER BY
CASE
    WHEN torokubi IS NULL
    THEN 0 ELSE 1
END,
torokubi;

-- カッターシャツの行で全ての行の合計金額を計算してしまっている

-- 別解1
-- 登録日不明を他の登録日より早い年月日に設定する
SELECT
    torokubi, shohin_mei, hanbai_tanka,
    SUM(hanbai_tanka) OVER (
        ORDER BY
        COALESCE(torokubi, CAST('0001-01-01' AS DATE)
    )) AS current_sum_tanka
FROM Shohin;

-- 別解2
-- NULLS FIRSTを使う
SELECT
    torokubi,
    shohin_mei,
    hanbai_tanka,
    SUM(hanbai_tanka) OVER (
        ORDER BY torokubi NULLS FIRST
    ) AS current_sum_tanka
FROM Shohin;

