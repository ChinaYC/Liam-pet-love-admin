-- 跳过已存在的表创建，只执行缺失的字段和数据更新

-- 检查并插入flow_spel数据（如果不存在）
INSERT IGNORE INTO flow_spel VALUES (1, 'spelRuleComponent', 'selectDeptLeaderById', 'initiatorDeptId', '#{@spelRuleComponent.selectDeptLeaderById(#initiatorDeptId)}', '根据部门id获取部门负责人', '0', '0', 103, 1, now(), 1, now());
INSERT IGNORE INTO flow_spel VALUES (2, NULL, NULL, 'initiator', '${initiator}', '流程发起人', '0', '0', 103, 1, now(), 1, now());

-- 检查并插入菜单数据（如果不存在）
INSERT IGNORE INTO sys_menu VALUES ('11801', '流程表达式', '11616', '2', 'spel', 'workflow/spel/index', '', 1, 0, 'C', '0', '0', 'workflow:spel:list', 'input', 103, 1, now(), 1, now(), '流程达式定义菜单');
INSERT IGNORE INTO sys_menu VALUES ('11802', '流程spel达式定义查询', '11801', 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'workflow:spel:query', '#', 103, 1, now(), NULL, NULL, '');
INSERT IGNORE INTO sys_menu VALUES ('11803', '流程spel达式定义新增', '11801', 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'workflow:spel:add', '#', 103, 1, now(), NULL, NULL, '');
INSERT IGNORE INTO sys_menu VALUES ('11804', '流程spel达式定义修改', '11801', 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'workflow:spel:edit', '#', 103, 1, now(), NULL, NULL, '');
INSERT IGNORE INTO sys_menu VALUES ('11805', '流程spel达式定义删除', '11801', 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'workflow:spel:remove', '#', 103, 1, now(), NULL, NULL, '');
INSERT IGNORE INTO sys_menu VALUES ('11806', '流程spel达式定义导出', '11801', 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'workflow:spel:export', '#', 103, 1, now(), NULL, NULL, '');

-- 更新flow_skip表的skip_condition字段
UPDATE flow_skip SET skip_condition = REPLACE(skip_condition,'notNike','notLike') WHERE skip_condition LIKE '%notNike%';

-- 修改flow_his_task表的collaborator字段
ALTER TABLE `flow_his_task` MODIFY COLUMN `collaborator` varchar(500) NULL DEFAULT NULL COMMENT '协作人' AFTER `cooperate_type`;

-- 更新sys_menu表的remark字段
UPDATE sys_menu SET remark = '/tool/gen' WHERE menu_id = 116;
UPDATE sys_menu SET remark = '/system/role' WHERE menu_id = 130;
UPDATE sys_menu SET remark = '/system/user' WHERE menu_id = 131;
UPDATE sys_menu SET remark = '/system/dict' WHERE menu_id = 132;
UPDATE sys_menu SET remark = '/system/oss' WHERE menu_id = 133;
UPDATE sys_menu SET remark = '/workflow/processDefinition' WHERE menu_id = 11700;