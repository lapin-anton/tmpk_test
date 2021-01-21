CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `tmpk`.`incoming_info` AS
    SELECT 
        `tmpk`.`incoming`.`id` AS `id`,
        `tmpk`.`incoming`.`amount` AS `amount`,
        `tmpk`.`incoming`.`date` AS `date`,
        `tmpk`.`contract`.`contract` AS `contract`
    FROM
        (`tmpk`.`incoming`
        JOIN `tmpk`.`contract` ON ((`tmpk`.`contract`.`id` = `tmpk`.`incoming`.`contract_id`)))