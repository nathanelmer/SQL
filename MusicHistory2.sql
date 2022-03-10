SELECT * FROM Genre;

SELECT * FROM Artist a
ORDER BY a.ArtistName; 

SELECT s.Title, a.ArtistName FROM Song s
JOIN Artist a ON s.ArtistId = a.Id;


SELECT DISTINCT a.ArtistName
FROM Artist a 
LEFT JOIN Album al ON al.ArtistId = a.Id
LEFT JOIN Genre g ON Al.GenreId = g.Id
WHERE g.Name = 'Soul';