SELECT 
    user.username AS "usuario",
    IF(YEAR(MAX(history.reproduction_date)) = 2021, 'Usuário ativo', 'Usuário inativo') AS "condicao_usuario"
FROM SpotifyClone.users AS user
    INNER JOIN SpotifyClone.history AS history 
        ON user.user_id = history.user_id
        GROUP BY user.username;