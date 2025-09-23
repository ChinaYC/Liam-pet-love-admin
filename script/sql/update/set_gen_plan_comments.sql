-- MySQL Only
-- 将生成顺序与生成信息写入每个业务表的注释，供团队对齐
-- 写入格式: | GenOrder:NN | Tpl:CRUD/TREE | Module:xxx | Biz:xxx | Func:中文 | Parent:中文  - 未生成｜提示：请先在“系统工具→代码生成”生成后端与前端页面，再移除此标记

SET NAMES utf8mb4;

DELIMITER $$
DROP PROCEDURE IF EXISTS set_plan $$
CREATE PROCEDURE set_plan(
  IN tbl VARCHAR(128),
  IN ord VARCHAR(4),
  IN tpl VARCHAR(16),
  IN module VARCHAR(32),
  IN biz VARCHAR(64),
  IN func VARCHAR(128),
  IN parent VARCHAR(128)
)
BEGIN
  DECLARE base VARCHAR(1024);
  DECLARE note VARCHAR(2048);
  SELECT TABLE_COMMENT INTO base
  FROM information_schema.TABLES
  WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = tbl
  LIMIT 1;
  SET note = CONCAT(IFNULL(base, ''),
                    ' | GenOrder:', ord,
                    ' | Tpl:', tpl,
                    ' | Module:', module,
                    ' | Biz:', biz,
                    ' | Func:', func,
                    ' | Parent:', parent,
                    ' - 未生成｜提示：请先在“系统工具→代码生成”生成后端与前端页面，再移除此标记');
  SET @sql = CONCAT('ALTER TABLE `', tbl, '` COMMENT ', QUOTE(note));
  PREPARE s FROM @sql; EXECUTE s; DEALLOCATE PREPARE s;
END $$
DELIMITER ;

-- ============ Phase 1: 字典/主数据 ============
CALL set_plan('L_system_dict', '01', 'CRUD', 'dict', 'systemDict', '自定义字典', '数据与系统');
CALL set_plan('L_product_categories', '02', 'TREE', 'product', 'productCategories', '商品分类', '商品与消费');
CALL set_plan('L_vaccine_types', '03', 'CRUD', 'pet', 'vaccineTypes', '疫苗类型', '数据与系统');
CALL set_plan('L_food_brands', '04', 'CRUD', 'product', 'foodBrands', '食品品牌', '商品与消费');
CALL set_plan('L_food_products', '05', 'CRUD', 'product', 'foodProducts', '食品商品', '商品与消费');
CALL set_plan('L_pet_breeds', '06', 'CRUD', 'pet', 'petBreeds', '宠物品种', '数据与系统');
CALL set_plan('L_pet_age_conversion', '07', 'CRUD', 'pet', 'petAgeConversion', '宠物年龄换算', '数据与系统');
CALL set_plan('L_pet_feature_tags', '08', 'CRUD', 'pet', 'petFeatureTags', '宠物特征标签', '数据与系统');
CALL set_plan('L_care_activity_types', '09', 'CRUD', 'pet', 'careActivityTypes', '关怀活动类型', '数据与系统');

-- ============ Phase 2: 核心实体 ============
CALL set_plan('L_raiser_users', '10', 'CRUD', 'pet', 'raiserUsers', '养宠用户', '宠物中心');
CALL set_plan('L_pets', '11', 'CRUD', 'pet', 'pets', '宠物档案', '宠物中心');
CALL set_plan('L_pet_products', '12', 'CRUD', 'product', 'petProducts', '宠物商品', '商品与消费');

