CREATE DATABASE IF NOT EXISTS test1 DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_general_ci;

use test1;

CREATE TABLE IF NOT EXISTS `runoob_tbl` (
    `runoob_id` INT UNSIGNED AUTO_INCREMENT,
    `runoob_title` VARCHAR(100) NOT NULL,
    `runoob_author` VARCHAR(40) NOT NULL,
    `submission_date` DATE,
    PRIMARY KEY(`runoob_id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO runoob_tbl (runoob_title,runoob_author, submission_date) VALUES  ('学习PHP','php.net','2022-06-12');