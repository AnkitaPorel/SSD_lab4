DELIMITER ##
CREATE PROCEDURE cumulativeWatchTime()
BEGIN
	SELECT subs.SubscriberID,subs.SubscriberName,SUM(w.WatchTime)
    FROM Subscribers subs JOIN WatchHistory w ON w.SubscriberID=subs.SubscriberID
    GROUP BY subs.SubscriberID;
END ##
DELIMITER ;

CALL cumulativeWatchTime();
