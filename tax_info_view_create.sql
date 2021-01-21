CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `tmpk`.`tax_info` AS
    SELECT 
        `tmpk`.`tax`.`id` AS `id`,
        `tmpk`.`tax`.`amount` AS `amount`,
        `tmpk`.`tax`.`date` AS `date`,
        `tmpk`.`tariff`.`name` AS `tariff`,
        `tmpk`.`tariff`.`cost` AS `cost`,
        `tmpk`.`tariff`.`start_date` AS `start`,
        `tmpk`.`tariff`.`finish_date` AS `finish`,
        `tmpk`.`contract`.`contract` AS `contract_id`
    FROM
        ((`tmpk`.`tax`
        JOIN `tmpk`.`tariff` ON ((`tmpk`.`tariff`.`id` = `tmpk`.`tax`.`tariff_id`)))
        JOIN `tmpk`.`contract` ON ((`tmpk`.`contract`.`id` = `tmpk`.`tax`.`contract_id`)))