CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `tmpk`.`main_contract_info` AS
    SELECT 
        `tmpk`.`contract`.`id` AS `id`,
        `tmpk`.`contract`.`contract` AS `contract_id`,
        `tmpk`.`contract`.`fio` AS `fio`,
        `tmpk`.`company`.`name` AS `is_company`,
        `tmpk`.`status`.`name` AS `status`,
        `tmpk`.`address`.`city` AS `city`,
        `tmpk`.`address`.`street` AS `street`,
        `tmpk`.`address`.`building` AS `building`,
        `tmpk`.`address`.`apartment` AS `apartment`
    FROM
        (((`tmpk`.`contract`
        JOIN `tmpk`.`address` ON ((`tmpk`.`address`.`id` = `tmpk`.`contract`.`address_id`)))
        JOIN `tmpk`.`status` ON ((`tmpk`.`status`.`id` = `tmpk`.`contract`.`status_id`)))
        JOIN `tmpk`.`company` ON ((`tmpk`.`company`.`id` = `tmpk`.`contract`.`company_id`)))