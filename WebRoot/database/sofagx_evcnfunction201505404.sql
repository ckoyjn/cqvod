/* Function  structure for function  `epk_currval` */



/*!50003 DROP FUNCTION IF EXISTS `epk_currval` */;

DELIMITER $$



/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `epk_currval`(seq_name varchar(50)) RETURNS int(11)
	DETERMINISTIC
BEGIN

	DECLARE returnval INTEGER;

	SET returnval=0;

	SELECT id INTO returnval FROM epk_sequence where seqname=seq_name;

	RETURN returnval;

    END */$$

DELIMITER ;



/* Function  structure for function  `epk_nextval` */



/*!50003 DROP FUNCTION IF EXISTS `epk_nextval` */;

DELIMITER $$



/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `epk_nextval`(seq_name varchar(50)) RETURNS int(11)

    DETERMINISTIC

BEGIN

	delete from epk_sequence where seqname=seq_name;

	insert into epk_sequence(seqname) values (seq_name);

	return epk_currval(seq_name);

    END */$$

DELIMITER ;
