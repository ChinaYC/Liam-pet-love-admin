-- MySQL Only
-- 目的: 给下列业务表的注释后面统一追加后缀 " - 未生成｜提示：请先在 系统工具→代码生成 生成后端与前端页面，再移除此标记"
-- 安全: 仅修改表注释，不改动表结构与数据。
-- 回滚: 需要回滚时，可手动编辑注释或从备份中恢复。

SET NAMES utf8mb4;

DELIMITER $$
DROP PROCEDURE IF EXISTS append_comment_suffix $$
CREATE PROCEDURE append_comment_suffix(IN tbl VARCHAR(128))
BEGIN
  DECLARE cur_comment VARCHAR(1024);
  DECLARE new_comment VARCHAR(2048);
  DECLARE suffix VARCHAR(1024);

  SET suffix = ' - 未生成｜提示：请先在“系统工具→代码生成”生成后端与前端页面，再移除此标记';

  SELECT TABLE_COMMENT INTO cur_comment
  FROM information_schema.TABLES
  WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = tbl
  LIMIT 1;

  SET new_comment = CONCAT(IFNULL(cur_comment, ''), suffix);

  SET @sql = CONCAT('ALTER TABLE `', tbl, '` COMMENT ', QUOTE(new_comment));
  PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;
END $$
DELIMITER ;

-- 需要追加后缀的表清单（如不存在将自动忽略）
CALL append_comment_suffix('L_abnormal_records');
CALL append_comment_suffix('L_anniversaries');
CALL append_comment_suffix('L_anniversary_reminders');
CALL append_comment_suffix('L_care_activity_types');
CALL append_comment_suffix('L_care_records');
CALL append_comment_suffix('L_couple_anniversaries');
CALL append_comment_suffix('L_couple_relations');
CALL append_comment_suffix('L_couple_tasks');
CALL append_comment_suffix('L_data_permissions');
CALL append_comment_suffix('L_data_view_logs');
CALL append_comment_suffix('L_date_records');
CALL append_comment_suffix('L_diary_comments');
CALL append_comment_suffix('L_excretion_records');
CALL append_comment_suffix('L_expense_categories');
CALL append_comment_suffix('L_expense_records');
CALL append_comment_suffix('L_feeding_records');
CALL append_comment_suffix('L_food_brands');
CALL append_comment_suffix('L_food_products');
CALL append_comment_suffix('L_health_records');
CALL append_comment_suffix('L_love_diaries');
CALL append_comment_suffix('L_pet_adoption_history');
CALL append_comment_suffix('L_pet_age_conversion');
CALL append_comment_suffix('L_pet_anniversaries');
CALL append_comment_suffix('L_pet_breeds');
CALL append_comment_suffix('L_pet_documents');
CALL append_comment_suffix('L_pet_family_relations');
CALL append_comment_suffix('L_pet_feature_tags');
CALL append_comment_suffix('L_pet_growth_records');
CALL append_comment_suffix('L_pet_milestones');
CALL append_comment_suffix('L_pet_photos');
CALL append_comment_suffix('L_pet_preferences');
CALL append_comment_suffix('L_pet_product_purchases');
CALL append_comment_suffix('L_pet_products');
CALL append_comment_suffix('L_pet_social_records');
CALL append_comment_suffix('L_pet_training_records');
CALL append_comment_suffix('L_pets');
CALL append_comment_suffix('L_privacy_settings');
CALL append_comment_suffix('L_product_categories');
CALL append_comment_suffix('L_product_value_assessments');
CALL append_comment_suffix('L_purchase_decisions');
CALL append_comment_suffix('L_raiser_users');
CALL append_comment_suffix('L_reminders');
CALL append_comment_suffix('L_system_dict');
CALL append_comment_suffix('L_vaccine_records');
CALL append_comment_suffix('L_vaccine_types');
CALL append_comment_suffix('L_weight_records');

-- 清理
DROP PROCEDURE IF EXISTS append_comment_suffix;

-- 使用方式
-- mysql --default-character-set=utf8mb4 -h127.0.0.1 -uroot -pLyc123456 Liam_pet_love_bd < script/sql/update/mark_tables_ungenerated.sql


