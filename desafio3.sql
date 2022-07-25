SELECT
    user.username AS "usuario",
    COUNT(history.user_id) AS "qtde_musicas_ouvidas",
    ROUND(SUM(songs.songs_duration)/60, 2) AS "total_minutos"
FROM SpotifyClone.users AS user
    INNER JOIN SpotifyClone.history AS history 
        ON user.user_id = history.user_id
    INNER JOIN SpotifyClone.songs AS songs 
        ON history.songs_id = songs.songs_id
GROUP BY user.username;