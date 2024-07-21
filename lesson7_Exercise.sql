-- 7.1
-- 集合演算子は通常重複を省くため、商品テーブルのレコードが一つ分表示される

-- 7.2

SELECT COALESCE(TS.tenpo_id, '不明') AS tenpo_id,
    COALESCE(TS.tenpo_mei, '不明') AS tenpo_mei,
    S.shohin_id,S.shohin_mei, S.hanbai_tanka
FROM Shohin AS S LEFT OUTER JOIN TenpoShohin AS TS
ON S.shohin_id = TS.shohin_id
ORDER BY tenpo_id;

正答数2/2