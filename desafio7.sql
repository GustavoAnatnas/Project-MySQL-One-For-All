SELECT 
    artists.artist_name AS 'artista',
    albums.album_name AS 'album',
    COUNT(following.artists_id) AS 'seguidores'
FROM SpotifyClone.albums as albums
    INNER JOIN SpotifyClone.artists as artists 
        ON artists.artists_id = albums.artist_id
    LEFT JOIN SpotifyClone.following as following 
        ON artists.artists_id = following.artists_id
    GROUP BY 
        artist_name, 
        albums.album_name
    ORDER BY 
        seguidores DESC, 
        artist_name ASC, 
        album_name ASC;
