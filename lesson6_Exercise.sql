-- 6.1

SELECT shohin_mei, shiire_tanka
FROM Shohin
WHERE shiire_tanka NOT IN (500, 2800, 5000);

-- ①shiire_tanka IN (500, 2800, 5000) 以外の行を抽出

SELECT shohin_mei, shiire_tanka
FROM Shohin
WHERE shiire_tanka NOT IN (500, 2800, 5000, NULL);

SELECT shohin_mei, shiire_tanka
FROM Shohin
WHERE shiire_tanka IN (500, 2800, 5000, NULL);

/* 予想：②NULLを含むためNULLを返す...x
正確にはNOT INの引数にNULLがあると結果が常に空っぽになる
つまりNOT INの引数にNULLを含んではならない
引数がサブクエリであっても同様にNULLを含んではならない */

-- 6.2

SELECT
    SUM(CASE WHEN hanbai_tanka <= 1000
        THEN 1 ELSE 0 END) AS low_price,
    SUM(CASE WHEN hanbai_tanka BETWEEN 1001 AND 3000
        THEN 1 ELSE 0 END) AS mid_price,
    SUM(CASE WHEN hanbai_tanka >= 3001
        THEN 1 ELSE 0 END) AS high_price
FROM Shohin;