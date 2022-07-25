SELECT 
    artist.artist_name AS "artista",
    album.album_name AS "album"
FROM SpotifyClone.albums AS album
    JOIN SpotifyClone.artists artist 
        ON album.artist_id = artist.artists_id
WHERE artist.artist_name = 'Walter Phoenix'
ORDER BY album.album_name ASC;