-- ============ Phase 3: 宠物子记录 ============
CALL set_plan('L_weight_records', '13', 'CRUD', 'pet', 'weightRecords', '重量记录', '宠物中心');
CALL set_plan('L_feeding_records', '14', 'CRUD', 'pet', 'feedingRecords', '喂养记录', '宠物中心');
CALL set_plan('L_excretion_records', '15', 'CRUD', 'pet', 'excretionRecords', '排泄记录', '宠物中心');
CALL set_plan('L_vaccine_records', '16', 'CRUD', 'pet', 'vaccineRecords', '疫苗记录', '宠物中心');
CALL set_plan('L_health_records', '17', 'CRUD', 'pet', 'healthRecords', '健康记录', '宠物中心');
CALL set_plan('L_pet_photos', '18', 'CRUD', 'pet', 'petPhotos', '宠物照片', '宠物中心');
CALL set_plan('L_pet_documents', '19', 'CRUD', 'pet', 'petDocuments', '宠物证件', '宠物中心');
CALL set_plan('L_pet_growth_records', '20', 'CRUD', 'pet', 'petGrowthRecords', '成长记录', '宠物中心');
CALL set_plan('L_pet_milestones', '21', 'CRUD', 'pet', 'petMilestones', '里程碑', '宠物中心');
CALL set_plan('L_pet_anniversaries', '22', 'CRUD', 'pet', 'petAnniversaries', '宠物纪念日', '宠物中心');
CALL set_plan('L_pet_training_records', '23', 'CRUD', 'pet', 'petTrainingRecords', '训练记录', '宠物中心');
CALL set_plan('L_pet_social_records', '24', 'CRUD', 'pet', 'petSocialRecords', '社交记录', '宠物中心');
CALL set_plan('L_pet_adoption_history', '25', 'CRUD', 'pet', 'petAdoptionHistory', '收养历史', '宠物中心');
CALL set_plan('L_pet_preferences', '26', 'CRUD', 'pet', 'petPreferences', '喜好设置', '宠物中心');
CALL set_plan('L_care_records', '27', 'CRUD', 'pet', 'careRecords', '关怀记录', '宠物中心');

-- ============ Phase 4: 商品/消费 ============
CALL set_plan('L_expense_categories', '28', 'CRUD', 'finance', 'expenseCategories', '费用类别', '商品与消费');
CALL set_plan('L_expense_records', '29', 'CRUD', 'finance', 'expenseRecords', '费用记录', '商品与消费');
CALL set_plan('L_product_value_assessments', '30', 'CRUD', 'finance', 'productValueAssessments', '商品估值', '商品与消费');
CALL set_plan('L_purchase_decisions', '31', 'CRUD', 'finance', 'purchaseDecisions', '购买决策', '商品与消费');
CALL set_plan('L_pet_product_purchases', '32', 'CRUD', 'finance', 'petProductPurchases', '商品购买', '商品与消费');

-- ============ Phase 5: 纪念/关系/日记 ============
CALL set_plan('L_love_diaries', '33', 'CRUD', 'social', 'loveDiaries', '爱情日记', '纪念与关系');
CALL set_plan('L_diary_comments', '34', 'CRUD', 'social', 'diaryComments', '日记评论', '纪念与关系');
CALL set_plan('L_date_records', '35', 'CRUD', 'social', 'dateRecords', '约会记录', '纪念与关系');
CALL set_plan('L_anniversaries', '36', 'CRUD', 'social', 'anniversaries', '纪念日', '纪念与关系');
CALL set_plan('L_anniversary_reminders', '37', 'CRUD', 'social', 'anniversaryReminders', '纪念日提醒', '纪念与关系');
CALL set_plan('L_couple_relations', '38', 'CRUD', 'social', 'coupleRelations', '情侣关系', '纪念与关系');
CALL set_plan('L_couple_tasks', '39', 'CRUD', 'social', 'coupleTasks', '情侣任务', '纪念与关系');
CALL set_plan('L_couple_anniversaries', '40', 'CRUD', 'social', 'coupleAnniversaries', '情侣纪念日', '纪念与关系');

-- ============ Phase 6: 权限/日志/设置 ============
CALL set_plan('L_data_permissions', '41', 'CRUD', 'admin', 'dataPermissions', '数据权限', '数据与系统');
CALL set_plan('L_data_view_logs', '42', 'CRUD', 'admin', 'dataViewLogs', '数据查看日志', '数据与系统');
CALL set_plan('L_abnormal_records', '43', 'CRUD', 'admin', 'abnormalRecords', '异常记录', '数据与系统');
CALL set_plan('L_privacy_settings', '44', 'CRUD', 'admin', 'privacySettings', '隐私设置', '数据与系统');
CALL set_plan('L_reminders', '45', 'CRUD', 'admin', 'reminders', '提醒', '数据与系统');
CALL set_plan('L_pet_family_relations', '46', 'CRUD', 'pet', 'petFamilyRelations', '家庭关系', '宠物中心');

-- 用法:
-- mysql --default-character-set=utf8mb4 -h127.0.0.1 -uroot -pLyc123456 Liam_pet_love_bd < script/sql/update/set_gen_plan_comments.sql


