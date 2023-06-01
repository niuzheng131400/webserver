CREATE DATABASE IF NOT EXISTS naming DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_general_ci;

use naming;

DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
                         `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
                         `openid` varchar(500) DEFAULT NULL COMMENT '用户在当前小程序的 ID',
                         `unionid` varchar(500) DEFAULT NULL COMMENT '用户在小程序平台的唯一标识符',
                         `order_id` varchar(100) NOT NULL COMMENT '订单ID',
                         `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '订单状态(0:未支付,1:正在支付,2:已支付;3:已退款)',
                         `data` text COMMENT '订单详情数据',
                         `add_time` datetime DEFAULT NULL COMMENT '添加时间',
                         `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                         PRIMARY KEY (`id`),
                         UNIQUE KEY `order_unique` (`order_id`) USING BTREE COMMENT '唯一订单ID'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4;