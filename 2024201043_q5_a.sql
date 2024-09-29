ALTER TABLE Subscribers ADD AGE INT;

DELIMITER ##
CREATE PROCEDURE addAgeVals()
BEGIN
	UPDATE Subscribers
    SET Age = 25;
END ##
DELIMITER ;

CALL addAgeVals();

SELECT * FROM Subscribers;
