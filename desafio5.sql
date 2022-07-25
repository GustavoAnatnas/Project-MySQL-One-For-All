SELECT 
    songs.song_name AS "cancao",
    COUNT(history.songs_id) AS 'reproducoes'
FROM SpotifyClone.songs AS songs
    INNER JOIN SpotifyClone.history AS history 
        ON songs.songs_id = history.songs_id
    GROUP BY songs.song_name
    ORDER BY reproducoes DESC, cancao ASC
    LIMIT 2;