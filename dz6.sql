-- Функция преобразования количества секунд в дни-часы-минуты-секунды
DELIMITER //
DROP FUNCTION IF EXISTS get_datetime//
CREATE FUNCTION get_datetime(DATESEC int) RETURNS TEXT DETERMINISTIC
BEGIN
	DECLARE txtres TEXT;
	SET @whole = DATESEC DIV 86400;
    SET @remains = DATESEC % 86400;
    SET @textres = CONCAT(@whole, ' days ', @remains DIV 3600, ' hours ');
    SET @whole = ((@remains % 3600) DIV 60);
    SET @remains = ((@remains % 3600) % 60);
    SET @textres = CONCAT(@textres, @whole, ' minutes ', @remains, ' seconds ');
	RETURN @textres;
END //

SELECT get_datetime(123456)//

-- Функция вывода четных чисел от 1 до 10 (или более) 
DROP FUNCTION IF EXISTS get_even//
CREATE FUNCTION get_even(NUMBERTEN int) RETURNS TEXT DETERMINISTIC
BEGIN
	DECLARE txtres TEXT;
    DECLARE i INT DEFAULT 1;
    SET @textres = '';
		WHILE i <= NUMBERTEN DO
			IF (i%2=0 AND i <> NUMBERTEN) THEN
				SET @textres = CONCAT(@textres, i, ', ');
			END IF;
			IF (i%2=0) AND (i = NUMBERTEN) THEN
				SET @textres = CONCAT(@textres, i);
			END IF;
            SET i = i + 1;
        END WHILE;
	RETURN @textres;
END //

SELECT get_even(10)//