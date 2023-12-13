1.
CREATE FUNCTION format_seconds(seconds INT, format VARCHAR(255))
RETURNS VARCHAR(255)
BEGIN
    DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;
    DECLARE remainder INT;

    SET days = FLOOR(seconds / (24 * 3600));
    SET remainder = seconds % (24 * 3600);
    SET hours = FLOOR(remainder / 3600);
    SET remainder = remainder % 3600;
    SET minutes = FLOOR(remainder / 60);
    SET remainder = remainder % 60;

    RETURN CONCAT(
        IF(days > 0, CONCAT(days, ' days '), ''),
        IF(hours > 0, CONCAT(hours, ' hours '), ''),
        IF(minutes > 0, CONCAT(minutes, ' minutes '), ''),
        IF(remainder > 0, CONCAT(remainder, ' seconds '), '')
    );
END;

2.
SELECT number
FROM generate_series(1, 10) AS number
WHERE number % 2 = 0;
