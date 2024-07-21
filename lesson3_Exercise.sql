-- 3.1

-- SUMに数値型でないデータを指定している
-- GROUP BYで指定していないキーをSELECT句で指定している
-- WHERE句をGROUP BY句の後に記述している

-- 3.2

-- SUM(hanbai_tanka) > SUM(shiire_tanka) * 1.5

SELECT shohin_bunrui, SUM(hanbai_tanka), SUM(shiire_tanka)
FROM Shohin
GROUP BY shohin_bunrui
HAVING SUM(hanbai_tanka) > SUM(shiire_tanka) * 1.5;

-- 3.3

-- torokubiの降順
-- hanbai_tankaの昇順

SELECT *
FROM Shohin
ORDER BY torokubi DESC, hanbai_tanka;

-- 正答数3/3