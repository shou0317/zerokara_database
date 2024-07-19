-- 2.1
SELECT shohin_mei, torokubi
FROM Shohin
WHERE torokubi > '2009-04-28'
ORDER BY torokubi;

-- 以とつくものはその日も含む
-- 正:WHERE torokubi >= '2009-04-28'

-- 2.2
NULLを含んだ演算の結果はUNKNOWNになるため何の行も抽出されない

-- 2.3
SELECT shohin_mei, hanbai_tanka, shiire_tanka
FROM Shohin
WHERE hanbai_tanka - shiire_tanka >= 500;

-- patern 1
SELECT shohin_mei, hanbai_tanka, shiire_tanka
FROM Shohin
WHERE NOT hanbai_tanka - shiire_tanka < 500;

-- patern 2
SELECT shohin_mei, hanbai_tanka, shiire_tanka
FROM Shohin
WHERE hanbai_tanka >= shiire_tanka + 500;

-- patern 3
SELECT shohin_mei, hanbai_tanka, shiire_tanka
FROM Shohin
WHERE hanbai_tanka - 500 >= shiire_tanka;

-- 2.4
rieki = hanbai_tanka * 0.9 - shiire_tanka

SELECT shohin_mei, shohin_bunrui,
    hanbai_tanka * 0.9 - shiire_tanka AS rieki
FROM Shohin
WHERE hanbai_tanka * 0.9 - shiire_tanka > 100
AND (shohin_bunrui = '事務用品'
    OR shohin_bunrui = 'キッチン用品');

-- 正答数3/4
