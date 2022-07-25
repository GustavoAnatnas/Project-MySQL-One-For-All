SELECT
COUNT(DISTINCT songs.songs_id) AS "cancoes",
COUNT(DISTINCT artists.artists_id) AS "artistas",
COUNT(DISTINCT albums.album_id) AS "albuns"
FROM SpotifyClone.songs AS songs
INNER JOIN SpotifyClone.artists AS artists ON songs.artist_id = artists.artists_id
INNER JOIN SpotifyClone.albums AS albums ON songs.album_id = albums.album_id;