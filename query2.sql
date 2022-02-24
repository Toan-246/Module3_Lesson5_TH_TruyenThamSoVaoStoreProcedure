use classicmodels;

delimiter //
create procedure getCusById
(IN cusNum int(11))
begin
    SELECT * FROM customers WHERE customerNumber = cusNum;

end //
delimiter ;

call getCusById(175);

delimiter //

create procedure GetCustomersCountByCity (
IN in_city varchar(50),
OUT total int
)
begin
    select count(customerNumber)
        into total
    from customers
        where city = in_city;
end //
delimiter ;

CALL GetCustomersCountByCity('Lyon',@total);

SELECT @total;


DELIMITER //

CREATE PROCEDURE SetCounter(

    INOUT counter INT,

    IN inc INT

)

BEGIN

    SET counter = counter + inc;

END//

DELIMITER ;

SET @counter = 1;

CALL SetCounter(@counter,1); -- 2

CALL SetCounter(@counter,1); -- 3

CALL SetCounter(@counter,5); -- 8

SELECT @counter; -- 8