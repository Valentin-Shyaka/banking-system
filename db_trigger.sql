DELIMITER //

CREATE TRIGGER after_transaction_insert
AFTER INSERT ON transaction
FOR EACH ROW
BEGIN
    DECLARE messageText TEXT;
    SET messageText = CONCAT('Transaction of amount ', NEW.amount, ' has been made by ', NEW.customer, ' on ', NEW.transactionDate);

    INSERT INTO message (customer, message, dateTime)
    VALUES (NEW.customer, messageText, NOW());
END //

DELIMITER ;
