CREATE TABLE users_backup(
subID INT,
subName VARCHAR(100)
);

DELIMITER ##
CREATE PROCEDURE retrUsersUsingCursor()
BEGIN
	DECLARE done INT DEFAULT FALSE;
    DECLARE subID INT;
    DECLARE subName VARCHAR(100);
    DECLARE auto_id INT;
    
    DECLARE cur CURSOR FOR SELECT SubscriberID, SubscriberName FROM Subscribers;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO subID, subName;
        IF done = 1 THEN
            LEAVE read_loop;
        END IF;
        INSERT INTO users_backup VALUES (subID, subName);
		SET auto_id=LAST_INSERT_ID();

    END LOOP;
    CLOSE cur;
END ##
DELIMITER ;

CALL retrUsersUsingCursor();

SELECT * FROM users_backup;
