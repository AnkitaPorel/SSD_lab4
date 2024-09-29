DELIMITER ##
CREATE PROCEDURE AddNewShow(IN newShowID INT, IN newTitle VARCHAR(100), IN newGenre VARCHAR(50), IN newReleaseYear INT)
BEGIN
    INSERT INTO Shows (ShowID, Title, Genre, ReleaseYear)
    VALUES (newShowID, newTitle, newGenre, newReleaseYear);
END ##
DELIMITER ;

CALL AddNewShow(4,'Game of Thrones','Comedy',2012);
SELECT * FROM Shows;
