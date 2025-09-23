-- =============================================
-- Liam Pet Love Management System Database Schema
-- Database: Liam_pet_love_bd
-- Prefix: L_
-- Created: 2025-09-15
-- Updated: 2025-01-27 - Enhanced for Pet & Love Management
-- Integrated: 2025-01-27 - Complete Database Creation Script
-- =============================================

-- 设置字符集和外键检查
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- 开始事务
START TRANSACTION;

-- =============================================
-- 1. 用户管理相关表
-- =============================================

-- 宠物饲养者基础信息表
DROP TABLE IF EXISTS `L_raiser_users`;
CREATE TABLE `L_raiser_users` (
  `ruid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '饲养者用户ID',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `phone` varchar(20) NOT NULL COMMENT '手机号',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `nickname` varchar(50) DEFAULT NULL COMMENT '昵称',
  `avatar` varchar(500) DEFAULT NULL COMMENT '头像URL',
  `gender` tinyint(1) DEFAULT NULL COMMENT '性别 0:男 1:女 2:未知',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `zodiac_sign` varchar(20) DEFAULT NULL COMMENT '星座',
  `blood_type` varchar(10) DEFAULT NULL COMMENT '血型',
  `height` decimal(5,2) DEFAULT NULL COMMENT '身高(cm)',
  `weight` decimal(5,2) DEFAULT NULL COMMENT '体重(kg)',
  `occupation` varchar(100) DEFAULT NULL COMMENT '职业',
  `location_province` varchar(50) DEFAULT NULL COMMENT '所在省份',
  `location_city` varchar(50) DEFAULT NULL COMMENT '所在城市',
  `location_district` varchar(50) DEFAULT NULL COMMENT '所在区县',
  `detailed_address` varchar(500) DEFAULT NULL COMMENT '详细地址',
  `pet_start_date` date DEFAULT NULL COMMENT '开始养宠时间',
  `favorite_pet_types` varchar(200) DEFAULT NULL COMMENT '喜欢的宠物类型(逗号分隔)',
  `personality_tags` varchar(500) DEFAULT NULL COMMENT '性格标签(JSON格式)',
  `hobbies` varchar(500) DEFAULT NULL COMMENT '兴趣爱好(逗号分隔)',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 0:禁用 1:正常 2:冻结',
  `account_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '账户类型 1:普通用户 2:VIP用户 3:专业饲养员',
  `wechat_openid` varchar(100) DEFAULT NULL COMMENT '微信openid',
  `wechat_unionid` varchar(100) DEFAULT NULL COMMENT '微信unionid',
  `qq_openid` varchar(100) DEFAULT NULL COMMENT 'QQ openid',
  `alipay_user_id` varchar(100) DEFAULT NULL COMMENT '支付宝用户ID',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(128) DEFAULT NULL COMMENT '最后登录IP',
  `login_count` int(11) NOT NULL DEFAULT '0' COMMENT '登录次数',
  `password_update_time` datetime DEFAULT NULL COMMENT '密码更新时间',
  `email_verified` tinyint(1) NOT NULL DEFAULT '0' COMMENT '邮箱是否验证',
  `phone_verified` tinyint(1) NOT NULL DEFAULT '0' COMMENT '手机是否验证',
  `real_name_verified` tinyint(1) NOT NULL DEFAULT '0' COMMENT '实名是否验证',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) DEFAULT NULL COMMENT '删除者',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ruid`),
  UNIQUE KEY `uk_phone` (`phone`),
  UNIQUE KEY `uk_username` (`username`),
  UNIQUE KEY `uk_wechat_openid` (`wechat_openid`),
  UNIQUE KEY `uk_email` (`email`),
  INDEX `idx_status` (`status`),
  INDEX `idx_account_type` (`account_type`),
  INDEX `idx_location` (`location_province`, `location_city`),
  INDEX `idx_create_time` (`create_time`),
  INDEX `idx_last_login_time` (`last_login_time`),
  INDEX `idx_deleted` (`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='宠物饲养者基础信息表';

