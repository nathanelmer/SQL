use [PoKi];
GO

--1
SELECT * FROM Grade AS AllGrades;
--Grades 1-5

--2
SELECT * FROM Emotion;
--Anger, Fear, Sadness, Joy

--3
SELECT Count(Poem.Id) From Poem;
--32,842

--4
SELECT TOP 76 * FROM Author
ORDER BY Author.Name;

--5
SELECT TOP 76 * FROM Author 
LEFT JOIN Grade ON Author.GradeId = Grade.Id
ORDER BY Author.Name

--6
SELECT TOP 76 * FROM Author 
LEFT JOIN Gender ON Author.GenderId = Gender.Id
ORDER BY Author.Name

--7
SELECT SUM(CharCount) FROM Poem AS WordCount;

--8
SELECT TOP 1 * FROM Poem
ORDER BY Poem.CharCount DESC;

--9
SELECT COUNT(Author.Id) FROM Author
WHERE Author.GradeId = 3;

--10
SELECT COUNT(Author.Id) FROM Author
WHERE Author.GradeId = 1 OR Author.GradeId = 2 OR Author.GradeId = 3;

--11
SELECT COUNT(Poem.Id) FROM Poem
LEFT JOIN Author ON Poem.AuthorId = Author.Id
WHERE Author.GradeId = 4;

--12
SELECT DISTINCT Grade.Name, COUNT(Poem.Id) FROM Grade
JOIN Author ON Author.GradeId = Grade.Id
JOIN Poem ON Poem.AuthorId = Author.Id
GROUP BY Grade.Name;

--13
SELECT DISTINCT Grade.Name, COUNT(Author.Id) FROM Grade
JOIN Author ON Author.GradeId = Grade.Id
JOIN Poem ON Poem.AuthorId = Author.Id
GROUP BY Grade.Name;

--14
SELECT TOP 1 * FROM Poem
ORDER BY Poem.CharCount DESC;

--15 NOT COMPLETE
SELECT TOP 1 Author.Name, COUNT(Poem.Id) FROM Author 
JOIN Poem ON Poem.AuthorId = Author.Id
GROUP BY Author.Id, Author.Name
ORDER BY COUNT(Poem.Id) DESC;

--16
SELECT COUNT(Poem.Id) FROM Poem
JOIN PoemEmotion pe ON pe.PoemId = Poem.Id
WHERE pe.EmotionId = 3;

--17
SELECT COUNT(PoemEmotion.Id) - (SELECT COUNT(Poem.Id) FROM Poem) FROM PoemEmotion;

--18
SELECT TOP 1 Emotion.Name, COUNT(pe.PoemId) FROM Emotion
JOIN PoemEmotion pe ON pe.EmotionId = Emotion.Id
JOIN Poem ON Poem.Id = pe.PoemId
GROUP BY Emotion.Name;

--19
SELECT TOP 1 Grade.Name, COUNT(Poem.Id) FROM Poem
JOIN Author ON Poem.AuthorId = Author.Id
JOIN Grade ON Author.GradeId = Grade.Id
JOIN PoemEmotion pe ON pe.PoemId = Poem.Id
JOIN Emotion ON pe.EmotionId = Emotion.Id
WHERE Emotion.Name = 'Joy'
GROUP BY Grade.Name
ORDER BY COUNT(Poem.Id) DESC;

--20
SELECT TOP 1 Gender.Name, COUNT(Poem.Id) FROM Poem
LEFT JOIN Author ON Poem.AuthorId = Author.Id
LEFT JOIN Gender ON Author.GenderId = Gender.Id
LEFT JOIN PoemEmotion pe ON pe.PoemId = Poem.Id
LEFT JOIN Emotion ON pe.EmotionId = Emotion.Id
WHERE Emotion.Name = 'Fear'
GROUP BY Gender.Name
ORDER BY COUNT(Poem.Id);



