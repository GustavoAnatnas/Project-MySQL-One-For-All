SELECT 
    MIN(price.plan_price) AS 'faturamento_minimo',
    MAX(price.plan_price) AS 'faturamento_maximo',
    ROUND(AVG(price.plan_price), 2) AS 'faturamento_medio',
    SUM(price.plan_price) AS 'faturamento_total'
FROM SpotifyClone.plans AS price
    INNER JOIN SpotifyClone.users AS users
        ON price.plan_id = users.plan_type;
