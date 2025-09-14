-- 为各个表添加缺失的create_by和update_by字段

-- flow_definition表添加字段
ALTER TABLE `flow_definition` ADD COLUMN `create_by` varchar(64) NULL DEFAULT NULL COMMENT '创建人' AFTER `create_time`;
ALTER TABLE `flow_definition` ADD COLUMN `update_by` varchar(64) NULL DEFAULT NULL COMMENT '更新人' AFTER `update_time`;

-- flow_node表添加字段
ALTER TABLE `flow_node` ADD COLUMN `create_by` varchar(64) NULL DEFAULT NULL COMMENT '创建人' AFTER `create_time`;
ALTER TABLE `flow_node` ADD COLUMN `update_by` varchar(64) NULL DEFAULT NULL COMMENT '更新人' AFTER `update_time`;

-- flow_skip表添加字段
ALTER TABLE `flow_skip` ADD COLUMN `create_by` varchar(64) NULL DEFAULT NULL COMMENT '创建人' AFTER `create_time`;
ALTER TABLE `flow_skip` ADD COLUMN `update_by` varchar(64) NULL DEFAULT NULL COMMENT '更新人' AFTER `update_time`;

-- flow_instance表添加字段
ALTER TABLE `flow_instance` ADD COLUMN `update_by` varchar(64) NULL DEFAULT NULL COMMENT '更新人' AFTER `update_time`;

-- flow_task表添加字段
ALTER TABLE `flow_task` ADD COLUMN `create_by` varchar(64) NULL DEFAULT NULL COMMENT '创建人' AFTER `create_time`;
ALTER TABLE `flow_task` ADD COLUMN `update_by` varchar(64) NULL DEFAULT NULL COMMENT '更新人' AFTER `update_time`;

-- flow_his_task表添加字段
ALTER TABLE `flow_his_task` ADD COLUMN `update_by` varchar(64) NULL DEFAULT NULL COMMENT '更新人' AFTER `update_time`;

-- flow_user表添加字段
ALTER TABLE `flow_user` ADD COLUMN `update_by` varchar(64) NULL DEFAULT NULL COMMENT '更新人' AFTER `update_time`;