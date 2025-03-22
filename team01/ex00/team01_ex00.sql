WITH latest_currency AS (
    SELECT DISTINCT ON (cur.id)
        cur.id,
        cur.rate_to_usd,
        COALESCE(cur.name, 'not defined') AS currency_name,  -- Добавляем COALESCE для обработки NULL
        cur.updated
    FROM currency cur
    ORDER BY cur.id, cur.updated DESC
)
SELECT DISTINCT
    name,
    lastname,
    type,
    SUM(CAST(money AS numeric)) AS volume,
    currency_name,
    last_rate_to_usd,
    (last_rate_to_usd * SUM(CAST(money AS numeric))) AS total_volume_in_usd
FROM (
    SELECT
        CASE
            WHEN us.name IS NOT NULL THEN us.name
            ELSE 'not defined'
        END AS name,
        CASE
            WHEN us.lastname IS NOT NULL THEN us.lastname
            ELSE 'not defined'
        END AS lastname,
        bal.type,
        bal.money,
        COALESCE(cur.currency_name, 'not defined') AS currency_name,  -- Добавляем COALESCE для обработки NULL
        COALESCE(cur.rate_to_usd, 1) AS last_rate_to_usd
    FROM balance bal
    FULL JOIN "user" us ON bal.user_id = us.id
    FULL JOIN latest_currency cur ON bal.currency_id = cur.id
) t1
GROUP BY name, lastname, type, currency_name, last_rate_to_usd
ORDER BY name DESC, lastname ASC, type ASC;