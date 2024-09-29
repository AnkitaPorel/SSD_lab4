ALTER TABLE Subscribers ADD AGE INT;

DELIMITER ##
CREATE PROCEDURE UpdateUserAgeWithCursor()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE subID INT;
    DECLARE subName INT;
    DECLARE cur CURSOR FOR SELECT SubscriberID, SubscriberName FROM Subscribers;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO subID;
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        UPDATE Subscribers
        SET AGE = 25
        WHERE SubscriberID = subID;
    END LOOP;
    CLOSE cur;
END ##
DELIMITER ;

CALL UpdateUserAgeWithCursor();