-- 情侣关系表
DROP TABLE IF EXISTS `L_couple_relations`;
CREATE TABLE `L_couple_relations` (
  `relation_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '关系ID',
  `ruid_1` bigint(20) NOT NULL COMMENT '饲养者1ID',
  `ruid_2` bigint(20) NOT NULL COMMENT '饲养者2ID',
  `relation_code` varchar(50) NOT NULL COMMENT '关系邀请码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0:待确认 1:已绑定 2:已解绑 3:暂停',
  `relation_type` varchar(50) NOT NULL DEFAULT 'couple' COMMENT '关系类型 couple:情侣 married:夫妻 friend:朋友 family:家人',
  `anniversary_date` date DEFAULT NULL COMMENT '恋爱纪念日',
  `relation_name` varchar(100) DEFAULT NULL COMMENT '关系名称',
  `relation_nickname_1` varchar(50) DEFAULT NULL COMMENT '用户1在关系中的昵称',
  `relation_nickname_2` varchar(50) DEFAULT NULL COMMENT '用户2在关系中的昵称',
  `shared_goals` text DEFAULT NULL COMMENT '共同目标',
  `relationship_motto` varchar(500) DEFAULT NULL COMMENT '关系座右铭',
  `bind_time` datetime DEFAULT NULL COMMENT '绑定时间',
  `unbind_time` datetime DEFAULT NULL COMMENT '解绑时间',
  `pause_time` datetime DEFAULT NULL COMMENT '暂停时间',
  `pause_reason` varchar(500) DEFAULT NULL COMMENT '暂停原因',
  `shared_pet_count` int(11) NOT NULL DEFAULT '0' COMMENT '共同宠物数量',
  `shared_expense_enabled` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用共同消费',
  `data_sharing_level` tinyint(1) NOT NULL DEFAULT '2' COMMENT '数据共享级别 1:基础 2:标准 3:完全',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) DEFAULT NULL COMMENT '删除者',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`relation_id`),
  UNIQUE KEY `uk_relation_code` (`relation_code`),
  UNIQUE KEY `uk_users` (`ruid_1`, `ruid_2`),
  INDEX `idx_status` (`status`),
  INDEX `idx_relation_type` (`relation_type`),
  INDEX `idx_anniversary_date` (`anniversary_date`),
  INDEX `idx_deleted` (`deleted`),
  FOREIGN KEY (`ruid_1`) REFERENCES `L_raiser_users` (`ruid`) ON DELETE CASCADE,
  FOREIGN KEY (`ruid_2`) REFERENCES `L_raiser_users` (`ruid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='情侣关系表';

-- =============================================
-- 2. 宠物基础档案相关表
-- =============================================

-- 宠物品种表
DROP TABLE IF EXISTS `L_pet_breeds`;
CREATE TABLE `L_pet_breeds` (
  `breed_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '品种ID',
  `breed_name` varchar(100) NOT NULL COMMENT '品种名称',
  `species` varchar(50) NOT NULL COMMENT '物种 cat:猫 dog:狗 rabbit:兔子 bird:鸟类 fish:鱼类 other:其他',
  `breed_code` varchar(50) DEFAULT NULL COMMENT '品种编码',
  `description` text DEFAULT NULL COMMENT '品种描述',
  `avg_weight_min` decimal(5,2) DEFAULT NULL COMMENT '平均体重范围最小值(kg)',
  `avg_weight_max` decimal(5,2) DEFAULT NULL COMMENT '平均体重范围最大值(kg)',
  `avg_lifespan` int(11) DEFAULT NULL COMMENT '平均寿命(年)',
  `care_level` tinyint(1) DEFAULT NULL COMMENT '照料难度 1:简单 2:一般 3:困难',
  `is_active` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`breed_id`),
  UNIQUE KEY `uk_breed_name_species` (`breed_name`, `species`),
  INDEX `idx_species` (`species`),
  INDEX `idx_is_active` (`is_active`),
  INDEX `idx_deleted` (`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='宠物品种表';

-- 宠物基础档案表
DROP TABLE IF EXISTS `L_pets`;
CREATE TABLE `L_pets` (
  `pet_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '宠物ID',
  `pet_name` varchar(100) NOT NULL COMMENT '宠物名字',
  `pet_nickname` varchar(100) DEFAULT NULL COMMENT '宠物昵称',
  `owner_ruid` bigint(20) NOT NULL COMMENT '主人ID',
  `co_owner_ruid` bigint(20) DEFAULT NULL COMMENT '共同饲养者ID',
  `breed_id` bigint(20) DEFAULT NULL COMMENT '品种ID',
  `species` varchar(50) NOT NULL COMMENT '物种 cat:猫 dog:狗 rabbit:兔子 bird:鸟类 fish:鱼类 hamster:仓鼠 turtle:乌龟 other:其他',
  `gender` tinyint(1) DEFAULT NULL COMMENT '性别 0:未知 1:公 2:母',
  `birth_date` date DEFAULT NULL COMMENT '出生日期',
  `adoption_date` date DEFAULT NULL COMMENT '领养日期',
  `age_months` int(11) DEFAULT NULL COMMENT '年龄(月)',
  `color` varchar(100) DEFAULT NULL COMMENT '毛色/颜色',
  `pattern` varchar(100) DEFAULT NULL COMMENT '花纹特征',
  `weight` decimal(5,2) DEFAULT NULL COMMENT '体重(kg)',
  `height` decimal(5,2) DEFAULT NULL COMMENT '身高(cm)',
  `length` decimal(5,2) DEFAULT NULL COMMENT '体长(cm)',
  `chest_circumference` decimal(5,2) DEFAULT NULL COMMENT '胸围(cm)',
  `chip_number` varchar(100) DEFAULT NULL COMMENT '芯片编号',
  `registration_number` varchar(100) DEFAULT NULL COMMENT '注册编号',
  `passport_number` varchar(100) DEFAULT NULL COMMENT '宠物护照号',
  `avatar` varchar(500) DEFAULT NULL COMMENT '头像照片URL',
  `photo_gallery` text DEFAULT NULL COMMENT '照片集合(JSON格式)',
  `is_sterilized` tinyint(1) DEFAULT NULL COMMENT '是否绝育 0:否 1:是',
  `sterilization_date` date DEFAULT NULL COMMENT '绝育日期',
  `sterilization_hospital` varchar(200) DEFAULT NULL COMMENT '绝育医院',
  `personality_traits` varchar(500) DEFAULT NULL COMMENT '性格特征(JSON格式)',
  `behavioral_notes` text DEFAULT NULL COMMENT '行为习惯记录',
  `dietary_preferences` varchar(500) DEFAULT NULL COMMENT '饮食偏好',
  `allergies` varchar(500) DEFAULT NULL COMMENT '过敏信息',
  `medical_conditions` text DEFAULT NULL COMMENT '疾病史',
  `emergency_contact` varchar(200) DEFAULT NULL COMMENT '紧急联系人',
  `emergency_phone` varchar(20) DEFAULT NULL COMMENT '紧急联系电话',
  `veterinarian_name` varchar(100) DEFAULT NULL COMMENT '常用兽医姓名',
  `veterinarian_phone` varchar(20) DEFAULT NULL COMMENT '兽医电话',
  `veterinarian_address` varchar(500) DEFAULT NULL COMMENT '兽医诊所地址',
  `insurance_company` varchar(100) DEFAULT NULL COMMENT '保险公司',
  `insurance_policy_number` varchar(100) DEFAULT NULL COMMENT '保险单号',
  `microchip_brand` varchar(50) DEFAULT NULL COMMENT '芯片品牌',
  `microchip_implant_date` date DEFAULT NULL COMMENT '芯片植入日期',
  `special_needs` text DEFAULT NULL COMMENT '特殊需求',
  `special_notes` text DEFAULT NULL COMMENT '特殊说明',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 0:已故 1:健康 2:生病 3:失踪 4:寄养中 5:医院治疗中',
  `health_score` tinyint(1) DEFAULT NULL COMMENT '健康评分 1-10分',
  `activity_level` tinyint(1) DEFAULT NULL COMMENT '活跃度 1:很低 2:低 3:中等 4:高 5:很高',
  `training_level` tinyint(1) DEFAULT NULL COMMENT '训练程度 1:未训练 2:基础 3:中级 4:高级 5:专业',
  `socialization_level` tinyint(1) DEFAULT NULL COMMENT '社交程度 1:很差 2:一般 3:良好 4:很好 5:优秀',
  `visibility` tinyint(1) NOT NULL DEFAULT '1' COMMENT '可见性 1:仅自己 2:情侣可见 3:公开',
  `is_shared_pet` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否共同宠物',
  `sharing_agreement` text DEFAULT NULL COMMENT '共养协议',
  `qr_code_url` varchar(500) DEFAULT NULL COMMENT '宠物二维码URL',
  `tags` varchar(500) DEFAULT NULL COMMENT '标签(逗号分隔)',
  `owner_nickname` varchar(50) DEFAULT NULL COMMENT '主人昵称(冗余字段)',
  `co_owner_nickname` varchar(50) DEFAULT NULL COMMENT '共同饲养者昵称(冗余字段)',
  `breed_name` varchar(100) DEFAULT NULL COMMENT '品种名称(冗余字段)',
  `total_photos` int(11) NOT NULL DEFAULT '0' COMMENT '照片总数',
  `total_health_records` int(11) NOT NULL DEFAULT '0' COMMENT '健康记录总数',
  `total_care_records` int(11) NOT NULL DEFAULT '0' COMMENT '护理记录总数',
  `last_health_check_date` date DEFAULT NULL COMMENT '最后健康检查日期',
  `last_care_date` date DEFAULT NULL COMMENT '最后护理日期',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`pet_id`),
  UNIQUE KEY `uk_chip_number` (`chip_number`),
  UNIQUE KEY `uk_registration_number` (`registration_number`),
  INDEX `idx_owner_ruid` (`owner_ruid`),
  INDEX `idx_co_owner_ruid` (`co_owner_ruid`),
  INDEX `idx_breed_id` (`breed_id`),
  INDEX `idx_species` (`species`),
  INDEX `idx_status` (`status`),
  INDEX `idx_visibility` (`visibility`),
  INDEX `idx_is_shared_pet` (`is_shared_pet`),
  INDEX `idx_birth_date` (`birth_date`),
  INDEX `idx_adoption_date` (`adoption_date`),
  INDEX `idx_deleted` (`deleted`),
  INDEX `idx_last_health_check` (`last_health_check_date`),
  INDEX `idx_last_care` (`last_care_date`),
  FOREIGN KEY (`owner_ruid`) REFERENCES `L_raiser_users` (`ruid`) ON DELETE CASCADE,
  FOREIGN KEY (`co_owner_ruid`) REFERENCES `L_raiser_users` (`ruid`) ON DELETE SET NULL,
  FOREIGN KEY (`breed_id`) REFERENCES `L_pet_breeds` (`breed_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='宠物基础档案表';

-- 宠物照片相册表
DROP TABLE IF EXISTS `L_pet_photos`;
CREATE TABLE `L_pet_photos` (
  `photo_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '照片ID',
  `pet_id` bigint(20) NOT NULL COMMENT '宠物ID',
  `photo_url` varchar(500) NOT NULL COMMENT '照片URL',
  `thumbnail_url` varchar(500) DEFAULT NULL COMMENT '缩略图URL',
  `photo_title` varchar(200) DEFAULT NULL COMMENT '照片标题',
  `photo_desc` text DEFAULT NULL COMMENT '照片描述',
  `photo_date` datetime DEFAULT NULL COMMENT '拍摄时间',
  `location` varchar(200) DEFAULT NULL COMMENT '拍摄地点',
  `tags` varchar(500) DEFAULT NULL COMMENT '标签(逗号分隔)',
  `ai_tags` varchar(500) DEFAULT NULL COMMENT 'AI识别标签',
  `is_favorite` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否收藏',
  `visibility` tinyint(1) NOT NULL DEFAULT '1' COMMENT '可见性 1:仅自己 2:情侣可见',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`photo_id`),
  INDEX `idx_pet_id` (`pet_id`),
  INDEX `idx_photo_date` (`photo_date`),
  INDEX `idx_is_favorite` (`is_favorite`),
  INDEX `idx_visibility` (`visibility`),
  INDEX `idx_deleted` (`deleted`),
  FOREIGN KEY (`pet_id`) REFERENCES `L_pets` (`pet_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='宠物照片相册表';

-- 宠物家族关系表
DROP TABLE IF EXISTS `L_pet_family_relations`;
CREATE TABLE `L_pet_family_relations` (
  `relation_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '关系ID',
  `pet_id` bigint(20) NOT NULL COMMENT '宠物ID',
  `related_pet_id` bigint(20) NOT NULL COMMENT '关联宠物ID',
  `relation_type` varchar(50) NOT NULL COMMENT '关系类型 parent:父母 child:子女 sibling:兄弟姐妹 mate:配偶 grandparent:祖父母 grandchild:孙子女',
  `relation_desc` varchar(200) DEFAULT NULL COMMENT '关系描述',
  `confirmed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否确认关系',
  `confirmed_by` bigint(20) DEFAULT NULL COMMENT '确认人ID',
  `confirmed_time` datetime DEFAULT NULL COMMENT '确认时间',
  `visibility` tinyint(1) NOT NULL DEFAULT '1' COMMENT '可见性 1:仅自己 2:情侣可见 3:公开',
  `pet_name` varchar(100) DEFAULT NULL COMMENT '宠物名称(冗余字段)',
  `related_pet_name` varchar(100) DEFAULT NULL COMMENT '关联宠物名称(冗余字段)',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`relation_id`),
  UNIQUE KEY `uk_pet_relation` (`pet_id`, `related_pet_id`, `relation_type`),
  INDEX `idx_pet_id` (`pet_id`),
  INDEX `idx_related_pet_id` (`related_pet_id`),
  INDEX `idx_relation_type` (`relation_type`),
  INDEX `idx_confirmed` (`confirmed`),
  INDEX `idx_visibility` (`visibility`),
  INDEX `idx_deleted` (`deleted`),
  FOREIGN KEY (`pet_id`) REFERENCES `L_pets` (`pet_id`) ON DELETE CASCADE,
  FOREIGN KEY (`related_pet_id`) REFERENCES `L_pets` (`pet_id`) ON DELETE CASCADE,
  FOREIGN KEY (`confirmed_by`) REFERENCES `L_raiser_users` (`ruid`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='宠物家族关系表';

-- 宠物特征标签表
DROP TABLE IF EXISTS `L_pet_feature_tags`;
CREATE TABLE `L_pet_feature_tags` (
  `tag_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标签ID',
  `pet_id` bigint(20) NOT NULL COMMENT '宠物ID',
  `tag_category` varchar(50) NOT NULL COMMENT '标签分类 appearance:外观 personality:性格 behavior:行为 skill:技能 health:健康 other:其他',
  `tag_name` varchar(100) NOT NULL COMMENT '标签名称',
  `tag_value` varchar(200) DEFAULT NULL COMMENT '标签值',
  `tag_description` text DEFAULT NULL COMMENT '标签描述',
  `is_system_tag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否系统标签',
  `tag_color` varchar(20) DEFAULT NULL COMMENT '标签颜色',
  `sort_order` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `visibility` tinyint(1) NOT NULL DEFAULT '1' COMMENT '可见性 1:仅自己 2:情侣可见 3:公开',
  `pet_name` varchar(100) DEFAULT NULL COMMENT '宠物名称(冗余字段)',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`tag_id`),
  INDEX `idx_pet_id` (`pet_id`),
  INDEX `idx_tag_category` (`tag_category`),
  INDEX `idx_tag_name` (`tag_name`),
  INDEX `idx_is_system_tag` (`is_system_tag`),
  INDEX `idx_sort_order` (`sort_order`),
  INDEX `idx_visibility` (`visibility`),
  INDEX `idx_deleted` (`deleted`),
  FOREIGN KEY (`pet_id`) REFERENCES `L_pets` (`pet_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='宠物特征标签表';

-- 宠物偏好设置表
DROP TABLE IF EXISTS `L_pet_preferences`;
CREATE TABLE `L_pet_preferences` (
  `preference_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '偏好ID',
  `pet_id` bigint(20) NOT NULL COMMENT '宠物ID',
  `preference_category` varchar(50) NOT NULL COMMENT '偏好分类 food:食物 toy:玩具 activity:活动 environment:环境 social:社交 other:其他',
  `preference_name` varchar(100) NOT NULL COMMENT '偏好名称',
  `preference_level` tinyint(1) NOT NULL DEFAULT '3' COMMENT '偏好程度 1:非常不喜欢 2:不喜欢 3:一般 4:喜欢 5:非常喜欢',
  `preference_desc` text DEFAULT NULL COMMENT '偏好描述',
  `notes` text DEFAULT NULL COMMENT '备注说明',
  `last_observed_date` date DEFAULT NULL COMMENT '最后观察日期',
  `confidence_level` tinyint(1) DEFAULT '3' COMMENT '确信程度 1:不确定 2:较不确定 3:一般 4:较确定 5:非常确定',
  `visibility` tinyint(1) NOT NULL DEFAULT '1' COMMENT '可见性 1:仅自己 2:情侣可见 3:公开',
  `pet_name` varchar(100) DEFAULT NULL COMMENT '宠物名称(冗余字段)',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`preference_id`),
  INDEX `idx_pet_id` (`pet_id`),
  INDEX `idx_preference_category` (`preference_category`),
  INDEX `idx_preference_level` (`preference_level`),
  INDEX `idx_visibility` (`visibility`),
  INDEX `idx_deleted` (`deleted`),
  FOREIGN KEY (`pet_id`) REFERENCES `L_pets` (`pet_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='宠物偏好设置表';

-- 宠物历代领养人信息表
DROP TABLE IF EXISTS `L_pet_adoption_history`;
CREATE TABLE `L_pet_adoption_history` (
  `history_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '历史记录ID',
  `pet_id` bigint(20) NOT NULL COMMENT '宠物ID',
  `owner_ruid` bigint(20) NOT NULL COMMENT '领养人ID',
  `owner_name` varchar(100) NOT NULL COMMENT '领养人姓名',
  `owner_phone` varchar(20) DEFAULT NULL COMMENT '领养人电话',
  `owner_address` varchar(500) DEFAULT NULL COMMENT '领养人地址',
  `adoption_date` date NOT NULL COMMENT '领养开始日期',
  `transfer_date` date DEFAULT NULL COMMENT '转让日期',
  `transfer_reason` varchar(500) DEFAULT NULL COMMENT '转让原因',
  `transfer_to_ruid` bigint(20) DEFAULT NULL COMMENT '转让给谁的ID',
  `transfer_to_name` varchar(100) DEFAULT NULL COMMENT '转让给谁的姓名',
  `is_current_owner` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否当前主人',
  `ownership_duration_days` int(11) DEFAULT NULL COMMENT '拥有天数',
  `care_quality_rating` tinyint(1) DEFAULT NULL COMMENT '照料质量评分 1-5分',
  `relationship_notes` text DEFAULT NULL COMMENT '关系备注',
  `contact_allowed` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否允许联系',
  `emergency_contact` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否紧急联系人',
  `pet_name` varchar(100) DEFAULT NULL COMMENT '宠物名称(冗余字段)',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`history_id`),
  INDEX `idx_pet_id` (`pet_id`),
  INDEX `idx_owner_ruid` (`owner_ruid`),
  INDEX `idx_adoption_date` (`adoption_date`),
  INDEX `idx_transfer_date` (`transfer_date`),
  INDEX `idx_is_current_owner` (`is_current_owner`),
  INDEX `idx_deleted` (`deleted`),
  FOREIGN KEY (`pet_id`) REFERENCES `L_pets` (`pet_id`) ON DELETE CASCADE,
  FOREIGN KEY (`owner_ruid`) REFERENCES `L_raiser_users` (`ruid`) ON DELETE CASCADE,
  FOREIGN KEY (`transfer_to_ruid`) REFERENCES `L_raiser_users` (`ruid`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='宠物历代领养人信息表';

-- 宠物年龄换算规则表
DROP TABLE IF EXISTS `L_pet_age_conversion`;
CREATE TABLE `L_pet_age_conversion` (
  `conversion_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '换算规则ID',
  `species` varchar(50) NOT NULL COMMENT '物种类型',
  `pet_age_months` int(11) NOT NULL COMMENT '宠物年龄(月)',
  `human_equivalent_age` decimal(5,2) NOT NULL COMMENT '相当于人类年龄',
  `growth_stage` varchar(50) NOT NULL COMMENT '成长阶段 newborn:新生儿 infant:幼儿 juvenile:少年 adult:成年 senior:老年',
  `conversion_formula` varchar(200) DEFAULT NULL COMMENT '换算公式',
  `notes` text DEFAULT NULL COMMENT '备注说明',
  `is_active` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`conversion_id`),
  UNIQUE KEY `uk_species_age` (`species`, `pet_age_months`),
  INDEX `idx_species` (`species`),
  INDEX `idx_growth_stage` (`growth_stage`),
  INDEX `idx_is_active` (`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='宠物年龄换算规则表';

-- 宠物成长记录表
DROP TABLE IF EXISTS `L_pet_growth_records`;
CREATE TABLE `L_pet_growth_records` (
  `record_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `pet_id` bigint(20) NOT NULL COMMENT '宠物ID',
  `growth_stage` varchar(50) NOT NULL COMMENT '成长阶段 newborn:新生儿 infant:幼儿 juvenile:少年 adult:成年 senior:老年',
  `record_date` date NOT NULL COMMENT '记录日期',
  `age_months` int(11) NOT NULL COMMENT '年龄(月)',
  `weight` decimal(5,2) DEFAULT NULL COMMENT '体重(kg)',
  `height` decimal(5,2) DEFAULT NULL COMMENT '身高(cm)',
  `length` decimal(5,2) DEFAULT NULL COMMENT '体长(cm)',
  `development_notes` text DEFAULT NULL COMMENT '发育情况记录',
  `behavioral_changes` text DEFAULT NULL COMMENT '行为变化记录',
  `health_status` varchar(100) DEFAULT NULL COMMENT '健康状况',
  `milestone_achieved` varchar(500) DEFAULT NULL COMMENT '达成的里程碑',
  `photos` text DEFAULT NULL COMMENT '照片URLs(JSON格式)',
  `veterinarian_notes` text DEFAULT NULL COMMENT '兽医备注',
  `next_checkup_date` date DEFAULT NULL COMMENT '下次检查日期',
  `visibility` tinyint(1) NOT NULL DEFAULT '1' COMMENT '可见性 1:仅自己 2:情侣可见 3:公开',
  `pet_name` varchar(100) DEFAULT NULL COMMENT '宠物名称(冗余字段)',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`record_id`),
  INDEX `idx_pet_id` (`pet_id`),
  INDEX `idx_growth_stage` (`growth_stage`),
  INDEX `idx_record_date` (`record_date`),
  INDEX `idx_age_months` (`age_months`),
  INDEX `idx_next_checkup_date` (`next_checkup_date`),
  INDEX `idx_visibility` (`visibility`),
  INDEX `idx_deleted` (`deleted`),
  FOREIGN KEY (`pet_id`) REFERENCES `L_pets` (`pet_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='宠物成长记录表';

-- 宠物历代领养人信息表
DROP TABLE IF EXISTS `L_pet_adoption_history`;
CREATE TABLE `L_pet_adoption_history` (
  `history_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '历史记录ID',
  `pet_id` bigint(20) NOT NULL COMMENT '宠物ID',
  `owner_ruid` bigint(20) NOT NULL COMMENT '领养人ID',
  `owner_name` varchar(100) NOT NULL COMMENT '领养人姓名',
  `owner_phone` varchar(20) DEFAULT NULL COMMENT '领养人电话',
  `owner_address` varchar(500) DEFAULT NULL COMMENT '领养人地址',
  `adoption_date` date NOT NULL COMMENT '领养开始日期',
  `transfer_date` date DEFAULT NULL COMMENT '转让日期',
  `transfer_reason` varchar(500) DEFAULT NULL COMMENT '转让原因',
  `transfer_to_ruid` bigint(20) DEFAULT NULL COMMENT '转让给谁的ID',
  `transfer_to_name` varchar(100) DEFAULT NULL COMMENT '转让给谁的姓名',
  `is_current_owner` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否当前主人',
  `ownership_duration_days` int(11) DEFAULT NULL COMMENT '拥有天数',
  `care_quality_rating` tinyint(1) DEFAULT NULL COMMENT '照料质量评分 1-5分',
  `relationship_notes` text DEFAULT NULL COMMENT '关系备注',
  `contact_allowed` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否允许联系',
  `emergency_contact` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否紧急联系人',
  `pet_name` varchar(100) DEFAULT NULL COMMENT '宠物名称(冗余字段)',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`history_id`),
  INDEX `idx_pet_id` (`pet_id`),
  INDEX `idx_owner_ruid` (`owner_ruid`),
  INDEX `idx_adoption_date` (`adoption_date`),
  INDEX `idx_transfer_date` (`transfer_date`),
  INDEX `idx_is_current_owner` (`is_current_owner`),
  INDEX `idx_deleted` (`deleted`),
  FOREIGN KEY (`pet_id`) REFERENCES `L_pets` (`pet_id`) ON DELETE CASCADE,
  FOREIGN KEY (`owner_ruid`) REFERENCES `L_raiser_users` (`ruid`) ON DELETE CASCADE,
  FOREIGN KEY (`transfer_to_ruid`) REFERENCES `L_raiser_users` (`ruid`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='宠物历代领养人信息表';

-- 宠物年龄换算规则表
DROP TABLE IF EXISTS `L_pet_age_conversion`;
CREATE TABLE `L_pet_age_conversion` (
  `conversion_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '换算规则ID',
  `species` varchar(50) NOT NULL COMMENT '物种类型',
  `pet_age_months` int(11) NOT NULL COMMENT '宠物年龄(月)',
  `human_equivalent_age` decimal(5,2) NOT NULL COMMENT '相当于人类年龄',
  `growth_stage` varchar(50) NOT NULL COMMENT '成长阶段 newborn:新生儿 infant:幼儿 juvenile:少年 adult:成年 senior:老年',
  `conversion_formula` varchar(200) DEFAULT NULL COMMENT '换算公式',
  `notes` text DEFAULT NULL COMMENT '备注说明',
  `is_active` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`conversion_id`),
  UNIQUE KEY `uk_species_age` (`species`, `pet_age_months`),
  INDEX `idx_species` (`species`),
  INDEX `idx_growth_stage` (`growth_stage`),
  INDEX `idx_is_active` (`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='宠物年龄换算规则表';

-- =============================================
-- 纪念日管理相关表
-- =============================================

-- 宠物纪念日表
DROP TABLE IF EXISTS `L_pet_anniversaries`;
CREATE TABLE `L_pet_anniversaries` (
  `anniversary_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '纪念日ID',
  `pet_id` bigint(20) NOT NULL COMMENT '宠物ID',
  `anniversary_type` varchar(50) NOT NULL COMMENT '纪念日类型 birthday:生日 adoption:领养日 first_meet:初次见面 vaccination:疫苗接种 surgery:手术 recovery:康复 achievement:成就 other:其他',
  `anniversary_name` varchar(200) NOT NULL COMMENT '纪念日名称',
  `anniversary_date` date NOT NULL COMMENT '纪念日日期',
  `is_recurring` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否每年重复',
  `description` text DEFAULT NULL COMMENT '纪念日描述',
  `importance_level` tinyint(1) NOT NULL DEFAULT '3' COMMENT '重要程度 1:一般 2:重要 3:非常重要 4:特别重要 5:最重要',
  `celebration_plan` text DEFAULT NULL COMMENT '庆祝计划',
  `photos` text DEFAULT NULL COMMENT '纪念照片URLs(JSON格式)',
  `memories` text DEFAULT NULL COMMENT '回忆记录',
  `gifts_given` text DEFAULT NULL COMMENT '赠送礼物记录',
  `location` varchar(200) DEFAULT NULL COMMENT '庆祝地点',
  `participants` varchar(500) DEFAULT NULL COMMENT '参与者',
  `reminder_days_before` int(11) DEFAULT '7' COMMENT '提前提醒天数',
  `is_reminder_enabled` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用提醒',
  `last_celebrated_year` int(11) DEFAULT NULL COMMENT '最后庆祝年份',
  `celebration_count` int(11) NOT NULL DEFAULT '0' COMMENT '庆祝次数',
  `visibility` tinyint(1) NOT NULL DEFAULT '1' COMMENT '可见性 1:仅自己 2:情侣可见 3:公开',
  `pet_name` varchar(100) DEFAULT NULL COMMENT '宠物名称(冗余字段)',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`anniversary_id`),
  INDEX `idx_pet_id` (`pet_id`),
  INDEX `idx_anniversary_type` (`anniversary_type`),
  INDEX `idx_anniversary_date` (`anniversary_date`),
  INDEX `idx_is_recurring` (`is_recurring`),
  INDEX `idx_importance_level` (`importance_level`),
  INDEX `idx_is_reminder_enabled` (`is_reminder_enabled`),
  INDEX `idx_visibility` (`visibility`),
  INDEX `idx_deleted` (`deleted`),
  FOREIGN KEY (`pet_id`) REFERENCES `L_pets` (`pet_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='宠物纪念日表';

-- 情侣纪念日表
DROP TABLE IF EXISTS `L_couple_anniversaries`;
CREATE TABLE `L_couple_anniversaries` (
  `anniversary_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '纪念日ID',
  `relation_id` bigint(20) NOT NULL COMMENT '情侣关系ID',
  `anniversary_type` varchar(50) NOT NULL COMMENT '纪念日类型 first_meet:初次见面 first_date:第一次约会 relationship_start:恋爱开始 engagement:订婚 marriage:结婚 move_in:同居 pet_adoption:共同领养宠物 other:其他',
  `anniversary_name` varchar(200) NOT NULL COMMENT '纪念日名称',
  `anniversary_date` date NOT NULL COMMENT '纪念日日期',
  `is_recurring` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否每年重复',
  `description` text DEFAULT NULL COMMENT '纪念日描述',
  `importance_level` tinyint(1) NOT NULL DEFAULT '3' COMMENT '重要程度 1:一般 2:重要 3:非常重要 4:特别重要 5:最重要',
  `celebration_plan` text DEFAULT NULL COMMENT '庆祝计划',
  `photos` text DEFAULT NULL COMMENT '纪念照片URLs(JSON格式)',
  `memories` text DEFAULT NULL COMMENT '回忆记录',
  `gifts_exchanged` text DEFAULT NULL COMMENT '互赠礼物记录',
  `location` varchar(200) DEFAULT NULL COMMENT '庆祝地点',
  `special_meaning` text DEFAULT NULL COMMENT '特殊意义',
  `reminder_days_before` int(11) DEFAULT '7' COMMENT '提前提醒天数',
  `is_reminder_enabled` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用提醒',
  `last_celebrated_year` int(11) DEFAULT NULL COMMENT '最后庆祝年份',
  `celebration_count` int(11) NOT NULL DEFAULT '0' COMMENT '庆祝次数',
  `visibility` tinyint(1) NOT NULL DEFAULT '2' COMMENT '可见性 1:仅自己 2:情侣可见 3:公开',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`anniversary_id`),
  INDEX `idx_relation_id` (`relation_id`),
  INDEX `idx_anniversary_type` (`anniversary_type`),
  INDEX `idx_anniversary_date` (`anniversary_date`),
  INDEX `idx_is_recurring` (`is_recurring`),
  INDEX `idx_importance_level` (`importance_level`),
  INDEX `idx_is_reminder_enabled` (`is_reminder_enabled`),
  INDEX `idx_visibility` (`visibility`),
  INDEX `idx_deleted` (`deleted`),
  FOREIGN KEY (`relation_id`) REFERENCES `L_couple_relations` (`relation_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='情侣纪念日表';

-- 纪念日提醒表
DROP TABLE IF EXISTS `L_anniversary_reminders`;
CREATE TABLE `L_anniversary_reminders` (
  `reminder_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '提醒ID',
  `anniversary_type` varchar(20) NOT NULL COMMENT '纪念日类型 pet:宠物纪念日 couple:情侣纪念日',
  `anniversary_id` bigint(20) NOT NULL COMMENT '纪念日ID',
  `ruid` bigint(20) NOT NULL COMMENT '用户ID',
  `reminder_date` date NOT NULL COMMENT '提醒日期',
  `reminder_time` time DEFAULT '09:00:00' COMMENT '提醒时间',
  `reminder_title` varchar(200) NOT NULL COMMENT '提醒标题',
  `reminder_content` text DEFAULT NULL COMMENT '提醒内容',
  `reminder_method` varchar(50) NOT NULL DEFAULT 'system' COMMENT '提醒方式 system:系统通知 email:邮件 sms:短信 wechat:微信',
  `is_sent` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已发送',
  `sent_time` datetime DEFAULT NULL COMMENT '发送时间',
  `is_read` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已读',
  `read_time` datetime DEFAULT NULL COMMENT '阅读时间',
  `response_action` varchar(100) DEFAULT NULL COMMENT '响应操作',
  `snooze_until` datetime DEFAULT NULL COMMENT '延迟到',
  `priority_level` tinyint(1) NOT NULL DEFAULT '3' COMMENT '优先级 1:低 2:一般 3:高 4:紧急 5:最高',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`reminder_id`),
  INDEX `idx_anniversary_type_id` (`anniversary_type`, `anniversary_id`),
  INDEX `idx_ruid` (`ruid`),
  INDEX `idx_reminder_date` (`reminder_date`),
  INDEX `idx_is_sent` (`is_sent`),
  INDEX `idx_is_read` (`is_read`),
  INDEX `idx_priority_level` (`priority_level`),
  INDEX `idx_deleted` (`deleted`),
  FOREIGN KEY (`ruid`) REFERENCES `L_raiser_users` (`ruid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='纪念日提醒表';

-- =============================================
-- 购买物品时间价值相关表
-- =============================================

-- 宠物用品购买记录表
DROP TABLE IF EXISTS `L_pet_product_purchases`;
CREATE TABLE `L_pet_product_purchases` (
  `purchase_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '购买记录ID',
  `pet_id` bigint(20) DEFAULT NULL COMMENT '宠物ID',
  `ruid` bigint(20) NOT NULL COMMENT '购买者ID',
  `product_name` varchar(200) NOT NULL COMMENT '商品名称',
  `product_category` varchar(100) DEFAULT NULL COMMENT '商品分类',
  `brand_name` varchar(100) DEFAULT NULL COMMENT '品牌名称',
  `product_model` varchar(100) DEFAULT NULL COMMENT '型号规格',
  `purchase_date` date NOT NULL COMMENT '购买日期',
  `purchase_price` decimal(10,2) NOT NULL COMMENT '购买价格',
  `quantity` int(11) NOT NULL DEFAULT '1' COMMENT '购买数量',
  `total_amount` decimal(10,2) NOT NULL COMMENT '总金额',
  `currency` varchar(10) NOT NULL DEFAULT 'CNY' COMMENT '货币类型',
  `purchase_channel` varchar(100) DEFAULT NULL COMMENT '购买渠道',
  `store_name` varchar(200) DEFAULT NULL COMMENT '商店名称',
  `order_number` varchar(100) DEFAULT NULL COMMENT '订单号',
  `receipt_photo` varchar(500) DEFAULT NULL COMMENT '收据照片URL',
  `product_photos` text DEFAULT NULL COMMENT '商品照片URLs(JSON格式)',
  `purchase_reason` text DEFAULT NULL COMMENT '购买原因',
  `expected_usage` text DEFAULT NULL COMMENT '预期用途',
  `warranty_period` int(11) DEFAULT NULL COMMENT '保修期(月)',
  `warranty_end_date` date DEFAULT NULL COMMENT '保修到期日期',
  `is_gift` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否礼品',
  `gift_from` varchar(100) DEFAULT NULL COMMENT '礼品来源',
  `usage_status` varchar(50) NOT NULL DEFAULT 'in_use' COMMENT '使用状态 in_use:使用中 stored:存放中 damaged:损坏 lost:丢失 discarded:丢弃',
  `satisfaction_rating` tinyint(1) DEFAULT NULL COMMENT '满意度评分 1-5分',
  `review_notes` text DEFAULT NULL COMMENT '使用评价',
  `repurchase_intention` tinyint(1) DEFAULT NULL COMMENT '复购意愿 1-5分',
  `visibility` tinyint(1) NOT NULL DEFAULT '1' COMMENT '可见性 1:仅自己 2:情侣可见 3:公开',
  `pet_name` varchar(100) DEFAULT NULL COMMENT '宠物名称(冗余字段)',
  `purchaser_nickname` varchar(50) DEFAULT NULL COMMENT '购买者昵称(冗余字段)',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`purchase_id`),
  INDEX `idx_pet_id` (`pet_id`),
  INDEX `idx_ruid` (`ruid`),
  INDEX `idx_purchase_date` (`purchase_date`),
  INDEX `idx_product_category` (`product_category`),
  INDEX `idx_brand_name` (`brand_name`),
  INDEX `idx_usage_status` (`usage_status`),
  INDEX `idx_satisfaction_rating` (`satisfaction_rating`),
  INDEX `idx_visibility` (`visibility`),
  INDEX `idx_deleted` (`deleted`),
  FOREIGN KEY (`pet_id`) REFERENCES `L_pets` (`pet_id`) ON DELETE SET NULL,
  FOREIGN KEY (`ruid`) REFERENCES `L_raiser_users` (`ruid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='宠物用品购买记录表';

-- 物品价值评估表
DROP TABLE IF EXISTS `L_product_value_assessments`;
CREATE TABLE `L_product_value_assessments` (
  `assessment_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '评估ID',
  `purchase_id` bigint(20) NOT NULL COMMENT '购买记录ID',
  `assessment_date` date NOT NULL COMMENT '评估日期',
  `assessment_type` varchar(50) NOT NULL COMMENT '评估类型 periodic:定期评估 damage:损坏评估 resale:转售评估 insurance:保险评估 disposal:处置评估',
  `current_value` decimal(10,2) NOT NULL COMMENT '当前价值',
  `depreciation_rate` decimal(5,2) DEFAULT NULL COMMENT '折旧率(%)',
  `condition_rating` tinyint(1) NOT NULL COMMENT '物品状况评分 1:很差 2:较差 3:一般 4:良好 5:优秀',
  `usage_frequency` varchar(50) DEFAULT NULL COMMENT '使用频率 daily:每日 weekly:每周 monthly:每月 rarely:很少 never:从未',
  `wear_level` tinyint(1) DEFAULT NULL COMMENT '磨损程度 1:无磨损 2:轻微 3:中等 4:严重 5:极严重',
  `functionality_status` varchar(100) DEFAULT NULL COMMENT '功能状态',
  `market_price` decimal(10,2) DEFAULT NULL COMMENT '市场参考价格',
  `replacement_cost` decimal(10,2) DEFAULT NULL COMMENT '替换成本',
  `assessment_notes` text DEFAULT NULL COMMENT '评估备注',
  `photos` text DEFAULT NULL COMMENT '评估照片URLs(JSON格式)',
  `assessor_type` varchar(50) NOT NULL DEFAULT 'owner' COMMENT '评估者类型 owner:主人 professional:专业评估师 system:系统评估',
  `assessor_name` varchar(100) DEFAULT NULL COMMENT '评估者姓名',
  `next_assessment_date` date DEFAULT NULL COMMENT '下次评估日期',
  `visibility` tinyint(1) NOT NULL DEFAULT '1' COMMENT '可见性 1:仅自己 2:情侣可见 3:公开',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`assessment_id`),
  INDEX `idx_purchase_id` (`purchase_id`),
  INDEX `idx_assessment_date` (`assessment_date`),
  INDEX `idx_assessment_type` (`assessment_type`),
  INDEX `idx_condition_rating` (`condition_rating`),
  INDEX `idx_next_assessment_date` (`next_assessment_date`),
  INDEX `idx_visibility` (`visibility`),
  INDEX `idx_deleted` (`deleted`),
  FOREIGN KEY (`purchase_id`) REFERENCES `L_pet_product_purchases` (`purchase_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='物品价值评估表';

-- 购买决策记录表
DROP TABLE IF EXISTS `L_purchase_decisions`;
CREATE TABLE `L_purchase_decisions` (
  `decision_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '决策ID',
  `purchase_id` bigint(20) DEFAULT NULL COMMENT '购买记录ID(购买后关联)',
  `ruid` bigint(20) NOT NULL COMMENT '决策者ID',
  `product_name` varchar(200) NOT NULL COMMENT '考虑的商品名称',
  `decision_date` date NOT NULL COMMENT '决策日期',
  `decision_status` varchar(50) NOT NULL COMMENT '决策状态 considering:考虑中 decided_buy:决定购买 decided_not_buy:决定不买 postponed:推迟 cancelled:取消',
  `need_urgency` tinyint(1) NOT NULL DEFAULT '3' COMMENT '需求紧急程度 1:不急 2:一般 3:较急 4:紧急 5:非常紧急',
  `budget_range_min` decimal(10,2) DEFAULT NULL COMMENT '预算范围最小值',
  `budget_range_max` decimal(10,2) DEFAULT NULL COMMENT '预算范围最大值',
  `research_duration_days` int(11) DEFAULT NULL COMMENT '研究时长(天)',
  `alternatives_considered` text DEFAULT NULL COMMENT '考虑的替代品',
  `decision_factors` text DEFAULT NULL COMMENT '决策因素',
  `pros_and_cons` text DEFAULT NULL COMMENT '优缺点分析',
  `influencing_reviews` text DEFAULT NULL COMMENT '影响决策的评价',
  `consultation_sources` varchar(500) DEFAULT NULL COMMENT '咨询来源',
  `final_decision_reason` text DEFAULT NULL COMMENT '最终决策原因',
  `satisfaction_with_process` tinyint(1) DEFAULT NULL COMMENT '决策过程满意度 1-5分',
  `would_decide_same_again` tinyint(1) DEFAULT NULL COMMENT '是否会再次做同样决策 0:否 1:是',
  `lessons_learned` text DEFAULT NULL COMMENT '经验教训',
  `decision_timeline` text DEFAULT NULL COMMENT '决策时间线(JSON格式)',
  `visibility` tinyint(1) NOT NULL DEFAULT '1' COMMENT '可见性 1:仅自己 2:情侣可见 3:公开',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`decision_id`),
  INDEX `idx_purchase_id` (`purchase_id`),
  INDEX `idx_ruid` (`ruid`),
  INDEX `idx_decision_date` (`decision_date`),
  INDEX `idx_decision_status` (`decision_status`),
  INDEX `idx_need_urgency` (`need_urgency`),
  INDEX `idx_visibility` (`visibility`),
  INDEX `idx_deleted` (`deleted`),
  FOREIGN KEY (`purchase_id`) REFERENCES `L_pet_product_purchases` (`purchase_id`) ON DELETE SET NULL,
  FOREIGN KEY (`ruid`) REFERENCES `L_raiser_users` (`ruid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='购买决策记录表';

-- =============================================
-- 3. 宠物健康管理相关表
-- =============================================

-- 疫苗类型表
DROP TABLE IF EXISTS `L_vaccine_types`;
CREATE TABLE `L_vaccine_types` (
  `vaccine_type_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '疫苗类型ID',
  `vaccine_name` varchar(100) NOT NULL COMMENT '疫苗名称',
  `species` varchar(50) NOT NULL COMMENT '适用物种',
  `manufacturer` varchar(100) DEFAULT NULL COMMENT '生产厂家',
  `description` text DEFAULT NULL COMMENT '疫苗描述',
  `interval_months` int(11) DEFAULT NULL COMMENT '接种间隔(月)',
  `is_required` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否必须接种',
  `is_active` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`vaccine_type_id`),
  INDEX `idx_species` (`species`),
  INDEX `idx_is_active` (`is_active`),
  INDEX `idx_deleted` (`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='疫苗类型表';

-- 疫苗接种记录表
DROP TABLE IF EXISTS `L_vaccine_records`;
CREATE TABLE `L_vaccine_records` (
  `record_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `pet_id` bigint(20) NOT NULL COMMENT '宠物ID',
  `vaccine_type_id` bigint(20) NOT NULL COMMENT '疫苗类型ID',
  `vaccine_name` varchar(100) NOT NULL COMMENT '疫苗名称',
  `batch_number` varchar(100) DEFAULT NULL COMMENT '疫苗批号',
  `vaccination_date` date NOT NULL COMMENT '接种日期',
  `next_due_date` date DEFAULT NULL COMMENT '下次接种日期',
  `veterinarian` varchar(100) DEFAULT NULL COMMENT '接种医生',
  `clinic_name` varchar(200) DEFAULT NULL COMMENT '诊所名称',
  `clinic_address` varchar(500) DEFAULT NULL COMMENT '诊所地址',
  `cost` decimal(10,2) DEFAULT NULL COMMENT '费用',
  `side_effects` text DEFAULT NULL COMMENT '不良反应',
  `notes` text DEFAULT NULL COMMENT '备注',
  `certificate_url` varchar(500) DEFAULT NULL COMMENT '接种证明照片URL',
  `reminder_sent` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已发送提醒',
  `visibility` tinyint(1) NOT NULL DEFAULT '1' COMMENT '可见性 1:仅自己 2:情侣可见',
  `pet_name` varchar(100) DEFAULT NULL COMMENT '宠物名称(冗余字段)',
  `pet_species` varchar(50) DEFAULT NULL COMMENT '宠物物种(冗余字段)',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`record_id`),
  INDEX `idx_pet_id` (`pet_id`),
  INDEX `idx_vaccine_type_id` (`vaccine_type_id`),
  INDEX `idx_vaccination_date` (`vaccination_date`),
  INDEX `idx_next_due_date` (`next_due_date`),
  INDEX `idx_visibility` (`visibility`),
  INDEX `idx_deleted` (`deleted`),
  FOREIGN KEY (`pet_id`) REFERENCES `L_pets` (`pet_id`) ON DELETE CASCADE,
  FOREIGN KEY (`vaccine_type_id`) REFERENCES `L_vaccine_types` (`vaccine_type_id`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='疫苗接种记录表';

-- 体重记录表
DROP TABLE IF EXISTS `L_weight_records`;
CREATE TABLE `L_weight_records` (
  `record_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `pet_id` bigint(20) NOT NULL COMMENT '宠物ID',
  `weight` decimal(5,2) NOT NULL COMMENT '体重(kg)',
  `height` decimal(5,2) DEFAULT NULL COMMENT '身高(cm)',
  `body_condition_score` tinyint(1) DEFAULT NULL COMMENT '体况评分 1-9分',
  `measurement_date` datetime NOT NULL COMMENT '测量时间',
  `measurement_location` varchar(200) DEFAULT NULL COMMENT '测量地点',
  `notes` text DEFAULT NULL COMMENT '备注',
  `visibility` tinyint(1) NOT NULL DEFAULT '1' COMMENT '可见性 1:仅自己 2:情侣可见',
  `pet_name` varchar(100) DEFAULT NULL COMMENT '宠物名称(冗余字段)',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`record_id`),
  INDEX `idx_pet_id` (`pet_id`),
  INDEX `idx_measurement_date` (`measurement_date`),
  INDEX `idx_visibility` (`visibility`),
  INDEX `idx_deleted` (`deleted`),
  FOREIGN KEY (`pet_id`) REFERENCES `L_pets` (`pet_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='体重记录表';

-- 健康体征记录表
DROP TABLE IF EXISTS `L_health_records`;
CREATE TABLE `L_health_records` (
  `record_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `pet_id` bigint(20) NOT NULL COMMENT '宠物ID',
  `record_type` varchar(50) NOT NULL COMMENT '记录类型 temperature:体温 heart_rate:心率 blood_pressure:血压 other:其他',
  `value` varchar(100) NOT NULL COMMENT '数值',
  `unit` varchar(20) DEFAULT NULL COMMENT '单位',
  `normal_range_min` varchar(50) DEFAULT NULL COMMENT '正常范围最小值',
  `normal_range_max` varchar(50) DEFAULT NULL COMMENT '正常范围最大值',
  `is_abnormal` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否异常',
  `measurement_date` datetime NOT NULL COMMENT '测量时间',
  `measurement_method` varchar(100) DEFAULT NULL COMMENT '测量方法',
  `notes` text DEFAULT NULL COMMENT '备注',
  `alert_sent` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已发送预警',
  `visibility` tinyint(1) NOT NULL DEFAULT '1' COMMENT '可见性 1:仅自己 2:情侣可见',
  `pet_name` varchar(100) DEFAULT NULL COMMENT '宠物名称(冗余字段)',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`record_id`),
  INDEX `idx_pet_id` (`pet_id`),
  INDEX `idx_record_type` (`record_type`),
  INDEX `idx_measurement_date` (`measurement_date`),
  INDEX `idx_is_abnormal` (`is_abnormal`),
  INDEX `idx_visibility` (`visibility`),
  INDEX `idx_deleted` (`deleted`),
  FOREIGN KEY (`pet_id`) REFERENCES `L_pets` (`pet_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='健康体征记录表';

-- 异常情况记录表
DROP TABLE IF EXISTS `L_abnormal_records`;
CREATE TABLE `L_abnormal_records` (
  `record_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `pet_id` bigint(20) NOT NULL COMMENT '宠物ID',
  `abnormal_type` varchar(100) NOT NULL COMMENT '异常类型',
  `symptoms` text NOT NULL COMMENT '症状描述',
  `severity_level` tinyint(1) NOT NULL DEFAULT '1' COMMENT '严重程度 1:轻微 2:一般 3:严重 4:紧急',
  `occurrence_time` datetime NOT NULL COMMENT '发生时间',
  `duration` varchar(100) DEFAULT NULL COMMENT '持续时间',
  `trigger_factor` text DEFAULT NULL COMMENT '诱发因素',
  `treatment_taken` text DEFAULT NULL COMMENT '采取的治疗措施',
  `recovery_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '恢复状态 0:未恢复 1:好转 2:完全恢复',
  `photo_urls` text DEFAULT NULL COMMENT '相关照片URLs(JSON格式)',
  `veterinarian_consulted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否咨询兽医',
  `vet_advice` text DEFAULT NULL COMMENT '兽医建议',
  `follow_up_required` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否需要跟进',
  `follow_up_date` date DEFAULT NULL COMMENT '跟进日期',
  `notes` text DEFAULT NULL COMMENT '备注',
  `visibility` tinyint(1) NOT NULL DEFAULT '1' COMMENT '可见性 1:仅自己 2:情侣可见',
  `pet_name` varchar(100) DEFAULT NULL COMMENT '宠物名称(冗余字段)',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`record_id`),
  INDEX `idx_pet_id` (`pet_id`),
  INDEX `idx_severity_level` (`severity_level`),
  INDEX `idx_occurrence_time` (`occurrence_time`),
  INDEX `idx_recovery_status` (`recovery_status`),
  INDEX `idx_visibility` (`visibility`),
  INDEX `idx_deleted` (`deleted`),
  FOREIGN KEY (`pet_id`) REFERENCES `L_pets` (`pet_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='异常情况记录表';

-- =============================================
-- 4. 宠物护理活动相关表
-- =============================================

-- 护理活动类型表
DROP TABLE IF EXISTS `L_care_activity_types`;
CREATE TABLE `L_care_activity_types` (
  `type_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '类型ID',
  `type_name` varchar(100) NOT NULL COMMENT '类型名称',
  `category` varchar(50) NOT NULL COMMENT '分类 bathing:洗澡 grooming:美容 deworming:驱虫 nail_trimming:剪指甲 dental:口腔护理 other:其他',
  `default_interval_days` int(11) DEFAULT NULL COMMENT '默认间隔天数',
  `species` varchar(50) DEFAULT NULL COMMENT '适用物种',
  `description` text DEFAULT NULL COMMENT '描述',
  `is_active` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`type_id`),
  INDEX `idx_category` (`category`),
  INDEX `idx_species` (`species`),
  INDEX `idx_is_active` (`is_active`),
  INDEX `idx_deleted` (`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='护理活动类型表';

-- 护理活动记录表
DROP TABLE IF EXISTS `L_care_records`;
CREATE TABLE `L_care_records` (
  `record_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `pet_id` bigint(20) NOT NULL COMMENT '宠物ID',
  `activity_type_id` bigint(20) DEFAULT NULL COMMENT '活动类型ID',
  `activity_name` varchar(100) NOT NULL COMMENT '活动名称',
  `activity_date` datetime NOT NULL COMMENT '活动时间',
  `duration_minutes` int(11) DEFAULT NULL COMMENT '持续时间(分钟)',
  `location` varchar(200) DEFAULT NULL COMMENT '地点',
  `service_provider` varchar(200) DEFAULT NULL COMMENT '服务提供者',
  `cost` decimal(10,2) DEFAULT NULL COMMENT '费用',
  `products_used` text DEFAULT NULL COMMENT '使用的产品',
  `notes` text DEFAULT NULL COMMENT '备注',
  `next_due_date` date DEFAULT NULL COMMENT '下次应做时间',
  `photo_urls` text DEFAULT NULL COMMENT '相关照片URLs(JSON格式)',
  `rating` tinyint(1) DEFAULT NULL COMMENT '满意度评分 1-5分',
  `reminder_sent` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已发送提醒',
  `visibility` tinyint(1) NOT NULL DEFAULT '1' COMMENT '可见性 1:仅自己 2:情侣可见',
  `pet_name` varchar(100) DEFAULT NULL COMMENT '宠物名称(冗余字段)',
  `activity_type_name` varchar(100) DEFAULT NULL COMMENT '活动类型名称(冗余字段)',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`record_id`),
  INDEX `idx_pet_id` (`pet_id`),
  INDEX `idx_activity_type_id` (`activity_type_id`),
  INDEX `idx_activity_date` (`activity_date`),
  INDEX `idx_next_due_date` (`next_due_date`),
  INDEX `idx_visibility` (`visibility`),
  INDEX `idx_deleted` (`deleted`),
  FOREIGN KEY (`pet_id`) REFERENCES `L_pets` (`pet_id`) ON DELETE CASCADE,
  FOREIGN KEY (`activity_type_id`) REFERENCES `L_care_activity_types` (`type_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='护理活动记录表';

-- =============================================
-- 5. 宠物饮食管理相关表
-- =============================================

-- 食物品牌表
DROP TABLE IF EXISTS `L_food_brands`;
CREATE TABLE `L_food_brands` (
  `brand_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '品牌ID',
  `brand_name` varchar(100) NOT NULL COMMENT '品牌名称',
  `brand_country` varchar(50) DEFAULT NULL COMMENT '品牌国家',
  `brand_description` text DEFAULT NULL COMMENT '品牌描述',
  `official_website` varchar(500) DEFAULT NULL COMMENT '官方网站',
  `is_active` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`brand_id`),
  UNIQUE KEY `uk_brand_name` (`brand_name`),
  INDEX `idx_is_active` (`is_active`),
  INDEX `idx_deleted` (`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='食物品牌表';

-- 食物产品表
DROP TABLE IF EXISTS `L_food_products`;
CREATE TABLE `L_food_products` (
  `product_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '产品ID',
  `product_name` varchar(200) NOT NULL COMMENT '产品名称',
  `brand_id` bigint(20) DEFAULT NULL COMMENT '品牌ID',
  `product_type` varchar(50) NOT NULL COMMENT '产品类型 dry_food:干粮 wet_food:湿粮 treats:零食 supplement:营养品',
  `species` varchar(50) NOT NULL COMMENT '适用物种',
  `life_stage` varchar(50) DEFAULT NULL COMMENT '适用生命阶段 kitten:幼年 adult:成年 senior:老年 all:全龄',
  `flavor` varchar(100) DEFAULT NULL COMMENT '口味',
  `package_size` varchar(50) DEFAULT NULL COMMENT '包装规格',
  `nutritional_info` text DEFAULT NULL COMMENT '营养成分(JSON格式)',
  `ingredients` text DEFAULT NULL COMMENT '成分列表',
  `feeding_guide` text DEFAULT NULL COMMENT '喂食指南',
  `barcode` varchar(100) DEFAULT NULL COMMENT '条形码',
  `avg_price` decimal(10,2) DEFAULT NULL COMMENT '平均价格',
  `shelf_life_days` int(11) DEFAULT NULL COMMENT '保质期天数',
  `storage_requirements` varchar(200) DEFAULT NULL COMMENT '储存要求',
  `allergen_info` varchar(500) DEFAULT NULL COMMENT '过敏原信息',
  `is_active` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  `ruid_nickname` varchar(50) DEFAULT NULL COMMENT '用户昵称(冗余字段)',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`product_id`),
  INDEX `idx_brand_id` (`brand_id`),
  INDEX `idx_product_type` (`product_type`),
  INDEX `idx_species` (`species`),
  INDEX `idx_shelf_life_days` (`shelf_life_days`),
  INDEX `idx_is_active` (`is_active`),
  INDEX `idx_deleted` (`deleted`),
  FOREIGN KEY (`brand_id`) REFERENCES `L_food_brands` (`brand_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='食物产品表';

-- 喂食记录表
DROP TABLE IF EXISTS `L_feeding_records`;
CREATE TABLE `L_feeding_records` (
  `record_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `pet_id` bigint(20) NOT NULL COMMENT '宠物ID',
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品ID',
  `food_name` varchar(200) NOT NULL COMMENT '食物名称',
  `brand_name` varchar(100) DEFAULT NULL COMMENT '品牌名称',
  `feeding_time` datetime NOT NULL COMMENT '喂食时间',
  `amount` decimal(8,2) NOT NULL COMMENT '喂食量',
  `amount_unit` varchar(20) NOT NULL DEFAULT 'g' COMMENT '计量单位 g:克 ml:毫升 cup:杯 piece:粒',
  `feeding_type` varchar(50) NOT NULL COMMENT '喂食类型 main_meal:正餐 snack:零食 supplement:营养品',
  `food_type` varchar(50) DEFAULT NULL COMMENT '食物类型 dry_food:干粮 wet_food:湿粮 treats:零食',
  `expiry_date` date DEFAULT NULL COMMENT '保质期',
  `batch_number` varchar(100) DEFAULT NULL COMMENT '批次号',
  `pet_appetite` tinyint(1) DEFAULT NULL COMMENT '宠物食欲 1:很差 2:一般 3:良好 4:很好 5:极佳',
  `finished_amount` decimal(8,2) DEFAULT NULL COMMENT '实际吃完量',
  `leftover_amount` decimal(8,2) DEFAULT NULL COMMENT '剩余量',
  `notes` text DEFAULT NULL COMMENT '备注',
  `visibility` tinyint(1) NOT NULL DEFAULT '1' COMMENT '可见性 1:仅自己 2:情侣可见',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`record_id`),
  INDEX `idx_pet_id` (`pet_id`),
  INDEX `idx_product_id` (`product_id`),
  INDEX `idx_feeding_time` (`feeding_time`),
  INDEX `idx_feeding_type` (`feeding_type`),
  INDEX `idx_visibility` (`visibility`),
  FOREIGN KEY (`pet_id`) REFERENCES `L_pets` (`pet_id`) ON DELETE CASCADE,
  FOREIGN KEY (`product_id`) REFERENCES `L_food_products` (`product_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='喂食记录表';

-- 排泄记录表
DROP TABLE IF EXISTS `L_excretion_records`;
CREATE TABLE `L_excretion_records` (
  `record_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `pet_id` bigint(20) NOT NULL COMMENT '宠物ID',
  `excretion_time` datetime NOT NULL COMMENT '排泄时间',
  `excretion_type` varchar(20) NOT NULL COMMENT '排泄类型 urine:小便 feces:大便 both:两者',
  `location` varchar(200) DEFAULT NULL COMMENT '排泄地点',
  `consistency` varchar(50) DEFAULT NULL COMMENT '性状 liquid:稀 soft:软 normal:正常 hard:硬 dry:干',
  `color` varchar(50) DEFAULT NULL COMMENT '颜色',
  `volume` varchar(50) DEFAULT NULL COMMENT '量 small:少 normal:正常 large:多',
  `odor` varchar(50) DEFAULT NULL COMMENT '气味 normal:正常 strong:强烈 unusual:异常',
  `blood_present` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有血',
  `mucus_present` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有粘液',
  `is_abnormal` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否异常',
  `notes` text DEFAULT NULL COMMENT '备注',
  `photo_url` varchar(500) DEFAULT NULL COMMENT '照片URL',
  `visibility` tinyint(1) NOT NULL DEFAULT '1' COMMENT '可见性 1:仅自己 2:情侣可见',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`record_id`),
  INDEX `idx_pet_id` (`pet_id`),
  INDEX `idx_excretion_time` (`excretion_time`),
  INDEX `idx_excretion_type` (`excretion_type`),
  INDEX `idx_is_abnormal` (`is_abnormal`),
  INDEX `idx_visibility` (`visibility`),
  FOREIGN KEY (`pet_id`) REFERENCES `L_pets` (`pet_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='排泄记录表';

-- =============================================
-- 6. 宠物用品管理相关表
-- =============================================

-- 用品分类表
DROP TABLE IF EXISTS `L_product_categories`;
CREATE TABLE `L_product_categories` (
  `category_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `category_name` varchar(100) NOT NULL COMMENT '分类名称',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父分类ID',
  `category_code` varchar(50) DEFAULT NULL COMMENT '分类编码',
  `description` text DEFAULT NULL COMMENT '分类描述',
  `sort_order` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `is_active` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`category_id`),
  INDEX `idx_parent_id` (`parent_id`),
  INDEX `idx_sort_order` (`sort_order`),
  INDEX `idx_is_active` (`is_active`),
  FOREIGN KEY (`parent_id`) REFERENCES `L_product_categories` (`category_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用品分类表';

-- 宠物用品表
DROP TABLE IF EXISTS `L_pet_products`;
CREATE TABLE `L_pet_products` (
  `product_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用品ID',
  `product_name` varchar(200) NOT NULL COMMENT '用品名称',
  `category_id` bigint(20) DEFAULT NULL COMMENT '分类ID',
  `brand_name` varchar(100) DEFAULT NULL COMMENT '品牌',
  `model` varchar(100) DEFAULT NULL COMMENT '型号',
  `specifications` text DEFAULT NULL COMMENT '规格说明',
  `material` varchar(200) DEFAULT NULL COMMENT '材质',
  `color` varchar(50) DEFAULT NULL COMMENT '颜色',
  `size` varchar(50) DEFAULT NULL COMMENT '尺寸',
  `weight` decimal(8,2) DEFAULT NULL COMMENT '重量(g)',
  `purchase_date` date DEFAULT NULL COMMENT '购买日期',
  `purchase_price` decimal(10,2) DEFAULT NULL COMMENT '购买价格',
  `purchase_location` varchar(200) DEFAULT NULL COMMENT '购买地点',
  `warranty_period` int(11) DEFAULT NULL COMMENT '保修期(月)',
  `expiry_date` date DEFAULT NULL COMMENT '过期日期',
  `status` varchar(50) NOT NULL DEFAULT 'normal' COMMENT '状态 normal:正常 damaged:损坏 lost:丢失 disposed:已处理',
  `usage_frequency` varchar(50) DEFAULT NULL COMMENT '使用频率 daily:每日 weekly:每周 monthly:每月 rarely:很少',
  `description` text DEFAULT NULL COMMENT '描述',
  `photo_urls` text DEFAULT NULL COMMENT '照片URLs(JSON格式)',
  `purchase_receipt_url` varchar(500) DEFAULT NULL COMMENT '购买凭证URL',
  `visibility` tinyint(1) NOT NULL DEFAULT '1' COMMENT '可见性 1:仅自己 2:情侣可见',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`product_id`),
  INDEX `idx_category_id` (`category_id`),
  INDEX `idx_purchase_date` (`purchase_date`),
  INDEX `idx_status` (`status`),
  INDEX `idx_visibility` (`visibility`),
  FOREIGN KEY (`category_id`) REFERENCES `L_product_categories` (`category_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='宠物用品表';

-- =============================================
-- 7. 消费记录相关表
-- =============================================

-- 消费分类表
DROP TABLE IF EXISTS `L_expense_categories`;
CREATE TABLE `L_expense_categories` (
  `category_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `category_name` varchar(100) NOT NULL COMMENT '分类名称',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父分类ID',
  `category_type` varchar(50) NOT NULL COMMENT '分类类型 pet:宠物相关 relationship:恋爱相关 other:其他',
  `is_pet_related` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否宠物相关',
  `icon` varchar(100) DEFAULT NULL COMMENT '图标',
  `color` varchar(20) DEFAULT NULL COMMENT '颜色',
  `sort_order` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `is_active` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`category_id`),
  INDEX `idx_parent_id` (`parent_id`),
  INDEX `idx_category_type` (`category_type`),
  INDEX `idx_is_pet_related` (`is_pet_related`),
  INDEX `idx_sort_order` (`sort_order`),
  INDEX `idx_is_active` (`is_active`),
  FOREIGN KEY (`parent_id`) REFERENCES `L_expense_categories` (`category_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='消费分类表';

-- 消费记录表
DROP TABLE IF EXISTS `L_expense_records`;
CREATE TABLE `L_expense_records` (
  `record_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `ruid` bigint(20) NOT NULL COMMENT '饲养者用户ID',
  `pet_id` bigint(20) DEFAULT NULL COMMENT '关联宠物ID',
  `category_id` bigint(20) DEFAULT NULL COMMENT '分类ID',
  `expense_title` varchar(200) NOT NULL COMMENT '消费标题',
  `amount` decimal(12,2) NOT NULL COMMENT '金额',
  `currency` varchar(10) NOT NULL DEFAULT 'CNY' COMMENT '货币类型',
  `expense_date` datetime NOT NULL COMMENT '消费时间',
  `payment_method` varchar(50) DEFAULT NULL COMMENT '支付方式 cash:现金 card:银行卡 wechat:微信 alipay:支付宝 credit_card:信用卡 other:其他',
  `merchant_name` varchar(200) DEFAULT NULL COMMENT '商家名称',
  `merchant_address` varchar(500) DEFAULT NULL COMMENT '商家地址',
  `merchant_phone` varchar(20) DEFAULT NULL COMMENT '商家电话',
  `expense_type` varchar(50) NOT NULL DEFAULT 'personal' COMMENT '消费类型 personal:个人 shared:共同 gift:礼物 emergency:紧急',
  `sharing_ratio` varchar(50) DEFAULT NULL COMMENT '分摊比例 50:50, 60:40等',
  `shared_with_ruid` bigint(20) DEFAULT NULL COMMENT '共享饲养者ID',
  `actual_payer_ruid` bigint(20) DEFAULT NULL COMMENT '实际付款人ID',
  `reimbursement_status` varchar(50) NOT NULL DEFAULT 'none' COMMENT '报销状态 none:无需报销 pending:待报销 approved:已报销 rejected:已拒绝',
  `reimbursement_amount` decimal(12,2) DEFAULT NULL COMMENT '报销金额',
  `invoice_number` varchar(100) DEFAULT NULL COMMENT '发票号码',
  `invoice_url` varchar(500) DEFAULT NULL COMMENT '发票照片URL',
  `receipt_url` varchar(500) DEFAULT NULL COMMENT '收据照片URL',
  `warranty_info` varchar(500) DEFAULT NULL COMMENT '保修信息',
  `return_policy` varchar(500) DEFAULT NULL COMMENT '退换货政策',
  `description` text DEFAULT NULL COMMENT '消费描述',
  `tags` varchar(500) DEFAULT NULL COMMENT '标签(逗号分隔)',
  `location_info` varchar(500) DEFAULT NULL COMMENT '消费地点信息(JSON格式)',
  `weather_info` varchar(100) DEFAULT NULL COMMENT '天气信息',
  `mood_rating` tinyint(1) DEFAULT NULL COMMENT '消费时心情评分 1-5分',
  `necessity_level` tinyint(1) DEFAULT NULL COMMENT '必要性等级 1:非必需 2:一般 3:重要 4:紧急 5:必需',
  `satisfaction_rating` tinyint(1) DEFAULT NULL COMMENT '满意度评分 1-5分',
  `privacy_level` tinyint(1) NOT NULL DEFAULT '1' COMMENT '隐私级别 1:公开 2:情侣可见 3:仅自己',
  `is_hidden` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `is_recurring` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否定期消费',
  `recurring_period` varchar(50) DEFAULT NULL COMMENT '定期周期 monthly:月度 quarterly:季度 yearly:年度',
  `verification_required` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否需要核对',
  `verified_by_ruid` bigint(20) DEFAULT NULL COMMENT '核对人ID',
  `verified_time` datetime DEFAULT NULL COMMENT '核对时间',
  `verification_notes` varchar(500) DEFAULT NULL COMMENT '核对备注',
  `ruid_nickname` varchar(50) DEFAULT NULL COMMENT '用户昵称(冗余字段)',
  `pet_name` varchar(100) DEFAULT NULL COMMENT '宠物名称(冗余字段)',
  `category_name` varchar(100) DEFAULT NULL COMMENT '分类名称(冗余字段)',
  `shared_with_nickname` varchar(50) DEFAULT NULL COMMENT '共享用户昵称(冗余字段)',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`record_id`),
  INDEX `idx_ruid` (`ruid`),
  INDEX `idx_pet_id` (`pet_id`),
  INDEX `idx_category_id` (`category_id`),
  INDEX `idx_expense_date` (`expense_date`),
  INDEX `idx_expense_type` (`expense_type`),
  INDEX `idx_privacy_level` (`privacy_level`),
  INDEX `idx_shared_with_ruid` (`shared_with_ruid`),
  INDEX `idx_actual_payer_ruid` (`actual_payer_ruid`),
  INDEX `idx_reimbursement_status` (`reimbursement_status`),
  INDEX `idx_is_recurring` (`is_recurring`),
  INDEX `idx_deleted` (`deleted`),
  FOREIGN KEY (`ruid`) REFERENCES `L_raiser_users` (`ruid`) ON DELETE CASCADE,
  FOREIGN KEY (`pet_id`) REFERENCES `L_pets` (`pet_id`) ON DELETE SET NULL,
  FOREIGN KEY (`category_id`) REFERENCES `L_expense_categories` (`category_id`) ON DELETE SET NULL,
  FOREIGN KEY (`shared_with_ruid`) REFERENCES `L_raiser_users` (`ruid`) ON DELETE SET NULL,
  FOREIGN KEY (`actual_payer_ruid`) REFERENCES `L_raiser_users` (`ruid`) ON DELETE SET NULL,
  FOREIGN KEY (`verified_by_ruid`) REFERENCES `L_raiser_users` (`ruid`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='消费记录表';

-- =============================================
-- 8. 恋爱纪念相关表
-- =============================================

-- 恋爱纪念日表
DROP TABLE IF EXISTS `L_anniversaries`;
CREATE TABLE `L_anniversaries` (
  `anniversary_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '纪念日ID',
  `relation_id` bigint(20) NOT NULL COMMENT '关系ID',
  `anniversary_name` varchar(200) NOT NULL COMMENT '纪念日名称',
  `anniversary_date` date NOT NULL COMMENT '纪念日日期',
  `anniversary_type` varchar(50) NOT NULL COMMENT '纪念日类型 relationship:恋爱纪念 birthday:生日 holiday:节日 custom:自定义',
  `repeat_type` varchar(50) NOT NULL DEFAULT 'yearly' COMMENT '重复类型 none:不重复 yearly:每年 monthly:每月',
  `description` text DEFAULT NULL COMMENT '描述',
  `reminder_days` int(11) NOT NULL DEFAULT '1' COMMENT '提前提醒天数',
  `is_reminder_enabled` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用提醒',
  `celebration_plan` text DEFAULT NULL COMMENT '庆祝计划',
  `photo_urls` text DEFAULT NULL COMMENT '相关照片URLs(JSON格式)',
  `is_active` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`anniversary_id`),
  INDEX `idx_relation_id` (`relation_id`),
  INDEX `idx_anniversary_date` (`anniversary_date`),
  INDEX `idx_anniversary_type` (`anniversary_type`),
  INDEX `idx_is_active` (`is_active`),
  FOREIGN KEY (`relation_id`) REFERENCES `L_couple_relations` (`relation_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='恋爱纪念日表';

-- 约会记录表
DROP TABLE IF EXISTS `L_date_records`;
CREATE TABLE `L_date_records` (
  `date_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '约会ID',
  `relation_id` bigint(20) NOT NULL COMMENT '关系ID',
  `date_title` varchar(200) NOT NULL COMMENT '约会标题',
  `date_time` datetime NOT NULL COMMENT '约会时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `location` varchar(500) DEFAULT NULL COMMENT '约会地点',
  `location_address` varchar(500) DEFAULT NULL COMMENT '详细地址',
  `latitude` decimal(10,6) DEFAULT NULL COMMENT '纬度',
  `longitude` decimal(10,6) DEFAULT NULL COMMENT '经度',
  `date_type` varchar(50) DEFAULT NULL COMMENT '约会类型 dinner:晚餐 movie:电影 travel:旅行 outdoor:户外 home:居家 other:其他',
  `activity_description` text DEFAULT NULL COMMENT '活动描述',
  `total_cost` decimal(12,2) DEFAULT NULL COMMENT '总费用',
  `cost_split` varchar(100) DEFAULT NULL COMMENT '费用分摊',
  `weather` varchar(100) DEFAULT NULL COMMENT '天气',
  `mood_rating` tinyint(1) DEFAULT NULL COMMENT '心情评分 1-5分',
  `date_rating` tinyint(1) DEFAULT NULL COMMENT '约会评分 1-5分',
  `memorable_moments` text DEFAULT NULL COMMENT '难忘时刻',
  `photo_urls` text DEFAULT NULL COMMENT '照片URLs(JSON格式)',
  `video_urls` text DEFAULT NULL COMMENT '视频URLs(JSON格式)',
  `next_plan` text DEFAULT NULL COMMENT '下次计划',
  `is_favorite` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否收藏',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`date_id`),
  INDEX `idx_relation_id` (`relation_id`),
  INDEX `idx_date_time` (`date_time`),
  INDEX `idx_date_type` (`date_type`),
  INDEX `idx_is_favorite` (`is_favorite`),
  FOREIGN KEY (`relation_id`) REFERENCES `L_couple_relations` (`relation_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='约会记录表';

-- 恋爱日记表
DROP TABLE IF EXISTS `L_love_diaries`;
CREATE TABLE `L_love_diaries` (
  `love_diary_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日记ID',
  `relation_id` bigint(20) DEFAULT NULL COMMENT '关系ID',
  `author_ruid` bigint(20) NOT NULL COMMENT '作者ID',
  `diary_title` varchar(200) NOT NULL COMMENT '日记标题',
  `diary_content` longtext NOT NULL COMMENT '日记内容',
  `diary_date` date NOT NULL COMMENT '日记日期',
  `mood` varchar(50) DEFAULT NULL COMMENT '心情 happy:开心 sad:难过 excited:兴奋 angry:生气 peaceful:平静 other:其他',
  `mood_score` tinyint(1) DEFAULT NULL COMMENT '心情评分 1-10分',
  `weather` varchar(100) DEFAULT NULL COMMENT '天气',
  `location` varchar(200) DEFAULT NULL COMMENT '地点',
  `photo_urls` text DEFAULT NULL COMMENT '照片URLs(JSON格式)',
  `tags` varchar(500) DEFAULT NULL COMMENT '标签(逗号分隔)',
  `is_private` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否私密',
  `shared_with_partner` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否与伴侣分享',
  `partner_can_comment` tinyint(1) NOT NULL DEFAULT '1' COMMENT '伴侣是否可以评论',
  `temporary_share_code` varchar(100) DEFAULT NULL COMMENT '临时分享码',
  `temporary_share_expires` datetime DEFAULT NULL COMMENT '临时分享过期时间',
  `view_count` int(11) NOT NULL DEFAULT '0' COMMENT '查看次数',
  `is_favorite` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否收藏',
  `author_nickname` varchar(50) DEFAULT NULL COMMENT '作者昵称(冗余字段)',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`love_diary_id`),
  INDEX `idx_relation_id` (`relation_id`),
  INDEX `idx_author_ruid` (`author_ruid`),
  INDEX `idx_diary_date` (`diary_date`),
  INDEX `idx_is_private` (`is_private`),
  INDEX `idx_shared_with_partner` (`shared_with_partner`),
  INDEX `idx_temporary_share_code` (`temporary_share_code`),
  INDEX `idx_deleted` (`deleted`),
  INDEX `idx_is_favorite` (`is_favorite`),
  FOREIGN KEY (`relation_id`) REFERENCES `L_couple_relations` (`relation_id`) ON DELETE SET NULL,
  FOREIGN KEY (`author_ruid`) REFERENCES `L_raiser_users` (`ruid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='恋爱日记表';

-- 日记评论表
DROP TABLE IF EXISTS `L_diary_comments`;
CREATE TABLE `L_diary_comments` (
  `comment_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `diary_id` bigint(20) NOT NULL COMMENT '日记ID',
  `commenter_ruid` bigint(20) NOT NULL COMMENT '评论者ID',
  `comment_content` text NOT NULL COMMENT '评论内容',
  `reply_to_comment_id` bigint(20) DEFAULT NULL COMMENT '回复的评论ID',
  `emoji_reaction` varchar(50) DEFAULT NULL COMMENT '表情反应',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`comment_id`),
  INDEX `idx_diary_id` (`diary_id`),
  INDEX `idx_commenter_ruid` (`commenter_ruid`),
  INDEX `idx_reply_to_comment_id` (`reply_to_comment_id`),
  INDEX `idx_create_time` (`create_time`),
  FOREIGN KEY (`diary_id`) REFERENCES `L_love_diaries` (`love_diary_id`) ON DELETE CASCADE,
  FOREIGN KEY (`commenter_ruid`) REFERENCES `L_raiser_users` (`ruid`) ON DELETE CASCADE,
  FOREIGN KEY (`reply_to_comment_id`) REFERENCES `L_diary_comments` (`comment_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='日记评论表';

-- =============================================
-- 9. 权限和隐私相关表
-- =============================================

-- 数据查看日志表
DROP TABLE IF EXISTS `L_data_view_logs`;
CREATE TABLE `L_data_view_logs` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `viewer_ruid` bigint(20) NOT NULL COMMENT '查看者ID',
  `data_owner_ruid` bigint(20) NOT NULL COMMENT '数据所有者ID',
  `data_type` varchar(50) NOT NULL COMMENT '数据类型 pet:宠物 expense:消费 diary:日记 photo:照片 health:健康',
  `data_id` bigint(20) NOT NULL COMMENT '数据ID',
  `view_action` varchar(50) NOT NULL COMMENT '查看动作 view:查看 edit:编辑 download:下载 share:分享',
  `view_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '查看时间',
  `ip_address` varchar(128) DEFAULT NULL COMMENT 'IP地址',
  `user_agent` varchar(500) DEFAULT NULL COMMENT '用户代理',
  `device_info` varchar(200) DEFAULT NULL COMMENT '设备信息',
  `location` varchar(200) DEFAULT NULL COMMENT '地理位置',
  `session_id` varchar(100) DEFAULT NULL COMMENT '会话ID',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`log_id`),
  INDEX `idx_viewer_ruid` (`viewer_ruid`),
  INDEX `idx_data_owner_ruid` (`data_owner_ruid`),
  INDEX `idx_data_type_id` (`data_type`, `data_id`),
  INDEX `idx_view_time` (`view_time`),
  FOREIGN KEY (`viewer_ruid`) REFERENCES `L_raiser_users` (`ruid`) ON DELETE CASCADE,
  FOREIGN KEY (`data_owner_ruid`) REFERENCES `L_raiser_users` (`ruid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='数据查看日志表';

-- 权限授权表
DROP TABLE IF EXISTS `L_data_permissions`;
CREATE TABLE `L_data_permissions` (
  `permission_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '权限ID',
  `grantor_ruid` bigint(20) NOT NULL COMMENT '授权人ID',
  `grantee_ruid` bigint(20) NOT NULL COMMENT '被授权人ID',
  `data_type` varchar(50) NOT NULL COMMENT '数据类型',
  `data_id` bigint(20) DEFAULT NULL COMMENT '数据ID(NULL表示全部)',
  `permission_type` varchar(50) NOT NULL COMMENT '权限类型 read:查看 edit:编辑 delete:删除 share:分享',
  `grant_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '授权时间',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `is_temporary` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否临时授权',
  `usage_limit` int(11) DEFAULT NULL COMMENT '使用次数限制',
  `used_count` int(11) NOT NULL DEFAULT '0' COMMENT '已使用次数',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 0:已撤销 1:有效',
  `revoke_time` datetime DEFAULT NULL COMMENT '撤销时间',
  `revoke_reason` varchar(500) DEFAULT NULL COMMENT '撤销原因',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`permission_id`),
  INDEX `idx_grantor_ruid` (`grantor_ruid`),
  INDEX `idx_grantee_ruid` (`grantee_ruid`),
  INDEX `idx_data_type_id` (`data_type`, `data_id`),
  INDEX `idx_status` (`status`),
  INDEX `idx_expire_time` (`expire_time`),
  FOREIGN KEY (`grantor_ruid`) REFERENCES `L_raiser_users` (`ruid`) ON DELETE CASCADE,
  FOREIGN KEY (`grantee_ruid`) REFERENCES `L_raiser_users` (`ruid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='权限授权表';

-- 隐私设置表
DROP TABLE IF EXISTS `L_privacy_settings`;
CREATE TABLE `L_privacy_settings` (
  `setting_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '设置ID',
  `ruid` bigint(20) NOT NULL COMMENT '饲养者用户ID',
  `setting_category` varchar(50) NOT NULL COMMENT '设置分类 pet:宠物 expense:消费 diary:日记 profile:个人资料',
  `setting_key` varchar(100) NOT NULL COMMENT '设置键',
  `setting_value` varchar(500) NOT NULL COMMENT '设置值',
  `default_value` varchar(500) DEFAULT NULL COMMENT '默认值',
  `description` varchar(500) DEFAULT NULL COMMENT '设置描述',
  `is_customizable` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可自定义',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`setting_id`),
  UNIQUE KEY `uk_user_setting` (`ruid`, `setting_category`, `setting_key`),
  INDEX `idx_setting_category` (`setting_category`),
  FOREIGN KEY (`ruid`) REFERENCES `L_raiser_users` (`ruid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='隐私设置表';

-- =============================================
-- 10. 提醒和通知相关表
-- =============================================

-- 提醒任务表
DROP TABLE IF EXISTS `L_reminders`;
CREATE TABLE `L_reminders` (
  `reminder_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '提醒ID',
  `ruid` bigint(20) NOT NULL COMMENT '饲养者用户ID',
  `reminder_type` varchar(50) NOT NULL COMMENT '提醒类型 vaccine:疫苗 care:护理 anniversary:纪念日 health:健康 feeding:喂食',
  `related_data_type` varchar(50) DEFAULT NULL COMMENT '关联数据类型',
  `related_data_id` bigint(20) DEFAULT NULL COMMENT '关联数据ID',
  `reminder_title` varchar(200) NOT NULL COMMENT '提醒标题',
  `reminder_content` text DEFAULT NULL COMMENT '提醒内容',
  `reminder_time` datetime NOT NULL COMMENT '提醒时间',
  `advance_days` int(11) DEFAULT NULL COMMENT '提前天数',
  `repeat_type` varchar(50) NOT NULL DEFAULT 'none' COMMENT '重复类型 none:不重复 daily:每日 weekly:每周 monthly:每月 yearly:每年',
  `repeat_interval` int(11) DEFAULT NULL COMMENT '重复间隔',
  `end_date` date DEFAULT NULL COMMENT '结束日期',
  `is_sent` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已发送',
  `send_time` datetime DEFAULT NULL COMMENT '发送时间',
  `send_method` varchar(50) DEFAULT NULL COMMENT '发送方式 system:系统通知 sms:短信 email:邮件 wechat:微信',
  `is_read` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已读',
  `read_time` datetime DEFAULT NULL COMMENT '阅读时间',
  `snooze_until` datetime DEFAULT NULL COMMENT '稍后提醒时间',
  `is_active` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  `ruid_nickname` varchar(50) DEFAULT NULL COMMENT '用户昵称(冗余字段)',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`reminder_id`),
  INDEX `idx_ruid` (`ruid`),
  INDEX `idx_reminder_type` (`reminder_type`),
  INDEX `idx_reminder_time` (`reminder_time`),
  INDEX `idx_is_sent` (`is_sent`),
  INDEX `idx_is_active` (`is_active`),
  INDEX `idx_deleted` (`deleted`),
  FOREIGN KEY (`ruid`) REFERENCES `L_raiser_users` (`ruid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='提醒任务表';

-- 证件管理表
DROP TABLE IF EXISTS `L_pet_documents`;
CREATE TABLE `L_pet_documents` (
  `document_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '证件ID',
  `pet_id` bigint(20) NOT NULL COMMENT '宠物ID',
  `document_type` varchar(50) NOT NULL COMMENT '证件类型 vaccination:疫苗证 registration:登记证 insurance:保险单 health:健康证 other:其他',
  `document_name` varchar(200) NOT NULL COMMENT '证件名称',
  `document_number` varchar(100) DEFAULT NULL COMMENT '证件号码',
  `issue_date` date DEFAULT NULL COMMENT '签发日期',
  `expiry_date` date DEFAULT NULL COMMENT '过期日期',
  `issuing_authority` varchar(200) DEFAULT NULL COMMENT '签发机构',
  `document_url` varchar(500) NOT NULL COMMENT '证件文件URL',
  `thumbnail_url` varchar(500) DEFAULT NULL COMMENT '缩略图URL',
  `file_type` varchar(20) DEFAULT NULL COMMENT '文件类型 pdf:PDF image:图片',
  `file_size` bigint(20) DEFAULT NULL COMMENT '文件大小(字节)',
  `is_verified` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已验证',
  `verification_time` datetime DEFAULT NULL COMMENT '验证时间',
  `notes` text DEFAULT NULL COMMENT '备注',
  `visibility` tinyint(1) NOT NULL DEFAULT '1' COMMENT '可见性 1:仅自己 2:情侣可见',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`document_id`),
  INDEX `idx_pet_id` (`pet_id`),
  INDEX `idx_document_type` (`document_type`),
  INDEX `idx_expiry_date` (`expiry_date`),
  INDEX `idx_visibility` (`visibility`),
  FOREIGN KEY (`pet_id`) REFERENCES `L_pets` (`pet_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='证件管理表';

-- 宠物训练记录表
DROP TABLE IF EXISTS `L_pet_training_records`;
CREATE TABLE `L_pet_training_records` (
  `training_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '训练记录ID',
  `pet_id` bigint(20) NOT NULL COMMENT '宠物ID',
  `training_type` varchar(50) NOT NULL COMMENT '训练类型 basic:基础训练 behavior:行为纠正 skill:技能训练 socialization:社交训练',
  `training_name` varchar(200) NOT NULL COMMENT '训练项目名称',
  `training_date` datetime NOT NULL COMMENT '训练时间',
  `duration_minutes` int(11) DEFAULT NULL COMMENT '训练时长(分钟)',
  `trainer_name` varchar(100) DEFAULT NULL COMMENT '训练师姓名',
  `training_location` varchar(200) DEFAULT NULL COMMENT '训练地点',
  `training_method` varchar(500) DEFAULT NULL COMMENT '训练方法',
  `training_goals` text DEFAULT NULL COMMENT '训练目标',
  `progress_level` tinyint(1) DEFAULT NULL COMMENT '进度等级 1:初学 2:练习 3:熟练 4:精通 5:完美',
  `success_rate` decimal(5,2) DEFAULT NULL COMMENT '成功率(%)',
  `pet_response` varchar(500) DEFAULT NULL COMMENT '宠物反应',
  `rewards_used` varchar(500) DEFAULT NULL COMMENT '使用的奖励',
  `challenges_faced` text DEFAULT NULL COMMENT '遇到的挑战',
  `next_steps` text DEFAULT NULL COMMENT '下一步计划',
  `training_notes` text DEFAULT NULL COMMENT '训练备注',
  `video_url` varchar(500) DEFAULT NULL COMMENT '训练视频URL',
  `photo_urls` text DEFAULT NULL COMMENT '训练照片URLs(JSON格式)',
  `visibility` tinyint(1) NOT NULL DEFAULT '1' COMMENT '可见性 1:仅自己 2:情侣可见',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`training_id`),
  INDEX `idx_pet_id` (`pet_id`),
  INDEX `idx_training_type` (`training_type`),
  INDEX `idx_training_date` (`training_date`),
  INDEX `idx_progress_level` (`progress_level`),
  INDEX `idx_visibility` (`visibility`),
  FOREIGN KEY (`pet_id`) REFERENCES `L_pets` (`pet_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='宠物训练记录表';

-- 宠物社交记录表
DROP TABLE IF EXISTS `L_pet_social_records`;
CREATE TABLE `L_pet_social_records` (
  `social_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '社交记录ID',
  `pet_id` bigint(20) NOT NULL COMMENT '宠物ID',
  `social_date` datetime NOT NULL COMMENT '社交时间',
  `social_type` varchar(50) NOT NULL COMMENT '社交类型 pet_meetup:宠物聚会 park_visit:公园游玩 vet_visit:医院就诊 grooming:美容 training:训练课',
  `location` varchar(200) DEFAULT NULL COMMENT '地点',
  `other_pets_info` text DEFAULT NULL COMMENT '其他宠物信息(JSON格式)',
  `human_interactions` text DEFAULT NULL COMMENT '与人类互动情况',
  `pet_behavior` text DEFAULT NULL COMMENT '宠物行为表现',
  `social_skills_rating` tinyint(1) DEFAULT NULL COMMENT '社交技能评分 1-5分',
  `stress_level` tinyint(1) DEFAULT NULL COMMENT '压力水平 1:很低 2:低 3:中等 4:高 5:很高',
  `enjoyment_level` tinyint(1) DEFAULT NULL COMMENT '享受程度 1-5分',
  `new_friends_made` int(11) DEFAULT NULL COMMENT '结交新朋友数量',
  `incidents_occurred` text DEFAULT NULL COMMENT '发生的事件',
  `lessons_learned` text DEFAULT NULL COMMENT '学到的经验',
  `improvement_areas` text DEFAULT NULL COMMENT '需要改进的方面',
  `photo_urls` text DEFAULT NULL COMMENT '照片URLs(JSON格式)',
  `video_urls` text DEFAULT NULL COMMENT '视频URLs(JSON格式)',
  `visibility` tinyint(1) NOT NULL DEFAULT '1' COMMENT '可见性 1:仅自己 2:情侣可见',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`social_id`),
  INDEX `idx_pet_id` (`pet_id`),
  INDEX `idx_social_date` (`social_date`),
  INDEX `idx_social_type` (`social_type`),
  INDEX `idx_visibility` (`visibility`),
  FOREIGN KEY (`pet_id`) REFERENCES `L_pets` (`pet_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='宠物社交记录表';

-- 情侣任务表
DROP TABLE IF EXISTS `L_couple_tasks`;
CREATE TABLE `L_couple_tasks` (
  `task_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `relation_id` bigint(20) NOT NULL COMMENT '关系ID',
  `task_title` varchar(200) NOT NULL COMMENT '任务标题',
  `task_description` text DEFAULT NULL COMMENT '任务描述',
  `task_type` varchar(50) NOT NULL COMMENT '任务类型 pet_care:宠物照料 date_plan:约会计划 anniversary:纪念日 daily:日常任务 goal:共同目标',
  `priority_level` tinyint(1) NOT NULL DEFAULT '2' COMMENT '优先级 1:低 2:中 3:高 4:紧急',
  `assigned_to_ruid` bigint(20) DEFAULT NULL COMMENT '分配给谁',
  `due_date` datetime DEFAULT NULL COMMENT '截止时间',
  `estimated_duration` int(11) DEFAULT NULL COMMENT '预计耗时(分钟)',
  `actual_duration` int(11) DEFAULT NULL COMMENT '实际耗时(分钟)',
  `status` varchar(50) NOT NULL DEFAULT 'pending' COMMENT '状态 pending:待处理 in_progress:进行中 completed:已完成 cancelled:已取消 overdue:已逾期',
  `completion_date` datetime DEFAULT NULL COMMENT '完成时间',
  `completion_notes` text DEFAULT NULL COMMENT '完成备注',
  `satisfaction_rating` tinyint(1) DEFAULT NULL COMMENT '满意度评分 1-5分',
  `related_pet_id` bigint(20) DEFAULT NULL COMMENT '相关宠物ID',
  `related_expense_id` bigint(20) DEFAULT NULL COMMENT '相关消费记录ID',
  `reminder_enabled` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用提醒',
  `reminder_advance_hours` int(11) DEFAULT '24' COMMENT '提前提醒小时数',
  `recurring_type` varchar(50) DEFAULT NULL COMMENT '重复类型 daily:每日 weekly:每周 monthly:每月 yearly:每年',
  `recurring_end_date` date DEFAULT NULL COMMENT '重复结束日期',
  `tags` varchar(500) DEFAULT NULL COMMENT '标签(逗号分隔)',
  `assigned_to_nickname` varchar(50) DEFAULT NULL COMMENT '分配对象昵称(冗余字段)',
  `related_pet_name` varchar(100) DEFAULT NULL COMMENT '相关宠物名称(冗余字段)',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`task_id`),
  INDEX `idx_relation_id` (`relation_id`),
  INDEX `idx_assigned_to_ruid` (`assigned_to_ruid`),
  INDEX `idx_task_type` (`task_type`),
  INDEX `idx_status` (`status`),
  INDEX `idx_due_date` (`due_date`),
  INDEX `idx_priority_level` (`priority_level`),
  INDEX `idx_related_pet_id` (`related_pet_id`),
  INDEX `idx_deleted` (`deleted`),
  FOREIGN KEY (`relation_id`) REFERENCES `L_couple_relations` (`relation_id`) ON DELETE CASCADE,
  FOREIGN KEY (`assigned_to_ruid`) REFERENCES `L_raiser_users` (`ruid`) ON DELETE SET NULL,
  FOREIGN KEY (`related_pet_id`) REFERENCES `L_pets` (`pet_id`) ON DELETE SET NULL,
  FOREIGN KEY (`related_expense_id`) REFERENCES `L_expense_records` (`record_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='情侣任务表';

-- 宠物成长里程碑表
DROP TABLE IF EXISTS `L_pet_milestones`;
CREATE TABLE `L_pet_milestones` (
  `milestone_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '里程碑ID',
  `pet_id` bigint(20) NOT NULL COMMENT '宠物ID',
  `milestone_type` varchar(50) NOT NULL COMMENT '里程碑类型 age:年龄 weight:体重 training:训练 health:健康 behavior:行为',
  `milestone_name` varchar(200) NOT NULL COMMENT '里程碑名称',
  `milestone_description` text DEFAULT NULL COMMENT '里程碑描述',
  `achievement_date` date NOT NULL COMMENT '达成日期',
  `pet_age_days` int(11) DEFAULT NULL COMMENT '宠物年龄(天)',
  `milestone_value` varchar(100) DEFAULT NULL COMMENT '里程碑数值',
  `milestone_unit` varchar(20) DEFAULT NULL COMMENT '数值单位',
  `significance_level` tinyint(1) DEFAULT NULL COMMENT '重要程度 1-5分',
  `celebration_plan` text DEFAULT NULL COMMENT '庆祝计划',
  `photo_urls` text DEFAULT NULL COMMENT '纪念照片URLs(JSON格式)',
  `video_urls` text DEFAULT NULL COMMENT '纪念视频URLs(JSON格式)',
  `shared_with_partner` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否与伴侣分享',
  `social_media_shared` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否分享到社交媒体',
  `memory_notes` text DEFAULT NULL COMMENT '回忆备注',
  `next_milestone_target` varchar(500) DEFAULT NULL COMMENT '下一个里程碑目标',
  `visibility` tinyint(1) NOT NULL DEFAULT '1' COMMENT '可见性 1:仅自己 2:情侣可见 3:公开',
  `pet_name` varchar(100) DEFAULT NULL COMMENT '宠物名称(冗余字段)',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`milestone_id`),
  INDEX `idx_pet_id` (`pet_id`),
  INDEX `idx_milestone_type` (`milestone_type`),
  INDEX `idx_achievement_date` (`achievement_date`),
  INDEX `idx_significance_level` (`significance_level`),
  INDEX `idx_visibility` (`visibility`),
  INDEX `idx_deleted` (`deleted`),
  FOREIGN KEY (`pet_id`) REFERENCES `L_pets` (`pet_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='宠物成长里程碑表';

-- =============================================
-- 11. 系统配置和字典表
-- =============================================

-- 系统字典表
DROP TABLE IF EXISTS `L_system_dict`;
CREATE TABLE `L_system_dict` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典ID',
  `dict_type` varchar(100) NOT NULL COMMENT '字典类型',
  `dict_key` varchar(100) NOT NULL COMMENT '字典键',
  `dict_value` varchar(500) NOT NULL COMMENT '字典值',
  `dict_label` varchar(200) NOT NULL COMMENT '字典标签',
  `sort_order` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `css_class` varchar(100) DEFAULT NULL COMMENT 'CSS类名',
  `list_class` varchar(100) DEFAULT NULL COMMENT '列表样式',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否默认',
  `is_active` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `uk_dict_type_key` (`dict_type`, `dict_key`),
  INDEX `idx_dict_type` (`dict_type`),
  INDEX `idx_sort_order` (`sort_order`),
  INDEX `idx_is_active` (`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='系统字典表';

-- =============================================
-- 插入基础数据
-- =============================================

-- 宠物品种基础数据
INSERT INTO `L_pet_breeds` (`breed_name`, `species`, `breed_code`, `description`, `avg_weight_min`, `avg_weight_max`, `avg_lifespan`, `care_level`) VALUES
-- 猫品种数据
('英国短毛猫', 'cat', 'BSH', '英国短毛猫，毛发浓密，性格温和', 3.5, 7.0, 15, 2),
('美国短毛猫', 'cat', 'ASH', '美国短毛猫，活泼好动，适应性强', 3.0, 6.0, 16, 1),
('波斯猫', 'cat', 'PERSIAN', '波斯猫，毛发长而密，需要定期梳理', 3.0, 5.5, 14, 3),
('布偶猫', 'cat', 'RAGDOLL', '布偶猫，温顺粘人，体型较大', 4.0, 9.0, 13, 2),
('俄罗斯蓝猫', 'cat', 'RUSSIAN_BLUE', '俄罗斯蓝猫，毛色银蓝，性格安静', 3.0, 5.5, 16, 2),
('暹罗猫', 'cat', 'SIAMESE', '暹罗猫，聪明活泼，喜欢与人互动', 2.5, 4.5, 15, 2),
('孟买猫', 'cat', 'BOMBAY', '孟买猫，全身黑色，性格温顺', 3.0, 5.0, 15, 1),
('阿比西尼亚猫', 'cat', 'ABYSSINIAN', '阿比西尼亚猫，活泼好动，毛色独特', 3.5, 5.5, 14, 2),
('挪威森林猫', 'cat', 'NORWEGIAN', '挪威森林猫，大型长毛猫，适应寒冷', 4.0, 8.0, 14, 3),
('缅因猫', 'cat', 'MAINE_COON', '缅因猫，体型巨大，性格温和', 4.5, 11.0, 13, 3),
('土耳其安哥拉猫', 'cat', 'TURKISH_ANGORA', '土耳其安哥拉猫，毛发丝滑，优雅高贵', 2.5, 5.0, 15, 3),
('苏格兰折耳猫', 'cat', 'SCOTTISH_FOLD', '苏格兰折耳猫，耳朵下折，性格温顺', 2.5, 6.0, 13, 2),
('加拿大无毛猫', 'cat', 'SPHYNX', '加拿大无毛猫，无毛品种，需要特殊护理', 3.5, 7.0, 14, 3),
('德文卷毛猫', 'cat', 'DEVON_REX', '德文卷毛猫，毛发卷曲，活泼好动', 2.5, 4.5, 14, 2),
('孟加拉猫', 'cat', 'BENGAL', '孟加拉猫，野性外观，活泼聪明', 3.5, 7.0, 13, 2),

-- 狗品种数据 - 大型犬
('金毛寻回犬', 'dog', 'GOLDEN', '金毛寻回犬，友善聪明，适合家庭饲养', 25.0, 35.0, 12, 2),
('拉布拉多犬', 'dog', 'LABRADOR', '拉布拉多犬，温和忠诚，精力充沛', 25.0, 35.0, 12, 2),
('德国牧羊犬', 'dog', 'GERMAN_SHEPHERD', '德国牧羊犬，聪明勇敢，工作能力强', 22.0, 40.0, 11, 3),
('哈士奇', 'dog', 'HUSKY', '西伯利亚哈士奇，精力旺盛，需要大量运动', 16.0, 27.0, 12, 3),
('阿拉斯加雪橇犬', 'dog', 'ALASKAN', '阿拉斯加雪橇犬，体型巨大，力量强劲', 34.0, 39.0, 11, 3),
('萨摩耶犬', 'dog', 'SAMOYED', '萨摩耶犬，毛发雪白，性格温和友善', 16.0, 30.0, 13, 3),
('边境牧羊犬', 'dog', 'BORDER_COLLIE', '边境牧羊犬，智商极高，需要智力刺激', 14.0, 20.0, 13, 3),
('罗威纳犬', 'dog', 'ROTTWEILER', '罗威纳犬，强壮有力，忠诚护主', 35.0, 60.0, 10, 3),
('杜宾犬', 'dog', 'DOBERMAN', '杜宾犬，优雅强壮，警觉性高', 27.0, 45.0, 11, 3),
('大丹犬', 'dog', 'GREAT_DANE', '大丹犬，体型巨大，性格温和', 45.0, 90.0, 8, 2),
('圣伯纳犬', 'dog', 'SAINT_BERNARD', '圣伯纳犬，温和巨型犬，救援犬品种', 50.0, 82.0, 9, 2),

-- 狗品种数据 - 中型犬
('柴犬', 'dog', 'SHIBA_INU', '柴犬，日本犬种，独立性强，表情丰富', 8.0, 11.0, 14, 2),
('威尔士柯基犬', 'dog', 'CORGI', '威尔士柯基犬，腿短身长，活泼聪明', 10.0, 14.0, 13, 2),
('比格犬', 'dog', 'BEAGLE', '比格犬，嗅觉灵敏，性格友善', 9.0, 11.0, 13, 2),
('法国斗牛犬', 'dog', 'FRENCH_BULLDOG', '法国斗牛犬，肌肉发达，性格温和', 8.0, 14.0, 11, 2),
('英国斗牛犬', 'dog', 'ENGLISH_BULLDOG', '英国斗牛犬，体格强壮，性格稳重', 18.0, 25.0, 9, 2),
('澳大利亚牧牛犬', 'dog', 'AUSTRALIAN_CATTLE', '澳大利亚牧牛犬，精力充沛，工作能力强', 15.0, 22.0, 14, 3),
('巴哥犬', 'dog', 'PUG', '巴哥犬，面部扁平，性格友善', 6.0, 8.0, 13, 2),
('雪纳瑞犬', 'dog', 'SCHNAUZER', '雪纳瑞犬，胡须明显，聪明活泼', 5.0, 8.0, 14, 2),
('可卡犬', 'dog', 'COCKER_SPANIEL', '可卡犬，毛发丰富，性格温和', 12.0, 15.0, 13, 2),
('巴塞特猎犬', 'dog', 'BASSET_HOUND', '巴塞特猎犬，腿短耳长，嗅觉敏锐', 20.0, 29.0, 12, 2),

-- 狗品种数据 - 小型犬
('泰迪犬', 'dog', 'POODLE', '泰迪犬（贵宾犬），聪明活泼，毛发需要定期修剪', 2.0, 8.0, 14, 2),
('吉娃娃', 'dog', 'CHIHUAHUA', '吉娃娃，世界最小犬种，勇敢机警', 1.5, 3.0, 16, 2),
('博美犬', 'dog', 'POMERANIAN', '博美犬，毛发蓬松，活泼可爱', 1.4, 3.2, 14, 2),
('约克夏梗', 'dog', 'YORKSHIRE_TERRIER', '约克夏梗，毛发丝滑，勇敢自信', 1.8, 3.2, 15, 3),
('马尔济斯犬', 'dog', 'MALTESE', '马尔济斯犬，毛发雪白，温和优雅', 1.8, 4.0, 14, 3),
('西高地白梗', 'dog', 'WEST_HIGHLAND_WHITE', '西高地白梗，毛色纯白，性格活泼', 6.0, 10.0, 14, 2),
('比熊犬', 'dog', 'BICHON_FRISE', '比熊犬，毛发卷曲，性格开朗', 3.0, 6.0, 14, 2),
('京巴犬', 'dog', 'PEKINGESE', '京巴犬，中国宫廷犬，性格独立', 3.2, 6.4, 13, 2),
('西施犬', 'dog', 'SHIH_TZU', '西施犬，毛发长而密，性格友善', 4.0, 7.2, 15, 3),
('蝴蝶犬', 'dog', 'PAPILLON', '蝴蝶犬，耳朵如蝴蝶翅膀，聪明活泼', 1.4, 4.5, 14, 2),

-- 兔子品种数据
('荷兰兔', 'rabbit', 'DUTCH_RABBIT', '荷兰兔，黑白相间，性格温顺', 1.4, 2.5, 8, 1),
('垂耳兔', 'rabbit', 'LOP_RABBIT', '垂耳兔，耳朵下垂，性格安静', 1.0, 2.0, 7, 1),
('安哥拉兔', 'rabbit', 'ANGORA_RABBIT', '安哥拉兔，毛发长而密，需要定期梳理', 2.0, 4.5, 7, 3),
('狮子兔', 'rabbit', 'LIONHEAD_RABBIT', '狮子兔，头部毛发浓密如鬃毛', 1.0, 1.7, 8, 2),
('侏儒兔', 'rabbit', 'DWARF_RABBIT', '侏儒兔，体型迷你，活泼可爱', 0.5, 1.2, 9, 1),

-- 鸟类品种数据
('虎皮鹦鹉', 'bird', 'BUDGERIGAR', '虎皮鹦鹉，色彩鲜艳，能学会说话', 0.03, 0.04, 8, 2),
('玄凤鹦鹉', 'bird', 'COCKATIEL', '玄凤鹦鹉，头冠明显，性格温和', 0.08, 0.12, 15, 2),
('金丝雀', 'bird', 'CANARY', '金丝雀，歌声悦耳，色彩美丽', 0.015, 0.025, 10, 1),
('牡丹鹦鹉', 'bird', 'LOVEBIRD', '牡丹鹦鹉，成对饲养，感情深厚', 0.04, 0.06, 12, 2),
('文鸟', 'bird', 'JAVA_SPARROW', '文鸟，体型小巧，群居性强', 0.02, 0.03, 8, 1),

-- 仓鼠品种数据
('金丝熊', 'hamster', 'GOLDEN_HAMSTER', '金丝熊，体型较大，性格温和', 0.08, 0.15, 3, 1),
('三线仓鼠', 'hamster', 'DJUNGARIAN_HAMSTER', '三线仓鼠，背部有三条黑线，活泼好动', 0.03, 0.05, 2, 1),
('一线仓鼠', 'hamster', 'CHINESE_HAMSTER', '一线仓鼠，背部有一条黑线，体型修长', 0.03, 0.04, 2, 1),
('银狐仓鼠', 'hamster', 'WINTER_WHITE', '银狐仓鼠，毛色银白，冬季会变色', 0.03, 0.05, 2, 1),
('布丁仓鼠', 'hamster', 'PUDDING_HAMSTER', '布丁仓鼠，毛色金黄，性格温顺', 0.03, 0.05, 2, 1),

-- 乌龟品种数据
('巴西龟', 'turtle', 'RED_EARED_SLIDER', '巴西龟，适应性强，容易饲养', 1.0, 3.0, 30, 1),
('草龟', 'turtle', 'CHINESE_POND_TURTLE', '草龟，中华草龟，本土龟种', 0.5, 2.0, 50, 1),
('黄缘龟', 'turtle', 'YELLOW_MARGINED_BOX', '黄缘龟，半水栖龟类，性格温和', 0.3, 1.0, 40, 2),
('陆龟', 'turtle', 'HERMANN_TORTOISE', '赫曼陆龟，纯陆栖，需要干燥环境', 0.5, 3.0, 80, 2),
('地图龟', 'turtle', 'MAP_TURTLE', '地图龟，背甲有地图样花纹', 0.2, 0.8, 25, 2),

-- 鱼类品种数据
('金鱼', 'fish', 'GOLDFISH', '金鱼，观赏鱼类，品种繁多', 0.02, 0.5, 10, 1),
('锦鲤', 'fish', 'KOI', '锦鲤，大型观赏鱼，色彩斑斓', 2.0, 15.0, 50, 2),
('热带鱼', 'fish', 'TROPICAL_FISH', '热带鱼，需要加温设备，色彩丰富', 0.005, 0.1, 5, 2),
('斗鱼', 'fish', 'BETTA_FISH', '斗鱼，色彩鲜艳，雄性好斗', 0.003, 0.008, 3, 2),
('神仙鱼', 'fish', 'ANGELFISH', '神仙鱼，体型优雅，游姿美丽', 0.05, 0.2, 8, 2);

-- 护理活动类型基础数据
INSERT INTO `L_care_activity_types` (`type_name`, `category`, `default_interval_days`, `species`, `description`) VALUES
('洗澡', 'bathing', 30, 'cat', '定期为猫咪洗澡，保持清洁'),
('洗澡', 'bathing', 14, 'dog', '定期为狗狗洗澡，保持清洁'),
('驱虫', 'deworming', 90, NULL, '定期驱虫，预防寄生虫感染'),
('剪指甲', 'nail_trimming', 14, NULL, '定期修剪指甲，避免过长'),
('刷牙', 'dental', 3, NULL, '定期刷牙，维护口腔健康'),
('梳毛', 'grooming', 7, NULL, '定期梳毛，去除死毛和打结');

-- 疫苗类型基础数据
INSERT INTO `L_vaccine_types` (`vaccine_name`, `species`, `manufacturer`, `description`, `interval_months`, `is_required`) VALUES
('猫三联疫苗', 'cat', '硕腾', '预防猫瘟、猫鼻支、猫杯状病毒', 12, 1),
('狂犬疫苗', 'cat', '硕腾', '预防狂犬病', 12, 1),
('犬八联疫苗', 'dog', '硕腾', '预防犬瘟热、细小病毒等八种疾病', 12, 1),
('狂犬疫苗', 'dog', '硕腾', '预防狂犬病', 12, 1);

-- 食物品牌基础数据
INSERT INTO `L_food_brands` (`brand_name`, `brand_country`, `brand_description`) VALUES
('皇家', '法国', 'Royal Canin，专业宠物营养品牌'),
('希尔思', '美国', 'Hills，科学营养宠物食品'),
('渴望', '加拿大', 'Orijen，天然无谷物宠物食品'),
('爱肯拿', '加拿大', 'Acana，天然营养宠物食品'),
('冠能', '美国', 'Pro Plan，普瑞纳旗下高端品牌');

-- 产品分类基础数据
INSERT INTO `L_product_categories` (`category_name`, `parent_id`, `category_code`, `description`, `sort_order`) VALUES
('猫用品', NULL, 'CAT_PRODUCTS', '猫咪专用用品', 1),
('狗用品', NULL, 'DOG_PRODUCTS', '狗狗专用用品', 2),
('通用用品', NULL, 'COMMON_PRODUCTS', '宠物通用用品', 3),
('食具水具', 1, 'CAT_FEEDING', '猫咪食具水具', 11),
('玩具', 1, 'CAT_TOYS', '猫咪玩具', 12),
('猫砂用品', 1, 'CAT_LITTER', '猫砂及相关用品', 13),
('食具水具', 2, 'DOG_FEEDING', '狗狗食具水具', 21),
('玩具', 2, 'DOG_TOYS', '狗狗玩具', 22),
('牵引用品', 2, 'DOG_LEASH', '狗狗牵引用品', 23);

-- 消费分类基础数据
INSERT INTO `L_expense_categories` (`category_name`, `parent_id`, `category_type`, `is_pet_related`, `sort_order`) VALUES
('宠物相关', NULL, 'pet', 1, 1),
('恋爱相关', NULL, 'relationship', 0, 2),
('其他消费', NULL, 'other', 0, 3),
('宠物食品', 1, 'pet', 1, 11),
('宠物医疗', 1, 'pet', 1, 12),
('宠物用品', 1, 'pet', 1, 13),
('宠物美容', 1, 'pet', 1, 14),
('约会消费', 2, 'relationship', 0, 21),
('礼物花费', 2, 'relationship', 0, 22),
('纪念日庆祝', 2, 'relationship', 0, 23);

-- 系统字典基础数据
INSERT INTO `L_system_dict` (`dict_type`, `dict_key`, `dict_value`, `dict_label`, `sort_order`, `is_active`) VALUES
-- 宠物性别（优化排序）
('pet_gender', '1', '1', '公', 1, 1),
('pet_gender', '2', '2', '母', 2, 1),
('pet_gender', '0', '0', '未知', 3, 1),
-- 宠物状态（积极状态优先，已故放最后）
('pet_status', '1', '1', '健康', 1, 1),
('pet_status', '8', '8', '活跃', 2, 1),
('pet_status', '9', '9', '快乐', 3, 1),
('pet_status', '10', '10', '调皮', 4, 1),
('pet_status', '11', '11', '康复中', 5, 1),
('pet_status', '12', '12', '怀孕中', 6, 1),
('pet_status', '13', '13', '哺乳期', 7, 1),
('pet_status', '14', '14', '训练中', 8, 1),
('pet_status', '15', '15', '比赛中', 9, 1),
('pet_status', '2', '2', '生病', 10, 1),
('pet_status', '5', '5', '寄养中', 11, 1),
('pet_status', '6', '6', '医院治疗中', 12, 1),
('pet_status', '3', '3', '失踪', 13, 1),
('pet_status', '0', '0', '已故', 14, 1),
-- 宠物活跃度等级
('pet_activity_level', '1', '1', '很低', 1, 1),
('pet_activity_level', '2', '2', '低', 2, 1),
('pet_activity_level', '3', '3', '中等', 3, 1),
('pet_activity_level', '4', '4', '高', 4, 1),
('pet_activity_level', '5', '5', '很高', 5, 1),
-- 宠物训练程度
('pet_training_level', '1', '1', '未训练', 1, 1),
('pet_training_level', '2', '2', '基础', 2, 1),
('pet_training_level', '3', '3', '中级', 3, 1),
('pet_training_level', '4', '4', '高级', 4, 1),
('pet_training_level', '5', '5', '专业', 5, 1),
-- 宠物社交程度
('pet_socialization_level', '1', '1', '很差', 1, 1),
('pet_socialization_level', '2', '2', '一般', 2, 1),
('pet_socialization_level', '3', '3', '良好', 3, 1),
('pet_socialization_level', '4', '4', '很好', 4, 1),
('pet_socialization_level', '5', '5', '优秀', 5, 1),
-- 宠物性格特征
('pet_personality', 'friendly', 'friendly', '友善', 1, 1),
('pet_personality', 'active', 'active', '活泼', 2, 1),
('pet_personality', 'calm', 'calm', '温和', 3, 1),
('pet_personality', 'shy', 'shy', '害羞', 4, 1),
('pet_personality', 'playful', 'playful', '爱玩', 5, 1),
('pet_personality', 'independent', 'independent', '独立', 6, 1),
('pet_personality', 'clingy', 'clingy', '粘人', 7, 1),
('pet_personality', 'smart', 'smart', '聪明', 8, 1),
('pet_personality', 'lazy', 'lazy', '懒惰', 9, 1),
('pet_personality', 'curious', 'curious', '好奇', 10, 1),
-- 宠物技能等级
('pet_skill_level', '0', '0', '无技能', 1, 1),
('pet_skill_level', '1', '1', '初学者', 2, 1),
('pet_skill_level', '2', '2', '熟练', 3, 1),
('pet_skill_level', '3', '3', '精通', 4, 1),
('pet_skill_level', '4', '4', '专家', 5, 1),
('pet_skill_level', '5', '5', '大师', 6, 1),
-- 宠物成就类型
('pet_achievement_type', 'first_walk', 'first_walk', '第一次散步', 1, 1),
('pet_achievement_type', 'first_bath', 'first_bath', '第一次洗澡', 2, 1),
('pet_achievement_type', 'first_trick', 'first_trick', '学会第一个技能', 3, 1),
('pet_achievement_type', 'birthday', 'birthday', '生日纪念', 4, 1),
('pet_achievement_type', 'adoption_anniversary', 'adoption_anniversary', '领养纪念日', 5, 1),
('pet_achievement_type', 'weight_goal', 'weight_goal', '达到理想体重', 6, 1),
('pet_achievement_type', 'health_checkup', 'health_checkup', '完成健康检查', 7, 1),
('pet_achievement_type', 'vaccination_complete', 'vaccination_complete', '完成疫苗接种', 8, 1),
-- 互动活动类型
('interaction_type', 'play', 'play', '玩耍', 1, 1),
('interaction_type', 'training', 'training', '训练', 2, 1),
('interaction_type', 'feeding', 'feeding', '喂食', 3, 1),
('interaction_type', 'grooming', 'grooming', '美容', 4, 1),
('interaction_type', 'walk', 'walk', '散步', 5, 1),
('interaction_type', 'cuddle', 'cuddle', '拥抱', 6, 1),
('interaction_type', 'photo', 'photo', '拍照', 7, 1),
('interaction_type', 'vet_visit', 'vet_visit', '看医生', 8, 1),
-- 纪念日类型
('anniversary_type', 'adoption', 'adoption', '领养纪念日', 1, 1),
('anniversary_type', 'birthday', 'birthday', '生日', 2, 1),
('anniversary_type', 'first_meeting', 'first_meeting', '初次见面', 3, 1),
('anniversary_type', 'first_trick', 'first_trick', '学会第一个技能', 4, 1),
('anniversary_type', 'vaccination', 'vaccination', '疫苗接种', 5, 1),
('anniversary_type', 'sterilization', 'sterilization', '绝育手术', 6, 1),
('anniversary_type', 'recovery', 'recovery', '康复纪念', 7, 1),
('anniversary_type', 'competition', 'competition', '比赛获奖', 8, 1),
-- 可见性级别（扩展选项）
('visibility_level', '1', '1', '仅自己', 1, 1),
('visibility_level', '2', '2', '情侣可见', 2, 1),
('visibility_level', '3', '3', '朋友可见', 3, 1),
('visibility_level', '4', '4', '公开', 4, 1),
-- 隐私级别
('privacy_level', '1', '1', '公开', 1, 1),
('privacy_level', '2', '2', '朋友可见', 2, 1),
('privacy_level', '3', '3', '情侣可见', 3, 1),
('privacy_level', '4', '4', '仅自己', 4, 1),
-- 关系状态
('relation_status', '0', '0', '待确认', 1, 1),
('relation_status', '1', '1', '已绑定', 2, 1),
('relation_status', '2', '2', '已解绑', 3, 1),
-- 情侣任务状态
('task_status', '0', '0', '待开始', 1, 1),
('task_status', '1', '1', '进行中', 2, 1),
('task_status', '2', '2', '已完成', 3, 1),
('task_status', '3', '3', '已取消', 4, 1),
-- 提醒类型
('reminder_type', 'vaccine', 'vaccine', '疫苗提醒', 1, 1),
('reminder_type', 'feeding', 'feeding', '喂食提醒', 2, 1),
('reminder_type', 'grooming', 'grooming', '美容提醒', 3, 1),
('reminder_type', 'exercise', 'exercise', '运动提醒', 4, 1),
('reminder_type', 'medication', 'medication', '用药提醒', 5, 1),
('reminder_type', 'checkup', 'checkup', '体检提醒', 6, 1),
('reminder_type', 'anniversary', 'anniversary', '纪念日提醒', 7, 1),
('reminder_type', 'birthday', 'birthday', '生日提醒', 8, 1),

-- 宠物家族关系类型字典
('pet_relation_type', 'parent', 'parent', '父母', 1, 1),
('pet_relation_type', 'child', 'child', '子女', 2, 1),
('pet_relation_type', 'sibling', 'sibling', '兄弟姐妹', 3, 1),
('pet_relation_type', 'mate', 'mate', '配偶', 4, 1),
('pet_relation_type', 'grandparent', 'grandparent', '祖父母', 5, 1),
('pet_relation_type', 'grandchild', 'grandchild', '孙子女', 6, 1),

-- 宠物特征标签分类字典
('pet_tag_category', 'appearance', 'appearance', '外观', 1, 1),
('pet_tag_category', 'personality', 'personality', '性格', 2, 1),
('pet_tag_category', 'behavior', 'behavior', '行为', 3, 1),
('pet_tag_category', 'skill', 'skill', '技能', 4, 1),
('pet_tag_category', 'health', 'health', '健康', 5, 1),
('pet_tag_category', 'other', 'other', '其他', 6, 1),

-- 宠物偏好分类字典
('pet_preference_category', 'food', 'food', '食物', 1, 1),
('pet_preference_category', 'toy', 'toy', '玩具', 2, 1),
('pet_preference_category', 'activity', 'activity', '活动', 3, 1),
('pet_preference_category', 'environment', 'environment', '环境', 4, 1),
('pet_preference_category', 'social', 'social', '社交', 5, 1),
('pet_preference_category', 'other', 'other', '其他', 6, 1),

-- 宠物成长阶段字典
('pet_growth_stage', 'newborn', 'newborn', '新生儿', 1, 1),
('pet_growth_stage', 'infant', 'infant', '幼儿', 2, 1),
('pet_growth_stage', 'juvenile', 'juvenile', '少年', 3, 1),
('pet_growth_stage', 'adult', 'adult', '成年', 4, 1),
('pet_growth_stage', 'senior', 'senior', '老年', 5, 1),

-- 情侣纪念日类型字典
('couple_anniversary_type', 'first_meet', 'first_meet', '初次见面', 1, 1),
('couple_anniversary_type', 'first_date', 'first_date', '第一次约会', 2, 1),
('couple_anniversary_type', 'relationship_start', 'relationship_start', '恋爱开始', 3, 1),
('couple_anniversary_type', 'engagement', 'engagement', '订婚', 4, 1),
('couple_anniversary_type', 'marriage', 'marriage', '结婚', 5, 1),
('couple_anniversary_type', 'move_in', 'move_in', '同居', 6, 1),
('couple_anniversary_type', 'pet_adoption', 'pet_adoption', '共同领养宠物', 7, 1),
('couple_anniversary_type', 'other', 'other', '其他', 8, 1),

-- 购买决策状态字典
('purchase_decision_status', 'considering', 'considering', '考虑中', 1, 1),
('purchase_decision_status', 'decided_buy', 'decided_buy', '决定购买', 2, 1),
('purchase_decision_status', 'decided_not_buy', 'decided_not_buy', '决定不买', 3, 1),
('purchase_decision_status', 'postponed', 'postponed', '推迟', 4, 1),
('purchase_decision_status', 'cancelled', 'cancelled', '取消', 5, 1),

-- 物品使用状态字典
('product_usage_status', 'in_use', 'in_use', '使用中', 1, 1),
('product_usage_status', 'stored', 'stored', '存放中', 2, 1),
('product_usage_status', 'damaged', 'damaged', '损坏', 3, 1),
('product_usage_status', 'lost', 'lost', '丢失', 4, 1),
('product_usage_status', 'discarded', 'discarded', '丢弃', 5, 1),

-- 评估类型字典
('assessment_type', 'periodic', 'periodic', '定期评估', 1, 1),
('assessment_type', 'damage', 'damage', '损坏评估', 2, 1),
('assessment_type', 'resale', 'resale', '转售评估', 3, 1),
('assessment_type', 'insurance', 'insurance', '保险评估', 4, 1),
('assessment_type', 'disposal', 'disposal', '处置评估', 5, 1);



SET FOREIGN_KEY_CHECKS = 1;

-- =============================================
-- 创建索引优化查询性能
-- =============================================

-- 复合索引优化
CREATE INDEX idx_pet_owner_status ON L_pets(owner_ruid, status, deleted);
CREATE INDEX idx_pet_co_owner_status ON L_pets(co_owner_ruid, status, deleted);
CREATE INDEX idx_pet_species_status ON L_pets(species, status, visibility, deleted);
CREATE INDEX idx_pet_shared_status ON L_pets(is_shared_pet, status, deleted);
CREATE INDEX idx_feeding_pet_date ON L_feeding_records(pet_id, feeding_time);
CREATE INDEX idx_care_pet_date ON L_care_records(pet_id, activity_date, deleted);
CREATE INDEX idx_vaccine_pet_date ON L_vaccine_records(pet_id, vaccination_date, deleted);
CREATE INDEX idx_expense_user_date ON L_expense_records(ruid, expense_date, deleted);
CREATE INDEX idx_expense_shared_date ON L_expense_records(shared_with_ruid, expense_date, deleted);
CREATE INDEX idx_expense_type_date ON L_expense_records(expense_type, expense_date, deleted);
CREATE INDEX idx_reminder_user_time ON L_reminders(ruid, reminder_time, is_active, deleted);
CREATE INDEX idx_couple_relation_status ON L_couple_relations(ruid_1, ruid_2, status, deleted);
CREATE INDEX idx_diary_author_date ON L_love_diaries(author_ruid, diary_date, deleted);
CREATE INDEX idx_training_pet_date ON L_pet_training_records(pet_id, training_date);
CREATE INDEX idx_social_pet_date ON L_pet_social_records(pet_id, social_date);
CREATE INDEX idx_task_relation_status ON L_couple_tasks(relation_id, status);
CREATE INDEX idx_task_assigned_due ON L_couple_tasks(assigned_to_ruid, due_date);
CREATE INDEX idx_milestone_pet_date ON L_pet_milestones(pet_id, achievement_date);
CREATE INDEX idx_document_pet_expiry ON L_pet_documents(pet_id, expiry_date);
CREATE INDEX idx_photo_pet_date ON L_pet_photos(pet_id, photo_date, deleted);
CREATE INDEX idx_health_pet_date ON L_health_records(pet_id, measurement_date, deleted);
CREATE INDEX idx_abnormal_pet_severity ON L_abnormal_records(pet_id, severity_level, occurrence_time, deleted);

-- 软删除相关复合索引
CREATE INDEX idx_users_deleted_status ON L_raiser_users(deleted, status);
CREATE INDEX idx_pets_deleted_owner ON L_pets(deleted, owner_ruid);
CREATE INDEX idx_photos_deleted_pet ON L_pet_photos(deleted, pet_id);
CREATE INDEX idx_health_deleted_pet ON L_health_records(deleted, pet_id);
CREATE INDEX idx_care_deleted_pet ON L_care_records(deleted, pet_id);
CREATE INDEX idx_vaccine_deleted_pet ON L_vaccine_records(deleted, pet_id);
CREATE INDEX idx_expense_deleted_user ON L_expense_records(deleted, ruid);
CREATE INDEX idx_diary_deleted_author ON L_love_diaries(deleted, author_ruid);
CREATE INDEX idx_reminder_deleted_user ON L_reminders(deleted, ruid);

-- 性能优化复合索引
CREATE INDEX idx_pets_owner_species_status ON L_pets(owner_ruid, species, status, deleted);
CREATE INDEX idx_expense_user_type_date ON L_expense_records(ruid, expense_type, expense_date, deleted);
CREATE INDEX idx_health_pet_type_date ON L_health_records(pet_id, record_type, measurement_date, deleted);
CREATE INDEX idx_care_pet_type_date ON L_care_records(pet_id, activity_type_id, activity_date, deleted);
CREATE INDEX idx_vaccine_pet_type_date ON L_vaccine_records(pet_id, vaccine_type_id, vaccination_date, deleted);

-- 新增表的复合索引
CREATE INDEX idx_family_relation_pet_type ON L_pet_family_relations(pet_id, relation_type, confirmed, deleted);
CREATE INDEX idx_feature_tag_pet_category ON L_pet_feature_tags(pet_id, tag_category, visibility, deleted);
CREATE INDEX idx_preference_pet_category ON L_pet_preferences(pet_id, preference_category, preference_level, deleted);
CREATE INDEX idx_growth_pet_stage ON L_pet_growth_records(pet_id, growth_stage, record_date, deleted);
CREATE INDEX idx_pet_anniversary_date_type ON L_pet_anniversaries(pet_id, anniversary_date, anniversary_type, deleted);
CREATE INDEX idx_couple_anniversary_relation ON L_couple_anniversaries(relation_id, anniversary_date, importance_level, deleted);
CREATE INDEX idx_anniversary_reminder_date ON L_anniversary_reminders(ruid, reminder_date, is_sent, deleted);
CREATE INDEX idx_purchase_pet_date ON L_pet_product_purchases(pet_id, purchase_date, ruid, deleted);
CREATE INDEX idx_purchase_category_date ON L_pet_product_purchases(product_category, purchase_date, deleted);
CREATE INDEX idx_value_assessment_purchase ON L_product_value_assessments(purchase_id, assessment_date, assessment_type, deleted);
CREATE INDEX idx_decision_user_status ON L_purchase_decisions(ruid, decision_status, decision_date, deleted);

-- =============================================
-- 添加注释说明
-- =============================================

/*
数据库设计说明：

1. 命名规范：
   - 所有表名以 L_ 开头
   - 使用小驼峰命名法
   - 主键统一命名为 [表名]_id

2. 数据隔离：
   - visibility字段控制数据可见性（1:仅自己 2:情侣可见）
   - privacy_level字段提供更细粒度的隐私控制

3. 软删除机制：
   - 所有重要表都添加了软删除功能
   - deleted字段标记删除状态（0:未删除 1:已删除）
   - delete_time字段记录删除时间
   - delete_by字段记录删除操作人
   - 为软删除字段创建了专门的索引优化查询性能

4. 冗余字段设计：
   - 在关联表中适当冗余常用查询字段
   - 如宠物名称、用户昵称等冗余到相关记录表中
   - 添加统计字段如照片总数、记录总数等
   - 冗余字段可减少JOIN查询，提升查询性能

5. 审计字段：
   - create_time, update_time 记录数据变更时间
   - create_by, update_by 记录操作人
   - 完整的数据变更追踪机制

6. 扩展性：
   - 预留JSON字段存储灵活数据
   - 字典表支持系统配置
   - 分类表支持树形结构
   - 预留扩展字段便于后续功能增加

7. 性能优化：
   - 合理的单列索引设计
   - 针对常用查询场景的复合索引
   - 软删除相关的专用索引
   - 考虑查询频率的索引优化
   - 分区字段预留

8. 数据完整性：
   - 合理的外键约束设计
   - 唯一性约束确保数据一致性
   - 默认值设置避免空值问题
   - 字段长度和类型的合理设计

9. 业务特色：
   - 情侣关系绑定机制
   - 宠物芯片编号唯一性约束
   - 疫苗提醒自动化
   - 数据查看日志记录
   - 临时授权机制
   - 共同饲养宠物支持
   - 多维度的隐私控制

10. 系统健全性：
    - 完善的用户权限体系
    - 数据备份和恢复考虑
    - 系统监控和日志记录
    - 数据迁移和升级支持
    - 多租户数据隔离
*/

-- =============================================
-- 创建视图支持软删除查询
-- =============================================

-- 活跃用户视图（未删除的用户）
CREATE VIEW V_active_users AS
SELECT * FROM L_raiser_users WHERE deleted = 0;

-- 活跃宠物视图（未删除的宠物）
CREATE VIEW V_active_pets AS
SELECT * FROM L_pets WHERE deleted = 0;

-- 活跃宠物照片视图
CREATE VIEW V_active_pet_photos AS
SELECT * FROM L_pet_photos WHERE deleted = 0;

-- 活跃健康记录视图
CREATE VIEW V_active_health_records AS
SELECT * FROM L_health_records WHERE deleted = 0;

-- 活跃护理记录视图
CREATE VIEW V_active_care_records AS
SELECT * FROM L_care_records WHERE deleted = 0;

-- 活跃疫苗记录视图
CREATE VIEW V_active_vaccine_records AS
SELECT * FROM L_vaccine_records WHERE deleted = 0;

-- 活跃消费记录视图
CREATE VIEW V_active_expense_records AS
SELECT * FROM L_expense_records WHERE deleted = 0;

-- 活跃恋爱日记视图
CREATE VIEW V_active_love_diaries AS
SELECT * FROM L_love_diaries WHERE deleted = 0;

-- 活跃提醒视图
CREATE VIEW V_active_reminders AS
SELECT * FROM L_reminders WHERE deleted = 0;

-- 活跃宠物家族关系视图
CREATE VIEW V_active_pet_family_relations AS
SELECT * FROM L_pet_family_relations WHERE deleted = 0;

-- 活跃宠物特征标签视图
CREATE VIEW V_active_pet_feature_tags AS
SELECT * FROM L_pet_feature_tags WHERE deleted = 0;

-- 活跃宠物偏好设置视图
CREATE VIEW V_active_pet_preferences AS
SELECT * FROM L_pet_preferences WHERE deleted = 0;

-- 活跃宠物成长记录视图
CREATE VIEW V_active_pet_growth_records AS
SELECT * FROM L_pet_growth_records WHERE deleted = 0;

-- 活跃宠物纪念日视图
CREATE VIEW V_active_pet_anniversaries AS
SELECT * FROM L_pet_anniversaries WHERE deleted = 0;

-- 活跃情侣纪念日视图
CREATE VIEW V_active_couple_anniversaries AS
SELECT * FROM L_couple_anniversaries WHERE deleted = 0;

-- 活跃纪念日提醒视图
CREATE VIEW V_active_anniversary_reminders AS
SELECT * FROM L_anniversary_reminders WHERE deleted = 0;

-- 活跃购买记录视图
CREATE VIEW V_active_pet_product_purchases AS
SELECT * FROM L_pet_product_purchases WHERE deleted = 0;

-- 活跃价值评估视图
CREATE VIEW V_active_product_value_assessments AS
SELECT * FROM L_product_value_assessments WHERE deleted = 0;

-- 活跃购买决策视图
CREATE VIEW V_active_purchase_decisions AS
SELECT * FROM L_purchase_decisions WHERE deleted = 0;

-- =============================================
-- 创建统计视图
-- =============================================

-- 用户宠物统计视图
CREATE VIEW V_user_pet_stats AS
SELECT 
    u.ruid,
    u.nickname,
    COUNT(p.pet_id) as total_pets,
    COUNT(CASE WHEN p.status = 1 THEN 1 END) as healthy_pets,
    COUNT(CASE WHEN p.status = 2 THEN 1 END) as sick_pets,
    COUNT(CASE WHEN p.is_shared_pet = 1 THEN 1 END) as shared_pets
FROM L_raiser_users u
LEFT JOIN L_pets p ON u.ruid = p.owner_ruid AND p.deleted = 0
WHERE u.deleted = 0
GROUP BY u.ruid, u.nickname;

-- 宠物健康统计视图
CREATE VIEW V_pet_health_stats AS
SELECT 
    p.pet_id,
    p.pet_name,
    p.owner_ruid,
    COUNT(h.record_id) as total_health_records,
    COUNT(CASE WHEN h.is_abnormal = 1 THEN 1 END) as abnormal_records,
    MAX(h.measurement_date) as last_health_check,
    COUNT(v.record_id) as total_vaccines,
    MAX(v.vaccination_date) as last_vaccination
FROM L_pets p
LEFT JOIN L_health_records h ON p.pet_id = h.pet_id AND h.deleted = 0
LEFT JOIN L_vaccine_records v ON p.pet_id = v.pet_id AND v.deleted = 0
WHERE p.deleted = 0
GROUP BY p.pet_id, p.pet_name, p.owner_ruid;

-- 消费统计视图
CREATE VIEW V_expense_stats AS
SELECT 
    e.ruid,
    YEAR(e.expense_date) as expense_year,
    MONTH(e.expense_date) as expense_month,
    COUNT(e.record_id) as total_records,
    SUM(e.amount) as total_amount,
    AVG(e.amount) as avg_amount,
    COUNT(CASE WHEN e.expense_type = 'shared' THEN 1 END) as shared_expenses,
    SUM(CASE WHEN e.expense_type = 'shared' THEN e.amount ELSE 0 END) as shared_amount
FROM L_expense_records e
WHERE e.deleted = 0
GROUP BY e.ruid, YEAR(e.expense_date), MONTH(e.expense_date);

-- 宠物完整档案统计视图
CREATE VIEW V_pet_complete_profile_stats AS
SELECT 
    p.pet_id,
    p.pet_name,
    p.owner_ruid,
    p.species,
    p.breed_name,
    COUNT(DISTINCT pf.relation_id) as family_relations_count,
    COUNT(DISTINCT pt.tag_id) as feature_tags_count,
    COUNT(DISTINCT pp.preference_id) as preferences_count,
    COUNT(DISTINCT pg.record_id) as growth_records_count,
    COUNT(DISTINCT pa.anniversary_id) as anniversaries_count,
    COUNT(DISTINCT pur.purchase_id) as purchases_count
FROM L_pets p
LEFT JOIN L_pet_family_relations pf ON p.pet_id = pf.pet_id AND pf.deleted = 0
LEFT JOIN L_pet_feature_tags pt ON p.pet_id = pt.pet_id AND pt.deleted = 0
LEFT JOIN L_pet_preferences pp ON p.pet_id = pp.pet_id AND pp.deleted = 0
LEFT JOIN L_pet_growth_records pg ON p.pet_id = pg.pet_id AND pg.deleted = 0
LEFT JOIN L_pet_anniversaries pa ON p.pet_id = pa.pet_id AND pa.deleted = 0
LEFT JOIN L_pet_product_purchases pur ON p.pet_id = pur.pet_id AND pur.deleted = 0
WHERE p.deleted = 0
GROUP BY p.pet_id, p.pet_name, p.owner_ruid, p.species, p.breed_name;

-- 用户消费统计视图
CREATE VIEW V_user_purchase_stats AS
SELECT 
    u.ruid,
    u.nickname,
    COUNT(DISTINCT p.purchase_id) as total_purchases,
    COALESCE(SUM(p.total_amount), 0) as total_spent,
    COALESCE(AVG(p.total_amount), 0) as avg_purchase_amount,
    COUNT(DISTINCT p.pet_id) as pets_purchased_for,
    MAX(p.purchase_date) as last_purchase_date,
    COALESCE(AVG(p.satisfaction_rating), 0) as avg_satisfaction
FROM L_raiser_users u
LEFT JOIN L_pet_product_purchases p ON u.ruid = p.ruid AND p.deleted = 0
WHERE u.deleted = 0
GROUP BY u.ruid, u.nickname;

-- 纪念日提醒统计视图
CREATE VIEW V_anniversary_reminder_stats AS
SELECT 
    u.ruid,
    u.nickname,
    COUNT(DISTINCT ar.reminder_id) as total_reminders,
    COUNT(DISTINCT CASE WHEN ar.is_sent = 1 THEN ar.reminder_id END) as sent_reminders,
    COUNT(DISTINCT CASE WHEN ar.is_read = 1 THEN ar.reminder_id END) as read_reminders,
    COUNT(DISTINCT CASE WHEN ar.reminder_date >= CURDATE() THEN ar.reminder_id END) as upcoming_reminders
FROM L_raiser_users u
LEFT JOIN L_anniversary_reminders ar ON u.ruid = ar.ruid AND ar.deleted = 0
WHERE u.deleted = 0
GROUP BY u.ruid, u.nickname;

-- 宠物价值资产统计视图
CREATE VIEW V_pet_asset_stats AS
SELECT 
    p.pet_id,
    p.pet_name,
    p.owner_ruid,
    COUNT(DISTINCT pur.purchase_id) as total_purchases,
    COALESCE(SUM(pur.total_amount), 0) as total_investment,
    COALESCE(AVG(pur.total_amount), 0) as avg_purchase_cost,
    COUNT(DISTINCT va.assessment_id) as total_assessments,
    COALESCE(MAX(va.current_value), 0) as latest_total_value,
    COALESCE(SUM(pur.total_amount) - MAX(va.current_value), 0) as depreciation_amount
FROM L_pets p
LEFT JOIN L_pet_product_purchases pur ON p.pet_id = pur.pet_id AND pur.deleted = 0
LEFT JOIN L_product_value_assessments va ON pur.purchase_id = va.purchase_id AND va.deleted = 0
WHERE p.deleted = 0
GROUP BY p.pet_id, p.pet_name, p.owner_ruid;

-- =============================================
-- 数据完整性检查
-- =============================================

-- 检查孤儿记录的视图
CREATE VIEW V_orphan_records AS
SELECT 'pet_photos' as table_name, photo_id as record_id, pet_id as parent_id
FROM L_pet_photos 
WHERE pet_id NOT IN (SELECT pet_id FROM L_pets WHERE deleted = 0)
UNION ALL
SELECT 'health_records' as table_name, record_id, pet_id as parent_id
FROM L_health_records 
WHERE pet_id NOT IN (SELECT pet_id FROM L_pets WHERE deleted = 0)
UNION ALL
SELECT 'care_records' as table_name, record_id, pet_id as parent_id
FROM L_care_records 
WHERE pet_id NOT IN (SELECT pet_id FROM L_pets WHERE deleted = 0);

-- =============================================
-- 性能监控视图
-- =============================================

-- 表大小统计视图
CREATE VIEW V_table_stats AS
SELECT 
    TABLE_NAME,
    TABLE_ROWS,
    ROUND(((DATA_LENGTH + INDEX_LENGTH) / 1024 / 1024), 2) AS 'Size_MB',
    ROUND((DATA_LENGTH / 1024 / 1024), 2) AS 'Data_MB',
    ROUND((INDEX_LENGTH / 1024 / 1024), 2) AS 'Index_MB'
FROM information_schema.TABLES 
WHERE TABLE_SCHEMA = DATABASE() 
AND TABLE_NAME LIKE 'L_%'
ORDER BY (DATA_LENGTH + INDEX_LENGTH) DESC;

-- =============================================
-- 猫咪年龄换算基础数据
-- =============================================

-- 插入猫咪年龄换算规则数据
INSERT INTO `L_pet_age_conversion` (`species`, `pet_age_months`, `human_equivalent_age`, `growth_stage`, `conversion_formula`, `notes`) VALUES
-- 猫咪年龄换算规则
('cat', 1, 1.0, 'infant', '1个月 = 1岁', '猫咪1个月相当于人类1岁'),
('cat', 2, 2.5, 'infant', '2个月 = 2.5岁', '猫咪2个月相当于人类2.5岁'),
('cat', 3, 5.0, 'infant', '3个月 = 5岁', '猫咪3个月相当于人类5岁'),
('cat', 4, 7.0, 'juvenile', '4个月 = 7岁', '猫咪4个月相当于人类7岁'),
('cat', 5, 8.5, 'juvenile', '5个月 = 8.5岁', '猫咪5个月相当于人类8.5岁'),
('cat', 6, 10.0, 'juvenile', '6个月 = 10岁', '猫咪6个月相当于人类10岁'),
('cat', 7, 11.5, 'juvenile', '7个月 = 11.5岁', '猫咪7个月相当于人类11.5岁'),
('cat', 8, 13.0, 'juvenile', '8个月 = 13岁', '猫咪8个月相当于人类13岁'),
('cat', 9, 13.5, 'juvenile', '9个月 = 13.5岁', '猫咪9个月相当于人类13.5岁'),
('cat', 10, 14.0, 'juvenile', '10个月 = 14岁', '猫咪10个月相当于人类14岁'),
('cat', 11, 14.5, 'juvenile', '11个月 = 14.5岁', '猫咪11个月相当于人类14.5岁'),
('cat', 12, 15.0, 'juvenile', '12个月 = 15岁', '猫咪1岁相当于人类15岁'),
('cat', 18, 20.0, 'adult', '18个月 = 20岁', '猫咪1.5岁相当于人类20岁'),
('cat', 24, 24.0, 'adult', '24个月 = 24岁', '猫咪2岁相当于人类24岁'),
('cat', 36, 28.0, 'adult', '每年+4岁', '猫咪3岁相当于人类28岁'),
('cat', 48, 32.0, 'adult', '每年+4岁', '猫咪4岁相当于人类32岁'),
('cat', 60, 36.0, 'adult', '每年+4岁', '猫咪5岁相当于人类36岁'),
('cat', 72, 40.0, 'adult', '每年+4岁', '猫咪6岁相当于人类40岁'),
('cat', 84, 44.0, 'adult', '每年+4岁', '猫咪7岁相当于人类44岁'),
('cat', 96, 48.0, 'senior', '每年+4岁', '猫咪8岁相当于人类48岁'),
('cat', 108, 52.0, 'senior', '每年+4岁', '猫咪9岁相当于人类52岁'),
('cat', 120, 56.0, 'senior', '每年+4岁', '猫咪10岁相当于人类56岁'),
('cat', 132, 60.0, 'senior', '每年+4岁', '猫咪11岁相当于人类60岁'),
('cat', 144, 64.0, 'senior', '每年+4岁', '猫咪12岁相当于人类64岁'),
('cat', 156, 68.0, 'senior', '每年+4岁', '猫咪13岁相当于人类68岁'),
('cat', 168, 72.0, 'senior', '每年+4岁', '猫咪14岁相当于人类72岁'),
('cat', 180, 76.0, 'senior', '每年+4岁', '猫咪15岁相当于人类76岁'),
('cat', 192, 80.0, 'senior', '每年+4岁', '猫咪16岁相当于人类80岁'),
('cat', 204, 84.0, 'senior', '每年+4岁', '猫咪17岁相当于人类84岁'),
('cat', 216, 88.0, 'senior', '每年+4岁', '猫咪18岁相当于人类88岁'),
('cat', 228, 92.0, 'senior', '每年+4岁', '猫咪19岁相当于人类92岁'),
('cat', 240, 96.0, 'senior', '每年+4岁', '猫咪20岁相当于人类96岁'),

-- 狗狗年龄换算规则（基础数据）
('dog', 1, 1.0, 'infant', '1个月 = 1岁', '狗狗1个月相当于人类1岁'),
('dog', 2, 2.0, 'infant', '2个月 = 2岁', '狗狗2个月相当于人类2岁'),
('dog', 3, 4.0, 'infant', '3个月 = 4岁', '狗狗3个月相当于人类4岁'),
('dog', 6, 10.0, 'juvenile', '6个月 = 10岁', '狗狗6个月相当于人类10岁'),
('dog', 12, 15.0, 'juvenile', '12个月 = 15岁', '狗狗1岁相当于人类15岁'),
('dog', 24, 24.0, 'adult', '24个月 = 24岁', '狗狗2岁相当于人类24岁'),
('dog', 36, 28.0, 'adult', '每年+4岁', '狗狗3岁相当于人类28岁'),
('dog', 48, 32.0, 'adult', '每年+4岁', '狗狗4岁相当于人类32岁'),
('dog', 60, 36.0, 'adult', '每年+4岁', '狗狗5岁相当于人类36岁'),
('dog', 72, 42.0, 'adult', '每年+6岁', '狗狗6岁相当于人类42岁'),
('dog', 84, 47.0, 'senior', '每年+5岁', '狗狗7岁相当于人类47岁'),
('dog', 96, 51.0, 'senior', '每年+4岁', '狗狗8岁相当于人类51岁'),
('dog', 108, 56.0, 'senior', '每年+5岁', '狗狗9岁相当于人类56岁'),
('dog', 120, 60.0, 'senior', '每年+4岁', '狗狗10岁相当于人类60岁');

-- =============================================
-- 宠物年龄计算函数
-- =============================================

DELIMITER //

-- 计算宠物当前年龄（月）
CREATE FUNCTION GetPetAgeInMonths(birth_date DATE)
RETURNS INT
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE age_months INT DEFAULT 0;
    
    IF birth_date IS NOT NULL AND birth_date <= CURDATE() THEN
        SET age_months = TIMESTAMPDIFF(MONTH, birth_date, CURDATE());
    END IF;
    
    RETURN age_months;
END //

-- 计算宠物相当于人类的年龄
CREATE FUNCTION GetPetHumanEquivalentAge(pet_species VARCHAR(50), birth_date DATE)
RETURNS DECIMAL(5,2)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE pet_age_months INT DEFAULT 0;
    DECLARE human_age DECIMAL(5,2) DEFAULT 0;
    
    -- 计算宠物当前年龄（月）
    SET pet_age_months = GetPetAgeInMonths(birth_date);
    
    IF pet_age_months > 0 THEN
        -- 查找最接近的年龄换算规则
        SELECT human_equivalent_age INTO human_age
        FROM L_pet_age_conversion
        WHERE species = pet_species 
          AND pet_age_months <= pet_age_months
          AND is_active = 1
        ORDER BY pet_age_months DESC
        LIMIT 1;
        
        -- 如果没找到精确匹配，使用插值计算
        IF human_age = 0 THEN
            -- 对于超出表格范围的年龄，使用线性推算
            IF pet_species = 'cat' AND pet_age_months > 240 THEN
                SET human_age = 96.0 + ((pet_age_months - 240) / 12 * 4);
            ELSEIF pet_species = 'dog' AND pet_age_months > 120 THEN
                SET human_age = 60.0 + ((pet_age_months - 120) / 12 * 4);
            ELSE
                -- 对于幼年期，使用简单比例
                SET human_age = pet_age_months * 1.0;
            END IF;
        END IF;
    END IF;
    
    RETURN human_age;
END //

-- 获取宠物成长阶段
CREATE FUNCTION GetPetGrowthStage(pet_species VARCHAR(50), birth_date DATE)
RETURNS VARCHAR(50)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE pet_age_months INT DEFAULT 0;
    DECLARE growth_stage VARCHAR(50) DEFAULT 'unknown';
    
    SET pet_age_months = GetPetAgeInMonths(birth_date);
    
    IF pet_age_months > 0 THEN
        SELECT g.growth_stage INTO growth_stage
        FROM L_pet_age_conversion g
        WHERE g.species = pet_species 
          AND g.pet_age_months <= pet_age_months
          AND g.is_active = 1
        ORDER BY g.pet_age_months DESC
        LIMIT 1;
        
        -- 如果没找到，根据通用规则判断
        IF growth_stage = 'unknown' THEN
            IF pet_age_months <= 3 THEN
                SET growth_stage = 'infant';
            ELSEIF pet_age_months <= 12 THEN
                SET growth_stage = 'juvenile';
            ELSEIF pet_age_months <= 84 THEN
                SET growth_stage = 'adult';
            ELSE
                SET growth_stage = 'senior';
            END IF;
        END IF;
    END IF;
    
    RETURN growth_stage;
END //

DELIMITER ;

-- =============================================
-- 自动更新宠物年龄的存储过程
-- =============================================

DELIMITER //

-- 批量更新所有宠物的年龄信息
CREATE PROCEDURE UpdateAllPetsAge()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE pet_id_var BIGINT;
    DECLARE birth_date_var DATE;
    DECLARE species_var VARCHAR(50);
    DECLARE age_months_var INT;
    DECLARE human_age_var DECIMAL(5,2);
    DECLARE growth_stage_var VARCHAR(50);
    
    -- 声明游标
    DECLARE pet_cursor CURSOR FOR 
        SELECT pet_id, birth_date, species 
        FROM L_pets 
        WHERE deleted = 0 AND birth_date IS NOT NULL;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    -- 开始事务
    START TRANSACTION;
    
    OPEN pet_cursor;
    
    read_loop: LOOP
        FETCH pet_cursor INTO pet_id_var, birth_date_var, species_var;
        
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        -- 计算年龄相关信息
        SET age_months_var = GetPetAgeInMonths(birth_date_var);
        SET human_age_var = GetPetHumanEquivalentAge(species_var, birth_date_var);
        SET growth_stage_var = GetPetGrowthStage(species_var, birth_date_var);
        
        -- 更新宠物年龄信息
        UPDATE L_pets 
        SET 
            age_months = age_months_var,
            update_time = CURRENT_TIMESTAMP
        WHERE pet_id = pet_id_var;
        
        -- 如果有成长记录表，也可以插入成长阶段变化记录
        -- 这里可以根据需要添加成长记录的逻辑
        
    END LOOP;
    
    CLOSE pet_cursor;
    
    -- 提交事务
    COMMIT;
    
END //

DELIMITER ;

-- =============================================
-- 护理提醒相关的存储过程
-- =============================================

DELIMITER //

-- 计算下次护理时间
CREATE PROCEDURE CalculateNextCareDate(
    IN pet_id_param BIGINT,
    IN activity_type_id_param BIGINT,
    IN last_care_date_param DATE,
    OUT next_care_date_param DATE
)
BEGIN
    DECLARE interval_days INT DEFAULT 30;
    
    -- 获取护理活动的默认间隔天数
    SELECT default_interval_days INTO interval_days
    FROM L_care_activity_types
    WHERE type_id = activity_type_id_param AND is_active = 1;
    
    -- 如果没找到间隔天数，使用默认值
    IF interval_days IS NULL THEN
        SET interval_days = 30;
    END IF;
    
    -- 计算下次护理日期
    SET next_care_date_param = DATE_ADD(last_care_date_param, INTERVAL interval_days DAY);
    
END //

-- 批量更新护理提醒
CREATE PROCEDURE UpdateCareReminders()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE pet_id_var BIGINT;
    DECLARE activity_type_id_var BIGINT;
    DECLARE last_care_date_var DATE;
    DECLARE next_care_date_var DATE;
    
    DECLARE care_cursor CURSOR FOR 
        SELECT 
            c.pet_id,
            c.activity_type_id,
            MAX(c.activity_date) as last_care_date
        FROM L_care_records c
        WHERE c.deleted = 0
        GROUP BY c.pet_id, c.activity_type_id;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    START TRANSACTION;
    
    OPEN care_cursor;
    
    read_loop: LOOP
        FETCH care_cursor INTO pet_id_var, activity_type_id_var, last_care_date_var;
        
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        -- 计算下次护理日期
        CALL CalculateNextCareDate(pet_id_var, activity_type_id_var, last_care_date_var, next_care_date_var);
        
        -- 更新护理记录的下次应做时间
        UPDATE L_care_records 
        SET next_due_date = next_care_date_var
        WHERE pet_id = pet_id_var 
          AND activity_type_id = activity_type_id_var 
          AND activity_date = last_care_date_var
          AND deleted = 0;
        
    END LOOP;
    
    CLOSE care_cursor;
    
    COMMIT;
    
END //

DELIMITER ;

-- =============================================
-- 创建定时任务事件（可选）
-- =============================================

-- 启用事件调度器
-- SET GLOBAL event_scheduler = ON;

-- 创建每日更新宠物年龄的事件
/*
CREATE EVENT IF NOT EXISTS daily_update_pet_age
ON SCHEDULE EVERY 1 DAY
STARTS CURRENT_TIMESTAMP
DO
  CALL UpdateAllPetsAge();
*/

-- 创建每日更新护理提醒的事件
/*
CREATE EVENT IF NOT EXISTS daily_update_care_reminders
ON SCHEDULE EVERY 1 DAY
STARTS CURRENT_TIMESTAMP
DO
  CALL UpdateCareReminders();
*/

-- =============================================
-- 数据库优化完成标记
-- =============================================

-- =============================================
-- 数据库性能优化
-- =============================================

-- 7.1 索引优化 - 为索引不足的表添加必要索引

-- 用户表索引优化
CREATE INDEX idx_users_phone_status ON L_raiser_users(phone, status, deleted);
CREATE INDEX idx_users_wechat_openid ON L_raiser_users(wechat_openid, deleted);
CREATE INDEX idx_users_last_login ON L_raiser_users(last_login_time, deleted);

-- 情侣关系表索引优化
CREATE INDEX idx_couple_relations_code ON L_couple_relations(relation_code, status);
CREATE INDEX idx_couple_relations_anniversary ON L_couple_relations(anniversary_date, status, deleted);

-- 喂食记录表索引优化
CREATE INDEX idx_feeding_pet_time ON L_feeding_records(pet_id, feeding_time, deleted);
CREATE INDEX idx_feeding_food_type ON L_feeding_records(food_type, feeding_time, deleted);

-- 异常记录表索引优化
CREATE INDEX idx_abnormal_pet_severity_time ON L_abnormal_records(pet_id, severity_level, occurrence_time, deleted);
CREATE INDEX idx_abnormal_recovery_status ON L_abnormal_records(recovery_status, follow_up_date, deleted);

-- 宠物训练记录索引优化
CREATE INDEX idx_training_pet_date ON L_pet_training_records(pet_id, training_date, deleted);
CREATE INDEX idx_training_skill_level ON L_pet_training_records(skill_name, skill_level, deleted);

-- 宠物社交记录索引优化
CREATE INDEX idx_social_pet_date ON L_pet_social_records(pet_id, social_date, deleted);
CREATE INDEX idx_social_interaction_type ON L_pet_social_records(interaction_type, social_date, deleted);

-- 宠物里程碑索引优化
CREATE INDEX idx_milestones_pet_date ON L_pet_milestones(pet_id, achievement_date, deleted);
CREATE INDEX idx_milestones_type ON L_pet_milestones(milestone_type, achievement_date, deleted);

-- 宠物文档索引优化
CREATE INDEX idx_documents_pet_type ON L_pet_documents(pet_id, document_type, deleted);
CREATE INDEX idx_documents_expiry ON L_pet_documents(expiry_date, document_type, deleted);

-- 宠物家族关系索引优化
CREATE INDEX idx_family_relations_pet ON L_pet_family_relations(pet_id, relation_type, deleted);
CREATE INDEX idx_family_relations_related ON L_pet_family_relations(related_pet_id, relation_type, deleted);

-- 宠物特征标签索引优化
CREATE INDEX idx_feature_tags_pet ON L_pet_feature_tags(pet_id, tag_category, deleted);
CREATE INDEX idx_feature_tags_name ON L_pet_feature_tags(tag_name, tag_category, deleted);

-- 宠物偏好设置索引优化
CREATE INDEX idx_preferences_pet ON L_pet_preferences(pet_id, preference_category, deleted);
CREATE INDEX idx_preferences_level ON L_pet_preferences(preference_level, confidence_level, deleted);

-- 宠物成长记录索引优化
CREATE INDEX idx_growth_pet_stage ON L_pet_growth_records(pet_id, growth_stage, deleted);
CREATE INDEX idx_growth_record_date ON L_pet_growth_records(record_date, growth_stage, deleted);

-- 纪念日相关索引优化
CREATE INDEX idx_pet_anniversaries_date ON L_pet_anniversaries(anniversary_date, anniversary_type, deleted);
CREATE INDEX idx_pet_anniversaries_importance ON L_pet_anniversaries(importance_level, anniversary_date, deleted);

CREATE INDEX idx_couple_anniversaries_date ON L_couple_anniversaries(anniversary_date, anniversary_type, deleted);
CREATE INDEX idx_couple_anniversaries_relation ON L_couple_anniversaries(relation_id, anniversary_date, deleted);

CREATE INDEX idx_anniversary_reminders_time ON L_anniversary_reminders(reminder_date, is_sent, deleted);
CREATE INDEX idx_anniversary_reminders_type ON L_anniversary_reminders(anniversary_type, reminder_date, deleted);

-- 购买决策记录索引优化
CREATE INDEX idx_purchase_decisions_status ON L_purchase_decisions(decision_status, decision_date, deleted);
CREATE INDEX idx_purchase_decisions_urgency ON L_purchase_decisions(urgency_level, decision_date, deleted);

-- 物品价值评估索引优化
CREATE INDEX idx_value_assessments_product ON L_product_value_assessments(product_purchase_id, assessment_date, deleted);
CREATE INDEX idx_value_assessments_type ON L_product_value_assessments(assessment_type, assessment_date, deleted);

-- 7.2 数据类型优化 - 优化过长或不合适的数据类型

-- 优化VARCHAR长度（根据实际使用情况调整）
ALTER TABLE L_raiser_users MODIFY COLUMN nickname varchar(30) DEFAULT NULL COMMENT '昵称';
ALTER TABLE L_raiser_users MODIFY COLUMN last_login_ip varchar(45) DEFAULT NULL COMMENT '最后登录IP';

ALTER TABLE L_pets MODIFY COLUMN pet_nickname varchar(50) DEFAULT NULL COMMENT '宠物昵称';
ALTER TABLE L_pets MODIFY COLUMN color varchar(50) DEFAULT NULL COMMENT '毛色/颜色';
ALTER TABLE L_pets MODIFY COLUMN pattern varchar(50) DEFAULT NULL COMMENT '花纹特征';

ALTER TABLE L_pet_photos MODIFY COLUMN photo_title varchar(100) DEFAULT NULL COMMENT '照片标题';
ALTER TABLE L_pet_photos MODIFY COLUMN location varchar(100) DEFAULT NULL COMMENT '拍摄地点';

-- 7.3 创建高性能查询视图

-- 创建高性能的宠物概览视图
CREATE OR REPLACE VIEW V_pet_overview_optimized AS
SELECT 
    p.pet_id,
    p.pet_name,
    p.species,
    p.breed_name,
    p.owner_nickname,
    p.status,
    p.age_months,
    p.weight,
    p.total_photos,
    p.last_health_check_date,
    p.create_time,
    GetPetHumanEquivalentAge(p.species, p.birth_date) as human_equivalent_age,
    GetPetGrowthStage(p.species, p.birth_date) as growth_stage
FROM L_pets p
WHERE p.deleted = 0
ORDER BY p.update_time DESC;

-- 创建用户宠物统计视图
CREATE OR REPLACE VIEW V_user_pet_stats_optimized AS
SELECT 
    u.ruid,
    u.nickname,
    COUNT(p.pet_id) as pet_count,
    COUNT(CASE WHEN p.status = 1 THEN 1 END) as healthy_pets,
    COUNT(CASE WHEN p.species = 'cat' THEN 1 END) as cat_count,
    COUNT(CASE WHEN p.species = 'dog' THEN 1 END) as dog_count,
    MAX(p.update_time) as last_pet_update
FROM L_raiser_users u
LEFT JOIN L_pets p ON u.ruid = p.owner_ruid AND p.deleted = 0
WHERE u.deleted = 0
GROUP BY u.ruid, u.nickname;

-- 创建性能监控视图
CREATE OR REPLACE VIEW V_table_performance_stats AS
SELECT 
    TABLE_NAME,
    TABLE_ROWS,
    ROUND(DATA_LENGTH/1024/1024, 2) AS data_size_mb,
    ROUND(INDEX_LENGTH/1024/1024, 2) AS index_size_mb,
    ROUND((DATA_LENGTH + INDEX_LENGTH)/1024/1024, 2) AS total_size_mb
FROM information_schema.TABLES 
WHERE TABLE_SCHEMA = DATABASE() 
AND TABLE_NAME LIKE 'L_%'
ORDER BY (DATA_LENGTH + INDEX_LENGTH) DESC;

-- 插入优化完成标记
INSERT INTO `L_system_dict` (`dict_type`, `dict_key`, `dict_value`, `dict_label`, `sort_order`, `is_active`) VALUES
('system_status', 'db_optimized', '1', '数据库已优化', 1, 1),
('system_status', 'performance_optimized', '1', '性能优化已完成', 2, 1),
('system_status', 'age_conversion_enabled', '1', '年龄换算功能已启用', 3, 1),
('system_status', 'care_reminder_enabled', '1', '护理提醒功能已启用', 4, 1),
('system_status', 'adoption_history_enabled', '1', '领养历史功能已启用', 5, 1)
ON DUPLICATE KEY UPDATE 
    dict_value = VALUES(dict_value),
    dict_label = VALUES(dict_label),
    update_time = CURRENT_TIMESTAMP;

-- =============================================
-- 8. 宠物社交功能扩展
-- =============================================

-- 宠物朋友圈表
DROP TABLE IF EXISTS `L_pet_moments`;
CREATE TABLE `L_pet_moments` (
  `moment_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '动态ID',
  `pet_id` bigint(20) NOT NULL COMMENT '宠物ID',
  `owner_ruid` bigint(20) NOT NULL COMMENT '发布者ID',
  `content` text NOT NULL COMMENT '动态内容',
  `moment_type` varchar(50) NOT NULL DEFAULT 'text' COMMENT '动态类型 text:文字 photo:图片 video:视频 activity:活动',
  `media_urls` text DEFAULT NULL COMMENT '媒体文件URLs(JSON格式)',
  `location` varchar(200) DEFAULT NULL COMMENT '位置信息',
  `mood` varchar(50) DEFAULT NULL COMMENT '心情状态',
  `tags` varchar(500) DEFAULT NULL COMMENT '标签(逗号分隔)',
  `visibility` tinyint(1) NOT NULL DEFAULT '1' COMMENT '可见性 1:公开 2:仅朋友 3:仅自己',
  `like_count` int(11) NOT NULL DEFAULT '0' COMMENT '点赞数',
  `comment_count` int(11) NOT NULL DEFAULT '0' COMMENT '评论数',
  `share_count` int(11) NOT NULL DEFAULT '0' COMMENT '分享数',
  `is_pinned` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否置顶',
  `pet_name` varchar(100) DEFAULT NULL COMMENT '宠物名称(冗余字段)',
  `owner_nickname` varchar(50) DEFAULT NULL COMMENT '发布者昵称(冗余字段)',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`moment_id`),
  INDEX `idx_pet_id` (`pet_id`),
  INDEX `idx_owner_ruid` (`owner_ruid`),
  INDEX `idx_moment_type` (`moment_type`),
  INDEX `idx_visibility` (`visibility`),
  INDEX `idx_create_time` (`create_time`),
  INDEX `idx_like_count` (`like_count`),
  INDEX `idx_is_pinned` (`is_pinned`),
  INDEX `idx_deleted` (`deleted`),
  FOREIGN KEY (`pet_id`) REFERENCES `L_pets` (`pet_id`) ON DELETE CASCADE,
  FOREIGN KEY (`owner_ruid`) REFERENCES `L_raiser_users` (`ruid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='宠物朋友圈动态表';

-- 宠物朋友圈互动表
DROP TABLE IF EXISTS `L_pet_moment_interactions`;
CREATE TABLE `L_pet_moment_interactions` (
  `interaction_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '互动ID',
  `moment_id` bigint(20) NOT NULL COMMENT '动态ID',
  `user_ruid` bigint(20) NOT NULL COMMENT '用户ID',
  `interaction_type` varchar(50) NOT NULL COMMENT '互动类型 like:点赞 comment:评论 share:分享 report:举报',
  `content` text DEFAULT NULL COMMENT '互动内容(评论内容等)',
  `reply_to_interaction_id` bigint(20) DEFAULT NULL COMMENT '回复的互动ID',
  `is_anonymous` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否匿名',
  `user_nickname` varchar(50) DEFAULT NULL COMMENT '用户昵称(冗余字段)',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`interaction_id`),
  UNIQUE KEY `uk_moment_user_type` (`moment_id`, `user_ruid`, `interaction_type`),
  INDEX `idx_moment_id` (`moment_id`),
  INDEX `idx_user_ruid` (`user_ruid`),
  INDEX `idx_interaction_type` (`interaction_type`),
  INDEX `idx_reply_to` (`reply_to_interaction_id`),
  INDEX `idx_create_time` (`create_time`),
  INDEX `idx_deleted` (`deleted`),
  FOREIGN KEY (`moment_id`) REFERENCES `L_pet_moments` (`moment_id`) ON DELETE CASCADE,
  FOREIGN KEY (`user_ruid`) REFERENCES `L_raiser_users` (`ruid`) ON DELETE CASCADE,
  FOREIGN KEY (`reply_to_interaction_id`) REFERENCES `L_pet_moment_interactions` (`interaction_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='宠物朋友圈互动表';

-- 宠物社交关系表
DROP TABLE IF EXISTS `L_pet_friendships`;
CREATE TABLE `L_pet_friendships` (
  `friendship_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '友谊ID',
  `pet_id_1` bigint(20) NOT NULL COMMENT '宠物1ID',
  `pet_id_2` bigint(20) NOT NULL COMMENT '宠物2ID',
  `friendship_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '友谊状态 0:待确认 1:已确认 2:已拒绝 3:已解除',
  `friendship_level` tinyint(1) NOT NULL DEFAULT '1' COMMENT '友谊等级 1:普通朋友 2:好朋友 3:最佳朋友',
  `first_meet_date` date DEFAULT NULL COMMENT '初次见面日期',
  `first_meet_location` varchar(200) DEFAULT NULL COMMENT '初次见面地点',
  `friendship_story` text DEFAULT NULL COMMENT '友谊故事',
  `common_activities` varchar(500) DEFAULT NULL COMMENT '共同活动(逗号分隔)',
  `interaction_frequency` tinyint(1) DEFAULT NULL COMMENT '互动频率 1:很少 2:偶尔 3:经常 4:频繁 5:每天',
  `compatibility_score` tinyint(1) DEFAULT NULL COMMENT '兼容性评分 1-10分',
  `last_interaction_date` date DEFAULT NULL COMMENT '最后互动日期',
  `total_meetings` int(11) NOT NULL DEFAULT '0' COMMENT '总见面次数',
  `pet_name_1` varchar(100) DEFAULT NULL COMMENT '宠物1名称(冗余字段)',
  `pet_name_2` varchar(100) DEFAULT NULL COMMENT '宠物2名称(冗余字段)',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`friendship_id`),
  UNIQUE KEY `uk_pet_friendship` (`pet_id_1`, `pet_id_2`),
  INDEX `idx_pet_id_1` (`pet_id_1`),
  INDEX `idx_pet_id_2` (`pet_id_2`),
  INDEX `idx_friendship_status` (`friendship_status`),
  INDEX `idx_friendship_level` (`friendship_level`),
  INDEX `idx_first_meet_date` (`first_meet_date`),
  INDEX `idx_last_interaction` (`last_interaction_date`),
  INDEX `idx_deleted` (`deleted`),
  FOREIGN KEY (`pet_id_1`) REFERENCES `L_pets` (`pet_id`) ON DELETE CASCADE,
  FOREIGN KEY (`pet_id_2`) REFERENCES `L_pets` (`pet_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='宠物社交关系表';

-- 宠物聚会活动表
DROP TABLE IF EXISTS `L_pet_gatherings`;
CREATE TABLE `L_pet_gatherings` (
  `gathering_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '聚会ID',
  `organizer_ruid` bigint(20) NOT NULL COMMENT '组织者ID',
  `gathering_name` varchar(200) NOT NULL COMMENT '聚会名称',
  `gathering_type` varchar(50) NOT NULL COMMENT '聚会类型 playdate:玩耍聚会 training:训练聚会 birthday:生日聚会 adoption:领养聚会 competition:比赛 exhibition:展览 other:其他',
  `description` text DEFAULT NULL COMMENT '聚会描述',
  `gathering_date` datetime NOT NULL COMMENT '聚会时间',
  `duration_hours` decimal(3,1) DEFAULT NULL COMMENT '持续时间(小时)',
  `location_name` varchar(200) DEFAULT NULL COMMENT '地点名称',
  `location_address` varchar(500) DEFAULT NULL COMMENT '详细地址',
  `location_coordinates` varchar(100) DEFAULT NULL COMMENT '地理坐标',
  `max_participants` int(11) DEFAULT NULL COMMENT '最大参与数',
  `current_participants` int(11) NOT NULL DEFAULT '0' COMMENT '当前参与数',
  `entry_fee` decimal(10,2) DEFAULT NULL COMMENT '参与费用',
  `age_restriction` varchar(100) DEFAULT NULL COMMENT '年龄限制',
  `species_restriction` varchar(200) DEFAULT NULL COMMENT '物种限制',
  `size_restriction` varchar(100) DEFAULT NULL COMMENT '体型限制',
  `special_requirements` text DEFAULT NULL COMMENT '特殊要求',
  `contact_info` varchar(200) DEFAULT NULL COMMENT '联系方式',
  `gathering_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '聚会状态 1:筹备中 2:报名中 3:已满员 4:进行中 5:已结束 6:已取消',
  `weather_requirement` varchar(100) DEFAULT NULL COMMENT '天气要求',
  `equipment_provided` text DEFAULT NULL COMMENT '提供设备',
  `equipment_needed` text DEFAULT NULL COMMENT '需要携带',
  `safety_measures` text DEFAULT NULL COMMENT '安全措施',
  `photo_gallery` text DEFAULT NULL COMMENT '活动照片(JSON格式)',
  `feedback_summary` text DEFAULT NULL COMMENT '反馈总结',
  `rating_average` decimal(3,2) DEFAULT NULL COMMENT '平均评分',
  `total_ratings` int(11) NOT NULL DEFAULT '0' COMMENT '评分总数',
  `organizer_nickname` varchar(50) DEFAULT NULL COMMENT '组织者昵称(冗余字段)',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`gathering_id`),
  INDEX `idx_organizer_ruid` (`organizer_ruid`),
  INDEX `idx_gathering_type` (`gathering_type`),
  INDEX `idx_gathering_date` (`gathering_date`),
  INDEX `idx_gathering_status` (`gathering_status`),
  INDEX `idx_location` (`location_name`),
  INDEX `idx_participants` (`current_participants`, `max_participants`),
  INDEX `idx_rating` (`rating_average`),
  INDEX `idx_deleted` (`deleted`),
  FOREIGN KEY (`organizer_ruid`) REFERENCES `L_raiser_users` (`ruid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='宠物聚会活动表';

-- 宠物聚会参与记录表
DROP TABLE IF EXISTS `L_pet_gathering_participants`;
CREATE TABLE `L_pet_gathering_participants` (
  `participant_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '参与记录ID',
  `gathering_id` bigint(20) NOT NULL COMMENT '聚会ID',
  `pet_id` bigint(20) NOT NULL COMMENT '宠物ID',
  `owner_ruid` bigint(20) NOT NULL COMMENT '主人ID',
  `registration_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '报名时间',
  `participation_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '参与状态 1:已报名 2:已确认 3:已参加 4:未参加 5:已取消',
  `arrival_time` datetime DEFAULT NULL COMMENT '到达时间',
  `departure_time` datetime DEFAULT NULL COMMENT '离开时间',
  `special_notes` text DEFAULT NULL COMMENT '特殊说明',
  `emergency_contact` varchar(200) DEFAULT NULL COMMENT '紧急联系人',
  `emergency_phone` varchar(20) DEFAULT NULL COMMENT '紧急联系电话',
  `rating` tinyint(1) DEFAULT NULL COMMENT '活动评分 1-5分',
  `feedback` text DEFAULT NULL COMMENT '活动反馈',
  `photos_shared` text DEFAULT NULL COMMENT '分享照片(JSON格式)',
  `pet_name` varchar(100) DEFAULT NULL COMMENT '宠物名称(冗余字段)',
  `owner_nickname` varchar(50) DEFAULT NULL COMMENT '主人昵称(冗余字段)',
  `gathering_name` varchar(200) DEFAULT NULL COMMENT '聚会名称(冗余字段)',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`participant_id`),
  UNIQUE KEY `uk_gathering_pet` (`gathering_id`, `pet_id`),
  INDEX `idx_gathering_id` (`gathering_id`),
  INDEX `idx_pet_id` (`pet_id`),
  INDEX `idx_owner_ruid` (`owner_ruid`),
  INDEX `idx_participation_status` (`participation_status`),
  INDEX `idx_registration_time` (`registration_time`),
  INDEX `idx_rating` (`rating`),
  INDEX `idx_deleted` (`deleted`),
  FOREIGN KEY (`gathering_id`) REFERENCES `L_pet_gatherings` (`gathering_id`) ON DELETE CASCADE,
  FOREIGN KEY (`pet_id`) REFERENCES `L_pets` (`pet_id`) ON DELETE CASCADE,
  FOREIGN KEY (`owner_ruid`) REFERENCES `L_raiser_users` (`ruid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='宠物聚会参与记录表';

-- =============================================
-- 9. 宠物教育训练功能扩展
-- =============================================

-- 训练课程表
DROP TABLE IF EXISTS `L_training_courses`;
CREATE TABLE `L_training_courses` (
  `course_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '课程ID',
  `course_name` varchar(200) NOT NULL COMMENT '课程名称',
  `course_category` varchar(50) NOT NULL COMMENT '课程分类 basic:基础训练 obedience:服从训练 agility:敏捷训练 behavior:行为矫正 trick:技巧训练 therapy:治疗训练 competition:竞赛训练',
  `course_description` text DEFAULT NULL COMMENT '课程描述',
  `target_species` varchar(200) DEFAULT NULL COMMENT '适用物种(逗号分隔)',
  `difficulty_level` tinyint(1) NOT NULL DEFAULT '1' COMMENT '难度等级 1:入门 2:初级 3:中级 4:高级 5:专业',
  `age_requirement_min` int(11) DEFAULT NULL COMMENT '最小年龄要求(月)',
  `age_requirement_max` int(11) DEFAULT NULL COMMENT '最大年龄要求(月)',
  `duration_weeks` int(11) DEFAULT NULL COMMENT '课程周期(周)',
  `sessions_per_week` int(11) DEFAULT NULL COMMENT '每周课时',
  `session_duration_minutes` int(11) DEFAULT NULL COMMENT '单次课时长(分钟)',
  `max_students` int(11) DEFAULT NULL COMMENT '最大学员数',
  `course_fee` decimal(10,2) DEFAULT NULL COMMENT '课程费用',
  `equipment_needed` text DEFAULT NULL COMMENT '所需设备',
  `prerequisites` text DEFAULT NULL COMMENT '前置要求',
  `learning_objectives` text DEFAULT NULL COMMENT '学习目标',
  `course_outline` text DEFAULT NULL COMMENT '课程大纲',
  `instructor_requirements` text DEFAULT NULL COMMENT '教练要求',
  `safety_guidelines` text DEFAULT NULL COMMENT '安全指导',
  `success_criteria` text DEFAULT NULL COMMENT '成功标准',
  `certification_available` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否提供认证',
  `course_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '课程状态 1:活跃 2:暂停 3:停用',
  `total_enrollments` int(11) NOT NULL DEFAULT '0' COMMENT '总报名数',
  `completion_rate` decimal(5,2) DEFAULT NULL COMMENT '完成率(%)',
  `average_rating` decimal(3,2) DEFAULT NULL COMMENT '平均评分',
  `total_ratings` int(11) NOT NULL DEFAULT '0' COMMENT '评分总数',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`course_id`),
  INDEX `idx_course_category` (`course_category`),
  INDEX `idx_difficulty_level` (`difficulty_level`),
  INDEX `idx_course_status` (`course_status`),
  INDEX `idx_target_species` (`target_species`),
  INDEX `idx_age_requirement` (`age_requirement_min`, `age_requirement_max`),
  INDEX `idx_course_fee` (`course_fee`),
  INDEX `idx_average_rating` (`average_rating`),
  INDEX `idx_deleted` (`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='训练课程表';

-- 宠物训练报名表
DROP TABLE IF EXISTS `L_pet_training_enrollments`;
CREATE TABLE `L_pet_training_enrollments` (
  `enrollment_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '报名ID',
  `course_id` bigint(20) NOT NULL COMMENT '课程ID',
  `pet_id` bigint(20) NOT NULL COMMENT '宠物ID',
  `owner_ruid` bigint(20) NOT NULL COMMENT '主人ID',
  `enrollment_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '报名时间',
  `start_date` date DEFAULT NULL COMMENT '开始日期',
  `expected_end_date` date DEFAULT NULL COMMENT '预期结束日期',
  `actual_end_date` date DEFAULT NULL COMMENT '实际结束日期',
  `enrollment_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '报名状态 1:已报名 2:进行中 3:已完成 4:已退出 5:已暂停',
  `payment_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '付款状态 0:未付款 1:已付款 2:部分付款 3:已退款',
  `payment_amount` decimal(10,2) DEFAULT NULL COMMENT '付款金额',
  `discount_amount` decimal(10,2) DEFAULT NULL COMMENT '优惠金额',
  `refund_amount` decimal(10,2) DEFAULT NULL COMMENT '退款金额',
  `instructor_ruid` bigint(20) DEFAULT NULL COMMENT '教练ID',
  `initial_assessment` text DEFAULT NULL COMMENT '初始评估',
  `training_goals` text DEFAULT NULL COMMENT '训练目标',
  `special_notes` text DEFAULT NULL COMMENT '特殊说明',
  `progress_percentage` decimal(5,2) NOT NULL DEFAULT '0.00' COMMENT '进度百分比',
  `sessions_completed` int(11) NOT NULL DEFAULT '0' COMMENT '已完成课时',
  `sessions_total` int(11) DEFAULT NULL COMMENT '总课时数',
  `attendance_rate` decimal(5,2) DEFAULT NULL COMMENT '出勤率(%)',
  `final_assessment` text DEFAULT NULL COMMENT '最终评估',
  `certification_earned` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否获得认证',
  `certification_date` date DEFAULT NULL COMMENT '认证日期',
  `rating` tinyint(1) DEFAULT NULL COMMENT '课程评分 1-5分',
  `feedback` text DEFAULT NULL COMMENT '课程反馈',
  `course_name` varchar(200) DEFAULT NULL COMMENT '课程名称(冗余字段)',
  `pet_name` varchar(100) DEFAULT NULL COMMENT '宠物名称(冗余字段)',
  `owner_nickname` varchar(50) DEFAULT NULL COMMENT '主人昵称(冗余字段)',
  `instructor_nickname` varchar(50) DEFAULT NULL COMMENT '教练昵称(冗余字段)',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`enrollment_id`),
  UNIQUE KEY `uk_course_pet` (`course_id`, `pet_id`),
  INDEX `idx_course_id` (`course_id`),
  INDEX `idx_pet_id` (`pet_id`),
  INDEX `idx_owner_ruid` (`owner_ruid`),
  INDEX `idx_instructor_ruid` (`instructor_ruid`),
  INDEX `idx_enrollment_status` (`enrollment_status`),
  INDEX `idx_payment_status` (`payment_status`),
  INDEX `idx_start_date` (`start_date`),
  INDEX `idx_progress` (`progress_percentage`),
  INDEX `idx_certification` (`certification_earned`, `certification_date`),
  INDEX `idx_deleted` (`deleted`),
  FOREIGN KEY (`course_id`) REFERENCES `L_training_courses` (`course_id`) ON DELETE CASCADE,
  FOREIGN KEY (`pet_id`) REFERENCES `L_pets` (`pet_id`) ON DELETE CASCADE,
  FOREIGN KEY (`owner_ruid`) REFERENCES `L_raiser_users` (`ruid`) ON DELETE CASCADE,
  FOREIGN KEY (`instructor_ruid`) REFERENCES `L_raiser_users` (`ruid`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='宠物训练报名表';

-- 训练课时记录表
DROP TABLE IF EXISTS `L_training_sessions`;
CREATE TABLE `L_training_sessions` (
  `session_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '课时ID',
  `enrollment_id` bigint(20) NOT NULL COMMENT '报名ID',
  `session_number` int(11) NOT NULL COMMENT '课时序号',
  `session_date` datetime NOT NULL COMMENT '上课时间',
  `duration_minutes` int(11) NOT NULL COMMENT '实际时长(分钟)',
  `session_type` varchar(50) NOT NULL DEFAULT 'regular' COMMENT '课时类型 regular:常规课 makeup:补课 assessment:评估 practice:练习',
  `attendance_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '出勤状态 1:出席 2:迟到 3:早退 4:缺席 5:请假',
  `session_content` text DEFAULT NULL COMMENT '课时内容',
  `skills_practiced` varchar(500) DEFAULT NULL COMMENT '练习技能(逗号分隔)',
  `performance_rating` tinyint(1) DEFAULT NULL COMMENT '表现评分 1-5分',
  `progress_notes` text DEFAULT NULL COMMENT '进度记录',
  `homework_assigned` text DEFAULT NULL COMMENT '布置作业',
  `next_session_goals` text DEFAULT NULL COMMENT '下次课目标',
  `instructor_feedback` text DEFAULT NULL COMMENT '教练反馈',
  `owner_feedback` text DEFAULT NULL COMMENT '主人反馈',
  `behavioral_observations` text DEFAULT NULL COMMENT '行为观察',
  `challenges_encountered` text DEFAULT NULL COMMENT '遇到困难',
  `breakthroughs_achieved` text DEFAULT NULL COMMENT '取得突破',
  `media_files` text DEFAULT NULL COMMENT '媒体文件(JSON格式)',
  `weather_conditions` varchar(100) DEFAULT NULL COMMENT '天气条件',
  `location` varchar(200) DEFAULT NULL COMMENT '上课地点',
  `equipment_used` varchar(500) DEFAULT NULL COMMENT '使用设备',
  `session_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '课时状态 1:已完成 2:已取消 3:需补课',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`session_id`),
  INDEX `idx_enrollment_id` (`enrollment_id`),
  INDEX `idx_session_date` (`session_date`),
  INDEX `idx_session_number` (`session_number`),
  INDEX `idx_attendance_status` (`attendance_status`),
  INDEX `idx_performance_rating` (`performance_rating`),
  INDEX `idx_session_status` (`session_status`),
  INDEX `idx_deleted` (`deleted`),
  FOREIGN KEY (`enrollment_id`) REFERENCES `L_pet_training_enrollments` (`enrollment_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='训练课时记录表';

-- 技能认证表
DROP TABLE IF EXISTS `L_pet_skill_certifications`;
CREATE TABLE `L_pet_skill_certifications` (
  `certification_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '认证ID',
  `pet_id` bigint(20) NOT NULL COMMENT '宠物ID',
  `skill_name` varchar(200) NOT NULL COMMENT '技能名称',
  `skill_category` varchar(50) NOT NULL COMMENT '技能分类 basic:基础技能 obedience:服从技能 agility:敏捷技能 trick:技巧技能 therapy:治疗技能 service:服务技能',
  `certification_level` tinyint(1) NOT NULL COMMENT '认证等级 1:初级 2:中级 3:高级 4:专家 5:大师',
  `certifying_organization` varchar(200) DEFAULT NULL COMMENT '认证机构',
  `instructor_ruid` bigint(20) DEFAULT NULL COMMENT '认证教练ID',
  `assessment_date` date NOT NULL COMMENT '评估日期',
  `certification_date` date NOT NULL COMMENT '认证日期',
  `expiry_date` date DEFAULT NULL COMMENT '过期日期',
  `assessment_score` decimal(5,2) DEFAULT NULL COMMENT '评估分数',
  `pass_threshold` decimal(5,2) DEFAULT NULL COMMENT '通过阈值',
  `assessment_criteria` text DEFAULT NULL COMMENT '评估标准',
  `performance_details` text DEFAULT NULL COMMENT '表现详情',
  `strengths` text DEFAULT NULL COMMENT '优势',
  `areas_for_improvement` text DEFAULT NULL COMMENT '改进领域',
  `certificate_number` varchar(100) DEFAULT NULL COMMENT '证书编号',
  `certificate_url` varchar(500) DEFAULT NULL COMMENT '证书文件URL',
  `verification_code` varchar(50) DEFAULT NULL COMMENT '验证码',
  `is_verified` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否已验证',
  `verification_date` datetime DEFAULT NULL COMMENT '验证时间',
  `renewal_required` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否需要续期',
  `next_assessment_date` date DEFAULT NULL COMMENT '下次评估日期',
  `certification_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '认证状态 1:有效 2:已过期 3:已撤销 4:暂停',
  `public_display` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否公开展示',
  `achievement_notes` text DEFAULT NULL COMMENT '成就备注',
  `pet_name` varchar(100) DEFAULT NULL COMMENT '宠物名称(冗余字段)',
  `instructor_nickname` varchar(50) DEFAULT NULL COMMENT '教练昵称(冗余字段)',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`certification_id`),
  UNIQUE KEY `uk_certificate_number` (`certificate_number`),
  INDEX `idx_pet_id` (`pet_id`),
  INDEX `idx_skill_name` (`skill_name`),
  INDEX `idx_skill_category` (`skill_category`),
  INDEX `idx_certification_level` (`certification_level`),
  INDEX `idx_instructor_ruid` (`instructor_ruid`),
  INDEX `idx_certification_date` (`certification_date`),
  INDEX `idx_expiry_date` (`expiry_date`),
  INDEX `idx_certification_status` (`certification_status`),
  INDEX `idx_is_verified` (`is_verified`),
  INDEX `idx_public_display` (`public_display`),
  INDEX `idx_deleted` (`deleted`),
  FOREIGN KEY (`pet_id`) REFERENCES `L_pets` (`pet_id`) ON DELETE CASCADE,
  FOREIGN KEY (`instructor_ruid`) REFERENCES `L_raiser_users` (`ruid`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='宠物技能认证表';

-- 训练进度跟踪表
DROP TABLE IF EXISTS `L_training_progress_tracking`;
CREATE TABLE `L_training_progress_tracking` (
  `tracking_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '跟踪ID',
  `enrollment_id` bigint(20) NOT NULL COMMENT '报名ID',
  `skill_name` varchar(200) NOT NULL COMMENT '技能名称',
  `tracking_date` date NOT NULL COMMENT '跟踪日期',
  `proficiency_level` tinyint(1) NOT NULL DEFAULT '1' COMMENT '熟练度 1:初学 2:练习 3:熟练 4:精通 5:专家',
  `consistency_rating` tinyint(1) DEFAULT NULL COMMENT '一致性评分 1-5分',
  `speed_rating` tinyint(1) DEFAULT NULL COMMENT '速度评分 1-5分',
  `accuracy_rating` tinyint(1) DEFAULT NULL COMMENT '准确性评分 1-5分',
  `enthusiasm_rating` tinyint(1) DEFAULT NULL COMMENT '积极性评分 1-5分',
  `difficulty_level` tinyint(1) DEFAULT NULL COMMENT '当前难度 1-5级',
  `success_rate` decimal(5,2) DEFAULT NULL COMMENT '成功率(%)',
  `practice_frequency` varchar(50) DEFAULT NULL COMMENT '练习频率',
  `time_to_complete` int(11) DEFAULT NULL COMMENT '完成时间(秒)',
  `distractions_handled` tinyint(1) DEFAULT NULL COMMENT '抗干扰能力 1-5分',
  `environmental_adaptability` tinyint(1) DEFAULT NULL COMMENT '环境适应性 1-5分',
  `progress_notes` text DEFAULT NULL COMMENT '进度备注',
  `challenges_faced` text DEFAULT NULL COMMENT '面临挑战',
  `improvement_suggestions` text DEFAULT NULL COMMENT '改进建议',
  `next_milestone` varchar(200) DEFAULT NULL COMMENT '下个里程碑',
  `estimated_mastery_date` date DEFAULT NULL COMMENT '预计掌握日期',
  `video_evidence` varchar(500) DEFAULT NULL COMMENT '视频证据URL',
  `photo_evidence` text DEFAULT NULL COMMENT '照片证据(JSON格式)',
  `witness_present` varchar(200) DEFAULT NULL COMMENT '见证人',
  `training_environment` varchar(200) DEFAULT NULL COMMENT '训练环境',
  `weather_conditions` varchar(100) DEFAULT NULL COMMENT '天气条件',
  `pet_mood` varchar(50) DEFAULT NULL COMMENT '宠物情绪',
  `health_status` varchar(100) DEFAULT NULL COMMENT '健康状态',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`tracking_id`),
  INDEX `idx_enrollment_id` (`enrollment_id`),
  INDEX `idx_skill_name` (`skill_name`),
  INDEX `idx_tracking_date` (`tracking_date`),
  INDEX `idx_proficiency_level` (`proficiency_level`),
  INDEX `idx_success_rate` (`success_rate`),
  INDEX `idx_difficulty_level` (`difficulty_level`),
  INDEX `idx_deleted` (`deleted`),
  FOREIGN KEY (`enrollment_id`) REFERENCES `L_pet_training_enrollments` (`enrollment_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='训练进度跟踪表';

-- =============================================
-- 10. 情侣互动记录功能扩展
-- =============================================

-- 情侣聊天记录表
DROP TABLE IF EXISTS `L_couple_chat_messages`;
CREATE TABLE `L_couple_chat_messages` (
  `message_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '消息ID',
  `relation_id` bigint(20) NOT NULL COMMENT '情侣关系ID',
  `sender_ruid` bigint(20) NOT NULL COMMENT '发送者ID',
  `receiver_ruid` bigint(20) NOT NULL COMMENT '接收者ID',
  `message_type` varchar(50) NOT NULL DEFAULT 'text' COMMENT '消息类型 text:文字 image:图片 voice:语音 video:视频 file:文件 location:位置 emoji:表情 sticker:贴纸',
  `content` text DEFAULT NULL COMMENT '消息内容',
  `media_url` varchar(500) DEFAULT NULL COMMENT '媒体文件URL',
  `media_duration` int(11) DEFAULT NULL COMMENT '媒体时长(秒)',
  `media_size` bigint(20) DEFAULT NULL COMMENT '媒体文件大小(字节)',
  `thumbnail_url` varchar(500) DEFAULT NULL COMMENT '缩略图URL',
  `location_latitude` decimal(10,8) DEFAULT NULL COMMENT '位置纬度',
  `location_longitude` decimal(11,8) DEFAULT NULL COMMENT '位置经度',
  `location_address` varchar(500) DEFAULT NULL COMMENT '位置地址',
  `reply_to_message_id` bigint(20) DEFAULT NULL COMMENT '回复的消息ID',
  `is_forwarded` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否转发消息',
  `forward_from_ruid` bigint(20) DEFAULT NULL COMMENT '转发来源用户ID',
  `is_edited` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已编辑',
  `edit_time` datetime DEFAULT NULL COMMENT '编辑时间',
  `is_recalled` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已撤回',
  `recall_time` datetime DEFAULT NULL COMMENT '撤回时间',
  `delivery_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '投递状态 0:发送中 1:已送达 2:已读 3:发送失败',
  `read_time` datetime DEFAULT NULL COMMENT '已读时间',
  `is_important` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否重要消息',
  `is_favorite` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否收藏',
  `emotion_score` tinyint(1) DEFAULT NULL COMMENT '情感评分 1-5分',
  `ai_analysis` text DEFAULT NULL COMMENT 'AI情感分析结果',
  `sender_nickname` varchar(50) DEFAULT NULL COMMENT '发送者昵称(冗余字段)',
  `receiver_nickname` varchar(50) DEFAULT NULL COMMENT '接收者昵称(冗余字段)',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`message_id`),
  INDEX `idx_relation_id` (`relation_id`),
  INDEX `idx_sender_ruid` (`sender_ruid`),
  INDEX `idx_receiver_ruid` (`receiver_ruid`),
  INDEX `idx_message_type` (`message_type`),
  INDEX `idx_create_time` (`create_time`),
  INDEX `idx_delivery_status` (`delivery_status`),
  INDEX `idx_reply_to` (`reply_to_message_id`),
  INDEX `idx_is_important` (`is_important`),
  INDEX `idx_is_favorite` (`is_favorite`),
  INDEX `idx_deleted` (`deleted`),
  FOREIGN KEY (`relation_id`) REFERENCES `L_couple_relations` (`relation_id`) ON DELETE CASCADE,
  FOREIGN KEY (`sender_ruid`) REFERENCES `L_raiser_users` (`ruid`) ON DELETE CASCADE,
  FOREIGN KEY (`receiver_ruid`) REFERENCES `L_raiser_users` (`ruid`) ON DELETE CASCADE,
  FOREIGN KEY (`reply_to_message_id`) REFERENCES `L_couple_chat_messages` (`message_id`) ON DELETE SET NULL,
  FOREIGN KEY (`forward_from_ruid`) REFERENCES `L_raiser_users` (`ruid`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='情侣聊天记录表';

-- 情侣通话记录表
DROP TABLE IF EXISTS `L_couple_call_records`;
CREATE TABLE `L_couple_call_records` (
  `call_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '通话ID',
  `relation_id` bigint(20) NOT NULL COMMENT '情侣关系ID',
  `caller_ruid` bigint(20) NOT NULL COMMENT '主叫用户ID',
  `callee_ruid` bigint(20) NOT NULL COMMENT '被叫用户ID',
  `call_type` varchar(50) NOT NULL COMMENT '通话类型 voice:语音通话 video:视频通话 group:群组通话',
  `call_status` varchar(50) NOT NULL COMMENT '通话状态 dialing:拨号中 ringing:响铃中 connected:已接通 ended:已结束 missed:未接 rejected:已拒绝 busy:忙线 failed:失败',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `connect_time` datetime DEFAULT NULL COMMENT '接通时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `duration_seconds` int(11) DEFAULT NULL COMMENT '通话时长(秒)',
  `call_quality` tinyint(1) DEFAULT NULL COMMENT '通话质量 1-5分',
  `network_type_caller` varchar(50) DEFAULT NULL COMMENT '主叫网络类型',
  `network_type_callee` varchar(50) DEFAULT NULL COMMENT '被叫网络类型',
  `device_type_caller` varchar(50) DEFAULT NULL COMMENT '主叫设备类型',
  `device_type_callee` varchar(50) DEFAULT NULL COMMENT '被叫设备类型',
  `call_rating` tinyint(1) DEFAULT NULL COMMENT '通话评分 1-5分',
  `call_notes` text DEFAULT NULL COMMENT '通话备注',
  `is_recorded` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否录音',
  `recording_url` varchar(500) DEFAULT NULL COMMENT '录音文件URL',
  `recording_duration` int(11) DEFAULT NULL COMMENT '录音时长(秒)',
  `is_favorite` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否收藏',
  `emotion_analysis` text DEFAULT NULL COMMENT '情感分析结果',
  `conversation_summary` text DEFAULT NULL COMMENT '对话摘要',
  `caller_nickname` varchar(50) DEFAULT NULL COMMENT '主叫昵称(冗余字段)',
  `callee_nickname` varchar(50) DEFAULT NULL COMMENT '被叫昵称(冗余字段)',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`call_id`),
  INDEX `idx_relation_id` (`relation_id`),
  INDEX `idx_caller_ruid` (`caller_ruid`),
  INDEX `idx_callee_ruid` (`callee_ruid`),
  INDEX `idx_call_type` (`call_type`),
  INDEX `idx_call_status` (`call_status`),
  INDEX `idx_start_time` (`start_time`),
  INDEX `idx_duration` (`duration_seconds`),
  INDEX `idx_call_quality` (`call_quality`),
  INDEX `idx_is_favorite` (`is_favorite`),
  INDEX `idx_deleted` (`deleted`),
  FOREIGN KEY (`relation_id`) REFERENCES `L_couple_relations` (`relation_id`) ON DELETE CASCADE,
  FOREIGN KEY (`caller_ruid`) REFERENCES `L_raiser_users` (`ruid`) ON DELETE CASCADE,
  FOREIGN KEY (`callee_ruid`) REFERENCES `L_raiser_users` (`ruid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='情侣通话记录表';

-- 情侣互动统计表
DROP TABLE IF EXISTS `L_couple_interaction_stats`;
CREATE TABLE `L_couple_interaction_stats` (
  `stat_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '统计ID',
  `relation_id` bigint(20) NOT NULL COMMENT '情侣关系ID',
  `stat_date` date NOT NULL COMMENT '统计日期',
  `stat_type` varchar(50) NOT NULL DEFAULT 'daily' COMMENT '统计类型 daily:日统计 weekly:周统计 monthly:月统计 yearly:年统计',
  `total_messages` int(11) NOT NULL DEFAULT '0' COMMENT '总消息数',
  `text_messages` int(11) NOT NULL DEFAULT '0' COMMENT '文字消息数',
  `image_messages` int(11) NOT NULL DEFAULT '0' COMMENT '图片消息数',
  `voice_messages` int(11) NOT NULL DEFAULT '0' COMMENT '语音消息数',
  `video_messages` int(11) NOT NULL DEFAULT '0' COMMENT '视频消息数',
  `total_calls` int(11) NOT NULL DEFAULT '0' COMMENT '总通话次数',
  `voice_calls` int(11) NOT NULL DEFAULT '0' COMMENT '语音通话次数',
  `video_calls` int(11) NOT NULL DEFAULT '0' COMMENT '视频通话次数',
  `total_call_duration` int(11) NOT NULL DEFAULT '0' COMMENT '总通话时长(秒)',
  `average_call_duration` int(11) NOT NULL DEFAULT '0' COMMENT '平均通话时长(秒)',
  `longest_call_duration` int(11) NOT NULL DEFAULT '0' COMMENT '最长通话时长(秒)',
  `missed_calls` int(11) NOT NULL DEFAULT '0' COMMENT '未接通话数',
  `user1_messages_sent` int(11) NOT NULL DEFAULT '0' COMMENT '用户1发送消息数',
  `user2_messages_sent` int(11) NOT NULL DEFAULT '0' COMMENT '用户2发送消息数',
  `user1_calls_initiated` int(11) NOT NULL DEFAULT '0' COMMENT '用户1发起通话数',
  `user2_calls_initiated` int(11) NOT NULL DEFAULT '0' COMMENT '用户2发起通话数',
  `peak_interaction_hour` tinyint(1) DEFAULT NULL COMMENT '互动高峰时段(0-23)',
  `interaction_frequency_score` decimal(5,2) DEFAULT NULL COMMENT '互动频率评分',
  `communication_balance_score` decimal(5,2) DEFAULT NULL COMMENT '沟通平衡评分',
  `emotional_tone_score` decimal(5,2) DEFAULT NULL COMMENT '情感基调评分',
  `relationship_health_score` decimal(5,2) DEFAULT NULL COMMENT '关系健康评分',
  `first_interaction_time` time DEFAULT NULL COMMENT '首次互动时间',
  `last_interaction_time` time DEFAULT NULL COMMENT '最后互动时间',
  `interaction_span_hours` decimal(4,2) DEFAULT NULL COMMENT '互动时间跨度(小时)',
  `favorite_messages_count` int(11) NOT NULL DEFAULT '0' COMMENT '收藏消息数',
  `important_messages_count` int(11) NOT NULL DEFAULT '0' COMMENT '重要消息数',
  `deleted_messages_count` int(11) NOT NULL DEFAULT '0' COMMENT '删除消息数',
  `recalled_messages_count` int(11) NOT NULL DEFAULT '0' COMMENT '撤回消息数',
  `average_response_time_minutes` decimal(8,2) DEFAULT NULL COMMENT '平均响应时间(分钟)',
  `longest_silence_hours` decimal(8,2) DEFAULT NULL COMMENT '最长静默时间(小时)',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`stat_id`),
  UNIQUE KEY `uk_relation_date_type` (`relation_id`, `stat_date`, `stat_type`),
  INDEX `idx_relation_id` (`relation_id`),
  INDEX `idx_stat_date` (`stat_date`),
  INDEX `idx_stat_type` (`stat_type`),
  INDEX `idx_total_messages` (`total_messages`),
  INDEX `idx_total_calls` (`total_calls`),
  INDEX `idx_relationship_health` (`relationship_health_score`),
  INDEX `idx_deleted` (`deleted`),
  FOREIGN KEY (`relation_id`) REFERENCES `L_couple_relations` (`relation_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='情侣互动统计表';

-- 情侣互动里程碑表
DROP TABLE IF EXISTS `L_couple_interaction_milestones`;
CREATE TABLE `L_couple_interaction_milestones` (
  `milestone_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '里程碑ID',
  `relation_id` bigint(20) NOT NULL COMMENT '情侣关系ID',
  `milestone_type` varchar(50) NOT NULL COMMENT '里程碑类型 first_message:首次消息 first_call:首次通话 message_1000:第1000条消息 call_100h:通话100小时 daily_streak:连续互动天数',
  `milestone_name` varchar(200) NOT NULL COMMENT '里程碑名称',
  `milestone_description` text DEFAULT NULL COMMENT '里程碑描述',
  `achievement_date` datetime NOT NULL COMMENT '达成时间',
  `achievement_value` varchar(100) DEFAULT NULL COMMENT '达成数值',
  `milestone_level` tinyint(1) NOT NULL DEFAULT '1' COMMENT '里程碑等级 1-5级',
  `is_celebrated` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已庆祝',
  `celebration_date` datetime DEFAULT NULL COMMENT '庆祝时间',
  `celebration_notes` text DEFAULT NULL COMMENT '庆祝备注',
  `badge_icon` varchar(500) DEFAULT NULL COMMENT '徽章图标URL',
  `badge_color` varchar(20) DEFAULT NULL COMMENT '徽章颜色',
  `share_count` int(11) NOT NULL DEFAULT '0' COMMENT '分享次数',
  `is_public` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否公开展示',
  `achievement_context` text DEFAULT NULL COMMENT '达成背景',
  `related_message_id` bigint(20) DEFAULT NULL COMMENT '相关消息ID',
  `related_call_id` bigint(20) DEFAULT NULL COMMENT '相关通话ID',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`milestone_id`),
  INDEX `idx_relation_id` (`relation_id`),
  INDEX `idx_milestone_type` (`milestone_type`),
  INDEX `idx_achievement_date` (`achievement_date`),
  INDEX `idx_milestone_level` (`milestone_level`),
  INDEX `idx_is_celebrated` (`is_celebrated`),
  INDEX `idx_is_public` (`is_public`),
  INDEX `idx_related_message` (`related_message_id`),
  INDEX `idx_related_call` (`related_call_id`),
  INDEX `idx_deleted` (`deleted`),
  FOREIGN KEY (`relation_id`) REFERENCES `L_couple_relations` (`relation_id`) ON DELETE CASCADE,
  FOREIGN KEY (`related_message_id`) REFERENCES `L_couple_chat_messages` (`message_id`) ON DELETE SET NULL,
  FOREIGN KEY (`related_call_id`) REFERENCES `L_couple_call_records` (`call_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='情侣互动里程碑表';

-- =============================================
-- 11. 情侣任务系统功能扩展
-- =============================================

-- 情侣共同任务表
DROP TABLE IF EXISTS `L_couple_tasks`;
CREATE TABLE `L_couple_tasks` (
  `task_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `relation_id` bigint(20) NOT NULL COMMENT '情侣关系ID',
  `task_name` varchar(200) NOT NULL COMMENT '任务名称',
  `task_category` varchar(50) NOT NULL COMMENT '任务分类 daily:日常任务 weekly:周任务 monthly:月任务 special:特殊任务 milestone:里程碑任务 pet_care:宠物护理 relationship:关系维护 fun:娱乐任务',
  `task_description` text DEFAULT NULL COMMENT '任务描述',
  `task_type` varchar(50) NOT NULL DEFAULT 'collaborative' COMMENT '任务类型 collaborative:协作任务 individual:个人任务 competitive:竞争任务 alternating:轮流任务',
  `difficulty_level` tinyint(1) NOT NULL DEFAULT '1' COMMENT '难度等级 1:简单 2:一般 3:困难 4:挑战 5:极限',
  `priority_level` tinyint(1) NOT NULL DEFAULT '2' COMMENT '优先级 1:低 2:中 3:高 4:紧急 5:关键',
  `task_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '任务状态 1:待开始 2:进行中 3:已完成 4:已暂停 5:已取消 6:已过期',
  `creator_ruid` bigint(20) NOT NULL COMMENT '创建者ID',
  `assignee_ruid_1` bigint(20) DEFAULT NULL COMMENT '分配给用户1ID',
  `assignee_ruid_2` bigint(20) DEFAULT NULL COMMENT '分配给用户2ID',
  `start_date` date DEFAULT NULL COMMENT '开始日期',
  `due_date` date DEFAULT NULL COMMENT '截止日期',
  `estimated_duration_hours` decimal(5,2) DEFAULT NULL COMMENT '预计耗时(小时)',
  `actual_duration_hours` decimal(5,2) DEFAULT NULL COMMENT '实际耗时(小时)',
  `completion_percentage` decimal(5,2) NOT NULL DEFAULT '0.00' COMMENT '完成百分比',
  `completion_date` datetime DEFAULT NULL COMMENT '完成时间',
  `is_recurring` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否循环任务',
  `recurrence_pattern` varchar(100) DEFAULT NULL COMMENT '循环模式',
  `next_occurrence_date` date DEFAULT NULL COMMENT '下次发生日期',
  `reward_points` int(11) NOT NULL DEFAULT '0' COMMENT '奖励积分',
  `reward_description` text DEFAULT NULL COMMENT '奖励描述',
  `penalty_points` int(11) NOT NULL DEFAULT '0' COMMENT '惩罚积分',
  `penalty_description` text DEFAULT NULL COMMENT '惩罚描述',
  `location` varchar(200) DEFAULT NULL COMMENT '任务地点',
  `required_resources` text DEFAULT NULL COMMENT '所需资源',
  `success_criteria` text DEFAULT NULL COMMENT '成功标准',
  `notes` text DEFAULT NULL COMMENT '任务备注',
  `attachments` text DEFAULT NULL COMMENT '附件(JSON格式)',
  `tags` varchar(500) DEFAULT NULL COMMENT '标签(逗号分隔)',
  `is_favorite` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否收藏',
  `reminder_enabled` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用提醒',
  `reminder_advance_hours` int(11) DEFAULT '24' COMMENT '提前提醒小时数',
  `last_reminder_time` datetime DEFAULT NULL COMMENT '最后提醒时间',
  `total_reminders_sent` int(11) NOT NULL DEFAULT '0' COMMENT '已发送提醒次数',
  `creator_nickname` varchar(50) DEFAULT NULL COMMENT '创建者昵称(冗余字段)',
  `assignee_nickname_1` varchar(50) DEFAULT NULL COMMENT '分配者1昵称(冗余字段)',
  `assignee_nickname_2` varchar(50) DEFAULT NULL COMMENT '分配者2昵称(冗余字段)',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`task_id`),
  INDEX `idx_relation_id` (`relation_id`),
  INDEX `idx_task_category` (`task_category`),
  INDEX `idx_task_type` (`task_type`),
  INDEX `idx_task_status` (`task_status`),
  INDEX `idx_creator_ruid` (`creator_ruid`),
  INDEX `idx_assignee_ruid_1` (`assignee_ruid_1`),
  INDEX `idx_assignee_ruid_2` (`assignee_ruid_2`),
  INDEX `idx_difficulty_level` (`difficulty_level`),
  INDEX `idx_priority_level` (`priority_level`),
  INDEX `idx_due_date` (`due_date`),
  INDEX `idx_completion_percentage` (`completion_percentage`),
  INDEX `idx_is_recurring` (`is_recurring`),
  INDEX `idx_next_occurrence` (`next_occurrence_date`),
  INDEX `idx_is_favorite` (`is_favorite`),
  INDEX `idx_deleted` (`deleted`),
  FOREIGN KEY (`relation_id`) REFERENCES `L_couple_relations` (`relation_id`) ON DELETE CASCADE,
  FOREIGN KEY (`creator_ruid`) REFERENCES `L_raiser_users` (`ruid`) ON DELETE CASCADE,
  FOREIGN KEY (`assignee_ruid_1`) REFERENCES `L_raiser_users` (`ruid`) ON DELETE SET NULL,
  FOREIGN KEY (`assignee_ruid_2`) REFERENCES `L_raiser_users` (`ruid`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='情侣共同任务表';

-- 任务进度跟踪表
DROP TABLE IF EXISTS `L_task_progress_tracking`;
CREATE TABLE `L_task_progress_tracking` (
  `progress_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '进度ID',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `user_ruid` bigint(20) NOT NULL COMMENT '用户ID',
  `progress_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '进度日期',
  `progress_type` varchar(50) NOT NULL COMMENT '进度类型 start:开始 update:更新 pause:暂停 resume:恢复 complete:完成 cancel:取消',
  `progress_percentage` decimal(5,2) NOT NULL DEFAULT '0.00' COMMENT '进度百分比',
  `time_spent_minutes` int(11) DEFAULT NULL COMMENT '花费时间(分钟)',
  `progress_description` text DEFAULT NULL COMMENT '进度描述',
  `achievements` text DEFAULT NULL COMMENT '取得成就',
  `challenges` text DEFAULT NULL COMMENT '遇到困难',
  `next_steps` text DEFAULT NULL COMMENT '下一步计划',
  `mood_rating` tinyint(1) DEFAULT NULL COMMENT '心情评分 1-5分',
  `effort_rating` tinyint(1) DEFAULT NULL COMMENT '努力程度 1-5分',
  `satisfaction_rating` tinyint(1) DEFAULT NULL COMMENT '满意度 1-5分',
  `location` varchar(200) DEFAULT NULL COMMENT '进度地点',
  `weather` varchar(100) DEFAULT NULL COMMENT '天气情况',
  `companions` varchar(200) DEFAULT NULL COMMENT '同伴',
  `media_files` text DEFAULT NULL COMMENT '媒体文件(JSON格式)',
  `is_milestone` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否里程碑',
  `milestone_description` text DEFAULT NULL COMMENT '里程碑描述',
  `shared_with_partner` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否与伴侣分享',
  `partner_reaction` text DEFAULT NULL COMMENT '伴侣反应',
  `partner_support_rating` tinyint(1) DEFAULT NULL COMMENT '伴侣支持度 1-5分',
  `user_nickname` varchar(50) DEFAULT NULL COMMENT '用户昵称(冗余字段)',
  `task_name` varchar(200) DEFAULT NULL COMMENT '任务名称(冗余字段)',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`progress_id`),
  INDEX `idx_task_id` (`task_id`),
  INDEX `idx_user_ruid` (`user_ruid`),
  INDEX `idx_progress_date` (`progress_date`),
  INDEX `idx_progress_type` (`progress_type`),
  INDEX `idx_progress_percentage` (`progress_percentage`),
  INDEX `idx_is_milestone` (`is_milestone`),
  INDEX `idx_mood_rating` (`mood_rating`),
  INDEX `idx_deleted` (`deleted`),
  FOREIGN KEY (`task_id`) REFERENCES `L_couple_tasks` (`task_id`) ON DELETE CASCADE,
  FOREIGN KEY (`user_ruid`) REFERENCES `L_raiser_users` (`ruid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='任务进度跟踪表';

-- 任务奖励系统表
DROP TABLE IF EXISTS `L_task_rewards`;
CREATE TABLE `L_task_rewards` (
  `reward_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '奖励ID',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `user_ruid` bigint(20) NOT NULL COMMENT '用户ID',
  `reward_type` varchar(50) NOT NULL COMMENT '奖励类型 points:积分 badge:徽章 privilege:特权 gift:礼物 experience:经验 title:称号 unlock:解锁',
  `reward_name` varchar(200) NOT NULL COMMENT '奖励名称',
  `reward_description` text DEFAULT NULL COMMENT '奖励描述',
  `reward_value` varchar(100) DEFAULT NULL COMMENT '奖励数值',
  `reward_icon` varchar(500) DEFAULT NULL COMMENT '奖励图标URL',
  `reward_color` varchar(20) DEFAULT NULL COMMENT '奖励颜色',
  `earned_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '获得时间',
  `expiry_date` datetime DEFAULT NULL COMMENT '过期时间',
  `is_claimed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已领取',
  `claim_date` datetime DEFAULT NULL COMMENT '领取时间',
  `is_shared` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已分享',
  `share_count` int(11) NOT NULL DEFAULT '0' COMMENT '分享次数',
  `reward_level` tinyint(1) NOT NULL DEFAULT '1' COMMENT '奖励等级 1-5级',
  `rarity` varchar(50) DEFAULT 'common' COMMENT '稀有度 common:普通 rare:稀有 epic:史诗 legendary:传说',
  `unlock_conditions` text DEFAULT NULL COMMENT '解锁条件',
  `usage_count` int(11) NOT NULL DEFAULT '0' COMMENT '使用次数',
  `max_usage` int(11) DEFAULT NULL COMMENT '最大使用次数',
  `is_transferable` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否可转让',
  `transfer_history` text DEFAULT NULL COMMENT '转让历史(JSON格式)',
  `achievement_context` text DEFAULT NULL COMMENT '获得背景',
  `celebration_message` text DEFAULT NULL COMMENT '庆祝消息',
  `partner_notification` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否通知伴侣',
  `partner_congratulated` tinyint(1) NOT NULL DEFAULT '0' COMMENT '伴侣是否已祝贺',
  `user_nickname` varchar(50) DEFAULT NULL COMMENT '用户昵称(冗余字段)',
  `task_name` varchar(200) DEFAULT NULL COMMENT '任务名称(冗余字段)',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`reward_id`),
  INDEX `idx_task_id` (`task_id`),
  INDEX `idx_user_ruid` (`user_ruid`),
  INDEX `idx_reward_type` (`reward_type`),
  INDEX `idx_earned_date` (`earned_date`),
  INDEX `idx_is_claimed` (`is_claimed`),
  INDEX `idx_reward_level` (`reward_level`),
  INDEX `idx_rarity` (`rarity`),
  INDEX `idx_expiry_date` (`expiry_date`),
  INDEX `idx_deleted` (`deleted`),
  FOREIGN KEY (`task_id`) REFERENCES `L_couple_tasks` (`task_id`) ON DELETE CASCADE,
  FOREIGN KEY (`user_ruid`) REFERENCES `L_raiser_users` (`ruid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='任务奖励系统表';

-- 任务评价反馈表
DROP TABLE IF EXISTS `L_task_feedback`;
CREATE TABLE `L_task_feedback` (
  `feedback_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '反馈ID',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `reviewer_ruid` bigint(20) NOT NULL COMMENT '评价者ID',
  `reviewee_ruid` bigint(20) DEFAULT NULL COMMENT '被评价者ID',
  `feedback_type` varchar(50) NOT NULL COMMENT '反馈类型 self:自评 partner:伴侣评价 mutual:相互评价 system:系统评价',
  `overall_rating` tinyint(1) NOT NULL COMMENT '总体评分 1-5分',
  `effort_rating` tinyint(1) DEFAULT NULL COMMENT '努力程度 1-5分',
  `quality_rating` tinyint(1) DEFAULT NULL COMMENT '完成质量 1-5分',
  `creativity_rating` tinyint(1) DEFAULT NULL COMMENT '创意程度 1-5分',
  `teamwork_rating` tinyint(1) DEFAULT NULL COMMENT '团队合作 1-5分',
  `communication_rating` tinyint(1) DEFAULT NULL COMMENT '沟通效果 1-5分',
  `punctuality_rating` tinyint(1) DEFAULT NULL COMMENT '时间管理 1-5分',
  `positive_feedback` text DEFAULT NULL COMMENT '正面反馈',
  `improvement_suggestions` text DEFAULT NULL COMMENT '改进建议',
  `favorite_moments` text DEFAULT NULL COMMENT '最喜欢的时刻',
  `challenging_aspects` text DEFAULT NULL COMMENT '挑战性方面',
  `learned_skills` text DEFAULT NULL COMMENT '学到的技能',
  `emotional_impact` text DEFAULT NULL COMMENT '情感影响',
  `would_repeat` tinyint(1) DEFAULT NULL COMMENT '是否愿意重复 0:否 1:是',
  `recommend_to_others` tinyint(1) DEFAULT NULL COMMENT '是否推荐给他人 0:否 1:是',
  `difficulty_perception` tinyint(1) DEFAULT NULL COMMENT '难度感知 1-5分',
  `enjoyment_level` tinyint(1) DEFAULT NULL COMMENT '享受程度 1-5分',
  `stress_level` tinyint(1) DEFAULT NULL COMMENT '压力程度 1-5分',
  `relationship_impact` tinyint(1) DEFAULT NULL COMMENT '关系影响 1-5分',
  `personal_growth` tinyint(1) DEFAULT NULL COMMENT '个人成长 1-5分',
  `media_attachments` text DEFAULT NULL COMMENT '媒体附件(JSON格式)',
  `is_anonymous` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否匿名评价',
  `is_public` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否公开展示',
  `feedback_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '反馈时间',
  `reviewer_nickname` varchar(50) DEFAULT NULL COMMENT '评价者昵称(冗余字段)',
  `reviewee_nickname` varchar(50) DEFAULT NULL COMMENT '被评价者昵称(冗余字段)',
  `task_name` varchar(200) DEFAULT NULL COMMENT '任务名称(冗余字段)',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`feedback_id`),
  INDEX `idx_task_id` (`task_id`),
  INDEX `idx_reviewer_ruid` (`reviewer_ruid`),
  INDEX `idx_reviewee_ruid` (`reviewee_ruid`),
  INDEX `idx_feedback_type` (`feedback_type`),
  INDEX `idx_overall_rating` (`overall_rating`),
  INDEX `idx_feedback_date` (`feedback_date`),
  INDEX `idx_is_public` (`is_public`),
  INDEX `idx_deleted` (`deleted`),
  FOREIGN KEY (`task_id`) REFERENCES `L_couple_tasks` (`task_id`) ON DELETE CASCADE,
  FOREIGN KEY (`reviewer_ruid`) REFERENCES `L_raiser_users` (`ruid`) ON DELETE CASCADE,
  FOREIGN KEY (`reviewee_ruid`) REFERENCES `L_raiser_users` (`ruid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='任务评价反馈表';

-- =============================================
-- 12. 系统功能完善
-- =============================================

-- 消息通知系统表
DROP TABLE IF EXISTS `L_system_notifications`;
CREATE TABLE `L_system_notifications` (
  `notification_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '通知ID',
  `user_ruid` bigint(20) NOT NULL COMMENT '用户ID',
  `notification_type` varchar(50) NOT NULL COMMENT '通知类型 system:系统通知 pet:宠物相关 relationship:关系相关 task:任务相关 reminder:提醒 achievement:成就 social:社交',
  `title` varchar(200) NOT NULL COMMENT '通知标题',
  `content` text NOT NULL COMMENT '通知内容',
  `priority` tinyint(1) NOT NULL DEFAULT '2' COMMENT '优先级 1:低 2:中 3:高 4:紧急',
  `is_read` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已读',
  `read_time` datetime DEFAULT NULL COMMENT '阅读时间',
  `action_type` varchar(50) DEFAULT NULL COMMENT '操作类型 none:无操作 redirect:跳转 action:执行动作',
  `action_data` text DEFAULT NULL COMMENT '操作数据(JSON格式)',
  `related_id` bigint(20) DEFAULT NULL COMMENT '关联数据ID',
  `related_type` varchar(50) DEFAULT NULL COMMENT '关联数据类型',
  `sender_type` varchar(50) NOT NULL DEFAULT 'system' COMMENT '发送者类型 system:系统 user:用户 auto:自动',
  `sender_ruid` bigint(20) DEFAULT NULL COMMENT '发送者用户ID',
  `scheduled_time` datetime DEFAULT NULL COMMENT '计划发送时间',
  `sent_time` datetime DEFAULT NULL COMMENT '实际发送时间',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `is_persistent` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否持久化',
  `push_channels` varchar(200) DEFAULT NULL COMMENT '推送渠道(逗号分隔)',
  `push_status` varchar(50) DEFAULT 'pending' COMMENT '推送状态 pending:待推送 sent:已推送 failed:推送失败',
  `retry_count` int(11) NOT NULL DEFAULT '0' COMMENT '重试次数',
  `max_retries` int(11) NOT NULL DEFAULT '3' COMMENT '最大重试次数',
  `user_nickname` varchar(50) DEFAULT NULL COMMENT '用户昵称(冗余字段)',
  `sender_nickname` varchar(50) DEFAULT NULL COMMENT '发送者昵称(冗余字段)',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notification_id`),
  INDEX `idx_user_ruid` (`user_ruid`),
  INDEX `idx_notification_type` (`notification_type`),
  INDEX `idx_priority` (`priority`),
  INDEX `idx_is_read` (`is_read`),
  INDEX `idx_sender_ruid` (`sender_ruid`),
  INDEX `idx_scheduled_time` (`scheduled_time`),
  INDEX `idx_expire_time` (`expire_time`),
  INDEX `idx_push_status` (`push_status`),
  INDEX `idx_related` (`related_type`, `related_id`),
  INDEX `idx_deleted` (`deleted`),
  FOREIGN KEY (`user_ruid`) REFERENCES `L_raiser_users` (`ruid`) ON DELETE CASCADE,
  FOREIGN KEY (`sender_ruid`) REFERENCES `L_raiser_users` (`ruid`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='系统通知表';

-- 用户积分系统表
DROP TABLE IF EXISTS `L_user_points`;
CREATE TABLE `L_user_points` (
  `point_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '积分记录ID',
  `user_ruid` bigint(20) NOT NULL COMMENT '用户ID',
  `point_type` varchar(50) NOT NULL COMMENT '积分类型 earn:获得 spend:消费 expire:过期 transfer:转账 bonus:奖励 penalty:惩罚',
  `point_source` varchar(50) NOT NULL COMMENT '积分来源 task:任务完成 daily:日常签到 achievement:成就解锁 social:社交互动 purchase:购买 referral:推荐 system:系统赠送',
  `points_change` int(11) NOT NULL COMMENT '积分变化(正数为增加，负数为减少)',
  `points_balance` int(11) NOT NULL COMMENT '积分余额',
  `related_id` bigint(20) DEFAULT NULL COMMENT '关联数据ID',
  `related_type` varchar(50) DEFAULT NULL COMMENT '关联数据类型',
  `description` varchar(500) DEFAULT NULL COMMENT '积分描述',
  `multiplier` decimal(3,2) NOT NULL DEFAULT '1.00' COMMENT '积分倍数',
  `expire_date` date DEFAULT NULL COMMENT '过期日期',
  `is_expired` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已过期',
  `transaction_id` varchar(100) DEFAULT NULL COMMENT '交易ID',
  `batch_id` varchar(100) DEFAULT NULL COMMENT '批次ID',
  `user_nickname` varchar(50) DEFAULT NULL COMMENT '用户昵称(冗余字段)',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`point_id`),
  INDEX `idx_user_ruid` (`user_ruid`),
  INDEX `idx_point_type` (`point_type`),
  INDEX `idx_point_source` (`point_source`),
  INDEX `idx_create_time` (`create_time`),
  INDEX `idx_expire_date` (`expire_date`),
  INDEX `idx_is_expired` (`is_expired`),
  INDEX `idx_related` (`related_type`, `related_id`),
  INDEX `idx_transaction_id` (`transaction_id`),
  INDEX `idx_deleted` (`deleted`),
  FOREIGN KEY (`user_ruid`) REFERENCES `L_raiser_users` (`ruid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户积分记录表';

-- 用户等级系统表
DROP TABLE IF EXISTS `L_user_levels`;
CREATE TABLE `L_user_levels` (
  `level_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '等级记录ID',
  `user_ruid` bigint(20) NOT NULL COMMENT '用户ID',
  `current_level` int(11) NOT NULL DEFAULT '1' COMMENT '当前等级',
  `current_exp` int(11) NOT NULL DEFAULT '0' COMMENT '当前经验值',
  `total_exp` int(11) NOT NULL DEFAULT '0' COMMENT '总经验值',
  `next_level_exp` int(11) NOT NULL DEFAULT '100' COMMENT '下一级所需经验',
  `level_name` varchar(100) DEFAULT NULL COMMENT '等级名称',
  `level_icon` varchar(500) DEFAULT NULL COMMENT '等级图标URL',
  `level_privileges` text DEFAULT NULL COMMENT '等级特权(JSON格式)',
  `last_level_up_time` datetime DEFAULT NULL COMMENT '最后升级时间',
  `level_up_count` int(11) NOT NULL DEFAULT '0' COMMENT '升级次数',
  `user_nickname` varchar(50) DEFAULT NULL COMMENT '用户昵称(冗余字段)',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`level_id`),
  UNIQUE KEY `uk_user_ruid` (`user_ruid`),
  INDEX `idx_current_level` (`current_level`),
  INDEX `idx_total_exp` (`total_exp`),
  INDEX `idx_last_level_up` (`last_level_up_time`),
  INDEX `idx_deleted` (`deleted`),
  FOREIGN KEY (`user_ruid`) REFERENCES `L_raiser_users` (`ruid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户等级系统表';

-- 系统统计分析表
DROP TABLE IF EXISTS `L_system_analytics`;
CREATE TABLE `L_system_analytics` (
  `analytics_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '分析记录ID',
  `metric_name` varchar(100) NOT NULL COMMENT '指标名称',
  `metric_category` varchar(50) NOT NULL COMMENT '指标分类 user:用户指标 pet:宠物指标 relationship:关系指标 system:系统指标 business:业务指标',
  `metric_value` decimal(15,4) NOT NULL COMMENT '指标数值',
  `metric_unit` varchar(20) DEFAULT NULL COMMENT '指标单位',
  `dimension_1` varchar(100) DEFAULT NULL COMMENT '维度1',
  `dimension_2` varchar(100) DEFAULT NULL COMMENT '维度2',
  `dimension_3` varchar(100) DEFAULT NULL COMMENT '维度3',
  `stat_date` date NOT NULL COMMENT '统计日期',
  `stat_period` varchar(20) NOT NULL DEFAULT 'daily' COMMENT '统计周期 hourly:小时 daily:日 weekly:周 monthly:月 yearly:年',
  `calculation_method` varchar(50) DEFAULT NULL COMMENT '计算方法 sum:求和 avg:平均 max:最大 min:最小 count:计数',
  `data_source` varchar(100) DEFAULT NULL COMMENT '数据来源',
  `is_benchmark` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否基准指标',
  `benchmark_value` decimal(15,4) DEFAULT NULL COMMENT '基准值',
  `variance_percentage` decimal(5,2) DEFAULT NULL COMMENT '变化百分比',
  `trend_direction` varchar(20) DEFAULT NULL COMMENT '趋势方向 up:上升 down:下降 stable:稳定',
  `quality_score` tinyint(1) DEFAULT NULL COMMENT '数据质量评分 1-5分',
  `confidence_level` decimal(5,2) DEFAULT NULL COMMENT '置信度',
  `sample_size` int(11) DEFAULT NULL COMMENT '样本大小',
  `metadata` text DEFAULT NULL COMMENT '元数据(JSON格式)',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`analytics_id`),
  UNIQUE KEY `uk_metric_date_period` (`metric_name`, `stat_date`, `stat_period`, `dimension_1`, `dimension_2`),
  INDEX `idx_metric_category` (`metric_category`),
  INDEX `idx_stat_date` (`stat_date`),
  INDEX `idx_stat_period` (`stat_period`),
  INDEX `idx_is_benchmark` (`is_benchmark`),
  INDEX `idx_trend_direction` (`trend_direction`),
  INDEX `idx_deleted` (`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='系统统计分析表';

-- 用户行为日志表
DROP TABLE IF EXISTS `L_user_behavior_logs`;
CREATE TABLE `L_user_behavior_logs` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `user_ruid` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `session_id` varchar(100) DEFAULT NULL COMMENT '会话ID',
  `action_type` varchar(50) NOT NULL COMMENT '行为类型 login:登录 logout:登出 view:查看 create:创建 update:更新 delete:删除 search:搜索 share:分享',
  `action_target` varchar(50) DEFAULT NULL COMMENT '操作对象 pet:宠物 user:用户 task:任务 message:消息 photo:照片',
  `target_id` bigint(20) DEFAULT NULL COMMENT '目标对象ID',
  `action_details` text DEFAULT NULL COMMENT '行为详情(JSON格式)',
  `ip_address` varchar(45) DEFAULT NULL COMMENT 'IP地址',
  `user_agent` varchar(500) DEFAULT NULL COMMENT '用户代理',
  `device_type` varchar(50) DEFAULT NULL COMMENT '设备类型 mobile:手机 tablet:平板 desktop:桌面',
  `platform` varchar(50) DEFAULT NULL COMMENT '平台 ios:iOS android:Android web:网页',
  `app_version` varchar(20) DEFAULT NULL COMMENT '应用版本',
  `location_info` varchar(200) DEFAULT NULL COMMENT '位置信息',
  `referrer` varchar(500) DEFAULT NULL COMMENT '来源页面',
  `duration_seconds` int(11) DEFAULT NULL COMMENT '持续时间(秒)',
  `is_successful` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否成功',
  `error_code` varchar(50) DEFAULT NULL COMMENT '错误代码',
  `error_message` text DEFAULT NULL COMMENT '错误信息',
  `user_nickname` varchar(50) DEFAULT NULL COMMENT '用户昵称(冗余字段)',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`log_id`),
  INDEX `idx_user_ruid` (`user_ruid`),
  INDEX `idx_session_id` (`session_id`),
  INDEX `idx_action_type` (`action_type`),
  INDEX `idx_action_target` (`action_target`),
  INDEX `idx_target_id` (`target_id`),
  INDEX `idx_create_time` (`create_time`),
  INDEX `idx_ip_address` (`ip_address`),
  INDEX `idx_device_type` (`device_type`),
  INDEX `idx_platform` (`platform`),
  INDEX `idx_is_successful` (`is_successful`),
  INDEX `idx_deleted` (`deleted`),
  FOREIGN KEY (`user_ruid`) REFERENCES `L_raiser_users` (`ruid`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户行为日志表';

-- =============================================
-- 13. 架构优化：抽象化内容发布系统
-- =============================================

-- 内容分类表（支持扩展性设计）
DROP TABLE IF EXISTS `L_content_categories`;
CREATE TABLE `L_content_categories` (
  `category_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `category_code` varchar(50) NOT NULL COMMENT '分类代码',
  `category_name` varchar(100) NOT NULL COMMENT '分类名称',
  `parent_category_id` bigint(20) DEFAULT NULL COMMENT '父分类ID',
  `category_level` tinyint(1) NOT NULL DEFAULT '1' COMMENT '分类层级',
  `category_path` varchar(500) DEFAULT NULL COMMENT '分类路径',
  `category_icon` varchar(500) DEFAULT NULL COMMENT '分类图标',
  `category_color` varchar(20) DEFAULT NULL COMMENT '分类颜色',
  `sort_order` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `is_active` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  `template_config` text DEFAULT NULL COMMENT '模板配置(JSON格式)',
  `field_config` text DEFAULT NULL COMMENT '字段配置(JSON格式)',
  `validation_rules` text DEFAULT NULL COMMENT '验证规则(JSON格式)',
  `display_settings` text DEFAULT NULL COMMENT '显示设置(JSON格式)',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `uk_category_code` (`category_code`),
  INDEX `idx_parent_category` (`parent_category_id`),
  INDEX `idx_category_level` (`category_level`),
  INDEX `idx_sort_order` (`sort_order`),
  INDEX `idx_is_active` (`is_active`),
  INDEX `idx_deleted` (`deleted`),
  FOREIGN KEY (`parent_category_id`) REFERENCES `L_content_categories` (`category_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='内容分类表';

-- 通用内容发布表（替代原有的宠物朋友圈表）
DROP TABLE IF EXISTS `L_universal_contents`;
CREATE TABLE `L_universal_contents` (
  `content_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '内容ID',
  `category_id` bigint(20) NOT NULL COMMENT '分类ID',
  `publisher_ruid` bigint(20) NOT NULL COMMENT '发布者ID',
  `related_pet_id` bigint(20) DEFAULT NULL COMMENT '关联宠物ID',
  `related_relation_id` bigint(20) DEFAULT NULL COMMENT '关联情侣关系ID',
  `title` varchar(200) DEFAULT NULL COMMENT '内容标题',
  `content` text NOT NULL COMMENT '内容正文',
  `content_type` varchar(50) NOT NULL DEFAULT 'text' COMMENT '内容类型 text:文字 image:图片 video:视频 audio:音频 mixed:混合',
  `media_urls` text DEFAULT NULL COMMENT '媒体文件URLs(JSON格式)',
  `thumbnail_url` varchar(500) DEFAULT NULL COMMENT '缩略图URL',
  `location_info` text DEFAULT NULL COMMENT '位置信息(JSON格式)',
  `mood_tags` varchar(500) DEFAULT NULL COMMENT '心情标签(逗号分隔)',
  `custom_tags` varchar(500) DEFAULT NULL COMMENT '自定义标签(逗号分隔)',
  `visibility` tinyint(1) NOT NULL DEFAULT '1' COMMENT '可见性 1:公开 2:仅朋友 3:仅自己 4:指定用户',
  `visibility_users` text DEFAULT NULL COMMENT '指定可见用户(JSON格式)',
  `interaction_stats` text DEFAULT NULL COMMENT '互动统计(JSON格式)',
  `like_count` int(11) NOT NULL DEFAULT '0' COMMENT '点赞数',
  `comment_count` int(11) NOT NULL DEFAULT '0' COMMENT '评论数',
  `share_count` int(11) NOT NULL DEFAULT '0' COMMENT '分享数',
  `view_count` int(11) NOT NULL DEFAULT '0' COMMENT '查看数',
  `is_pinned` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否置顶',
  `is_featured` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否精选',
  `is_official` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否官方内容',
  `quality_score` decimal(3,2) DEFAULT NULL COMMENT '内容质量评分',
  `ai_analysis` text DEFAULT NULL COMMENT 'AI内容分析(JSON格式)',
  `moderation_status` varchar(50) DEFAULT 'approved' COMMENT '审核状态 pending:待审核 approved:已通过 rejected:已拒绝 flagged:已标记',
  `moderation_notes` text DEFAULT NULL COMMENT '审核备注',
  `scheduled_publish_time` datetime DEFAULT NULL COMMENT '定时发布时间',
  `actual_publish_time` datetime DEFAULT NULL COMMENT '实际发布时间',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `edit_history` text DEFAULT NULL COMMENT '编辑历史(JSON格式)',
  `extended_fields` text DEFAULT NULL COMMENT '扩展字段(JSON格式)',
  `publisher_nickname` varchar(50) DEFAULT NULL COMMENT '发布者昵称(冗余字段)',
  `pet_name` varchar(100) DEFAULT NULL COMMENT '宠物名称(冗余字段)',
  `category_name` varchar(100) DEFAULT NULL COMMENT '分类名称(冗余字段)',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`content_id`),
  INDEX `idx_category_id` (`category_id`),
  INDEX `idx_publisher_ruid` (`publisher_ruid`),
  INDEX `idx_related_pet_id` (`related_pet_id`),
  INDEX `idx_related_relation_id` (`related_relation_id`),
  INDEX `idx_content_type` (`content_type`),
  INDEX `idx_visibility` (`visibility`),
  INDEX `idx_create_time` (`create_time`),
  INDEX `idx_like_count` (`like_count`),
  INDEX `idx_is_pinned` (`is_pinned`),
  INDEX `idx_is_featured` (`is_featured`),
  INDEX `idx_moderation_status` (`moderation_status`),
  INDEX `idx_scheduled_publish` (`scheduled_publish_time`),
  INDEX `idx_deleted` (`deleted`),
  FOREIGN KEY (`category_id`) REFERENCES `L_content_categories` (`category_id`) ON DELETE CASCADE,
  FOREIGN KEY (`publisher_ruid`) REFERENCES `L_raiser_users` (`ruid`) ON DELETE CASCADE,
  FOREIGN KEY (`related_pet_id`) REFERENCES `L_pets` (`pet_id`) ON DELETE SET NULL,
  FOREIGN KEY (`related_relation_id`) REFERENCES `L_couple_relations` (`relation_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='通用内容发布表';

-- 内容互动表（替代原有的朋友圈互动表）
DROP TABLE IF EXISTS `L_content_interactions`;
CREATE TABLE `L_content_interactions` (
  `interaction_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '互动ID',
  `content_id` bigint(20) NOT NULL COMMENT '内容ID',
  `user_ruid` bigint(20) NOT NULL COMMENT '用户ID',
  `interaction_type` varchar(50) NOT NULL COMMENT '互动类型 like:点赞 love:喜爱 comment:评论 share:分享 bookmark:收藏 report:举报 follow:关注',
  `interaction_subtype` varchar(50) DEFAULT NULL COMMENT '互动子类型（扩展用）',
  `content` text DEFAULT NULL COMMENT '互动内容(评论内容等)',
  `reply_to_interaction_id` bigint(20) DEFAULT NULL COMMENT '回复的互动ID',
  `media_attachments` text DEFAULT NULL COMMENT '媒体附件(JSON格式)',
  `emotion_type` varchar(50) DEFAULT NULL COMMENT '情感类型',
  `is_anonymous` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否匿名',
  `interaction_score` decimal(3,2) DEFAULT NULL COMMENT '互动评分',
  `extended_data` text DEFAULT NULL COMMENT '扩展数据(JSON格式)',
  `user_nickname` varchar(50) DEFAULT NULL COMMENT '用户昵称(冗余字段)',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`interaction_id`),
  INDEX `idx_content_id` (`content_id`),
  INDEX `idx_user_ruid` (`user_ruid`),
  INDEX `idx_interaction_type` (`interaction_type`),
  INDEX `idx_reply_to` (`reply_to_interaction_id`),
  INDEX `idx_create_time` (`create_time`),
  INDEX `idx_deleted` (`deleted`),
  FOREIGN KEY (`content_id`) REFERENCES `L_universal_contents` (`content_id`) ON DELETE CASCADE,
  FOREIGN KEY (`user_ruid`) REFERENCES `L_raiser_users` (`ruid`) ON DELETE CASCADE,
  FOREIGN KEY (`reply_to_interaction_id`) REFERENCES `L_content_interactions` (`interaction_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='内容互动表';

-- 插入预定义内容分类数据
INSERT INTO `L_content_categories` (`category_code`, `category_name`, `category_level`, `sort_order`, `template_config`, `field_config`) VALUES
('pet_moments', '宠物动态', 1, 1, '{"template":"pet_moment","layout":"card"}', '{"required":["content","pet_id"],"optional":["location","mood","media"]}'),
('pet_daily', '宠物日常', 2, 2, '{"template":"daily_life","layout":"timeline"}', '{"required":["content"],"optional":["photos","time","activity"]}'),
('pet_health', '健康记录', 2, 3, '{"template":"health_record","layout":"form"}', '{"required":["content","health_type"],"optional":["symptoms","treatment","photos"]}'),
('pet_training', '训练成果', 2, 4, '{"template":"training_progress","layout":"achievement"}', '{"required":["content","skill"],"optional":["video","progress","difficulty"]}'),
('pet_grooming', '美容护理', 2, 5, '{"template":"grooming_record","layout":"before_after"}', '{"required":["content","service_type"],"optional":["before_photo","after_photo","cost","rating"]}'),
('pet_nail_care', '美甲护理', 3, 6, '{"template":"nail_care","layout":"detail"}', '{"required":["content","nail_type"],"optional":["color","style","duration","photos"]}'),
('couple_moments', '情侣动态', 1, 10, '{"template":"couple_moment","layout":"romantic"}', '{"required":["content"],"optional":["location","mood","photos","anniversary"]}'),
('couple_tasks', '共同任务', 2, 11, '{"template":"task_sharing","layout":"progress"}', '{"required":["content","task_type"],"optional":["progress","photos","completion_date"]}'),
('system_announcement', '系统公告', 1, 20, '{"template":"announcement","layout":"notice"}', '{"required":["title","content"],"optional":["priority","expire_time"]}');

-- 恢复外键检查
SET FOREIGN_KEY_CHECKS = 1;

-- 提交事务
COMMIT;

-- 数据库整合完成
SELECT 
    'Liam Pet Love Database Integration Completed Successfully!' as status,
    NOW() as completion_time,
    '已整合历代领养人追踪、猫咪年龄换算、食物保质期管理、用品记账、护理提醒、异常记录、疫苗管理、宠物社交功能、宠物教育训练、情侣互动记录、情侣任务系统、系统通知积分、抽象化内容发布系统等完整功能' as features_added;

-- =============================================
-- 数据库功能完整性总结
-- =============================================

/*
关于您提出的宠物朋友圈抽象化问题的回答：

您的建议非常有前瞻性！确实需要抽象化设计来支持未来扩展。我已经在第13部分实现了架构优化：

## 1. 原有设计的局限性
- L_pet_moments 表结构固定，难以扩展新功能
- 字段设计针对特定场景，不够通用
- 添加美甲等新功能需要修改表结构

## 2. 新的抽象化设计优势
- **L_content_categories**: 分类管理，支持层级结构
- **L_universal_contents**: 通用内容表，支持所有类型内容
- **L_content_interactions**: 统一的互动系统

## 3. 扩展性体现
- 预置了美甲护理分类 (pet_nail_care)
- JSON字段支持动态扩展
- 模板配置支持不同展示方式
- 字段配置支持不同验证规则

## 4. 未来添加新功能的方式
添加美甲功能只需：
1. 在 L_content_categories 中添加新分类
2. 配置对应的模板和字段规则
3. 前端根据分类渲染不同界面
4. 无需修改核心表结构

## 5. 数据库完整功能清单

### 核心业务功能
- ✅ 用户管理系统（注册、登录、资料管理）
- ✅ 宠物档案管理（基础信息、照片、家族关系）
- ✅ 情侣关系管理（关系绑定、共同宠物）
- ✅ 宠物健康管理（体检、疫苗、异常记录）
- ✅ 宠物护理管理（喂食、洗澡、驱虫）
- ✅ 宠物用品管理（购买记录、价值评估）
- ✅ 食物品牌管理（品牌信息、保质期）

### 社交互动功能
- ✅ 抽象化内容发布系统（支持宠物动态、美甲等扩展）
- ✅ 宠物社交关系（友谊管理、互动记录）
- ✅ 宠物聚会活动（组织、参与、评价）
- ✅ 情侣聊天通话（消息、通话、统计）
- ✅ 情侣互动里程碑（成就记录）

### 教育培训功能
- ✅ 训练课程管理（课程、报名、进度）
- ✅ 技能认证系统（评估、证书、验证）
- ✅ 训练进度跟踪（详细记录、分析）

### 任务协作功能
- ✅ 情侣任务系统（创建、分配、跟踪）
- ✅ 任务奖励机制（积分、徽章、特权）
- ✅ 任务评价反馈（多维度评价）

### 系统支撑功能
- ✅ 消息通知系统（多渠道推送、定时发送）
- ✅ 用户积分等级（积分记录、等级特权）
- ✅ 数据统计分析（多维度指标、趋势分析）
- ✅ 用户行为日志（操作记录、行为分析）

### 高级功能特性
- ✅ 年龄换算算法（宠物年龄转人类年龄）
- ✅ 护理提醒系统（自动化提醒机制）
- ✅ 历代领养人追踪（完整饲养历史）
- ✅ 性能优化索引（查询效率提升）
- ✅ 软删除机制（数据安全保护）
- ✅ 审计字段标准（操作追踪）

### 数据库技术特点
- 📊 总计 50+ 业务表，支持完整业务流程
- 🔗 完善的外键关系，保证数据一致性
- 📈 高性能索引设计，优化查询效率
- 🛡️ 软删除 + 审计字段，保证数据安全
- 🔄 JSON字段支持，提供扩展灵活性
- 📱 移动端友好设计，支持多平台
- 🎯 抽象化架构，支持功能快速扩展

该数据库设计已经具备了完整的宠物管理和恋爱管理功能，
同时通过抽象化设计为未来功能扩展提供了强大的支持。
*/
