DELIMITER ;
DELIMITER $$

CREATE PROCEDURE departureTimeUpdate(t TIMESTAMP, num CHAR(7))
BEGIN
 	UPDATE `flights` SET `departure_time` = t WHERE `flight_number` = num;
END $$

CREATE PROCEDURE buyTicket(class CHAR(11), name CHAR(20), customer_no VARCHAR(11), age INT, isFemale BOOLEAN, cost INT, flight_number CHAR(7))
BEGIN
	INSERT INTO `passengers`(`class`, `name`, `customer_no`, `age`, `isFemale`)
		VALUES (class, name, customer_no, age, isFemale, cost);
	INSERT INTO `flies`(`cost`, `customer_no`, `flight_number`)
		VALUES (cost, customer_no, flight_number);
END $$ 

CREATE PROCEDURE newAirline(airline_code CHAR(4), airline_name CHAR(20))
BEGIN
	INSERT INTO `airlines`(`airline_code`, `airline_name`)
		VALUES (airline_code, airline_name);
END $$

-- below belongs to bengusu, geri durun.

CREATE PROCEDURE addNewFlight( flightNumber CHAR(7), planeModel CHAR(20), tailNumber CHAR(6), gate_park CHAR(5), 
departureTime TIMESTAMP, is_domestic BOOLEAN, flightDestination CHAR(3), flightDeparture CHAR(3), flightRunway CHAR(5), 
airlineCode CHAR(4))

BEGIN
     INSERT INTO `flights` (`flight_number`,`plane_model`,`tail_number`, `gate/park`,`departure_time`,`isDomestic`, `destination`,`departure`,`runway`)
	 
     VALUES (flightNumber, planeModel, tailNumber, gate_park, departureTime, is_domestic, flightDestination, flightDeparture, flightRunway)	;
     
	 INSERT INTO `belongs` (`airline_code`, `flight_number`)

	 VALUES (airlineCode, flightNumber);
	 
END $$


CREATE PROCEDURE cancelFlight(num CHAR(7), cancel BOOLEAN)
BEGIN
        UPDATE `flights` SET `is_canceled` = cancel WHERE `flight_number` = num;
END $$

CREATE PROCEDURE changePlaneModel(num CHAR(7), planeModel CHAR(20))
BEGIN
        UPDATE `flights` SET `plane_model` = planeModel WHERE `flight_number` = num;
END $$

--above belongs to bengusu, geri durun.
