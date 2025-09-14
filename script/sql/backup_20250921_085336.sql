-- MySQL dump 10.13  Distrib 9.3.0, for macos15.4 (arm64)
--
-- Host: localhost    Database: Liam_pet_love_bd
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `flow_category`
--

DROP TABLE IF EXISTS `flow_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flow_category` (
  `category_id` bigint NOT NULL COMMENT '流程分类ID',
  `tenant_id` varchar(20) COLLATE utf8mb4_general_ci DEFAULT '000000' COMMENT '租户编号',
  `parent_id` bigint DEFAULT '0' COMMENT '父流程分类id',
  `ancestors` varchar(500) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '祖级列表',
  `category_name` varchar(30) COLLATE utf8mb4_general_ci NOT NULL COMMENT '流程分类名称',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `del_flag` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='流程分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flow_category`
--

LOCK TABLES `flow_category` WRITE;
/*!40000 ALTER TABLE `flow_category` DISABLE KEYS */;
INSERT INTO `flow_category` VALUES (100,'000000',0,'0','OA审批',0,'0',103,1,'2025-09-17 22:01:10',NULL,NULL),(101,'000000',100,'0,100','假勤管理',0,'0',103,1,'2025-09-17 22:01:10',NULL,NULL),(102,'000000',100,'0,100','人事管理',1,'0',103,1,'2025-09-17 22:01:10',NULL,NULL),(103,'000000',101,'0,100,101','请假',0,'0',103,1,'2025-09-17 22:01:10',NULL,NULL),(104,'000000',101,'0,100,101','出差',1,'0',103,1,'2025-09-17 22:01:10',NULL,NULL),(105,'000000',101,'0,100,101','加班',2,'0',103,1,'2025-09-17 22:01:10',NULL,NULL),(106,'000000',101,'0,100,101','换班',3,'0',103,1,'2025-09-17 22:01:10',NULL,NULL),(107,'000000',101,'0,100,101','外出',4,'0',103,1,'2025-09-17 22:01:10',NULL,NULL),(108,'000000',102,'0,100,102','转正',1,'0',103,1,'2025-09-17 22:01:10',NULL,NULL),(109,'000000',102,'0,100,102','离职',2,'0',103,1,'2025-09-17 22:01:10',NULL,NULL);
/*!40000 ALTER TABLE `flow_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flow_definition`
--

DROP TABLE IF EXISTS `flow_definition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flow_definition` (
  `id` bigint NOT NULL COMMENT '主键id',
  `flow_code` varchar(40) COLLATE utf8mb4_general_ci NOT NULL COMMENT '流程编码',
  `flow_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL COMMENT '流程名称',
  `model_value` varchar(40) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'CLASSICS' COMMENT '设计器模型（CLASSICS经典模型 MIMIC仿钉钉模型）',
  `category` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '流程类别',
  `version` varchar(20) COLLATE utf8mb4_general_ci NOT NULL COMMENT '流程版本',
  `is_publish` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否发布（0未发布 1已发布 9失效）',
  `form_custom` char(1) COLLATE utf8mb4_general_ci DEFAULT 'N' COMMENT '审批表单是否自定义（Y是 N否）',
  `form_path` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '审批表单路径',
  `activity_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '流程激活状态（0挂起 1激活）',
  `listener_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '监听器类型',
  `listener_path` varchar(400) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '监听器路径',
  `ext` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '业务详情 存业务表对象json字符串',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `del_flag` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志',
  `tenant_id` varchar(40) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='流程定义表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flow_definition`
--

LOCK TABLES `flow_definition` WRITE;
/*!40000 ALTER TABLE `flow_definition` DISABLE KEYS */;
/*!40000 ALTER TABLE `flow_definition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flow_his_task`
--

DROP TABLE IF EXISTS `flow_his_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flow_his_task` (
  `id` bigint NOT NULL COMMENT '主键id',
  `definition_id` bigint NOT NULL COMMENT '对应flow_definition表的id',
  `instance_id` bigint NOT NULL COMMENT '对应flow_instance表的id',
  `task_id` bigint NOT NULL COMMENT '对应flow_task表的id',
  `node_code` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '开始节点编码',
  `node_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '开始节点名称',
  `node_type` tinyint(1) DEFAULT NULL COMMENT '开始节点类型（0开始节点 1中间节点 2结束节点 3互斥网关 4并行网关）',
  `target_node_code` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '目标节点编码',
  `target_node_name` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '结束节点名称',
  `approver` varchar(40) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '审批者',
  `cooperate_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '协作方式(1审批 2转办 3委派 4会签 5票签 6加签 7减签)',
  `collaborator` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '协作人',
  `skip_type` varchar(10) COLLATE utf8mb4_general_ci NOT NULL COMMENT '流转类型（PASS通过 REJECT退回 NONE无动作）',
  `flow_status` varchar(20) COLLATE utf8mb4_general_ci NOT NULL COMMENT '流程状态（0待提交 1审批中 2审批通过 4终止 5作废 6撤销 8已完成 9已退回 10失效 11拿回）',
  `form_custom` char(1) COLLATE utf8mb4_general_ci DEFAULT 'N' COMMENT '审批表单是否自定义（Y是 N否）',
  `form_path` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '审批表单路径',
  `message` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '审批意见',
  `variable` text COLLATE utf8mb4_general_ci COMMENT '任务变量',
  `ext` text COLLATE utf8mb4_general_ci COMMENT '业务详情 存业务表对象json字符串',
  `create_time` datetime DEFAULT NULL COMMENT '任务开始时间',
  `update_time` datetime DEFAULT NULL COMMENT '审批完成时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `del_flag` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志',
  `tenant_id` varchar(40) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='历史任务记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flow_his_task`
--

LOCK TABLES `flow_his_task` WRITE;
/*!40000 ALTER TABLE `flow_his_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `flow_his_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flow_instance`
--

DROP TABLE IF EXISTS `flow_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flow_instance` (
  `id` bigint NOT NULL COMMENT '主键id',
  `definition_id` bigint NOT NULL COMMENT '对应flow_definition表的id',
  `business_id` varchar(40) COLLATE utf8mb4_general_ci NOT NULL COMMENT '业务id',
  `node_type` tinyint(1) NOT NULL COMMENT '节点类型（0开始节点 1中间节点 2结束节点 3互斥网关 4并行网关）',
  `node_code` varchar(40) COLLATE utf8mb4_general_ci NOT NULL COMMENT '流程节点编码',
  `node_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '流程节点名称',
  `variable` text COLLATE utf8mb4_general_ci COMMENT '任务变量',
  `flow_status` varchar(20) COLLATE utf8mb4_general_ci NOT NULL COMMENT '流程状态（0待提交 1审批中 2审批通过 4终止 5作废 6撤销 8已完成 9已退回 10失效 11拿回）',
  `activity_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '流程激活状态（0挂起 1激活）',
  `def_json` text COLLATE utf8mb4_general_ci COMMENT '流程定义json',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `ext` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '扩展字段，预留给业务系统使用',
  `del_flag` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志',
  `tenant_id` varchar(40) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='流程实例表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flow_instance`
--

LOCK TABLES `flow_instance` WRITE;
/*!40000 ALTER TABLE `flow_instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `flow_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flow_instance_biz_ext`
--

DROP TABLE IF EXISTS `flow_instance_biz_ext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flow_instance_biz_ext` (
  `id` bigint NOT NULL COMMENT '主键id',
  `tenant_id` varchar(20) COLLATE utf8mb4_general_ci DEFAULT '000000' COMMENT '租户编号',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `business_code` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '业务编码',
  `business_title` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '业务标题',
  `del_flag` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `instance_id` bigint DEFAULT NULL COMMENT '流程实例Id',
  `business_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '业务Id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='流程实例业务扩展表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flow_instance_biz_ext`
--

LOCK TABLES `flow_instance_biz_ext` WRITE;
/*!40000 ALTER TABLE `flow_instance_biz_ext` DISABLE KEYS */;
/*!40000 ALTER TABLE `flow_instance_biz_ext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flow_node`
--

DROP TABLE IF EXISTS `flow_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flow_node` (
  `id` bigint NOT NULL COMMENT '主键id',
  `node_type` tinyint(1) NOT NULL COMMENT '节点类型（0开始节点 1中间节点 2结束节点 3互斥网关 4并行网关）',
  `definition_id` bigint NOT NULL COMMENT '流程定义id',
  `node_code` varchar(100) COLLATE utf8mb4_general_ci NOT NULL COMMENT '流程节点编码',
  `node_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '流程节点名称',
  `permission_flag` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '权限标识（权限类型:权限标识，可以多个，用@@隔开)',
  `node_ratio` decimal(6,3) DEFAULT NULL COMMENT '流程签署比例值',
  `coordinate` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '坐标',
  `any_node_skip` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '任意结点跳转',
  `listener_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '监听器类型',
  `listener_path` varchar(400) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '监听器路径',
  `handler_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '处理器类型',
  `handler_path` varchar(400) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '处理器路径',
  `form_custom` char(1) COLLATE utf8mb4_general_ci DEFAULT 'N' COMMENT '审批表单是否自定义（Y是 N否）',
  `form_path` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '审批表单路径',
  `version` varchar(20) COLLATE utf8mb4_general_ci NOT NULL COMMENT '版本',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `ext` text COLLATE utf8mb4_general_ci COMMENT '节点扩展属性',
  `del_flag` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志',
  `tenant_id` varchar(40) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='流程节点表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flow_node`
--

LOCK TABLES `flow_node` WRITE;
/*!40000 ALTER TABLE `flow_node` DISABLE KEYS */;
/*!40000 ALTER TABLE `flow_node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flow_skip`
--

DROP TABLE IF EXISTS `flow_skip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flow_skip` (
  `id` bigint NOT NULL COMMENT '主键id',
  `definition_id` bigint NOT NULL COMMENT '流程定义id',
  `now_node_code` varchar(100) COLLATE utf8mb4_general_ci NOT NULL COMMENT '当前流程节点的编码',
  `now_node_type` tinyint(1) DEFAULT NULL COMMENT '当前节点类型（0开始节点 1中间节点 2结束节点 3互斥网关 4并行网关）',
  `next_node_code` varchar(100) COLLATE utf8mb4_general_ci NOT NULL COMMENT '下一个流程节点的编码',
  `next_node_type` tinyint(1) DEFAULT NULL COMMENT '下一个节点类型（0开始节点 1中间节点 2结束节点 3互斥网关 4并行网关）',
  `skip_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '跳转名称',
  `skip_type` varchar(40) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '跳转类型（PASS审批通过 REJECT退回）',
  `skip_condition` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '跳转条件',
  `coordinate` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '坐标',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `del_flag` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志',
  `tenant_id` varchar(40) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='节点跳转关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flow_skip`
--

LOCK TABLES `flow_skip` WRITE;
/*!40000 ALTER TABLE `flow_skip` DISABLE KEYS */;
/*!40000 ALTER TABLE `flow_skip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flow_spel`
--

DROP TABLE IF EXISTS `flow_spel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flow_spel` (
  `id` bigint NOT NULL COMMENT '主键id',
  `component_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组件名称',
  `method_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '方法名',
  `method_params` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '参数',
  `view_spel` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '预览spel表达式',
  `remark` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='流程spel表达式定义表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flow_spel`
--

LOCK TABLES `flow_spel` WRITE;
/*!40000 ALTER TABLE `flow_spel` DISABLE KEYS */;
INSERT INTO `flow_spel` VALUES (1,'spelRuleComponent','selectDeptLeaderById','initiatorDeptId','#{@spelRuleComponent.selectDeptLeaderById(#initiatorDeptId)}','根据部门id获取部门负责人','0','0',103,1,'2025-09-17 22:01:10',1,'2025-09-17 22:01:10'),(2,NULL,NULL,'initiator','${initiator}','流程发起人','0','0',103,1,'2025-09-17 22:01:10',1,'2025-09-17 22:01:10');
/*!40000 ALTER TABLE `flow_spel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flow_task`
--

DROP TABLE IF EXISTS `flow_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flow_task` (
  `id` bigint NOT NULL COMMENT '主键id',
  `definition_id` bigint NOT NULL COMMENT '对应flow_definition表的id',
  `instance_id` bigint NOT NULL COMMENT '对应flow_instance表的id',
  `node_code` varchar(100) COLLATE utf8mb4_general_ci NOT NULL COMMENT '节点编码',
  `node_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '节点名称',
  `node_type` tinyint(1) NOT NULL COMMENT '节点类型（0开始节点 1中间节点 2结束节点 3互斥网关 4并行网关）',
  `flow_status` varchar(20) COLLATE utf8mb4_general_ci NOT NULL COMMENT '流程状态（0待提交 1审批中 2审批通过 4终止 5作废 6撤销 8已完成 9已退回 10失效 11拿回）',
  `form_custom` char(1) COLLATE utf8mb4_general_ci DEFAULT 'N' COMMENT '审批表单是否自定义（Y是 N否）',
  `form_path` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '审批表单路径',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `del_flag` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志',
  `tenant_id` varchar(40) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='待办任务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flow_task`
--

LOCK TABLES `flow_task` WRITE;
/*!40000 ALTER TABLE `flow_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `flow_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flow_user`
--

DROP TABLE IF EXISTS `flow_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flow_user` (
  `id` bigint NOT NULL COMMENT '主键id',
  `type` char(1) COLLATE utf8mb4_general_ci NOT NULL COMMENT '人员类型（1待办任务的审批人权限 2待办任务的转办人权限 3待办任务的委托人权限）',
  `processed_by` varchar(80) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '权限人',
  `associated` bigint NOT NULL COMMENT '任务表id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(80) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `del_flag` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志',
  `tenant_id` varchar(40) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_processed_type` (`processed_by`,`type`),
  KEY `user_associated` (`associated`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='流程用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flow_user`
--

LOCK TABLES `flow_user` WRITE;
/*!40000 ALTER TABLE `flow_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `flow_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table`
--

DROP TABLE IF EXISTS `gen_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table` (
  `table_id` bigint NOT NULL COMMENT '编号',
  `data_name` varchar(200) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '数据源名称',
  `table_name` varchar(200) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) COLLATE utf8mb4_general_ci DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) COLLATE utf8mb4_general_ci DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '其它生成选项',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='代码生成业务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table`
--

LOCK TABLES `gen_table` WRITE;
/*!40000 ALTER TABLE `gen_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `gen_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table_column`
--

DROP TABLE IF EXISTS `gen_table_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table_column` (
  `column_id` bigint NOT NULL COMMENT '编号',
  `table_id` bigint DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) COLLATE utf8mb4_general_ci DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典类型',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='代码生成业务表字段';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table_column`
--

LOCK TABLES `gen_table_column` WRITE;
/*!40000 ALTER TABLE `gen_table_column` DISABLE KEYS */;
/*!40000 ALTER TABLE `gen_table_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `L_abnormal_records`
--

DROP TABLE IF EXISTS `L_abnormal_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `L_abnormal_records` (
  `record_id` bigint NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `pet_id` bigint NOT NULL COMMENT '宠物ID',
  `abnormal_type` varchar(100) COLLATE utf8mb4_general_ci NOT NULL COMMENT '异常类型',
  `symptoms` text COLLATE utf8mb4_general_ci NOT NULL COMMENT '症状描述',
  `severity_level` tinyint(1) NOT NULL DEFAULT '1' COMMENT '严重程度 1:轻微 2:一般 3:严重 4:紧急',
  `occurrence_time` datetime NOT NULL COMMENT '发生时间',
  `duration` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '持续时间',
  `trigger_factor` text COLLATE utf8mb4_general_ci COMMENT '诱发因素',
  `treatment_taken` text COLLATE utf8mb4_general_ci COMMENT '采取的治疗措施',
  `recovery_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '恢复状态 0:未恢复 1:好转 2:完全恢复',
  `photo_urls` text COLLATE utf8mb4_general_ci COMMENT '相关照片URLs(JSON格式)',
  `veterinarian_consulted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否咨询兽医',
  `vet_advice` text COLLATE utf8mb4_general_ci COMMENT '兽医建议',
  `follow_up_required` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否需要跟进',
  `follow_up_date` date DEFAULT NULL COMMENT '跟进日期',
  `notes` text COLLATE utf8mb4_general_ci COMMENT '备注',
  `visibility` tinyint(1) NOT NULL DEFAULT '1' COMMENT '可见性 1:仅自己 2:情侣可见',
  `pet_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '宠物名称(冗余字段)',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`record_id`),
  KEY `idx_pet_id` (`pet_id`),
  KEY `idx_severity_level` (`severity_level`),
  KEY `idx_occurrence_time` (`occurrence_time`),
  KEY `idx_recovery_status` (`recovery_status`),
  KEY `idx_visibility` (`visibility`),
  KEY `idx_deleted` (`deleted`),
  KEY `idx_abnormal_pet_severity` (`pet_id`,`severity_level`,`occurrence_time`,`deleted`),
  CONSTRAINT `l_abnormal_records_ibfk_1` FOREIGN KEY (`pet_id`) REFERENCES `L_pets` (`pet_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='异常情况记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `L_abnormal_records`
--

LOCK TABLES `L_abnormal_records` WRITE;
/*!40000 ALTER TABLE `L_abnormal_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `L_abnormal_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `L_anniversaries`
--

DROP TABLE IF EXISTS `L_anniversaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `L_anniversaries` (
  `anniversary_id` bigint NOT NULL AUTO_INCREMENT COMMENT '纪念日ID',
  `relation_id` bigint NOT NULL COMMENT '关系ID',
  `anniversary_name` varchar(200) COLLATE utf8mb4_general_ci NOT NULL COMMENT '纪念日名称',
  `anniversary_date` date NOT NULL COMMENT '纪念日日期',
  `anniversary_type` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '纪念日类型 relationship:恋爱纪念 birthday:生日 holiday:节日 custom:自定义',
  `repeat_type` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'yearly' COMMENT '重复类型 none:不重复 yearly:每年 monthly:每月',
  `description` text COLLATE utf8mb4_general_ci COMMENT '描述',
  `reminder_days` int NOT NULL DEFAULT '1' COMMENT '提前提醒天数',
  `is_reminder_enabled` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用提醒',
  `celebration_plan` text COLLATE utf8mb4_general_ci COMMENT '庆祝计划',
  `photo_urls` text COLLATE utf8mb4_general_ci COMMENT '相关照片URLs(JSON格式)',
  `is_active` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`anniversary_id`),
  KEY `idx_relation_id` (`relation_id`),
  KEY `idx_anniversary_date` (`anniversary_date`),
  KEY `idx_anniversary_type` (`anniversary_type`),
  KEY `idx_is_active` (`is_active`),
  CONSTRAINT `l_anniversaries_ibfk_1` FOREIGN KEY (`relation_id`) REFERENCES `L_couple_relations` (`relation_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='恋爱纪念日表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `L_anniversaries`
--

LOCK TABLES `L_anniversaries` WRITE;
/*!40000 ALTER TABLE `L_anniversaries` DISABLE KEYS */;
/*!40000 ALTER TABLE `L_anniversaries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `L_anniversary_reminders`
--

DROP TABLE IF EXISTS `L_anniversary_reminders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `L_anniversary_reminders` (
  `reminder_id` bigint NOT NULL AUTO_INCREMENT COMMENT '提醒ID',
  `anniversary_type` varchar(20) COLLATE utf8mb4_general_ci NOT NULL COMMENT '纪念日类型 pet:宠物纪念日 couple:情侣纪念日',
  `anniversary_id` bigint NOT NULL COMMENT '纪念日ID',
  `ruid` bigint NOT NULL COMMENT '用户ID',
  `reminder_date` date NOT NULL COMMENT '提醒日期',
  `reminder_time` time DEFAULT '09:00:00' COMMENT '提醒时间',
  `reminder_title` varchar(200) COLLATE utf8mb4_general_ci NOT NULL COMMENT '提醒标题',
  `reminder_content` text COLLATE utf8mb4_general_ci COMMENT '提醒内容',
  `reminder_method` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'system' COMMENT '提醒方式 system:系统通知 email:邮件 sms:短信 wechat:微信',
  `is_sent` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已发送',
  `sent_time` datetime DEFAULT NULL COMMENT '发送时间',
  `is_read` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已读',
  `read_time` datetime DEFAULT NULL COMMENT '阅读时间',
  `response_action` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '响应操作',
  `snooze_until` datetime DEFAULT NULL COMMENT '延迟到',
  `priority_level` tinyint(1) NOT NULL DEFAULT '3' COMMENT '优先级 1:低 2:一般 3:高 4:紧急 5:最高',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`reminder_id`),
  KEY `idx_anniversary_type_id` (`anniversary_type`,`anniversary_id`),
  KEY `idx_ruid` (`ruid`),
  KEY `idx_reminder_date` (`reminder_date`),
  KEY `idx_is_sent` (`is_sent`),
  KEY `idx_is_read` (`is_read`),
  KEY `idx_priority_level` (`priority_level`),
  KEY `idx_deleted` (`deleted`),
  KEY `idx_anniversary_reminder_date` (`ruid`,`reminder_date`,`is_sent`,`deleted`),
  CONSTRAINT `l_anniversary_reminders_ibfk_1` FOREIGN KEY (`ruid`) REFERENCES `L_raiser_users` (`ruid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='纪念日提醒表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `L_anniversary_reminders`
--

LOCK TABLES `L_anniversary_reminders` WRITE;
/*!40000 ALTER TABLE `L_anniversary_reminders` DISABLE KEYS */;
/*!40000 ALTER TABLE `L_anniversary_reminders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `L_care_activity_types`
--

DROP TABLE IF EXISTS `L_care_activity_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `L_care_activity_types` (
  `type_id` bigint NOT NULL AUTO_INCREMENT COMMENT '类型ID',
  `type_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL COMMENT '类型名称',
  `category` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '分类 bathing:洗澡 grooming:美容 deworming:驱虫 nail_trimming:剪指甲 dental:口腔护理 other:其他',
  `default_interval_days` int DEFAULT NULL COMMENT '默认间隔天数',
  `species` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '适用物种',
  `description` text COLLATE utf8mb4_general_ci COMMENT '描述',
  `is_active` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`type_id`),
  KEY `idx_category` (`category`),
  KEY `idx_species` (`species`),
  KEY `idx_is_active` (`is_active`),
  KEY `idx_deleted` (`deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='护理活动类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `L_care_activity_types`
--

LOCK TABLES `L_care_activity_types` WRITE;
/*!40000 ALTER TABLE `L_care_activity_types` DISABLE KEYS */;
INSERT INTO `L_care_activity_types` VALUES (1,'洗澡','bathing',30,'cat','定期为猫咪洗澡，保持清洁',1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(2,'洗澡','bathing',14,'dog','定期为狗狗洗澡，保持清洁',1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(3,'驱虫','deworming',90,NULL,'定期驱虫，预防寄生虫感染',1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(4,'剪指甲','nail_trimming',14,NULL,'定期修剪指甲，避免过长',1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(5,'刷牙','dental',3,NULL,'定期刷牙，维护口腔健康',1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(6,'梳毛','grooming',7,NULL,'定期梳毛，去除死毛和打结',1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51');
/*!40000 ALTER TABLE `L_care_activity_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `L_care_records`
--

DROP TABLE IF EXISTS `L_care_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `L_care_records` (
  `record_id` bigint NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `pet_id` bigint NOT NULL COMMENT '宠物ID',
  `activity_type_id` bigint DEFAULT NULL COMMENT '活动类型ID',
  `activity_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL COMMENT '活动名称',
  `activity_date` datetime NOT NULL COMMENT '活动时间',
  `duration_minutes` int DEFAULT NULL COMMENT '持续时间(分钟)',
  `location` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '地点',
  `service_provider` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '服务提供者',
  `cost` decimal(10,2) DEFAULT NULL COMMENT '费用',
  `products_used` text COLLATE utf8mb4_general_ci COMMENT '使用的产品',
  `notes` text COLLATE utf8mb4_general_ci COMMENT '备注',
  `next_due_date` date DEFAULT NULL COMMENT '下次应做时间',
  `photo_urls` text COLLATE utf8mb4_general_ci COMMENT '相关照片URLs(JSON格式)',
  `rating` tinyint(1) DEFAULT NULL COMMENT '满意度评分 1-5分',
  `reminder_sent` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已发送提醒',
  `visibility` tinyint(1) NOT NULL DEFAULT '1' COMMENT '可见性 1:仅自己 2:情侣可见',
  `pet_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '宠物名称(冗余字段)',
  `activity_type_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '活动类型名称(冗余字段)',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`record_id`),
  KEY `idx_pet_id` (`pet_id`),
  KEY `idx_activity_type_id` (`activity_type_id`),
  KEY `idx_activity_date` (`activity_date`),
  KEY `idx_next_due_date` (`next_due_date`),
  KEY `idx_visibility` (`visibility`),
  KEY `idx_deleted` (`deleted`),
  KEY `idx_care_pet_date` (`pet_id`,`activity_date`,`deleted`),
  KEY `idx_care_deleted_pet` (`deleted`,`pet_id`),
  KEY `idx_care_pet_type_date` (`pet_id`,`activity_type_id`,`activity_date`,`deleted`),
  CONSTRAINT `l_care_records_ibfk_1` FOREIGN KEY (`pet_id`) REFERENCES `L_pets` (`pet_id`) ON DELETE CASCADE,
  CONSTRAINT `l_care_records_ibfk_2` FOREIGN KEY (`activity_type_id`) REFERENCES `L_care_activity_types` (`type_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='护理活动记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `L_care_records`
--

LOCK TABLES `L_care_records` WRITE;
/*!40000 ALTER TABLE `L_care_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `L_care_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `L_couple_anniversaries`
--

DROP TABLE IF EXISTS `L_couple_anniversaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `L_couple_anniversaries` (
  `anniversary_id` bigint NOT NULL AUTO_INCREMENT COMMENT '纪念日ID',
  `relation_id` bigint NOT NULL COMMENT '情侣关系ID',
  `anniversary_type` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '纪念日类型 first_meet:初次见面 first_date:第一次约会 relationship_start:恋爱开始 engagement:订婚 marriage:结婚 move_in:同居 pet_adoption:共同领养宠物 other:其他',
  `anniversary_name` varchar(200) COLLATE utf8mb4_general_ci NOT NULL COMMENT '纪念日名称',
  `anniversary_date` date NOT NULL COMMENT '纪念日日期',
  `is_recurring` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否每年重复',
  `description` text COLLATE utf8mb4_general_ci COMMENT '纪念日描述',
  `importance_level` tinyint(1) NOT NULL DEFAULT '3' COMMENT '重要程度 1:一般 2:重要 3:非常重要 4:特别重要 5:最重要',
  `celebration_plan` text COLLATE utf8mb4_general_ci COMMENT '庆祝计划',
  `photos` text COLLATE utf8mb4_general_ci COMMENT '纪念照片URLs(JSON格式)',
  `memories` text COLLATE utf8mb4_general_ci COMMENT '回忆记录',
  `gifts_exchanged` text COLLATE utf8mb4_general_ci COMMENT '互赠礼物记录',
  `location` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '庆祝地点',
  `special_meaning` text COLLATE utf8mb4_general_ci COMMENT '特殊意义',
  `reminder_days_before` int DEFAULT '7' COMMENT '提前提醒天数',
  `is_reminder_enabled` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用提醒',
  `last_celebrated_year` int DEFAULT NULL COMMENT '最后庆祝年份',
  `celebration_count` int NOT NULL DEFAULT '0' COMMENT '庆祝次数',
  `visibility` tinyint(1) NOT NULL DEFAULT '2' COMMENT '可见性 1:仅自己 2:情侣可见 3:公开',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`anniversary_id`),
  KEY `idx_relation_id` (`relation_id`),
  KEY `idx_anniversary_type` (`anniversary_type`),
  KEY `idx_anniversary_date` (`anniversary_date`),
  KEY `idx_is_recurring` (`is_recurring`),
  KEY `idx_importance_level` (`importance_level`),
  KEY `idx_is_reminder_enabled` (`is_reminder_enabled`),
  KEY `idx_visibility` (`visibility`),
  KEY `idx_deleted` (`deleted`),
  KEY `idx_couple_anniversary_relation` (`relation_id`,`anniversary_date`,`importance_level`,`deleted`),
  CONSTRAINT `l_couple_anniversaries_ibfk_1` FOREIGN KEY (`relation_id`) REFERENCES `L_couple_relations` (`relation_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='情侣纪念日表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `L_couple_anniversaries`
--

LOCK TABLES `L_couple_anniversaries` WRITE;
/*!40000 ALTER TABLE `L_couple_anniversaries` DISABLE KEYS */;
/*!40000 ALTER TABLE `L_couple_anniversaries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `L_couple_relations`
--

DROP TABLE IF EXISTS `L_couple_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `L_couple_relations` (
  `relation_id` bigint NOT NULL AUTO_INCREMENT COMMENT '关系ID',
  `ruid_1` bigint NOT NULL COMMENT '饲养者1ID',
  `ruid_2` bigint NOT NULL COMMENT '饲养者2ID',
  `relation_code` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '关系邀请码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0:待确认 1:已绑定 2:已解绑 3:暂停',
  `relation_type` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'couple' COMMENT '关系类型 couple:情侣 married:夫妻 friend:朋友 family:家人',
  `anniversary_date` date DEFAULT NULL COMMENT '恋爱纪念日',
  `relation_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '关系名称',
  `relation_nickname_1` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户1在关系中的昵称',
  `relation_nickname_2` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户2在关系中的昵称',
  `shared_goals` text COLLATE utf8mb4_general_ci COMMENT '共同目标',
  `relationship_motto` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '关系座右铭',
  `bind_time` datetime DEFAULT NULL COMMENT '绑定时间',
  `unbind_time` datetime DEFAULT NULL COMMENT '解绑时间',
  `pause_time` datetime DEFAULT NULL COMMENT '暂停时间',
  `pause_reason` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '暂停原因',
  `shared_pet_count` int NOT NULL DEFAULT '0' COMMENT '共同宠物数量',
  `shared_expense_enabled` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用共同消费',
  `data_sharing_level` tinyint(1) NOT NULL DEFAULT '2' COMMENT '数据共享级别 1:基础 2:标准 3:完全',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除者',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`relation_id`),
  UNIQUE KEY `uk_relation_code` (`relation_code`),
  UNIQUE KEY `uk_users` (`ruid_1`,`ruid_2`),
  KEY `idx_status` (`status`),
  KEY `idx_relation_type` (`relation_type`),
  KEY `idx_anniversary_date` (`anniversary_date`),
  KEY `idx_deleted` (`deleted`),
  KEY `ruid_2` (`ruid_2`),
  KEY `idx_couple_relation_status` (`ruid_1`,`ruid_2`,`status`,`deleted`),
  KEY `idx_couple_relations_code` (`relation_code`,`status`),
  KEY `idx_couple_relations_anniversary` (`anniversary_date`,`status`,`deleted`),
  CONSTRAINT `l_couple_relations_ibfk_1` FOREIGN KEY (`ruid_1`) REFERENCES `L_raiser_users` (`ruid`) ON DELETE CASCADE,
  CONSTRAINT `l_couple_relations_ibfk_2` FOREIGN KEY (`ruid_2`) REFERENCES `L_raiser_users` (`ruid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='情侣关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `L_couple_relations`
--

LOCK TABLES `L_couple_relations` WRITE;
/*!40000 ALTER TABLE `L_couple_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `L_couple_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `L_couple_tasks`
--

DROP TABLE IF EXISTS `L_couple_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `L_couple_tasks` (
  `task_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `relation_id` bigint NOT NULL COMMENT '关系ID',
  `task_title` varchar(200) COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务标题',
  `task_description` text COLLATE utf8mb4_general_ci COMMENT '任务描述',
  `task_type` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务类型 pet_care:宠物照料 date_plan:约会计划 anniversary:纪念日 daily:日常任务 goal:共同目标',
  `priority_level` tinyint(1) NOT NULL DEFAULT '2' COMMENT '优先级 1:低 2:中 3:高 4:紧急',
  `assigned_to_ruid` bigint DEFAULT NULL COMMENT '分配给谁',
  `due_date` datetime DEFAULT NULL COMMENT '截止时间',
  `estimated_duration` int DEFAULT NULL COMMENT '预计耗时(分钟)',
  `actual_duration` int DEFAULT NULL COMMENT '实际耗时(分钟)',
  `status` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'pending' COMMENT '状态 pending:待处理 in_progress:进行中 completed:已完成 cancelled:已取消 overdue:已逾期',
  `completion_date` datetime DEFAULT NULL COMMENT '完成时间',
  `completion_notes` text COLLATE utf8mb4_general_ci COMMENT '完成备注',
  `satisfaction_rating` tinyint(1) DEFAULT NULL COMMENT '满意度评分 1-5分',
  `related_pet_id` bigint DEFAULT NULL COMMENT '相关宠物ID',
  `related_expense_id` bigint DEFAULT NULL COMMENT '相关消费记录ID',
  `reminder_enabled` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用提醒',
  `reminder_advance_hours` int DEFAULT '24' COMMENT '提前提醒小时数',
  `recurring_type` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '重复类型 daily:每日 weekly:每周 monthly:每月 yearly:每年',
  `recurring_end_date` date DEFAULT NULL COMMENT '重复结束日期',
  `tags` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '标签(逗号分隔)',
  `assigned_to_nickname` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '分配对象昵称(冗余字段)',
  `related_pet_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '相关宠物名称(冗余字段)',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`task_id`),
  KEY `idx_relation_id` (`relation_id`),
  KEY `idx_assigned_to_ruid` (`assigned_to_ruid`),
  KEY `idx_task_type` (`task_type`),
  KEY `idx_status` (`status`),
  KEY `idx_due_date` (`due_date`),
  KEY `idx_priority_level` (`priority_level`),
  KEY `idx_related_pet_id` (`related_pet_id`),
  KEY `idx_deleted` (`deleted`),
  KEY `related_expense_id` (`related_expense_id`),
  KEY `idx_task_relation_status` (`relation_id`,`status`),
  KEY `idx_task_assigned_due` (`assigned_to_ruid`,`due_date`),
  CONSTRAINT `l_couple_tasks_ibfk_1` FOREIGN KEY (`relation_id`) REFERENCES `L_couple_relations` (`relation_id`) ON DELETE CASCADE,
  CONSTRAINT `l_couple_tasks_ibfk_2` FOREIGN KEY (`assigned_to_ruid`) REFERENCES `L_raiser_users` (`ruid`) ON DELETE SET NULL,
  CONSTRAINT `l_couple_tasks_ibfk_3` FOREIGN KEY (`related_pet_id`) REFERENCES `L_pets` (`pet_id`) ON DELETE SET NULL,
  CONSTRAINT `l_couple_tasks_ibfk_4` FOREIGN KEY (`related_expense_id`) REFERENCES `L_expense_records` (`record_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='情侣任务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `L_couple_tasks`
--

LOCK TABLES `L_couple_tasks` WRITE;
/*!40000 ALTER TABLE `L_couple_tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `L_couple_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `L_data_permissions`
--

DROP TABLE IF EXISTS `L_data_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `L_data_permissions` (
  `permission_id` bigint NOT NULL AUTO_INCREMENT COMMENT '权限ID',
  `grantor_ruid` bigint NOT NULL COMMENT '授权人ID',
  `grantee_ruid` bigint NOT NULL COMMENT '被授权人ID',
  `data_type` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据类型',
  `data_id` bigint DEFAULT NULL COMMENT '数据ID(NULL表示全部)',
  `permission_type` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '权限类型 read:查看 edit:编辑 delete:删除 share:分享',
  `grant_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '授权时间',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `is_temporary` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否临时授权',
  `usage_limit` int DEFAULT NULL COMMENT '使用次数限制',
  `used_count` int NOT NULL DEFAULT '0' COMMENT '已使用次数',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 0:已撤销 1:有效',
  `revoke_time` datetime DEFAULT NULL COMMENT '撤销时间',
  `revoke_reason` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '撤销原因',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`permission_id`),
  KEY `idx_grantor_ruid` (`grantor_ruid`),
  KEY `idx_grantee_ruid` (`grantee_ruid`),
  KEY `idx_data_type_id` (`data_type`,`data_id`),
  KEY `idx_status` (`status`),
  KEY `idx_expire_time` (`expire_time`),
  CONSTRAINT `l_data_permissions_ibfk_1` FOREIGN KEY (`grantor_ruid`) REFERENCES `L_raiser_users` (`ruid`) ON DELETE CASCADE,
  CONSTRAINT `l_data_permissions_ibfk_2` FOREIGN KEY (`grantee_ruid`) REFERENCES `L_raiser_users` (`ruid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='权限授权表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `L_data_permissions`
--

LOCK TABLES `L_data_permissions` WRITE;
/*!40000 ALTER TABLE `L_data_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `L_data_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `L_data_view_logs`
--

DROP TABLE IF EXISTS `L_data_view_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `L_data_view_logs` (
  `log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `viewer_ruid` bigint NOT NULL COMMENT '查看者ID',
  `data_owner_ruid` bigint NOT NULL COMMENT '数据所有者ID',
  `data_type` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据类型 pet:宠物 expense:消费 diary:日记 photo:照片 health:健康',
  `data_id` bigint NOT NULL COMMENT '数据ID',
  `view_action` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '查看动作 view:查看 edit:编辑 download:下载 share:分享',
  `view_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '查看时间',
  `ip_address` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'IP地址',
  `user_agent` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户代理',
  `device_info` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '设备信息',
  `location` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '地理位置',
  `session_id` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '会话ID',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`log_id`),
  KEY `idx_viewer_ruid` (`viewer_ruid`),
  KEY `idx_data_owner_ruid` (`data_owner_ruid`),
  KEY `idx_data_type_id` (`data_type`,`data_id`),
  KEY `idx_view_time` (`view_time`),
  CONSTRAINT `l_data_view_logs_ibfk_1` FOREIGN KEY (`viewer_ruid`) REFERENCES `L_raiser_users` (`ruid`) ON DELETE CASCADE,
  CONSTRAINT `l_data_view_logs_ibfk_2` FOREIGN KEY (`data_owner_ruid`) REFERENCES `L_raiser_users` (`ruid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='数据查看日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `L_data_view_logs`
--

LOCK TABLES `L_data_view_logs` WRITE;
/*!40000 ALTER TABLE `L_data_view_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `L_data_view_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `L_date_records`
--

DROP TABLE IF EXISTS `L_date_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `L_date_records` (
  `date_id` bigint NOT NULL AUTO_INCREMENT COMMENT '约会ID',
  `relation_id` bigint NOT NULL COMMENT '关系ID',
  `date_title` varchar(200) COLLATE utf8mb4_general_ci NOT NULL COMMENT '约会标题',
  `date_time` datetime NOT NULL COMMENT '约会时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `location` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '约会地点',
  `location_address` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '详细地址',
  `latitude` decimal(10,6) DEFAULT NULL COMMENT '纬度',
  `longitude` decimal(10,6) DEFAULT NULL COMMENT '经度',
  `date_type` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '约会类型 dinner:晚餐 movie:电影 travel:旅行 outdoor:户外 home:居家 other:其他',
  `activity_description` text COLLATE utf8mb4_general_ci COMMENT '活动描述',
  `total_cost` decimal(12,2) DEFAULT NULL COMMENT '总费用',
  `cost_split` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '费用分摊',
  `weather` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '天气',
  `mood_rating` tinyint(1) DEFAULT NULL COMMENT '心情评分 1-5分',
  `date_rating` tinyint(1) DEFAULT NULL COMMENT '约会评分 1-5分',
  `memorable_moments` text COLLATE utf8mb4_general_ci COMMENT '难忘时刻',
  `photo_urls` text COLLATE utf8mb4_general_ci COMMENT '照片URLs(JSON格式)',
  `video_urls` text COLLATE utf8mb4_general_ci COMMENT '视频URLs(JSON格式)',
  `next_plan` text COLLATE utf8mb4_general_ci COMMENT '下次计划',
  `is_favorite` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否收藏',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`date_id`),
  KEY `idx_relation_id` (`relation_id`),
  KEY `idx_date_time` (`date_time`),
  KEY `idx_date_type` (`date_type`),
  KEY `idx_is_favorite` (`is_favorite`),
  CONSTRAINT `l_date_records_ibfk_1` FOREIGN KEY (`relation_id`) REFERENCES `L_couple_relations` (`relation_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='约会记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `L_date_records`
--

LOCK TABLES `L_date_records` WRITE;
/*!40000 ALTER TABLE `L_date_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `L_date_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `L_diary_comments`
--

DROP TABLE IF EXISTS `L_diary_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `L_diary_comments` (
  `comment_id` bigint NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `diary_id` bigint NOT NULL COMMENT '日记ID',
  `commenter_ruid` bigint NOT NULL COMMENT '评论者ID',
  `comment_content` text COLLATE utf8mb4_general_ci NOT NULL COMMENT '评论内容',
  `reply_to_comment_id` bigint DEFAULT NULL COMMENT '回复的评论ID',
  `emoji_reaction` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '表情反应',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`comment_id`),
  KEY `idx_diary_id` (`diary_id`),
  KEY `idx_commenter_ruid` (`commenter_ruid`),
  KEY `idx_reply_to_comment_id` (`reply_to_comment_id`),
  KEY `idx_create_time` (`create_time`),
  CONSTRAINT `l_diary_comments_ibfk_1` FOREIGN KEY (`diary_id`) REFERENCES `L_love_diaries` (`love_diary_id`) ON DELETE CASCADE,
  CONSTRAINT `l_diary_comments_ibfk_2` FOREIGN KEY (`commenter_ruid`) REFERENCES `L_raiser_users` (`ruid`) ON DELETE CASCADE,
  CONSTRAINT `l_diary_comments_ibfk_3` FOREIGN KEY (`reply_to_comment_id`) REFERENCES `L_diary_comments` (`comment_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='日记评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `L_diary_comments`
--

LOCK TABLES `L_diary_comments` WRITE;
/*!40000 ALTER TABLE `L_diary_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `L_diary_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `L_excretion_records`
--

DROP TABLE IF EXISTS `L_excretion_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `L_excretion_records` (
  `record_id` bigint NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `pet_id` bigint NOT NULL COMMENT '宠物ID',
  `excretion_time` datetime NOT NULL COMMENT '排泄时间',
  `excretion_type` varchar(20) COLLATE utf8mb4_general_ci NOT NULL COMMENT '排泄类型 urine:小便 feces:大便 both:两者',
  `location` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '排泄地点',
  `consistency` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '性状 liquid:稀 soft:软 normal:正常 hard:硬 dry:干',
  `color` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '颜色',
  `volume` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '量 small:少 normal:正常 large:多',
  `odor` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '气味 normal:正常 strong:强烈 unusual:异常',
  `blood_present` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有血',
  `mucus_present` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有粘液',
  `is_abnormal` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否异常',
  `notes` text COLLATE utf8mb4_general_ci COMMENT '备注',
  `photo_url` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '照片URL',
  `visibility` tinyint(1) NOT NULL DEFAULT '1' COMMENT '可见性 1:仅自己 2:情侣可见',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`record_id`),
  KEY `idx_pet_id` (`pet_id`),
  KEY `idx_excretion_time` (`excretion_time`),
  KEY `idx_excretion_type` (`excretion_type`),
  KEY `idx_is_abnormal` (`is_abnormal`),
  KEY `idx_visibility` (`visibility`),
  CONSTRAINT `l_excretion_records_ibfk_1` FOREIGN KEY (`pet_id`) REFERENCES `L_pets` (`pet_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='排泄记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `L_excretion_records`
--

LOCK TABLES `L_excretion_records` WRITE;
/*!40000 ALTER TABLE `L_excretion_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `L_excretion_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `L_expense_categories`
--

DROP TABLE IF EXISTS `L_expense_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `L_expense_categories` (
  `category_id` bigint NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `category_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL COMMENT '分类名称',
  `parent_id` bigint DEFAULT NULL COMMENT '父分类ID',
  `category_type` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '分类类型 pet:宠物相关 relationship:恋爱相关 other:其他',
  `is_pet_related` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否宠物相关',
  `icon` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '图标',
  `color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '颜色',
  `sort_order` int NOT NULL DEFAULT '0' COMMENT '排序',
  `is_active` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`category_id`),
  KEY `idx_parent_id` (`parent_id`),
  KEY `idx_category_type` (`category_type`),
  KEY `idx_is_pet_related` (`is_pet_related`),
  KEY `idx_sort_order` (`sort_order`),
  KEY `idx_is_active` (`is_active`),
  CONSTRAINT `l_expense_categories_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `L_expense_categories` (`category_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='消费分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `L_expense_categories`
--

LOCK TABLES `L_expense_categories` WRITE;
/*!40000 ALTER TABLE `L_expense_categories` DISABLE KEYS */;
INSERT INTO `L_expense_categories` VALUES (1,'宠物相关',NULL,'pet',1,NULL,NULL,1,1,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(2,'恋爱相关',NULL,'relationship',0,NULL,NULL,2,1,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(3,'其他消费',NULL,'other',0,NULL,NULL,3,1,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(4,'宠物食品',1,'pet',1,NULL,NULL,11,1,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(5,'宠物医疗',1,'pet',1,NULL,NULL,12,1,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(6,'宠物用品',1,'pet',1,NULL,NULL,13,1,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(7,'宠物美容',1,'pet',1,NULL,NULL,14,1,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(8,'约会消费',2,'relationship',0,NULL,NULL,21,1,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(9,'礼物花费',2,'relationship',0,NULL,NULL,22,1,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(10,'纪念日庆祝',2,'relationship',0,NULL,NULL,23,1,'2025-09-17 21:30:51','2025-09-17 21:30:51');
/*!40000 ALTER TABLE `L_expense_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `L_expense_records`
--

DROP TABLE IF EXISTS `L_expense_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `L_expense_records` (
  `record_id` bigint NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `ruid` bigint NOT NULL COMMENT '饲养者用户ID',
  `pet_id` bigint DEFAULT NULL COMMENT '关联宠物ID',
  `category_id` bigint DEFAULT NULL COMMENT '分类ID',
  `expense_title` varchar(200) COLLATE utf8mb4_general_ci NOT NULL COMMENT '消费标题',
  `amount` decimal(12,2) NOT NULL COMMENT '金额',
  `currency` varchar(10) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'CNY' COMMENT '货币类型',
  `expense_date` datetime NOT NULL COMMENT '消费时间',
  `payment_method` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '支付方式 cash:现金 card:银行卡 wechat:微信 alipay:支付宝 credit_card:信用卡 other:其他',
  `merchant_name` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商家名称',
  `merchant_address` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商家地址',
  `merchant_phone` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商家电话',
  `expense_type` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'personal' COMMENT '消费类型 personal:个人 shared:共同 gift:礼物 emergency:紧急',
  `sharing_ratio` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '分摊比例 50:50, 60:40等',
  `shared_with_ruid` bigint DEFAULT NULL COMMENT '共享饲养者ID',
  `actual_payer_ruid` bigint DEFAULT NULL COMMENT '实际付款人ID',
  `reimbursement_status` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'none' COMMENT '报销状态 none:无需报销 pending:待报销 approved:已报销 rejected:已拒绝',
  `reimbursement_amount` decimal(12,2) DEFAULT NULL COMMENT '报销金额',
  `invoice_number` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '发票号码',
  `invoice_url` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '发票照片URL',
  `receipt_url` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '收据照片URL',
  `warranty_info` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '保修信息',
  `return_policy` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '退换货政策',
  `description` text COLLATE utf8mb4_general_ci COMMENT '消费描述',
  `tags` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '标签(逗号分隔)',
  `location_info` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '消费地点信息(JSON格式)',
  `weather_info` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '天气信息',
  `mood_rating` tinyint(1) DEFAULT NULL COMMENT '消费时心情评分 1-5分',
  `necessity_level` tinyint(1) DEFAULT NULL COMMENT '必要性等级 1:非必需 2:一般 3:重要 4:紧急 5:必需',
  `satisfaction_rating` tinyint(1) DEFAULT NULL COMMENT '满意度评分 1-5分',
  `privacy_level` tinyint(1) NOT NULL DEFAULT '1' COMMENT '隐私级别 1:公开 2:情侣可见 3:仅自己',
  `is_hidden` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `is_recurring` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否定期消费',
  `recurring_period` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '定期周期 monthly:月度 quarterly:季度 yearly:年度',
  `verification_required` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否需要核对',
  `verified_by_ruid` bigint DEFAULT NULL COMMENT '核对人ID',
  `verified_time` datetime DEFAULT NULL COMMENT '核对时间',
  `verification_notes` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '核对备注',
  `ruid_nickname` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户昵称(冗余字段)',
  `pet_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '宠物名称(冗余字段)',
  `category_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '分类名称(冗余字段)',
  `shared_with_nickname` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '共享用户昵称(冗余字段)',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`record_id`),
  KEY `idx_ruid` (`ruid`),
  KEY `idx_pet_id` (`pet_id`),
  KEY `idx_category_id` (`category_id`),
  KEY `idx_expense_date` (`expense_date`),
  KEY `idx_expense_type` (`expense_type`),
  KEY `idx_privacy_level` (`privacy_level`),
  KEY `idx_shared_with_ruid` (`shared_with_ruid`),
  KEY `idx_actual_payer_ruid` (`actual_payer_ruid`),
  KEY `idx_reimbursement_status` (`reimbursement_status`),
  KEY `idx_is_recurring` (`is_recurring`),
  KEY `idx_deleted` (`deleted`),
  KEY `verified_by_ruid` (`verified_by_ruid`),
  KEY `idx_expense_user_date` (`ruid`,`expense_date`,`deleted`),
  KEY `idx_expense_shared_date` (`shared_with_ruid`,`expense_date`,`deleted`),
  KEY `idx_expense_type_date` (`expense_type`,`expense_date`,`deleted`),
  KEY `idx_expense_deleted_user` (`deleted`,`ruid`),
  KEY `idx_expense_user_type_date` (`ruid`,`expense_type`,`expense_date`,`deleted`),
  CONSTRAINT `l_expense_records_ibfk_1` FOREIGN KEY (`ruid`) REFERENCES `L_raiser_users` (`ruid`) ON DELETE CASCADE,
  CONSTRAINT `l_expense_records_ibfk_2` FOREIGN KEY (`pet_id`) REFERENCES `L_pets` (`pet_id`) ON DELETE SET NULL,
  CONSTRAINT `l_expense_records_ibfk_3` FOREIGN KEY (`category_id`) REFERENCES `L_expense_categories` (`category_id`) ON DELETE SET NULL,
  CONSTRAINT `l_expense_records_ibfk_4` FOREIGN KEY (`shared_with_ruid`) REFERENCES `L_raiser_users` (`ruid`) ON DELETE SET NULL,
  CONSTRAINT `l_expense_records_ibfk_5` FOREIGN KEY (`actual_payer_ruid`) REFERENCES `L_raiser_users` (`ruid`) ON DELETE SET NULL,
  CONSTRAINT `l_expense_records_ibfk_6` FOREIGN KEY (`verified_by_ruid`) REFERENCES `L_raiser_users` (`ruid`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='消费记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `L_expense_records`
--

LOCK TABLES `L_expense_records` WRITE;
/*!40000 ALTER TABLE `L_expense_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `L_expense_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `L_feeding_records`
--

DROP TABLE IF EXISTS `L_feeding_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `L_feeding_records` (
  `record_id` bigint NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `pet_id` bigint NOT NULL COMMENT '宠物ID',
  `product_id` bigint DEFAULT NULL COMMENT '产品ID',
  `food_name` varchar(200) COLLATE utf8mb4_general_ci NOT NULL COMMENT '食物名称',
  `brand_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '品牌名称',
  `feeding_time` datetime NOT NULL COMMENT '喂食时间',
  `amount` decimal(8,2) NOT NULL COMMENT '喂食量',
  `amount_unit` varchar(20) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'g' COMMENT '计量单位 g:克 ml:毫升 cup:杯 piece:粒',
  `feeding_type` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '喂食类型 main_meal:正餐 snack:零食 supplement:营养品',
  `food_type` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '食物类型 dry_food:干粮 wet_food:湿粮 treats:零食',
  `expiry_date` date DEFAULT NULL COMMENT '保质期',
  `batch_number` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '批次号',
  `pet_appetite` tinyint(1) DEFAULT NULL COMMENT '宠物食欲 1:很差 2:一般 3:良好 4:很好 5:极佳',
  `finished_amount` decimal(8,2) DEFAULT NULL COMMENT '实际吃完量',
  `leftover_amount` decimal(8,2) DEFAULT NULL COMMENT '剩余量',
  `notes` text COLLATE utf8mb4_general_ci COMMENT '备注',
  `visibility` tinyint(1) NOT NULL DEFAULT '1' COMMENT '可见性 1:仅自己 2:情侣可见',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`record_id`),
  KEY `idx_pet_id` (`pet_id`),
  KEY `idx_product_id` (`product_id`),
  KEY `idx_feeding_time` (`feeding_time`),
  KEY `idx_feeding_type` (`feeding_type`),
  KEY `idx_visibility` (`visibility`),
  KEY `idx_feeding_pet_date` (`pet_id`,`feeding_time`),
  CONSTRAINT `l_feeding_records_ibfk_1` FOREIGN KEY (`pet_id`) REFERENCES `L_pets` (`pet_id`) ON DELETE CASCADE,
  CONSTRAINT `l_feeding_records_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `L_food_products` (`product_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='喂食记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `L_feeding_records`
--

LOCK TABLES `L_feeding_records` WRITE;
/*!40000 ALTER TABLE `L_feeding_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `L_feeding_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `L_food_brands`
--

DROP TABLE IF EXISTS `L_food_brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `L_food_brands` (
  `brand_id` bigint NOT NULL AUTO_INCREMENT COMMENT '品牌ID',
  `brand_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL COMMENT '品牌名称',
  `brand_country` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '品牌国家',
  `brand_description` text COLLATE utf8mb4_general_ci COMMENT '品牌描述',
  `official_website` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '官方网站',
  `is_active` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`brand_id`),
  UNIQUE KEY `uk_brand_name` (`brand_name`),
  KEY `idx_is_active` (`is_active`),
  KEY `idx_deleted` (`deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='食物品牌表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `L_food_brands`
--

LOCK TABLES `L_food_brands` WRITE;
/*!40000 ALTER TABLE `L_food_brands` DISABLE KEYS */;
INSERT INTO `L_food_brands` VALUES (1,'皇家','法国','Royal Canin，专业宠物营养品牌',NULL,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(2,'希尔思','美国','Hills，科学营养宠物食品',NULL,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(3,'渴望','加拿大','Orijen，天然无谷物宠物食品',NULL,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(4,'爱肯拿','加拿大','Acana，天然营养宠物食品',NULL,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(5,'冠能','美国','Pro Plan，普瑞纳旗下高端品牌',NULL,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51');
/*!40000 ALTER TABLE `L_food_brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `L_food_products`
--

DROP TABLE IF EXISTS `L_food_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `L_food_products` (
  `product_id` bigint NOT NULL AUTO_INCREMENT COMMENT '产品ID',
  `product_name` varchar(200) COLLATE utf8mb4_general_ci NOT NULL COMMENT '产品名称',
  `brand_id` bigint DEFAULT NULL COMMENT '品牌ID',
  `product_type` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '产品类型 dry_food:干粮 wet_food:湿粮 treats:零食 supplement:营养品',
  `species` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '适用物种',
  `life_stage` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '适用生命阶段 kitten:幼年 adult:成年 senior:老年 all:全龄',
  `flavor` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '口味',
  `package_size` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '包装规格',
  `nutritional_info` text COLLATE utf8mb4_general_ci COMMENT '营养成分(JSON格式)',
  `ingredients` text COLLATE utf8mb4_general_ci COMMENT '成分列表',
  `feeding_guide` text COLLATE utf8mb4_general_ci COMMENT '喂食指南',
  `barcode` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '条形码',
  `avg_price` decimal(10,2) DEFAULT NULL COMMENT '平均价格',
  `shelf_life_days` int DEFAULT NULL COMMENT '保质期天数',
  `storage_requirements` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '储存要求',
  `allergen_info` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '过敏原信息',
  `is_active` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  `ruid_nickname` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户昵称(冗余字段)',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`product_id`),
  KEY `idx_brand_id` (`brand_id`),
  KEY `idx_product_type` (`product_type`),
  KEY `idx_species` (`species`),
  KEY `idx_shelf_life_days` (`shelf_life_days`),
  KEY `idx_is_active` (`is_active`),
  KEY `idx_deleted` (`deleted`),
  CONSTRAINT `l_food_products_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `L_food_brands` (`brand_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='食物产品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `L_food_products`
--

LOCK TABLES `L_food_products` WRITE;
/*!40000 ALTER TABLE `L_food_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `L_food_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `L_health_records`
--

DROP TABLE IF EXISTS `L_health_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `L_health_records` (
  `record_id` bigint NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `pet_id` bigint NOT NULL COMMENT '宠物ID',
  `record_type` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '记录类型 temperature:体温 heart_rate:心率 blood_pressure:血压 other:其他',
  `value` varchar(100) COLLATE utf8mb4_general_ci NOT NULL COMMENT '数值',
  `unit` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '单位',
  `normal_range_min` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '正常范围最小值',
  `normal_range_max` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '正常范围最大值',
  `is_abnormal` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否异常',
  `measurement_date` datetime NOT NULL COMMENT '测量时间',
  `measurement_method` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '测量方法',
  `notes` text COLLATE utf8mb4_general_ci COMMENT '备注',
  `alert_sent` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已发送预警',
  `visibility` tinyint(1) NOT NULL DEFAULT '1' COMMENT '可见性 1:仅自己 2:情侣可见',
  `pet_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '宠物名称(冗余字段)',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`record_id`),
  KEY `idx_pet_id` (`pet_id`),
  KEY `idx_record_type` (`record_type`),
  KEY `idx_measurement_date` (`measurement_date`),
  KEY `idx_is_abnormal` (`is_abnormal`),
  KEY `idx_visibility` (`visibility`),
  KEY `idx_deleted` (`deleted`),
  KEY `idx_health_pet_date` (`pet_id`,`measurement_date`,`deleted`),
  KEY `idx_health_deleted_pet` (`deleted`,`pet_id`),
  KEY `idx_health_pet_type_date` (`pet_id`,`record_type`,`measurement_date`,`deleted`),
  CONSTRAINT `l_health_records_ibfk_1` FOREIGN KEY (`pet_id`) REFERENCES `L_pets` (`pet_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='健康体征记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `L_health_records`
--

LOCK TABLES `L_health_records` WRITE;
/*!40000 ALTER TABLE `L_health_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `L_health_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `L_love_diaries`
--

DROP TABLE IF EXISTS `L_love_diaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `L_love_diaries` (
  `love_diary_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日记ID',
  `relation_id` bigint DEFAULT NULL COMMENT '关系ID',
  `author_ruid` bigint NOT NULL COMMENT '作者ID',
  `diary_title` varchar(200) COLLATE utf8mb4_general_ci NOT NULL COMMENT '日记标题',
  `diary_content` longtext COLLATE utf8mb4_general_ci NOT NULL COMMENT '日记内容',
  `diary_date` date NOT NULL COMMENT '日记日期',
  `mood` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '心情 happy:开心 sad:难过 excited:兴奋 angry:生气 peaceful:平静 other:其他',
  `mood_score` tinyint(1) DEFAULT NULL COMMENT '心情评分 1-10分',
  `weather` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '天气',
  `location` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '地点',
  `photo_urls` text COLLATE utf8mb4_general_ci COMMENT '照片URLs(JSON格式)',
  `tags` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '标签(逗号分隔)',
  `is_private` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否私密',
  `shared_with_partner` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否与伴侣分享',
  `partner_can_comment` tinyint(1) NOT NULL DEFAULT '1' COMMENT '伴侣是否可以评论',
  `temporary_share_code` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '临时分享码',
  `temporary_share_expires` datetime DEFAULT NULL COMMENT '临时分享过期时间',
  `view_count` int NOT NULL DEFAULT '0' COMMENT '查看次数',
  `is_favorite` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否收藏',
  `author_nickname` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '作者昵称(冗余字段)',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`love_diary_id`),
  KEY `idx_relation_id` (`relation_id`),
  KEY `idx_author_ruid` (`author_ruid`),
  KEY `idx_diary_date` (`diary_date`),
  KEY `idx_is_private` (`is_private`),
  KEY `idx_shared_with_partner` (`shared_with_partner`),
  KEY `idx_temporary_share_code` (`temporary_share_code`),
  KEY `idx_deleted` (`deleted`),
  KEY `idx_is_favorite` (`is_favorite`),
  KEY `idx_diary_author_date` (`author_ruid`,`diary_date`,`deleted`),
  KEY `idx_diary_deleted_author` (`deleted`,`author_ruid`),
  CONSTRAINT `l_love_diaries_ibfk_1` FOREIGN KEY (`relation_id`) REFERENCES `L_couple_relations` (`relation_id`) ON DELETE SET NULL,
  CONSTRAINT `l_love_diaries_ibfk_2` FOREIGN KEY (`author_ruid`) REFERENCES `L_raiser_users` (`ruid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='恋爱日记表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `L_love_diaries`
--

LOCK TABLES `L_love_diaries` WRITE;
/*!40000 ALTER TABLE `L_love_diaries` DISABLE KEYS */;
/*!40000 ALTER TABLE `L_love_diaries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `L_pet_adoption_history`
--

DROP TABLE IF EXISTS `L_pet_adoption_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `L_pet_adoption_history` (
  `history_id` bigint NOT NULL AUTO_INCREMENT COMMENT '历史记录ID',
  `pet_id` bigint NOT NULL COMMENT '宠物ID',
  `owner_ruid` bigint NOT NULL COMMENT '领养人ID',
  `owner_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL COMMENT '领养人姓名',
  `owner_phone` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '领养人电话',
  `owner_address` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '领养人地址',
  `adoption_date` date NOT NULL COMMENT '领养开始日期',
  `transfer_date` date DEFAULT NULL COMMENT '转让日期',
  `transfer_reason` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '转让原因',
  `transfer_to_ruid` bigint DEFAULT NULL COMMENT '转让给谁的ID',
  `transfer_to_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '转让给谁的姓名',
  `is_current_owner` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否当前主人',
  `ownership_duration_days` int DEFAULT NULL COMMENT '拥有天数',
  `care_quality_rating` tinyint(1) DEFAULT NULL COMMENT '照料质量评分 1-5分',
  `relationship_notes` text COLLATE utf8mb4_general_ci COMMENT '关系备注',
  `contact_allowed` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否允许联系',
  `emergency_contact` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否紧急联系人',
  `pet_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '宠物名称(冗余字段)',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`history_id`),
  KEY `idx_pet_id` (`pet_id`),
  KEY `idx_owner_ruid` (`owner_ruid`),
  KEY `idx_adoption_date` (`adoption_date`),
  KEY `idx_transfer_date` (`transfer_date`),
  KEY `idx_is_current_owner` (`is_current_owner`),
  KEY `idx_deleted` (`deleted`),
  KEY `transfer_to_ruid` (`transfer_to_ruid`),
  CONSTRAINT `l_pet_adoption_history_ibfk_1` FOREIGN KEY (`pet_id`) REFERENCES `L_pets` (`pet_id`) ON DELETE CASCADE,
  CONSTRAINT `l_pet_adoption_history_ibfk_2` FOREIGN KEY (`owner_ruid`) REFERENCES `L_raiser_users` (`ruid`) ON DELETE CASCADE,
  CONSTRAINT `l_pet_adoption_history_ibfk_3` FOREIGN KEY (`transfer_to_ruid`) REFERENCES `L_raiser_users` (`ruid`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='宠物历代领养人信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `L_pet_adoption_history`
--

LOCK TABLES `L_pet_adoption_history` WRITE;
/*!40000 ALTER TABLE `L_pet_adoption_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `L_pet_adoption_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `L_pet_age_conversion`
--

DROP TABLE IF EXISTS `L_pet_age_conversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `L_pet_age_conversion` (
  `conversion_id` bigint NOT NULL AUTO_INCREMENT COMMENT '换算规则ID',
  `species` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '物种类型',
  `pet_age_months` int NOT NULL COMMENT '宠物年龄(月)',
  `human_equivalent_age` decimal(5,2) NOT NULL COMMENT '相当于人类年龄',
  `growth_stage` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '成长阶段 newborn:新生儿 infant:幼儿 juvenile:少年 adult:成年 senior:老年',
  `conversion_formula` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '换算公式',
  `notes` text COLLATE utf8mb4_general_ci COMMENT '备注说明',
  `is_active` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`conversion_id`),
  UNIQUE KEY `uk_species_age` (`species`,`pet_age_months`),
  KEY `idx_species` (`species`),
  KEY `idx_growth_stage` (`growth_stage`),
  KEY `idx_is_active` (`is_active`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='宠物年龄换算规则表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `L_pet_age_conversion`
--

LOCK TABLES `L_pet_age_conversion` WRITE;
/*!40000 ALTER TABLE `L_pet_age_conversion` DISABLE KEYS */;
INSERT INTO `L_pet_age_conversion` VALUES (1,'cat',1,1.00,'infant','1个月 = 1岁','猫咪1个月相当于人类1岁',1,'2025-09-17 21:30:52','2025-09-17 21:30:52'),(2,'cat',2,2.50,'infant','2个月 = 2.5岁','猫咪2个月相当于人类2.5岁',1,'2025-09-17 21:30:52','2025-09-17 21:30:52'),(3,'cat',3,5.00,'infant','3个月 = 5岁','猫咪3个月相当于人类5岁',1,'2025-09-17 21:30:52','2025-09-17 21:30:52'),(4,'cat',4,7.00,'juvenile','4个月 = 7岁','猫咪4个月相当于人类7岁',1,'2025-09-17 21:30:52','2025-09-17 21:30:52'),(5,'cat',5,8.50,'juvenile','5个月 = 8.5岁','猫咪5个月相当于人类8.5岁',1,'2025-09-17 21:30:52','2025-09-17 21:30:52'),(6,'cat',6,10.00,'juvenile','6个月 = 10岁','猫咪6个月相当于人类10岁',1,'2025-09-17 21:30:52','2025-09-17 21:30:52'),(7,'cat',7,11.50,'juvenile','7个月 = 11.5岁','猫咪7个月相当于人类11.5岁',1,'2025-09-17 21:30:52','2025-09-17 21:30:52'),(8,'cat',8,13.00,'juvenile','8个月 = 13岁','猫咪8个月相当于人类13岁',1,'2025-09-17 21:30:52','2025-09-17 21:30:52'),(9,'cat',9,13.50,'juvenile','9个月 = 13.5岁','猫咪9个月相当于人类13.5岁',1,'2025-09-17 21:30:52','2025-09-17 21:30:52'),(10,'cat',10,14.00,'juvenile','10个月 = 14岁','猫咪10个月相当于人类14岁',1,'2025-09-17 21:30:52','2025-09-17 21:30:52'),(11,'cat',11,14.50,'juvenile','11个月 = 14.5岁','猫咪11个月相当于人类14.5岁',1,'2025-09-17 21:30:52','2025-09-17 21:30:52'),(12,'cat',12,15.00,'juvenile','12个月 = 15岁','猫咪1岁相当于人类15岁',1,'2025-09-17 21:30:52','2025-09-17 21:30:52'),(13,'cat',18,20.00,'adult','18个月 = 20岁','猫咪1.5岁相当于人类20岁',1,'2025-09-17 21:30:52','2025-09-17 21:30:52'),(14,'cat',24,24.00,'adult','24个月 = 24岁','猫咪2岁相当于人类24岁',1,'2025-09-17 21:30:52','2025-09-17 21:30:52'),(15,'cat',36,28.00,'adult','每年+4岁','猫咪3岁相当于人类28岁',1,'2025-09-17 21:30:52','2025-09-17 21:30:52'),(16,'cat',48,32.00,'adult','每年+4岁','猫咪4岁相当于人类32岁',1,'2025-09-17 21:30:52','2025-09-17 21:30:52'),(17,'cat',60,36.00,'adult','每年+4岁','猫咪5岁相当于人类36岁',1,'2025-09-17 21:30:52','2025-09-17 21:30:52'),(18,'cat',72,40.00,'adult','每年+4岁','猫咪6岁相当于人类40岁',1,'2025-09-17 21:30:52','2025-09-17 21:30:52'),(19,'cat',84,44.00,'adult','每年+4岁','猫咪7岁相当于人类44岁',1,'2025-09-17 21:30:52','2025-09-17 21:30:52'),(20,'cat',96,48.00,'senior','每年+4岁','猫咪8岁相当于人类48岁',1,'2025-09-17 21:30:52','2025-09-17 21:30:52'),(21,'cat',108,52.00,'senior','每年+4岁','猫咪9岁相当于人类52岁',1,'2025-09-17 21:30:52','2025-09-17 21:30:52'),(22,'cat',120,56.00,'senior','每年+4岁','猫咪10岁相当于人类56岁',1,'2025-09-17 21:30:52','2025-09-17 21:30:52'),(23,'cat',132,60.00,'senior','每年+4岁','猫咪11岁相当于人类60岁',1,'2025-09-17 21:30:52','2025-09-17 21:30:52'),(24,'cat',144,64.00,'senior','每年+4岁','猫咪12岁相当于人类64岁',1,'2025-09-17 21:30:52','2025-09-17 21:30:52'),(25,'cat',156,68.00,'senior','每年+4岁','猫咪13岁相当于人类68岁',1,'2025-09-17 21:30:52','2025-09-17 21:30:52'),(26,'cat',168,72.00,'senior','每年+4岁','猫咪14岁相当于人类72岁',1,'2025-09-17 21:30:52','2025-09-17 21:30:52'),(27,'cat',180,76.00,'senior','每年+4岁','猫咪15岁相当于人类76岁',1,'2025-09-17 21:30:52','2025-09-17 21:30:52'),(28,'cat',192,80.00,'senior','每年+4岁','猫咪16岁相当于人类80岁',1,'2025-09-17 21:30:52','2025-09-17 21:30:52'),(29,'cat',204,84.00,'senior','每年+4岁','猫咪17岁相当于人类84岁',1,'2025-09-17 21:30:52','2025-09-17 21:30:52'),(30,'cat',216,88.00,'senior','每年+4岁','猫咪18岁相当于人类88岁',1,'2025-09-17 21:30:52','2025-09-17 21:30:52'),(31,'cat',228,92.00,'senior','每年+4岁','猫咪19岁相当于人类92岁',1,'2025-09-17 21:30:52','2025-09-17 21:30:52'),(32,'cat',240,96.00,'senior','每年+4岁','猫咪20岁相当于人类96岁',1,'2025-09-17 21:30:52','2025-09-17 21:30:52'),(33,'dog',1,1.00,'infant','1个月 = 1岁','狗狗1个月相当于人类1岁',1,'2025-09-17 21:30:52','2025-09-17 21:30:52'),(34,'dog',2,2.00,'infant','2个月 = 2岁','狗狗2个月相当于人类2岁',1,'2025-09-17 21:30:52','2025-09-17 21:30:52'),(35,'dog',3,4.00,'infant','3个月 = 4岁','狗狗3个月相当于人类4岁',1,'2025-09-17 21:30:52','2025-09-17 21:30:52'),(36,'dog',6,10.00,'juvenile','6个月 = 10岁','狗狗6个月相当于人类10岁',1,'2025-09-17 21:30:52','2025-09-17 21:30:52'),(37,'dog',12,15.00,'juvenile','12个月 = 15岁','狗狗1岁相当于人类15岁',1,'2025-09-17 21:30:52','2025-09-17 21:30:52'),(38,'dog',24,24.00,'adult','24个月 = 24岁','狗狗2岁相当于人类24岁',1,'2025-09-17 21:30:52','2025-09-17 21:30:52'),(39,'dog',36,28.00,'adult','每年+4岁','狗狗3岁相当于人类28岁',1,'2025-09-17 21:30:52','2025-09-17 21:30:52'),(40,'dog',48,32.00,'adult','每年+4岁','狗狗4岁相当于人类32岁',1,'2025-09-17 21:30:52','2025-09-17 21:30:52'),(41,'dog',60,36.00,'adult','每年+4岁','狗狗5岁相当于人类36岁',1,'2025-09-17 21:30:52','2025-09-17 21:30:52'),(42,'dog',72,42.00,'adult','每年+6岁','狗狗6岁相当于人类42岁',1,'2025-09-17 21:30:52','2025-09-17 21:30:52'),(43,'dog',84,47.00,'senior','每年+5岁','狗狗7岁相当于人类47岁',1,'2025-09-17 21:30:52','2025-09-17 21:30:52'),(44,'dog',96,51.00,'senior','每年+4岁','狗狗8岁相当于人类51岁',1,'2025-09-17 21:30:52','2025-09-17 21:30:52'),(45,'dog',108,56.00,'senior','每年+5岁','狗狗9岁相当于人类56岁',1,'2025-09-17 21:30:52','2025-09-17 21:30:52'),(46,'dog',120,60.00,'senior','每年+4岁','狗狗10岁相当于人类60岁',1,'2025-09-17 21:30:52','2025-09-17 21:30:52');
/*!40000 ALTER TABLE `L_pet_age_conversion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `L_pet_anniversaries`
--

DROP TABLE IF EXISTS `L_pet_anniversaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `L_pet_anniversaries` (
  `anniversary_id` bigint NOT NULL AUTO_INCREMENT COMMENT '纪念日ID',
  `pet_id` bigint NOT NULL COMMENT '宠物ID',
  `anniversary_type` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '纪念日类型 birthday:生日 adoption:领养日 first_meet:初次见面 vaccination:疫苗接种 surgery:手术 recovery:康复 achievement:成就 other:其他',
  `anniversary_name` varchar(200) COLLATE utf8mb4_general_ci NOT NULL COMMENT '纪念日名称',
  `anniversary_date` date NOT NULL COMMENT '纪念日日期',
  `is_recurring` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否每年重复',
  `description` text COLLATE utf8mb4_general_ci COMMENT '纪念日描述',
  `importance_level` tinyint(1) NOT NULL DEFAULT '3' COMMENT '重要程度 1:一般 2:重要 3:非常重要 4:特别重要 5:最重要',
  `celebration_plan` text COLLATE utf8mb4_general_ci COMMENT '庆祝计划',
  `photos` text COLLATE utf8mb4_general_ci COMMENT '纪念照片URLs(JSON格式)',
  `memories` text COLLATE utf8mb4_general_ci COMMENT '回忆记录',
  `gifts_given` text COLLATE utf8mb4_general_ci COMMENT '赠送礼物记录',
  `location` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '庆祝地点',
  `participants` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '参与者',
  `reminder_days_before` int DEFAULT '7' COMMENT '提前提醒天数',
  `is_reminder_enabled` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用提醒',
  `last_celebrated_year` int DEFAULT NULL COMMENT '最后庆祝年份',
  `celebration_count` int NOT NULL DEFAULT '0' COMMENT '庆祝次数',
  `visibility` tinyint(1) NOT NULL DEFAULT '1' COMMENT '可见性 1:仅自己 2:情侣可见 3:公开',
  `pet_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '宠物名称(冗余字段)',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`anniversary_id`),
  KEY `idx_pet_id` (`pet_id`),
  KEY `idx_anniversary_type` (`anniversary_type`),
  KEY `idx_anniversary_date` (`anniversary_date`),
  KEY `idx_is_recurring` (`is_recurring`),
  KEY `idx_importance_level` (`importance_level`),
  KEY `idx_is_reminder_enabled` (`is_reminder_enabled`),
  KEY `idx_visibility` (`visibility`),
  KEY `idx_deleted` (`deleted`),
  KEY `idx_pet_anniversary_date_type` (`pet_id`,`anniversary_date`,`anniversary_type`,`deleted`),
  CONSTRAINT `l_pet_anniversaries_ibfk_1` FOREIGN KEY (`pet_id`) REFERENCES `L_pets` (`pet_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='宠物纪念日表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `L_pet_anniversaries`
--

LOCK TABLES `L_pet_anniversaries` WRITE;
/*!40000 ALTER TABLE `L_pet_anniversaries` DISABLE KEYS */;
/*!40000 ALTER TABLE `L_pet_anniversaries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `L_pet_breeds`
--

DROP TABLE IF EXISTS `L_pet_breeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `L_pet_breeds` (
  `breed_id` bigint NOT NULL AUTO_INCREMENT COMMENT '品种ID',
  `breed_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL COMMENT '品种名称',
  `species` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '物种 cat:猫 dog:狗 rabbit:兔子 bird:鸟类 fish:鱼类 other:其他',
  `breed_code` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '品种编码',
  `description` text COLLATE utf8mb4_general_ci COMMENT '品种描述',
  `avg_weight_min` decimal(5,2) DEFAULT NULL COMMENT '平均体重范围最小值(kg)',
  `avg_weight_max` decimal(5,2) DEFAULT NULL COMMENT '平均体重范围最大值(kg)',
  `avg_lifespan` int DEFAULT NULL COMMENT '平均寿命(年)',
  `care_level` tinyint(1) DEFAULT NULL COMMENT '照料难度 1:简单 2:一般 3:困难',
  `is_active` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`breed_id`),
  UNIQUE KEY `uk_breed_name_species` (`breed_name`,`species`),
  KEY `idx_species` (`species`),
  KEY `idx_is_active` (`is_active`),
  KEY `idx_deleted` (`deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='宠物品种表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `L_pet_breeds`
--

LOCK TABLES `L_pet_breeds` WRITE;
/*!40000 ALTER TABLE `L_pet_breeds` DISABLE KEYS */;
INSERT INTO `L_pet_breeds` VALUES (1,'英国短毛猫','cat','BSH','英国短毛猫，毛发浓密，性格温和',3.50,7.00,15,2,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(2,'美国短毛猫','cat','ASH','美国短毛猫，活泼好动，适应性强',3.00,6.00,16,1,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(3,'波斯猫','cat','PERSIAN','波斯猫，毛发长而密，需要定期梳理',3.00,5.50,14,3,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(4,'布偶猫','cat','RAGDOLL','布偶猫，温顺粘人，体型较大',4.00,9.00,13,2,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(5,'俄罗斯蓝猫','cat','RUSSIAN_BLUE','俄罗斯蓝猫，毛色银蓝，性格安静',3.00,5.50,16,2,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(6,'暹罗猫','cat','SIAMESE','暹罗猫，聪明活泼，喜欢与人互动',2.50,4.50,15,2,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(7,'孟买猫','cat','BOMBAY','孟买猫，全身黑色，性格温顺',3.00,5.00,15,1,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(8,'阿比西尼亚猫','cat','ABYSSINIAN','阿比西尼亚猫，活泼好动，毛色独特',3.50,5.50,14,2,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(9,'挪威森林猫','cat','NORWEGIAN','挪威森林猫，大型长毛猫，适应寒冷',4.00,8.00,14,3,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(10,'缅因猫','cat','MAINE_COON','缅因猫，体型巨大，性格温和',4.50,11.00,13,3,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(11,'土耳其安哥拉猫','cat','TURKISH_ANGORA','土耳其安哥拉猫，毛发丝滑，优雅高贵',2.50,5.00,15,3,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(12,'苏格兰折耳猫','cat','SCOTTISH_FOLD','苏格兰折耳猫，耳朵下折，性格温顺',2.50,6.00,13,2,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(13,'加拿大无毛猫','cat','SPHYNX','加拿大无毛猫，无毛品种，需要特殊护理',3.50,7.00,14,3,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(14,'德文卷毛猫','cat','DEVON_REX','德文卷毛猫，毛发卷曲，活泼好动',2.50,4.50,14,2,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(15,'孟加拉猫','cat','BENGAL','孟加拉猫，野性外观，活泼聪明',3.50,7.00,13,2,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(16,'金毛寻回犬','dog','GOLDEN','金毛寻回犬，友善聪明，适合家庭饲养',25.00,35.00,12,2,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(17,'拉布拉多犬','dog','LABRADOR','拉布拉多犬，温和忠诚，精力充沛',25.00,35.00,12,2,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(18,'德国牧羊犬','dog','GERMAN_SHEPHERD','德国牧羊犬，聪明勇敢，工作能力强',22.00,40.00,11,3,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(19,'哈士奇','dog','HUSKY','西伯利亚哈士奇，精力旺盛，需要大量运动',16.00,27.00,12,3,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(20,'阿拉斯加雪橇犬','dog','ALASKAN','阿拉斯加雪橇犬，体型巨大，力量强劲',34.00,39.00,11,3,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(21,'萨摩耶犬','dog','SAMOYED','萨摩耶犬，毛发雪白，性格温和友善',16.00,30.00,13,3,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(22,'边境牧羊犬','dog','BORDER_COLLIE','边境牧羊犬，智商极高，需要智力刺激',14.00,20.00,13,3,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(23,'罗威纳犬','dog','ROTTWEILER','罗威纳犬，强壮有力，忠诚护主',35.00,60.00,10,3,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(24,'杜宾犬','dog','DOBERMAN','杜宾犬，优雅强壮，警觉性高',27.00,45.00,11,3,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(25,'大丹犬','dog','GREAT_DANE','大丹犬，体型巨大，性格温和',45.00,90.00,8,2,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(26,'圣伯纳犬','dog','SAINT_BERNARD','圣伯纳犬，温和巨型犬，救援犬品种',50.00,82.00,9,2,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(27,'柴犬','dog','SHIBA_INU','柴犬，日本犬种，独立性强，表情丰富',8.00,11.00,14,2,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(28,'威尔士柯基犬','dog','CORGI','威尔士柯基犬，腿短身长，活泼聪明',10.00,14.00,13,2,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(29,'比格犬','dog','BEAGLE','比格犬，嗅觉灵敏，性格友善',9.00,11.00,13,2,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(30,'法国斗牛犬','dog','FRENCH_BULLDOG','法国斗牛犬，肌肉发达，性格温和',8.00,14.00,11,2,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(31,'英国斗牛犬','dog','ENGLISH_BULLDOG','英国斗牛犬，体格强壮，性格稳重',18.00,25.00,9,2,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(32,'澳大利亚牧牛犬','dog','AUSTRALIAN_CATTLE','澳大利亚牧牛犬，精力充沛，工作能力强',15.00,22.00,14,3,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(33,'巴哥犬','dog','PUG','巴哥犬，面部扁平，性格友善',6.00,8.00,13,2,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(34,'雪纳瑞犬','dog','SCHNAUZER','雪纳瑞犬，胡须明显，聪明活泼',5.00,8.00,14,2,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(35,'可卡犬','dog','COCKER_SPANIEL','可卡犬，毛发丰富，性格温和',12.00,15.00,13,2,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(36,'巴塞特猎犬','dog','BASSET_HOUND','巴塞特猎犬，腿短耳长，嗅觉敏锐',20.00,29.00,12,2,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(37,'泰迪犬','dog','POODLE','泰迪犬（贵宾犬），聪明活泼，毛发需要定期修剪',2.00,8.00,14,2,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(38,'吉娃娃','dog','CHIHUAHUA','吉娃娃，世界最小犬种，勇敢机警',1.50,3.00,16,2,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(39,'博美犬','dog','POMERANIAN','博美犬，毛发蓬松，活泼可爱',1.40,3.20,14,2,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(40,'约克夏梗','dog','YORKSHIRE_TERRIER','约克夏梗，毛发丝滑，勇敢自信',1.80,3.20,15,3,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(41,'马尔济斯犬','dog','MALTESE','马尔济斯犬，毛发雪白，温和优雅',1.80,4.00,14,3,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(42,'西高地白梗','dog','WEST_HIGHLAND_WHITE','西高地白梗，毛色纯白，性格活泼',6.00,10.00,14,2,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(43,'比熊犬','dog','BICHON_FRISE','比熊犬，毛发卷曲，性格开朗',3.00,6.00,14,2,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(44,'京巴犬','dog','PEKINGESE','京巴犬，中国宫廷犬，性格独立',3.20,6.40,13,2,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(45,'西施犬','dog','SHIH_TZU','西施犬，毛发长而密，性格友善',4.00,7.20,15,3,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(46,'蝴蝶犬','dog','PAPILLON','蝴蝶犬，耳朵如蝴蝶翅膀，聪明活泼',1.40,4.50,14,2,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(47,'荷兰兔','rabbit','DUTCH_RABBIT','荷兰兔，黑白相间，性格温顺',1.40,2.50,8,1,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(48,'垂耳兔','rabbit','LOP_RABBIT','垂耳兔，耳朵下垂，性格安静',1.00,2.00,7,1,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(49,'安哥拉兔','rabbit','ANGORA_RABBIT','安哥拉兔，毛发长而密，需要定期梳理',2.00,4.50,7,3,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(50,'狮子兔','rabbit','LIONHEAD_RABBIT','狮子兔，头部毛发浓密如鬃毛',1.00,1.70,8,2,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(51,'侏儒兔','rabbit','DWARF_RABBIT','侏儒兔，体型迷你，活泼可爱',0.50,1.20,9,1,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(52,'虎皮鹦鹉','bird','BUDGERIGAR','虎皮鹦鹉，色彩鲜艳，能学会说话',0.03,0.04,8,2,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(53,'玄凤鹦鹉','bird','COCKATIEL','玄凤鹦鹉，头冠明显，性格温和',0.08,0.12,15,2,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(54,'金丝雀','bird','CANARY','金丝雀，歌声悦耳，色彩美丽',0.02,0.03,10,1,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(55,'牡丹鹦鹉','bird','LOVEBIRD','牡丹鹦鹉，成对饲养，感情深厚',0.04,0.06,12,2,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(56,'文鸟','bird','JAVA_SPARROW','文鸟，体型小巧，群居性强',0.02,0.03,8,1,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(57,'金丝熊','hamster','GOLDEN_HAMSTER','金丝熊，体型较大，性格温和',0.08,0.15,3,1,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(58,'三线仓鼠','hamster','DJUNGARIAN_HAMSTER','三线仓鼠，背部有三条黑线，活泼好动',0.03,0.05,2,1,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(59,'一线仓鼠','hamster','CHINESE_HAMSTER','一线仓鼠，背部有一条黑线，体型修长',0.03,0.04,2,1,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(60,'银狐仓鼠','hamster','WINTER_WHITE','银狐仓鼠，毛色银白，冬季会变色',0.03,0.05,2,1,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(61,'布丁仓鼠','hamster','PUDDING_HAMSTER','布丁仓鼠，毛色金黄，性格温顺',0.03,0.05,2,1,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(62,'巴西龟','turtle','RED_EARED_SLIDER','巴西龟，适应性强，容易饲养',1.00,3.00,30,1,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(63,'草龟','turtle','CHINESE_POND_TURTLE','草龟，中华草龟，本土龟种',0.50,2.00,50,1,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(64,'黄缘龟','turtle','YELLOW_MARGINED_BOX','黄缘龟，半水栖龟类，性格温和',0.30,1.00,40,2,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(65,'陆龟','turtle','HERMANN_TORTOISE','赫曼陆龟，纯陆栖，需要干燥环境',0.50,3.00,80,2,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(66,'地图龟','turtle','MAP_TURTLE','地图龟，背甲有地图样花纹',0.20,0.80,25,2,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(67,'金鱼','fish','GOLDFISH','金鱼，观赏鱼类，品种繁多',0.02,0.50,10,1,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(68,'锦鲤','fish','KOI','锦鲤，大型观赏鱼，色彩斑斓',2.00,15.00,50,2,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(69,'热带鱼','fish','TROPICAL_FISH','热带鱼，需要加温设备，色彩丰富',0.01,0.10,5,2,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(70,'斗鱼','fish','BETTA_FISH','斗鱼，色彩鲜艳，雄性好斗',0.00,0.01,3,2,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(71,'神仙鱼','fish','ANGELFISH','神仙鱼，体型优雅，游姿美丽',0.05,0.20,8,2,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51');
/*!40000 ALTER TABLE `L_pet_breeds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `L_pet_documents`
--

DROP TABLE IF EXISTS `L_pet_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `L_pet_documents` (
  `document_id` bigint NOT NULL AUTO_INCREMENT COMMENT '证件ID',
  `pet_id` bigint NOT NULL COMMENT '宠物ID',
  `document_type` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '证件类型 vaccination:疫苗证 registration:登记证 insurance:保险单 health:健康证 other:其他',
  `document_name` varchar(200) COLLATE utf8mb4_general_ci NOT NULL COMMENT '证件名称',
  `document_number` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '证件号码',
  `issue_date` date DEFAULT NULL COMMENT '签发日期',
  `expiry_date` date DEFAULT NULL COMMENT '过期日期',
  `issuing_authority` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '签发机构',
  `document_url` varchar(500) COLLATE utf8mb4_general_ci NOT NULL COMMENT '证件文件URL',
  `thumbnail_url` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '缩略图URL',
  `file_type` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文件类型 pdf:PDF image:图片',
  `file_size` bigint DEFAULT NULL COMMENT '文件大小(字节)',
  `is_verified` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已验证',
  `verification_time` datetime DEFAULT NULL COMMENT '验证时间',
  `notes` text COLLATE utf8mb4_general_ci COMMENT '备注',
  `visibility` tinyint(1) NOT NULL DEFAULT '1' COMMENT '可见性 1:仅自己 2:情侣可见',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`document_id`),
  KEY `idx_pet_id` (`pet_id`),
  KEY `idx_document_type` (`document_type`),
  KEY `idx_expiry_date` (`expiry_date`),
  KEY `idx_visibility` (`visibility`),
  KEY `idx_document_pet_expiry` (`pet_id`,`expiry_date`),
  CONSTRAINT `l_pet_documents_ibfk_1` FOREIGN KEY (`pet_id`) REFERENCES `L_pets` (`pet_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='证件管理表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `L_pet_documents`
--

LOCK TABLES `L_pet_documents` WRITE;
/*!40000 ALTER TABLE `L_pet_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `L_pet_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `L_pet_family_relations`
--

DROP TABLE IF EXISTS `L_pet_family_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `L_pet_family_relations` (
  `relation_id` bigint NOT NULL AUTO_INCREMENT COMMENT '关系ID',
  `pet_id` bigint NOT NULL COMMENT '宠物ID',
  `related_pet_id` bigint NOT NULL COMMENT '关联宠物ID',
  `relation_type` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '关系类型 parent:父母 child:子女 sibling:兄弟姐妹 mate:配偶 grandparent:祖父母 grandchild:孙子女',
  `relation_desc` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '关系描述',
  `confirmed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否确认关系',
  `confirmed_by` bigint DEFAULT NULL COMMENT '确认人ID',
  `confirmed_time` datetime DEFAULT NULL COMMENT '确认时间',
  `visibility` tinyint(1) NOT NULL DEFAULT '1' COMMENT '可见性 1:仅自己 2:情侣可见 3:公开',
  `pet_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '宠物名称(冗余字段)',
  `related_pet_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '关联宠物名称(冗余字段)',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`relation_id`),
  UNIQUE KEY `uk_pet_relation` (`pet_id`,`related_pet_id`,`relation_type`),
  KEY `idx_pet_id` (`pet_id`),
  KEY `idx_related_pet_id` (`related_pet_id`),
  KEY `idx_relation_type` (`relation_type`),
  KEY `idx_confirmed` (`confirmed`),
  KEY `idx_visibility` (`visibility`),
  KEY `idx_deleted` (`deleted`),
  KEY `confirmed_by` (`confirmed_by`),
  KEY `idx_family_relation_pet_type` (`pet_id`,`relation_type`,`confirmed`,`deleted`),
  CONSTRAINT `l_pet_family_relations_ibfk_1` FOREIGN KEY (`pet_id`) REFERENCES `L_pets` (`pet_id`) ON DELETE CASCADE,
  CONSTRAINT `l_pet_family_relations_ibfk_2` FOREIGN KEY (`related_pet_id`) REFERENCES `L_pets` (`pet_id`) ON DELETE CASCADE,
  CONSTRAINT `l_pet_family_relations_ibfk_3` FOREIGN KEY (`confirmed_by`) REFERENCES `L_raiser_users` (`ruid`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='宠物家族关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `L_pet_family_relations`
--

LOCK TABLES `L_pet_family_relations` WRITE;
/*!40000 ALTER TABLE `L_pet_family_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `L_pet_family_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `L_pet_feature_tags`
--

DROP TABLE IF EXISTS `L_pet_feature_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `L_pet_feature_tags` (
  `tag_id` bigint NOT NULL AUTO_INCREMENT COMMENT '标签ID',
  `pet_id` bigint NOT NULL COMMENT '宠物ID',
  `tag_category` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '标签分类 appearance:外观 personality:性格 behavior:行为 skill:技能 health:健康 other:其他',
  `tag_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL COMMENT '标签名称',
  `tag_value` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '标签值',
  `tag_description` text COLLATE utf8mb4_general_ci COMMENT '标签描述',
  `is_system_tag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否系统标签',
  `tag_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '标签颜色',
  `sort_order` int NOT NULL DEFAULT '0' COMMENT '排序',
  `visibility` tinyint(1) NOT NULL DEFAULT '1' COMMENT '可见性 1:仅自己 2:情侣可见 3:公开',
  `pet_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '宠物名称(冗余字段)',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`tag_id`),
  KEY `idx_pet_id` (`pet_id`),
  KEY `idx_tag_category` (`tag_category`),
  KEY `idx_tag_name` (`tag_name`),
  KEY `idx_is_system_tag` (`is_system_tag`),
  KEY `idx_sort_order` (`sort_order`),
  KEY `idx_visibility` (`visibility`),
  KEY `idx_deleted` (`deleted`),
  KEY `idx_feature_tag_pet_category` (`pet_id`,`tag_category`,`visibility`,`deleted`),
  CONSTRAINT `l_pet_feature_tags_ibfk_1` FOREIGN KEY (`pet_id`) REFERENCES `L_pets` (`pet_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='宠物特征标签表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `L_pet_feature_tags`
--

LOCK TABLES `L_pet_feature_tags` WRITE;
/*!40000 ALTER TABLE `L_pet_feature_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `L_pet_feature_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `L_pet_growth_records`
--

DROP TABLE IF EXISTS `L_pet_growth_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `L_pet_growth_records` (
  `record_id` bigint NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `pet_id` bigint NOT NULL COMMENT '宠物ID',
  `growth_stage` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '成长阶段 newborn:新生儿 infant:幼儿 juvenile:少年 adult:成年 senior:老年',
  `record_date` date NOT NULL COMMENT '记录日期',
  `age_months` int NOT NULL COMMENT '年龄(月)',
  `weight` decimal(5,2) DEFAULT NULL COMMENT '体重(kg)',
  `height` decimal(5,2) DEFAULT NULL COMMENT '身高(cm)',
  `length` decimal(5,2) DEFAULT NULL COMMENT '体长(cm)',
  `development_notes` text COLLATE utf8mb4_general_ci COMMENT '发育情况记录',
  `behavioral_changes` text COLLATE utf8mb4_general_ci COMMENT '行为变化记录',
  `health_status` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '健康状况',
  `milestone_achieved` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '达成的里程碑',
  `photos` text COLLATE utf8mb4_general_ci COMMENT '照片URLs(JSON格式)',
  `veterinarian_notes` text COLLATE utf8mb4_general_ci COMMENT '兽医备注',
  `next_checkup_date` date DEFAULT NULL COMMENT '下次检查日期',
  `visibility` tinyint(1) NOT NULL DEFAULT '1' COMMENT '可见性 1:仅自己 2:情侣可见 3:公开',
  `pet_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '宠物名称(冗余字段)',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`record_id`),
  KEY `idx_pet_id` (`pet_id`),
  KEY `idx_growth_stage` (`growth_stage`),
  KEY `idx_record_date` (`record_date`),
  KEY `idx_age_months` (`age_months`),
  KEY `idx_next_checkup_date` (`next_checkup_date`),
  KEY `idx_visibility` (`visibility`),
  KEY `idx_deleted` (`deleted`),
  KEY `idx_growth_pet_stage` (`pet_id`,`growth_stage`,`record_date`,`deleted`),
  CONSTRAINT `l_pet_growth_records_ibfk_1` FOREIGN KEY (`pet_id`) REFERENCES `L_pets` (`pet_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='宠物成长记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `L_pet_growth_records`
--

LOCK TABLES `L_pet_growth_records` WRITE;
/*!40000 ALTER TABLE `L_pet_growth_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `L_pet_growth_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `L_pet_milestones`
--

DROP TABLE IF EXISTS `L_pet_milestones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `L_pet_milestones` (
  `milestone_id` bigint NOT NULL AUTO_INCREMENT COMMENT '里程碑ID',
  `pet_id` bigint NOT NULL COMMENT '宠物ID',
  `milestone_type` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '里程碑类型 age:年龄 weight:体重 training:训练 health:健康 behavior:行为',
  `milestone_name` varchar(200) COLLATE utf8mb4_general_ci NOT NULL COMMENT '里程碑名称',
  `milestone_description` text COLLATE utf8mb4_general_ci COMMENT '里程碑描述',
  `achievement_date` date NOT NULL COMMENT '达成日期',
  `pet_age_days` int DEFAULT NULL COMMENT '宠物年龄(天)',
  `milestone_value` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '里程碑数值',
  `milestone_unit` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '数值单位',
  `significance_level` tinyint(1) DEFAULT NULL COMMENT '重要程度 1-5分',
  `celebration_plan` text COLLATE utf8mb4_general_ci COMMENT '庆祝计划',
  `photo_urls` text COLLATE utf8mb4_general_ci COMMENT '纪念照片URLs(JSON格式)',
  `video_urls` text COLLATE utf8mb4_general_ci COMMENT '纪念视频URLs(JSON格式)',
  `shared_with_partner` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否与伴侣分享',
  `social_media_shared` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否分享到社交媒体',
  `memory_notes` text COLLATE utf8mb4_general_ci COMMENT '回忆备注',
  `next_milestone_target` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '下一个里程碑目标',
  `visibility` tinyint(1) NOT NULL DEFAULT '1' COMMENT '可见性 1:仅自己 2:情侣可见 3:公开',
  `pet_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '宠物名称(冗余字段)',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`milestone_id`),
  KEY `idx_pet_id` (`pet_id`),
  KEY `idx_milestone_type` (`milestone_type`),
  KEY `idx_achievement_date` (`achievement_date`),
  KEY `idx_significance_level` (`significance_level`),
  KEY `idx_visibility` (`visibility`),
  KEY `idx_deleted` (`deleted`),
  KEY `idx_milestone_pet_date` (`pet_id`,`achievement_date`),
  CONSTRAINT `l_pet_milestones_ibfk_1` FOREIGN KEY (`pet_id`) REFERENCES `L_pets` (`pet_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='宠物成长里程碑表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `L_pet_milestones`
--

LOCK TABLES `L_pet_milestones` WRITE;
/*!40000 ALTER TABLE `L_pet_milestones` DISABLE KEYS */;
/*!40000 ALTER TABLE `L_pet_milestones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `L_pet_photos`
--

DROP TABLE IF EXISTS `L_pet_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `L_pet_photos` (
  `photo_id` bigint NOT NULL AUTO_INCREMENT COMMENT '照片ID',
  `pet_id` bigint NOT NULL COMMENT '宠物ID',
  `photo_url` varchar(500) COLLATE utf8mb4_general_ci NOT NULL COMMENT '照片URL',
  `thumbnail_url` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '缩略图URL',
  `photo_title` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '照片标题',
  `photo_desc` text COLLATE utf8mb4_general_ci COMMENT '照片描述',
  `photo_date` datetime DEFAULT NULL COMMENT '拍摄时间',
  `location` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '拍摄地点',
  `tags` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '标签(逗号分隔)',
  `ai_tags` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'AI识别标签',
  `is_favorite` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否收藏',
  `visibility` tinyint(1) NOT NULL DEFAULT '1' COMMENT '可见性 1:仅自己 2:情侣可见',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`photo_id`),
  KEY `idx_pet_id` (`pet_id`),
  KEY `idx_photo_date` (`photo_date`),
  KEY `idx_is_favorite` (`is_favorite`),
  KEY `idx_visibility` (`visibility`),
  KEY `idx_deleted` (`deleted`),
  KEY `idx_photo_pet_date` (`pet_id`,`photo_date`,`deleted`),
  KEY `idx_photos_deleted_pet` (`deleted`,`pet_id`),
  CONSTRAINT `l_pet_photos_ibfk_1` FOREIGN KEY (`pet_id`) REFERENCES `L_pets` (`pet_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='宠物照片相册表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `L_pet_photos`
--

LOCK TABLES `L_pet_photos` WRITE;
/*!40000 ALTER TABLE `L_pet_photos` DISABLE KEYS */;
/*!40000 ALTER TABLE `L_pet_photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `L_pet_preferences`
--

DROP TABLE IF EXISTS `L_pet_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `L_pet_preferences` (
  `preference_id` bigint NOT NULL AUTO_INCREMENT COMMENT '偏好ID',
  `pet_id` bigint NOT NULL COMMENT '宠物ID',
  `preference_category` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '偏好分类 food:食物 toy:玩具 activity:活动 environment:环境 social:社交 other:其他',
  `preference_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL COMMENT '偏好名称',
  `preference_level` tinyint(1) NOT NULL DEFAULT '3' COMMENT '偏好程度 1:非常不喜欢 2:不喜欢 3:一般 4:喜欢 5:非常喜欢',
  `preference_desc` text COLLATE utf8mb4_general_ci COMMENT '偏好描述',
  `notes` text COLLATE utf8mb4_general_ci COMMENT '备注说明',
  `last_observed_date` date DEFAULT NULL COMMENT '最后观察日期',
  `confidence_level` tinyint(1) DEFAULT '3' COMMENT '确信程度 1:不确定 2:较不确定 3:一般 4:较确定 5:非常确定',
  `visibility` tinyint(1) NOT NULL DEFAULT '1' COMMENT '可见性 1:仅自己 2:情侣可见 3:公开',
  `pet_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '宠物名称(冗余字段)',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`preference_id`),
  KEY `idx_pet_id` (`pet_id`),
  KEY `idx_preference_category` (`preference_category`),
  KEY `idx_preference_level` (`preference_level`),
  KEY `idx_visibility` (`visibility`),
  KEY `idx_deleted` (`deleted`),
  KEY `idx_preference_pet_category` (`pet_id`,`preference_category`,`preference_level`,`deleted`),
  CONSTRAINT `l_pet_preferences_ibfk_1` FOREIGN KEY (`pet_id`) REFERENCES `L_pets` (`pet_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='宠物偏好设置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `L_pet_preferences`
--

LOCK TABLES `L_pet_preferences` WRITE;
/*!40000 ALTER TABLE `L_pet_preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `L_pet_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `L_pet_product_purchases`
--

DROP TABLE IF EXISTS `L_pet_product_purchases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `L_pet_product_purchases` (
  `purchase_id` bigint NOT NULL AUTO_INCREMENT COMMENT '购买记录ID',
  `pet_id` bigint DEFAULT NULL COMMENT '宠物ID',
  `ruid` bigint NOT NULL COMMENT '购买者ID',
  `product_name` varchar(200) COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品名称',
  `product_category` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品分类',
  `brand_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '品牌名称',
  `product_model` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '型号规格',
  `purchase_date` date NOT NULL COMMENT '购买日期',
  `purchase_price` decimal(10,2) NOT NULL COMMENT '购买价格',
  `quantity` int NOT NULL DEFAULT '1' COMMENT '购买数量',
  `total_amount` decimal(10,2) NOT NULL COMMENT '总金额',
  `currency` varchar(10) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'CNY' COMMENT '货币类型',
  `purchase_channel` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '购买渠道',
  `store_name` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商店名称',
  `order_number` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '订单号',
  `receipt_photo` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '收据照片URL',
  `product_photos` text COLLATE utf8mb4_general_ci COMMENT '商品照片URLs(JSON格式)',
  `purchase_reason` text COLLATE utf8mb4_general_ci COMMENT '购买原因',
  `expected_usage` text COLLATE utf8mb4_general_ci COMMENT '预期用途',
  `warranty_period` int DEFAULT NULL COMMENT '保修期(月)',
  `warranty_end_date` date DEFAULT NULL COMMENT '保修到期日期',
  `is_gift` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否礼品',
  `gift_from` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '礼品来源',
  `usage_status` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'in_use' COMMENT '使用状态 in_use:使用中 stored:存放中 damaged:损坏 lost:丢失 discarded:丢弃',
  `satisfaction_rating` tinyint(1) DEFAULT NULL COMMENT '满意度评分 1-5分',
  `review_notes` text COLLATE utf8mb4_general_ci COMMENT '使用评价',
  `repurchase_intention` tinyint(1) DEFAULT NULL COMMENT '复购意愿 1-5分',
  `visibility` tinyint(1) NOT NULL DEFAULT '1' COMMENT '可见性 1:仅自己 2:情侣可见 3:公开',
  `pet_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '宠物名称(冗余字段)',
  `purchaser_nickname` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '购买者昵称(冗余字段)',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`purchase_id`),
  KEY `idx_pet_id` (`pet_id`),
  KEY `idx_ruid` (`ruid`),
  KEY `idx_purchase_date` (`purchase_date`),
  KEY `idx_product_category` (`product_category`),
  KEY `idx_brand_name` (`brand_name`),
  KEY `idx_usage_status` (`usage_status`),
  KEY `idx_satisfaction_rating` (`satisfaction_rating`),
  KEY `idx_visibility` (`visibility`),
  KEY `idx_deleted` (`deleted`),
  KEY `idx_purchase_pet_date` (`pet_id`,`purchase_date`,`ruid`,`deleted`),
  KEY `idx_purchase_category_date` (`product_category`,`purchase_date`,`deleted`),
  CONSTRAINT `l_pet_product_purchases_ibfk_1` FOREIGN KEY (`pet_id`) REFERENCES `L_pets` (`pet_id`) ON DELETE SET NULL,
  CONSTRAINT `l_pet_product_purchases_ibfk_2` FOREIGN KEY (`ruid`) REFERENCES `L_raiser_users` (`ruid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='宠物用品购买记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `L_pet_product_purchases`
--

LOCK TABLES `L_pet_product_purchases` WRITE;
/*!40000 ALTER TABLE `L_pet_product_purchases` DISABLE KEYS */;
/*!40000 ALTER TABLE `L_pet_product_purchases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `L_pet_products`
--

DROP TABLE IF EXISTS `L_pet_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `L_pet_products` (
  `product_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用品ID',
  `product_name` varchar(200) COLLATE utf8mb4_general_ci NOT NULL COMMENT '用品名称',
  `category_id` bigint DEFAULT NULL COMMENT '分类ID',
  `brand_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '品牌',
  `model` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '型号',
  `specifications` text COLLATE utf8mb4_general_ci COMMENT '规格说明',
  `material` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '材质',
  `color` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '颜色',
  `size` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '尺寸',
  `weight` decimal(8,2) DEFAULT NULL COMMENT '重量(g)',
  `purchase_date` date DEFAULT NULL COMMENT '购买日期',
  `purchase_price` decimal(10,2) DEFAULT NULL COMMENT '购买价格',
  `purchase_location` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '购买地点',
  `warranty_period` int DEFAULT NULL COMMENT '保修期(月)',
  `expiry_date` date DEFAULT NULL COMMENT '过期日期',
  `status` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'normal' COMMENT '状态 normal:正常 damaged:损坏 lost:丢失 disposed:已处理',
  `usage_frequency` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '使用频率 daily:每日 weekly:每周 monthly:每月 rarely:很少',
  `description` text COLLATE utf8mb4_general_ci COMMENT '描述',
  `photo_urls` text COLLATE utf8mb4_general_ci COMMENT '照片URLs(JSON格式)',
  `purchase_receipt_url` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '购买凭证URL',
  `visibility` tinyint(1) NOT NULL DEFAULT '1' COMMENT '可见性 1:仅自己 2:情侣可见',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`product_id`),
  KEY `idx_category_id` (`category_id`),
  KEY `idx_purchase_date` (`purchase_date`),
  KEY `idx_status` (`status`),
  KEY `idx_visibility` (`visibility`),
  CONSTRAINT `l_pet_products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `L_product_categories` (`category_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='宠物用品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `L_pet_products`
--

LOCK TABLES `L_pet_products` WRITE;
/*!40000 ALTER TABLE `L_pet_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `L_pet_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `L_pet_social_records`
--

DROP TABLE IF EXISTS `L_pet_social_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `L_pet_social_records` (
  `social_id` bigint NOT NULL AUTO_INCREMENT COMMENT '社交记录ID',
  `pet_id` bigint NOT NULL COMMENT '宠物ID',
  `social_date` datetime NOT NULL COMMENT '社交时间',
  `social_type` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '社交类型 pet_meetup:宠物聚会 park_visit:公园游玩 vet_visit:医院就诊 grooming:美容 training:训练课',
  `location` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '地点',
  `other_pets_info` text COLLATE utf8mb4_general_ci COMMENT '其他宠物信息(JSON格式)',
  `human_interactions` text COLLATE utf8mb4_general_ci COMMENT '与人类互动情况',
  `pet_behavior` text COLLATE utf8mb4_general_ci COMMENT '宠物行为表现',
  `social_skills_rating` tinyint(1) DEFAULT NULL COMMENT '社交技能评分 1-5分',
  `stress_level` tinyint(1) DEFAULT NULL COMMENT '压力水平 1:很低 2:低 3:中等 4:高 5:很高',
  `enjoyment_level` tinyint(1) DEFAULT NULL COMMENT '享受程度 1-5分',
  `new_friends_made` int DEFAULT NULL COMMENT '结交新朋友数量',
  `incidents_occurred` text COLLATE utf8mb4_general_ci COMMENT '发生的事件',
  `lessons_learned` text COLLATE utf8mb4_general_ci COMMENT '学到的经验',
  `improvement_areas` text COLLATE utf8mb4_general_ci COMMENT '需要改进的方面',
  `photo_urls` text COLLATE utf8mb4_general_ci COMMENT '照片URLs(JSON格式)',
  `video_urls` text COLLATE utf8mb4_general_ci COMMENT '视频URLs(JSON格式)',
  `visibility` tinyint(1) NOT NULL DEFAULT '1' COMMENT '可见性 1:仅自己 2:情侣可见',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`social_id`),
  KEY `idx_pet_id` (`pet_id`),
  KEY `idx_social_date` (`social_date`),
  KEY `idx_social_type` (`social_type`),
  KEY `idx_visibility` (`visibility`),
  KEY `idx_social_pet_date` (`pet_id`,`social_date`),
  CONSTRAINT `l_pet_social_records_ibfk_1` FOREIGN KEY (`pet_id`) REFERENCES `L_pets` (`pet_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='宠物社交记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `L_pet_social_records`
--

LOCK TABLES `L_pet_social_records` WRITE;
/*!40000 ALTER TABLE `L_pet_social_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `L_pet_social_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `L_pet_training_records`
--

DROP TABLE IF EXISTS `L_pet_training_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `L_pet_training_records` (
  `training_id` bigint NOT NULL AUTO_INCREMENT COMMENT '训练记录ID',
  `pet_id` bigint NOT NULL COMMENT '宠物ID',
  `training_type` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '训练类型 basic:基础训练 behavior:行为纠正 skill:技能训练 socialization:社交训练',
  `training_name` varchar(200) COLLATE utf8mb4_general_ci NOT NULL COMMENT '训练项目名称',
  `training_date` datetime NOT NULL COMMENT '训练时间',
  `duration_minutes` int DEFAULT NULL COMMENT '训练时长(分钟)',
  `trainer_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '训练师姓名',
  `training_location` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '训练地点',
  `training_method` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '训练方法',
  `training_goals` text COLLATE utf8mb4_general_ci COMMENT '训练目标',
  `progress_level` tinyint(1) DEFAULT NULL COMMENT '进度等级 1:初学 2:练习 3:熟练 4:精通 5:完美',
  `success_rate` decimal(5,2) DEFAULT NULL COMMENT '成功率(%)',
  `pet_response` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '宠物反应',
  `rewards_used` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '使用的奖励',
  `challenges_faced` text COLLATE utf8mb4_general_ci COMMENT '遇到的挑战',
  `next_steps` text COLLATE utf8mb4_general_ci COMMENT '下一步计划',
  `training_notes` text COLLATE utf8mb4_general_ci COMMENT '训练备注',
  `video_url` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '训练视频URL',
  `photo_urls` text COLLATE utf8mb4_general_ci COMMENT '训练照片URLs(JSON格式)',
  `visibility` tinyint(1) NOT NULL DEFAULT '1' COMMENT '可见性 1:仅自己 2:情侣可见',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`training_id`),
  KEY `idx_pet_id` (`pet_id`),
  KEY `idx_training_type` (`training_type`),
  KEY `idx_training_date` (`training_date`),
  KEY `idx_progress_level` (`progress_level`),
  KEY `idx_visibility` (`visibility`),
  KEY `idx_training_pet_date` (`pet_id`,`training_date`),
  CONSTRAINT `l_pet_training_records_ibfk_1` FOREIGN KEY (`pet_id`) REFERENCES `L_pets` (`pet_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='宠物训练记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `L_pet_training_records`
--

LOCK TABLES `L_pet_training_records` WRITE;
/*!40000 ALTER TABLE `L_pet_training_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `L_pet_training_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `L_pets`
--

DROP TABLE IF EXISTS `L_pets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `L_pets` (
  `pet_id` bigint NOT NULL AUTO_INCREMENT COMMENT '宠物ID',
  `pet_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL COMMENT '宠物名字',
  `pet_nickname` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '宠物昵称',
  `owner_ruid` bigint NOT NULL COMMENT '主人ID',
  `co_owner_ruid` bigint DEFAULT NULL COMMENT '共同饲养者ID',
  `breed_id` bigint DEFAULT NULL COMMENT '品种ID',
  `species` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '物种 cat:猫 dog:狗 rabbit:兔子 bird:鸟类 fish:鱼类 hamster:仓鼠 turtle:乌龟 other:其他',
  `gender` tinyint(1) DEFAULT NULL COMMENT '性别 0:未知 1:公 2:母',
  `birth_date` date DEFAULT NULL COMMENT '出生日期',
  `adoption_date` date DEFAULT NULL COMMENT '领养日期',
  `age_months` int DEFAULT NULL COMMENT '年龄(月)',
  `color` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '毛色/颜色',
  `pattern` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '花纹特征',
  `weight` decimal(5,2) DEFAULT NULL COMMENT '体重(kg)',
  `height` decimal(5,2) DEFAULT NULL COMMENT '身高(cm)',
  `length` decimal(5,2) DEFAULT NULL COMMENT '体长(cm)',
  `chest_circumference` decimal(5,2) DEFAULT NULL COMMENT '胸围(cm)',
  `chip_number` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '芯片编号',
  `registration_number` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '注册编号',
  `passport_number` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '宠物护照号',
  `avatar` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '头像照片URL',
  `photo_gallery` text COLLATE utf8mb4_general_ci COMMENT '照片集合(JSON格式)',
  `is_sterilized` tinyint(1) DEFAULT NULL COMMENT '是否绝育 0:否 1:是',
  `sterilization_date` date DEFAULT NULL COMMENT '绝育日期',
  `sterilization_hospital` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '绝育医院',
  `personality_traits` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '性格特征(JSON格式)',
  `behavioral_notes` text COLLATE utf8mb4_general_ci COMMENT '行为习惯记录',
  `dietary_preferences` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '饮食偏好',
  `allergies` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '过敏信息',
  `medical_conditions` text COLLATE utf8mb4_general_ci COMMENT '疾病史',
  `emergency_contact` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '紧急联系人',
  `emergency_phone` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '紧急联系电话',
  `veterinarian_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '常用兽医姓名',
  `veterinarian_phone` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '兽医电话',
  `veterinarian_address` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '兽医诊所地址',
  `insurance_company` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '保险公司',
  `insurance_policy_number` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '保险单号',
  `microchip_brand` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '芯片品牌',
  `microchip_implant_date` date DEFAULT NULL COMMENT '芯片植入日期',
  `special_needs` text COLLATE utf8mb4_general_ci COMMENT '特殊需求',
  `special_notes` text COLLATE utf8mb4_general_ci COMMENT '特殊说明',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 0:已故 1:健康 2:生病 3:失踪 4:寄养中 5:医院治疗中',
  `health_score` tinyint(1) DEFAULT NULL COMMENT '健康评分 1-10分',
  `activity_level` tinyint(1) DEFAULT NULL COMMENT '活跃度 1:很低 2:低 3:中等 4:高 5:很高',
  `training_level` tinyint(1) DEFAULT NULL COMMENT '训练程度 1:未训练 2:基础 3:中级 4:高级 5:专业',
  `socialization_level` tinyint(1) DEFAULT NULL COMMENT '社交程度 1:很差 2:一般 3:良好 4:很好 5:优秀',
  `visibility` tinyint(1) NOT NULL DEFAULT '1' COMMENT '可见性 1:仅自己 2:情侣可见 3:公开',
  `is_shared_pet` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否共同宠物',
  `sharing_agreement` text COLLATE utf8mb4_general_ci COMMENT '共养协议',
  `qr_code_url` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '宠物二维码URL',
  `tags` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '标签(逗号分隔)',
  `owner_nickname` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '主人昵称(冗余字段)',
  `co_owner_nickname` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '共同饲养者昵称(冗余字段)',
  `breed_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '品种名称(冗余字段)',
  `total_photos` int NOT NULL DEFAULT '0' COMMENT '照片总数',
  `total_health_records` int NOT NULL DEFAULT '0' COMMENT '健康记录总数',
  `total_care_records` int NOT NULL DEFAULT '0' COMMENT '护理记录总数',
  `last_health_check_date` date DEFAULT NULL COMMENT '最后健康检查日期',
  `last_care_date` date DEFAULT NULL COMMENT '最后护理日期',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`pet_id`),
  UNIQUE KEY `uk_chip_number` (`chip_number`),
  UNIQUE KEY `uk_registration_number` (`registration_number`),
  KEY `idx_owner_ruid` (`owner_ruid`),
  KEY `idx_co_owner_ruid` (`co_owner_ruid`),
  KEY `idx_breed_id` (`breed_id`),
  KEY `idx_species` (`species`),
  KEY `idx_status` (`status`),
  KEY `idx_visibility` (`visibility`),
  KEY `idx_is_shared_pet` (`is_shared_pet`),
  KEY `idx_birth_date` (`birth_date`),
  KEY `idx_adoption_date` (`adoption_date`),
  KEY `idx_deleted` (`deleted`),
  KEY `idx_last_health_check` (`last_health_check_date`),
  KEY `idx_last_care` (`last_care_date`),
  KEY `idx_pet_owner_status` (`owner_ruid`,`status`,`deleted`),
  KEY `idx_pet_co_owner_status` (`co_owner_ruid`,`status`,`deleted`),
  KEY `idx_pet_species_status` (`species`,`status`,`visibility`,`deleted`),
  KEY `idx_pet_shared_status` (`is_shared_pet`,`status`,`deleted`),
  KEY `idx_pets_deleted_owner` (`deleted`,`owner_ruid`),
  KEY `idx_pets_owner_species_status` (`owner_ruid`,`species`,`status`,`deleted`),
  CONSTRAINT `l_pets_ibfk_1` FOREIGN KEY (`owner_ruid`) REFERENCES `L_raiser_users` (`ruid`) ON DELETE CASCADE,
  CONSTRAINT `l_pets_ibfk_2` FOREIGN KEY (`co_owner_ruid`) REFERENCES `L_raiser_users` (`ruid`) ON DELETE SET NULL,
  CONSTRAINT `l_pets_ibfk_3` FOREIGN KEY (`breed_id`) REFERENCES `L_pet_breeds` (`breed_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='宠物基础档案表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `L_pets`
--

LOCK TABLES `L_pets` WRITE;
/*!40000 ALTER TABLE `L_pets` DISABLE KEYS */;
/*!40000 ALTER TABLE `L_pets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `L_privacy_settings`
--

DROP TABLE IF EXISTS `L_privacy_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `L_privacy_settings` (
  `setting_id` bigint NOT NULL AUTO_INCREMENT COMMENT '设置ID',
  `ruid` bigint NOT NULL COMMENT '饲养者用户ID',
  `setting_category` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '设置分类 pet:宠物 expense:消费 diary:日记 profile:个人资料',
  `setting_key` varchar(100) COLLATE utf8mb4_general_ci NOT NULL COMMENT '设置键',
  `setting_value` varchar(500) COLLATE utf8mb4_general_ci NOT NULL COMMENT '设置值',
  `default_value` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '默认值',
  `description` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '设置描述',
  `is_customizable` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可自定义',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`setting_id`),
  UNIQUE KEY `uk_user_setting` (`ruid`,`setting_category`,`setting_key`),
  KEY `idx_setting_category` (`setting_category`),
  CONSTRAINT `l_privacy_settings_ibfk_1` FOREIGN KEY (`ruid`) REFERENCES `L_raiser_users` (`ruid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='隐私设置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `L_privacy_settings`
--

LOCK TABLES `L_privacy_settings` WRITE;
/*!40000 ALTER TABLE `L_privacy_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `L_privacy_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `L_product_categories`
--

DROP TABLE IF EXISTS `L_product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `L_product_categories` (
  `category_id` bigint NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `category_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL COMMENT '分类名称',
  `parent_id` bigint DEFAULT NULL COMMENT '父分类ID',
  `category_code` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '分类编码',
  `description` text COLLATE utf8mb4_general_ci COMMENT '分类描述',
  `sort_order` int NOT NULL DEFAULT '0' COMMENT '排序',
  `is_active` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`category_id`),
  KEY `idx_parent_id` (`parent_id`),
  KEY `idx_sort_order` (`sort_order`),
  KEY `idx_is_active` (`is_active`),
  CONSTRAINT `l_product_categories_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `L_product_categories` (`category_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用品分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `L_product_categories`
--

LOCK TABLES `L_product_categories` WRITE;
/*!40000 ALTER TABLE `L_product_categories` DISABLE KEYS */;
INSERT INTO `L_product_categories` VALUES (1,'猫用品',NULL,'CAT_PRODUCTS','猫咪专用用品',1,1,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(2,'狗用品',NULL,'DOG_PRODUCTS','狗狗专用用品',2,1,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(3,'通用用品',NULL,'COMMON_PRODUCTS','宠物通用用品',3,1,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(4,'食具水具',1,'CAT_FEEDING','猫咪食具水具',11,1,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(5,'玩具',1,'CAT_TOYS','猫咪玩具',12,1,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(6,'猫砂用品',1,'CAT_LITTER','猫砂及相关用品',13,1,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(7,'食具水具',2,'DOG_FEEDING','狗狗食具水具',21,1,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(8,'玩具',2,'DOG_TOYS','狗狗玩具',22,1,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(9,'牵引用品',2,'DOG_LEASH','狗狗牵引用品',23,1,'2025-09-17 21:30:51','2025-09-17 21:30:51');
/*!40000 ALTER TABLE `L_product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `L_product_value_assessments`
--

DROP TABLE IF EXISTS `L_product_value_assessments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `L_product_value_assessments` (
  `assessment_id` bigint NOT NULL AUTO_INCREMENT COMMENT '评估ID',
  `purchase_id` bigint NOT NULL COMMENT '购买记录ID',
  `assessment_date` date NOT NULL COMMENT '评估日期',
  `assessment_type` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '评估类型 periodic:定期评估 damage:损坏评估 resale:转售评估 insurance:保险评估 disposal:处置评估',
  `current_value` decimal(10,2) NOT NULL COMMENT '当前价值',
  `depreciation_rate` decimal(5,2) DEFAULT NULL COMMENT '折旧率(%)',
  `condition_rating` tinyint(1) NOT NULL COMMENT '物品状况评分 1:很差 2:较差 3:一般 4:良好 5:优秀',
  `usage_frequency` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '使用频率 daily:每日 weekly:每周 monthly:每月 rarely:很少 never:从未',
  `wear_level` tinyint(1) DEFAULT NULL COMMENT '磨损程度 1:无磨损 2:轻微 3:中等 4:严重 5:极严重',
  `functionality_status` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '功能状态',
  `market_price` decimal(10,2) DEFAULT NULL COMMENT '市场参考价格',
  `replacement_cost` decimal(10,2) DEFAULT NULL COMMENT '替换成本',
  `assessment_notes` text COLLATE utf8mb4_general_ci COMMENT '评估备注',
  `photos` text COLLATE utf8mb4_general_ci COMMENT '评估照片URLs(JSON格式)',
  `assessor_type` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'owner' COMMENT '评估者类型 owner:主人 professional:专业评估师 system:系统评估',
  `assessor_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '评估者姓名',
  `next_assessment_date` date DEFAULT NULL COMMENT '下次评估日期',
  `visibility` tinyint(1) NOT NULL DEFAULT '1' COMMENT '可见性 1:仅自己 2:情侣可见 3:公开',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`assessment_id`),
  KEY `idx_purchase_id` (`purchase_id`),
  KEY `idx_assessment_date` (`assessment_date`),
  KEY `idx_assessment_type` (`assessment_type`),
  KEY `idx_condition_rating` (`condition_rating`),
  KEY `idx_next_assessment_date` (`next_assessment_date`),
  KEY `idx_visibility` (`visibility`),
  KEY `idx_deleted` (`deleted`),
  KEY `idx_value_assessment_purchase` (`purchase_id`,`assessment_date`,`assessment_type`,`deleted`),
  CONSTRAINT `l_product_value_assessments_ibfk_1` FOREIGN KEY (`purchase_id`) REFERENCES `L_pet_product_purchases` (`purchase_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='物品价值评估表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `L_product_value_assessments`
--

LOCK TABLES `L_product_value_assessments` WRITE;
/*!40000 ALTER TABLE `L_product_value_assessments` DISABLE KEYS */;
/*!40000 ALTER TABLE `L_product_value_assessments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `L_purchase_decisions`
--

DROP TABLE IF EXISTS `L_purchase_decisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `L_purchase_decisions` (
  `decision_id` bigint NOT NULL AUTO_INCREMENT COMMENT '决策ID',
  `purchase_id` bigint DEFAULT NULL COMMENT '购买记录ID(购买后关联)',
  `ruid` bigint NOT NULL COMMENT '决策者ID',
  `product_name` varchar(200) COLLATE utf8mb4_general_ci NOT NULL COMMENT '考虑的商品名称',
  `decision_date` date NOT NULL COMMENT '决策日期',
  `decision_status` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '决策状态 considering:考虑中 decided_buy:决定购买 decided_not_buy:决定不买 postponed:推迟 cancelled:取消',
  `need_urgency` tinyint(1) NOT NULL DEFAULT '3' COMMENT '需求紧急程度 1:不急 2:一般 3:较急 4:紧急 5:非常紧急',
  `budget_range_min` decimal(10,2) DEFAULT NULL COMMENT '预算范围最小值',
  `budget_range_max` decimal(10,2) DEFAULT NULL COMMENT '预算范围最大值',
  `research_duration_days` int DEFAULT NULL COMMENT '研究时长(天)',
  `alternatives_considered` text COLLATE utf8mb4_general_ci COMMENT '考虑的替代品',
  `decision_factors` text COLLATE utf8mb4_general_ci COMMENT '决策因素',
  `pros_and_cons` text COLLATE utf8mb4_general_ci COMMENT '优缺点分析',
  `influencing_reviews` text COLLATE utf8mb4_general_ci COMMENT '影响决策的评价',
  `consultation_sources` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '咨询来源',
  `final_decision_reason` text COLLATE utf8mb4_general_ci COMMENT '最终决策原因',
  `satisfaction_with_process` tinyint(1) DEFAULT NULL COMMENT '决策过程满意度 1-5分',
  `would_decide_same_again` tinyint(1) DEFAULT NULL COMMENT '是否会再次做同样决策 0:否 1:是',
  `lessons_learned` text COLLATE utf8mb4_general_ci COMMENT '经验教训',
  `decision_timeline` text COLLATE utf8mb4_general_ci COMMENT '决策时间线(JSON格式)',
  `visibility` tinyint(1) NOT NULL DEFAULT '1' COMMENT '可见性 1:仅自己 2:情侣可见 3:公开',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`decision_id`),
  KEY `idx_purchase_id` (`purchase_id`),
  KEY `idx_ruid` (`ruid`),
  KEY `idx_decision_date` (`decision_date`),
  KEY `idx_decision_status` (`decision_status`),
  KEY `idx_need_urgency` (`need_urgency`),
  KEY `idx_visibility` (`visibility`),
  KEY `idx_deleted` (`deleted`),
  KEY `idx_decision_user_status` (`ruid`,`decision_status`,`decision_date`,`deleted`),
  CONSTRAINT `l_purchase_decisions_ibfk_1` FOREIGN KEY (`purchase_id`) REFERENCES `L_pet_product_purchases` (`purchase_id`) ON DELETE SET NULL,
  CONSTRAINT `l_purchase_decisions_ibfk_2` FOREIGN KEY (`ruid`) REFERENCES `L_raiser_users` (`ruid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='购买决策记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `L_purchase_decisions`
--

LOCK TABLES `L_purchase_decisions` WRITE;
/*!40000 ALTER TABLE `L_purchase_decisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `L_purchase_decisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `L_raiser_users`
--

DROP TABLE IF EXISTS `L_raiser_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `L_raiser_users` (
  `ruid` bigint NOT NULL AUTO_INCREMENT COMMENT '饲养者用户ID',
  `username` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `phone` varchar(20) COLLATE utf8mb4_general_ci NOT NULL COMMENT '手机号',
  `email` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
  `nickname` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '昵称',
  `avatar` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '头像URL',
  `gender` tinyint(1) DEFAULT NULL COMMENT '性别 0:男 1:女 2:未知',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `zodiac_sign` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '星座',
  `blood_type` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '血型',
  `height` decimal(5,2) DEFAULT NULL COMMENT '身高(cm)',
  `weight` decimal(5,2) DEFAULT NULL COMMENT '体重(kg)',
  `occupation` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '职业',
  `location_province` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '所在省份',
  `location_city` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '所在城市',
  `location_district` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '所在区县',
  `detailed_address` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '详细地址',
  `pet_start_date` date DEFAULT NULL COMMENT '开始养宠时间',
  `favorite_pet_types` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '喜欢的宠物类型(逗号分隔)',
  `personality_tags` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '性格标签(JSON格式)',
  `hobbies` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '兴趣爱好(逗号分隔)',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 0:禁用 1:正常 2:冻结',
  `account_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '账户类型 1:普通用户 2:VIP用户 3:专业饲养员',
  `wechat_openid` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '微信openid',
  `wechat_unionid` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '微信unionid',
  `qq_openid` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'QQ openid',
  `alipay_user_id` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '支付宝用户ID',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '最后登录IP',
  `login_count` int NOT NULL DEFAULT '0' COMMENT '登录次数',
  `password_update_time` datetime DEFAULT NULL COMMENT '密码更新时间',
  `email_verified` tinyint(1) NOT NULL DEFAULT '0' COMMENT '邮箱是否验证',
  `phone_verified` tinyint(1) NOT NULL DEFAULT '0' COMMENT '手机是否验证',
  `real_name_verified` tinyint(1) NOT NULL DEFAULT '0' COMMENT '实名是否验证',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除者',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ruid`),
  UNIQUE KEY `uk_phone` (`phone`),
  UNIQUE KEY `uk_username` (`username`),
  UNIQUE KEY `uk_wechat_openid` (`wechat_openid`),
  UNIQUE KEY `uk_email` (`email`),
  KEY `idx_status` (`status`),
  KEY `idx_account_type` (`account_type`),
  KEY `idx_location` (`location_province`,`location_city`),
  KEY `idx_create_time` (`create_time`),
  KEY `idx_last_login_time` (`last_login_time`),
  KEY `idx_deleted` (`deleted`),
  KEY `idx_users_deleted_status` (`deleted`,`status`),
  KEY `idx_users_phone_status` (`phone`,`status`,`deleted`),
  KEY `idx_users_wechat_openid` (`wechat_openid`,`deleted`),
  KEY `idx_users_last_login` (`last_login_time`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='宠物饲养者基础信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `L_raiser_users`
--

LOCK TABLES `L_raiser_users` WRITE;
/*!40000 ALTER TABLE `L_raiser_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `L_raiser_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `L_reminders`
--

DROP TABLE IF EXISTS `L_reminders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `L_reminders` (
  `reminder_id` bigint NOT NULL AUTO_INCREMENT COMMENT '提醒ID',
  `ruid` bigint NOT NULL COMMENT '饲养者用户ID',
  `reminder_type` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '提醒类型 vaccine:疫苗 care:护理 anniversary:纪念日 health:健康 feeding:喂食',
  `related_data_type` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '关联数据类型',
  `related_data_id` bigint DEFAULT NULL COMMENT '关联数据ID',
  `reminder_title` varchar(200) COLLATE utf8mb4_general_ci NOT NULL COMMENT '提醒标题',
  `reminder_content` text COLLATE utf8mb4_general_ci COMMENT '提醒内容',
  `reminder_time` datetime NOT NULL COMMENT '提醒时间',
  `advance_days` int DEFAULT NULL COMMENT '提前天数',
  `repeat_type` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'none' COMMENT '重复类型 none:不重复 daily:每日 weekly:每周 monthly:每月 yearly:每年',
  `repeat_interval` int DEFAULT NULL COMMENT '重复间隔',
  `end_date` date DEFAULT NULL COMMENT '结束日期',
  `is_sent` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已发送',
  `send_time` datetime DEFAULT NULL COMMENT '发送时间',
  `send_method` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '发送方式 system:系统通知 sms:短信 email:邮件 wechat:微信',
  `is_read` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已读',
  `read_time` datetime DEFAULT NULL COMMENT '阅读时间',
  `snooze_until` datetime DEFAULT NULL COMMENT '稍后提醒时间',
  `is_active` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  `ruid_nickname` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户昵称(冗余字段)',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`reminder_id`),
  KEY `idx_ruid` (`ruid`),
  KEY `idx_reminder_type` (`reminder_type`),
  KEY `idx_reminder_time` (`reminder_time`),
  KEY `idx_is_sent` (`is_sent`),
  KEY `idx_is_active` (`is_active`),
  KEY `idx_deleted` (`deleted`),
  KEY `idx_reminder_user_time` (`ruid`,`reminder_time`,`is_active`,`deleted`),
  KEY `idx_reminder_deleted_user` (`deleted`,`ruid`),
  CONSTRAINT `l_reminders_ibfk_1` FOREIGN KEY (`ruid`) REFERENCES `L_raiser_users` (`ruid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='提醒任务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `L_reminders`
--

LOCK TABLES `L_reminders` WRITE;
/*!40000 ALTER TABLE `L_reminders` DISABLE KEYS */;
/*!40000 ALTER TABLE `L_reminders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `L_system_dict`
--

DROP TABLE IF EXISTS `L_system_dict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `L_system_dict` (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典ID',
  `dict_type` varchar(100) COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典类型',
  `dict_key` varchar(100) COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典键',
  `dict_value` varchar(500) COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典值',
  `dict_label` varchar(200) COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典标签',
  `sort_order` int NOT NULL DEFAULT '0' COMMENT '排序',
  `css_class` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'CSS类名',
  `list_class` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '列表样式',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否默认',
  `is_active` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `uk_dict_type_key` (`dict_type`,`dict_key`),
  KEY `idx_dict_type` (`dict_type`),
  KEY `idx_sort_order` (`sort_order`),
  KEY `idx_is_active` (`is_active`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='系统字典表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `L_system_dict`
--

LOCK TABLES `L_system_dict` WRITE;
/*!40000 ALTER TABLE `L_system_dict` DISABLE KEYS */;
INSERT INTO `L_system_dict` VALUES (1,'pet_gender','1','1','公',1,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(2,'pet_gender','2','2','母',2,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(3,'pet_gender','0','0','未知',3,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(4,'pet_status','1','1','健康',1,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(5,'pet_status','8','8','活跃',2,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(6,'pet_status','9','9','快乐',3,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(7,'pet_status','10','10','调皮',4,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(8,'pet_status','11','11','康复中',5,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(9,'pet_status','12','12','怀孕中',6,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(10,'pet_status','13','13','哺乳期',7,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(11,'pet_status','14','14','训练中',8,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(12,'pet_status','15','15','比赛中',9,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(13,'pet_status','2','2','生病',10,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(14,'pet_status','5','5','寄养中',11,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(15,'pet_status','6','6','医院治疗中',12,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(16,'pet_status','3','3','失踪',13,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(17,'pet_status','0','0','已故',14,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(18,'pet_activity_level','1','1','很低',1,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(19,'pet_activity_level','2','2','低',2,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(20,'pet_activity_level','3','3','中等',3,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(21,'pet_activity_level','4','4','高',4,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(22,'pet_activity_level','5','5','很高',5,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(23,'pet_training_level','1','1','未训练',1,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(24,'pet_training_level','2','2','基础',2,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(25,'pet_training_level','3','3','中级',3,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(26,'pet_training_level','4','4','高级',4,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(27,'pet_training_level','5','5','专业',5,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(28,'pet_socialization_level','1','1','很差',1,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(29,'pet_socialization_level','2','2','一般',2,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(30,'pet_socialization_level','3','3','良好',3,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(31,'pet_socialization_level','4','4','很好',4,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(32,'pet_socialization_level','5','5','优秀',5,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(33,'pet_personality','friendly','friendly','友善',1,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(34,'pet_personality','active','active','活泼',2,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(35,'pet_personality','calm','calm','温和',3,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(36,'pet_personality','shy','shy','害羞',4,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(37,'pet_personality','playful','playful','爱玩',5,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(38,'pet_personality','independent','independent','独立',6,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(39,'pet_personality','clingy','clingy','粘人',7,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(40,'pet_personality','smart','smart','聪明',8,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(41,'pet_personality','lazy','lazy','懒惰',9,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(42,'pet_personality','curious','curious','好奇',10,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(43,'pet_skill_level','0','0','无技能',1,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(44,'pet_skill_level','1','1','初学者',2,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(45,'pet_skill_level','2','2','熟练',3,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(46,'pet_skill_level','3','3','精通',4,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(47,'pet_skill_level','4','4','专家',5,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(48,'pet_skill_level','5','5','大师',6,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(49,'pet_achievement_type','first_walk','first_walk','第一次散步',1,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(50,'pet_achievement_type','first_bath','first_bath','第一次洗澡',2,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(51,'pet_achievement_type','first_trick','first_trick','学会第一个技能',3,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(52,'pet_achievement_type','birthday','birthday','生日纪念',4,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(53,'pet_achievement_type','adoption_anniversary','adoption_anniversary','领养纪念日',5,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(54,'pet_achievement_type','weight_goal','weight_goal','达到理想体重',6,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(55,'pet_achievement_type','health_checkup','health_checkup','完成健康检查',7,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(56,'pet_achievement_type','vaccination_complete','vaccination_complete','完成疫苗接种',8,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(57,'interaction_type','play','play','玩耍',1,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(58,'interaction_type','training','training','训练',2,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(59,'interaction_type','feeding','feeding','喂食',3,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(60,'interaction_type','grooming','grooming','美容',4,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(61,'interaction_type','walk','walk','散步',5,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(62,'interaction_type','cuddle','cuddle','拥抱',6,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(63,'interaction_type','photo','photo','拍照',7,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(64,'interaction_type','vet_visit','vet_visit','看医生',8,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(65,'anniversary_type','adoption','adoption','领养纪念日',1,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(66,'anniversary_type','birthday','birthday','生日',2,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(67,'anniversary_type','first_meeting','first_meeting','初次见面',3,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(68,'anniversary_type','first_trick','first_trick','学会第一个技能',4,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(69,'anniversary_type','vaccination','vaccination','疫苗接种',5,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(70,'anniversary_type','sterilization','sterilization','绝育手术',6,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(71,'anniversary_type','recovery','recovery','康复纪念',7,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(72,'anniversary_type','competition','competition','比赛获奖',8,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(73,'visibility_level','1','1','仅自己',1,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(74,'visibility_level','2','2','情侣可见',2,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(75,'visibility_level','3','3','朋友可见',3,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(76,'visibility_level','4','4','公开',4,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(77,'privacy_level','1','1','公开',1,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(78,'privacy_level','2','2','朋友可见',2,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(79,'privacy_level','3','3','情侣可见',3,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(80,'privacy_level','4','4','仅自己',4,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(81,'relation_status','0','0','待确认',1,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(82,'relation_status','1','1','已绑定',2,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(83,'relation_status','2','2','已解绑',3,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(84,'task_status','0','0','待开始',1,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(85,'task_status','1','1','进行中',2,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(86,'task_status','2','2','已完成',3,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(87,'task_status','3','3','已取消',4,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(88,'reminder_type','vaccine','vaccine','疫苗提醒',1,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(89,'reminder_type','feeding','feeding','喂食提醒',2,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(90,'reminder_type','grooming','grooming','美容提醒',3,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(91,'reminder_type','exercise','exercise','运动提醒',4,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(92,'reminder_type','medication','medication','用药提醒',5,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(93,'reminder_type','checkup','checkup','体检提醒',6,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(94,'reminder_type','anniversary','anniversary','纪念日提醒',7,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(95,'reminder_type','birthday','birthday','生日提醒',8,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(96,'pet_relation_type','parent','parent','父母',1,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(97,'pet_relation_type','child','child','子女',2,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(98,'pet_relation_type','sibling','sibling','兄弟姐妹',3,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(99,'pet_relation_type','mate','mate','配偶',4,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(100,'pet_relation_type','grandparent','grandparent','祖父母',5,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(101,'pet_relation_type','grandchild','grandchild','孙子女',6,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(102,'pet_tag_category','appearance','appearance','外观',1,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(103,'pet_tag_category','personality','personality','性格',2,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(104,'pet_tag_category','behavior','behavior','行为',3,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(105,'pet_tag_category','skill','skill','技能',4,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(106,'pet_tag_category','health','health','健康',5,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(107,'pet_tag_category','other','other','其他',6,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(108,'pet_preference_category','food','food','食物',1,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(109,'pet_preference_category','toy','toy','玩具',2,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(110,'pet_preference_category','activity','activity','活动',3,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(111,'pet_preference_category','environment','environment','环境',4,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(112,'pet_preference_category','social','social','社交',5,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(113,'pet_preference_category','other','other','其他',6,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(114,'pet_growth_stage','newborn','newborn','新生儿',1,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(115,'pet_growth_stage','infant','infant','幼儿',2,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(116,'pet_growth_stage','juvenile','juvenile','少年',3,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(117,'pet_growth_stage','adult','adult','成年',4,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(118,'pet_growth_stage','senior','senior','老年',5,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(119,'couple_anniversary_type','first_meet','first_meet','初次见面',1,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(120,'couple_anniversary_type','first_date','first_date','第一次约会',2,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(121,'couple_anniversary_type','relationship_start','relationship_start','恋爱开始',3,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(122,'couple_anniversary_type','engagement','engagement','订婚',4,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(123,'couple_anniversary_type','marriage','marriage','结婚',5,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(124,'couple_anniversary_type','move_in','move_in','同居',6,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(125,'couple_anniversary_type','pet_adoption','pet_adoption','共同领养宠物',7,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(126,'couple_anniversary_type','other','other','其他',8,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(127,'purchase_decision_status','considering','considering','考虑中',1,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(128,'purchase_decision_status','decided_buy','decided_buy','决定购买',2,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(129,'purchase_decision_status','decided_not_buy','decided_not_buy','决定不买',3,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(130,'purchase_decision_status','postponed','postponed','推迟',4,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(131,'purchase_decision_status','cancelled','cancelled','取消',5,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(132,'product_usage_status','in_use','in_use','使用中',1,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(133,'product_usage_status','stored','stored','存放中',2,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(134,'product_usage_status','damaged','damaged','损坏',3,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(135,'product_usage_status','lost','lost','丢失',4,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(136,'product_usage_status','discarded','discarded','丢弃',5,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(137,'assessment_type','periodic','periodic','定期评估',1,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(138,'assessment_type','damage','damage','损坏评估',2,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(139,'assessment_type','resale','resale','转售评估',3,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(140,'assessment_type','insurance','insurance','保险评估',4,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(141,'assessment_type','disposal','disposal','处置评估',5,NULL,NULL,0,1,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51');
/*!40000 ALTER TABLE `L_system_dict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `L_vaccine_records`
--

DROP TABLE IF EXISTS `L_vaccine_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `L_vaccine_records` (
  `record_id` bigint NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `pet_id` bigint NOT NULL COMMENT '宠物ID',
  `vaccine_type_id` bigint NOT NULL COMMENT '疫苗类型ID',
  `vaccine_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL COMMENT '疫苗名称',
  `batch_number` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '疫苗批号',
  `vaccination_date` date NOT NULL COMMENT '接种日期',
  `next_due_date` date DEFAULT NULL COMMENT '下次接种日期',
  `veterinarian` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '接种医生',
  `clinic_name` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '诊所名称',
  `clinic_address` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '诊所地址',
  `cost` decimal(10,2) DEFAULT NULL COMMENT '费用',
  `side_effects` text COLLATE utf8mb4_general_ci COMMENT '不良反应',
  `notes` text COLLATE utf8mb4_general_ci COMMENT '备注',
  `certificate_url` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '接种证明照片URL',
  `reminder_sent` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已发送提醒',
  `visibility` tinyint(1) NOT NULL DEFAULT '1' COMMENT '可见性 1:仅自己 2:情侣可见',
  `pet_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '宠物名称(冗余字段)',
  `pet_species` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '宠物物种(冗余字段)',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`record_id`),
  KEY `idx_pet_id` (`pet_id`),
  KEY `idx_vaccine_type_id` (`vaccine_type_id`),
  KEY `idx_vaccination_date` (`vaccination_date`),
  KEY `idx_next_due_date` (`next_due_date`),
  KEY `idx_visibility` (`visibility`),
  KEY `idx_deleted` (`deleted`),
  KEY `idx_vaccine_pet_date` (`pet_id`,`vaccination_date`,`deleted`),
  KEY `idx_vaccine_deleted_pet` (`deleted`,`pet_id`),
  KEY `idx_vaccine_pet_type_date` (`pet_id`,`vaccine_type_id`,`vaccination_date`,`deleted`),
  CONSTRAINT `l_vaccine_records_ibfk_1` FOREIGN KEY (`pet_id`) REFERENCES `L_pets` (`pet_id`) ON DELETE CASCADE,
  CONSTRAINT `l_vaccine_records_ibfk_2` FOREIGN KEY (`vaccine_type_id`) REFERENCES `L_vaccine_types` (`vaccine_type_id`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='疫苗接种记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `L_vaccine_records`
--

LOCK TABLES `L_vaccine_records` WRITE;
/*!40000 ALTER TABLE `L_vaccine_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `L_vaccine_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `L_vaccine_types`
--

DROP TABLE IF EXISTS `L_vaccine_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `L_vaccine_types` (
  `vaccine_type_id` bigint NOT NULL AUTO_INCREMENT COMMENT '疫苗类型ID',
  `vaccine_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL COMMENT '疫苗名称',
  `species` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '适用物种',
  `manufacturer` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生产厂家',
  `description` text COLLATE utf8mb4_general_ci COMMENT '疫苗描述',
  `interval_months` int DEFAULT NULL COMMENT '接种间隔(月)',
  `is_required` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否必须接种',
  `is_active` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`vaccine_type_id`),
  KEY `idx_species` (`species`),
  KEY `idx_is_active` (`is_active`),
  KEY `idx_deleted` (`deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='疫苗类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `L_vaccine_types`
--

LOCK TABLES `L_vaccine_types` WRITE;
/*!40000 ALTER TABLE `L_vaccine_types` DISABLE KEYS */;
INSERT INTO `L_vaccine_types` VALUES (1,'猫三联疫苗','cat','硕腾','预防猫瘟、猫鼻支、猫杯状病毒',12,1,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(2,'狂犬疫苗','cat','硕腾','预防狂犬病',12,1,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(3,'犬八联疫苗','dog','硕腾','预防犬瘟热、细小病毒等八种疾病',12,1,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51'),(4,'狂犬疫苗','dog','硕腾','预防狂犬病',12,1,1,0,NULL,NULL,'2025-09-17 21:30:51','2025-09-17 21:30:51');
/*!40000 ALTER TABLE `L_vaccine_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `L_weight_records`
--

DROP TABLE IF EXISTS `L_weight_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `L_weight_records` (
  `record_id` bigint NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `pet_id` bigint NOT NULL COMMENT '宠物ID',
  `weight` decimal(5,2) NOT NULL COMMENT '体重(kg)',
  `height` decimal(5,2) DEFAULT NULL COMMENT '身高(cm)',
  `body_condition_score` tinyint(1) DEFAULT NULL COMMENT '体况评分 1-9分',
  `measurement_date` datetime NOT NULL COMMENT '测量时间',
  `measurement_location` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '测量地点',
  `notes` text COLLATE utf8mb4_general_ci COMMENT '备注',
  `visibility` tinyint(1) NOT NULL DEFAULT '1' COMMENT '可见性 1:仅自己 2:情侣可见',
  `pet_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '宠物名称(冗余字段)',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`record_id`),
  KEY `idx_pet_id` (`pet_id`),
  KEY `idx_measurement_date` (`measurement_date`),
  KEY `idx_visibility` (`visibility`),
  KEY `idx_deleted` (`deleted`),
  CONSTRAINT `l_weight_records_ibfk_1` FOREIGN KEY (`pet_id`) REFERENCES `L_pets` (`pet_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='体重记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `L_weight_records`
--

LOCK TABLES `L_weight_records` WRITE;
/*!40000 ALTER TABLE `L_weight_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `L_weight_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sj_distributed_lock`
--

DROP TABLE IF EXISTS `sj_distributed_lock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sj_distributed_lock` (
  `name` varchar(64) NOT NULL COMMENT '锁名称',
  `lock_until` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '锁定时长',
  `locked_at` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '锁定时间',
  `locked_by` varchar(255) NOT NULL COMMENT '锁定者',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='锁定表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sj_distributed_lock`
--

LOCK TABLES `sj_distributed_lock` WRITE;
/*!40000 ALTER TABLE `sj_distributed_lock` DISABLE KEYS */;
/*!40000 ALTER TABLE `sj_distributed_lock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sj_group_config`
--

DROP TABLE IF EXISTS `sj_group_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sj_group_config` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) NOT NULL DEFAULT '' COMMENT '组名称',
  `description` varchar(256) NOT NULL DEFAULT '' COMMENT '组描述',
  `token` varchar(64) NOT NULL DEFAULT 'SJ_cKqBTPzCsWA3VyuCfFoccmuIEGXjr5KT' COMMENT 'token',
  `group_status` tinyint NOT NULL DEFAULT '0' COMMENT '组状态 0、未启用 1、启用',
  `version` int NOT NULL COMMENT '版本号',
  `group_partition` int NOT NULL COMMENT '分区',
  `id_generator_mode` tinyint NOT NULL DEFAULT '1' COMMENT '唯一id生成模式 默认号段模式',
  `init_scene` tinyint NOT NULL DEFAULT '0' COMMENT '是否初始化场景 0:否 1:是',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_namespace_id_group_name` (`namespace_id`,`group_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='组配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sj_group_config`
--

LOCK TABLES `sj_group_config` WRITE;
/*!40000 ALTER TABLE `sj_group_config` DISABLE KEYS */;
INSERT INTO `sj_group_config` VALUES (1,'dev','ruoyi_group','','SJ_cKqBTPzCsWA3VyuCfFoccmuIEGXjr5KT',1,1,0,1,1,'2025-09-17 21:52:17','2025-09-17 21:52:17'),(2,'prod','ruoyi_group','','SJ_cKqBTPzCsWA3VyuCfFoccmuIEGXjr5KT',1,1,0,1,1,'2025-09-17 21:52:17','2025-09-17 21:52:17');
/*!40000 ALTER TABLE `sj_group_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sj_job`
--

DROP TABLE IF EXISTS `sj_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sj_job` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) NOT NULL COMMENT '组名称',
  `job_name` varchar(64) NOT NULL COMMENT '名称',
  `args_str` text COMMENT '执行方法参数',
  `args_type` tinyint NOT NULL DEFAULT '1' COMMENT '参数类型 ',
  `next_trigger_at` bigint NOT NULL COMMENT '下次触发时间',
  `job_status` tinyint NOT NULL DEFAULT '1' COMMENT '任务状态 0、关闭、1、开启',
  `task_type` tinyint NOT NULL DEFAULT '1' COMMENT '任务类型 1、集群 2、广播 3、切片',
  `route_key` tinyint NOT NULL DEFAULT '4' COMMENT '路由策略',
  `executor_type` tinyint NOT NULL DEFAULT '1' COMMENT '执行器类型',
  `executor_info` varchar(255) DEFAULT NULL COMMENT '执行器名称',
  `trigger_type` tinyint NOT NULL COMMENT '触发类型 1.CRON 表达式 2. 固定时间',
  `trigger_interval` varchar(255) NOT NULL COMMENT '间隔时长',
  `block_strategy` tinyint NOT NULL DEFAULT '1' COMMENT '阻塞策略 1、丢弃 2、覆盖 3、并行 4、恢复',
  `executor_timeout` int NOT NULL DEFAULT '0' COMMENT '任务执行超时时间，单位秒',
  `max_retry_times` int NOT NULL DEFAULT '0' COMMENT '最大重试次数',
  `parallel_num` int NOT NULL DEFAULT '1' COMMENT '并行数',
  `retry_interval` int NOT NULL DEFAULT '0' COMMENT '重试间隔(s)',
  `bucket_index` int NOT NULL DEFAULT '0' COMMENT 'bucket',
  `resident` tinyint NOT NULL DEFAULT '0' COMMENT '是否是常驻任务',
  `notify_ids` varchar(128) NOT NULL DEFAULT '' COMMENT '通知告警场景配置id列表',
  `owner_id` bigint DEFAULT NULL COMMENT '负责人id',
  `labels` varchar(512) DEFAULT '' COMMENT '标签',
  `description` varchar(256) NOT NULL DEFAULT '' COMMENT '描述',
  `ext_attrs` varchar(256) DEFAULT '' COMMENT '扩展字段',
  `deleted` tinyint NOT NULL DEFAULT '0' COMMENT '逻辑删除 1、删除',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_namespace_id_group_name` (`namespace_id`,`group_name`),
  KEY `idx_job_status_bucket_index` (`job_status`,`bucket_index`),
  KEY `idx_create_dt` (`create_dt`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='任务信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sj_job`
--

LOCK TABLES `sj_job` WRITE;
/*!40000 ALTER TABLE `sj_job` DISABLE KEYS */;
INSERT INTO `sj_job` VALUES (1,'dev','ruoyi_group','demo-job',NULL,1,1710344035622,1,1,4,1,'testJobExecutor',2,'60',1,60,3,1,1,116,0,'',1,'','','',0,'2025-09-17 21:52:17','2025-09-17 21:52:17');
/*!40000 ALTER TABLE `sj_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sj_job_executor`
--

DROP TABLE IF EXISTS `sj_job_executor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sj_job_executor` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) NOT NULL COMMENT '组名称',
  `executor_info` varchar(256) NOT NULL COMMENT '任务执行器名称',
  `executor_type` varchar(3) NOT NULL COMMENT '1:java 2:python 3:go',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_namespace_id_group_name` (`namespace_id`,`group_name`),
  KEY `idx_create_dt` (`create_dt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='任务执行器信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sj_job_executor`
--

LOCK TABLES `sj_job_executor` WRITE;
/*!40000 ALTER TABLE `sj_job_executor` DISABLE KEYS */;
/*!40000 ALTER TABLE `sj_job_executor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sj_job_log_message`
--

DROP TABLE IF EXISTS `sj_job_log_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sj_job_log_message` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) NOT NULL COMMENT '组名称',
  `job_id` bigint NOT NULL COMMENT '任务信息id',
  `task_batch_id` bigint NOT NULL COMMENT '任务批次id',
  `task_id` bigint NOT NULL COMMENT '调度任务id',
  `message` longtext NOT NULL COMMENT '调度信息',
  `log_num` int NOT NULL DEFAULT '1' COMMENT '日志数量',
  `real_time` bigint NOT NULL DEFAULT '0' COMMENT '上报时间',
  `ext_attrs` varchar(256) DEFAULT '' COMMENT '扩展字段',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_task_batch_id_task_id` (`task_batch_id`,`task_id`),
  KEY `idx_create_dt` (`create_dt`),
  KEY `idx_namespace_id_group_name` (`namespace_id`,`group_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='调度日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sj_job_log_message`
--

LOCK TABLES `sj_job_log_message` WRITE;
/*!40000 ALTER TABLE `sj_job_log_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `sj_job_log_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sj_job_summary`
--

DROP TABLE IF EXISTS `sj_job_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sj_job_summary` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) NOT NULL DEFAULT '' COMMENT '组名称',
  `business_id` bigint NOT NULL COMMENT '业务id (job_id或workflow_id)',
  `system_task_type` tinyint NOT NULL DEFAULT '3' COMMENT '任务类型 3、JOB任务 4、WORKFLOW任务',
  `trigger_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '统计时间',
  `success_num` int NOT NULL DEFAULT '0' COMMENT '执行成功-日志数量',
  `fail_num` int NOT NULL DEFAULT '0' COMMENT '执行失败-日志数量',
  `fail_reason` varchar(512) NOT NULL DEFAULT '' COMMENT '失败原因',
  `stop_num` int NOT NULL DEFAULT '0' COMMENT '执行失败-日志数量',
  `stop_reason` varchar(512) NOT NULL DEFAULT '' COMMENT '失败原因',
  `cancel_num` int NOT NULL DEFAULT '0' COMMENT '执行失败-日志数量',
  `cancel_reason` varchar(512) NOT NULL DEFAULT '' COMMENT '失败原因',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_trigger_at_system_task_type_business_id` (`trigger_at`,`system_task_type`,`business_id`) USING BTREE,
  KEY `idx_namespace_id_group_name_business_id` (`namespace_id`,`group_name`,`business_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='DashBoard_Job';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sj_job_summary`
--

LOCK TABLES `sj_job_summary` WRITE;
/*!40000 ALTER TABLE `sj_job_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `sj_job_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sj_job_task`
--

DROP TABLE IF EXISTS `sj_job_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sj_job_task` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) NOT NULL COMMENT '组名称',
  `job_id` bigint NOT NULL COMMENT '任务信息id',
  `task_batch_id` bigint NOT NULL COMMENT '调度任务id',
  `parent_id` bigint NOT NULL DEFAULT '0' COMMENT '父执行器id',
  `task_status` tinyint NOT NULL DEFAULT '0' COMMENT '执行的状态 0、失败 1、成功',
  `retry_count` int NOT NULL DEFAULT '0' COMMENT '重试次数',
  `mr_stage` tinyint DEFAULT NULL COMMENT '动态分片所处阶段 1:map 2:reduce 3:mergeReduce',
  `leaf` tinyint NOT NULL DEFAULT '1' COMMENT '叶子节点',
  `task_name` varchar(255) NOT NULL DEFAULT '' COMMENT '任务名称',
  `client_info` varchar(128) DEFAULT NULL COMMENT '客户端地址 clientId#ip:port',
  `wf_context` text COMMENT '工作流全局上下文',
  `result_message` text NOT NULL COMMENT '执行结果',
  `args_str` text COMMENT '执行方法参数',
  `args_type` tinyint NOT NULL DEFAULT '1' COMMENT '参数类型 ',
  `ext_attrs` varchar(256) DEFAULT '' COMMENT '扩展字段',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_task_batch_id_task_status` (`task_batch_id`,`task_status`),
  KEY `idx_create_dt` (`create_dt`),
  KEY `idx_namespace_id_group_name` (`namespace_id`,`group_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='任务实例';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sj_job_task`
--

LOCK TABLES `sj_job_task` WRITE;
/*!40000 ALTER TABLE `sj_job_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `sj_job_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sj_job_task_batch`
--

DROP TABLE IF EXISTS `sj_job_task_batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sj_job_task_batch` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) NOT NULL COMMENT '组名称',
  `job_id` bigint NOT NULL COMMENT '任务id',
  `workflow_node_id` bigint NOT NULL DEFAULT '0' COMMENT '工作流节点id',
  `parent_workflow_node_id` bigint NOT NULL DEFAULT '0' COMMENT '工作流任务父批次id',
  `workflow_task_batch_id` bigint NOT NULL DEFAULT '0' COMMENT '工作流任务批次id',
  `task_batch_status` tinyint NOT NULL DEFAULT '0' COMMENT '任务批次状态 0、失败 1、成功',
  `operation_reason` tinyint NOT NULL DEFAULT '0' COMMENT '操作原因',
  `execution_at` bigint NOT NULL DEFAULT '0' COMMENT '任务执行时间',
  `system_task_type` tinyint NOT NULL DEFAULT '3' COMMENT '任务类型 3、JOB任务 4、WORKFLOW任务',
  `parent_id` varchar(64) NOT NULL DEFAULT '' COMMENT '父节点',
  `ext_attrs` varchar(256) DEFAULT '' COMMENT '扩展字段',
  `deleted` tinyint NOT NULL DEFAULT '0' COMMENT '逻辑删除 1、删除',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_job_id_task_batch_status` (`job_id`,`task_batch_status`),
  KEY `idx_create_dt` (`create_dt`),
  KEY `idx_namespace_id_group_name` (`namespace_id`,`group_name`),
  KEY `idx_workflow_task_batch_id_workflow_node_id` (`workflow_task_batch_id`,`workflow_node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='任务批次';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sj_job_task_batch`
--

LOCK TABLES `sj_job_task_batch` WRITE;
/*!40000 ALTER TABLE `sj_job_task_batch` DISABLE KEYS */;
/*!40000 ALTER TABLE `sj_job_task_batch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sj_namespace`
--

DROP TABLE IF EXISTS `sj_namespace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sj_namespace` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(64) NOT NULL COMMENT '名称',
  `unique_id` varchar(64) NOT NULL COMMENT '唯一id',
  `description` varchar(256) NOT NULL DEFAULT '' COMMENT '描述',
  `deleted` tinyint NOT NULL DEFAULT '0' COMMENT '逻辑删除 1、删除',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_unique_id` (`unique_id`),
  KEY `idx_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='命名空间';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sj_namespace`
--

LOCK TABLES `sj_namespace` WRITE;
/*!40000 ALTER TABLE `sj_namespace` DISABLE KEYS */;
INSERT INTO `sj_namespace` VALUES (1,'Development','dev','',0,'2025-09-17 21:52:17','2025-09-17 21:52:17'),(2,'Production','prod','',0,'2025-09-17 21:52:17','2025-09-17 21:52:17');
/*!40000 ALTER TABLE `sj_namespace` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sj_notify_config`
--

DROP TABLE IF EXISTS `sj_notify_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sj_notify_config` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) NOT NULL COMMENT '组名称',
  `notify_name` varchar(64) NOT NULL DEFAULT '' COMMENT '通知名称',
  `system_task_type` tinyint NOT NULL DEFAULT '3' COMMENT '任务类型 1. 重试任务 2. 重试回调 3、JOB任务 4、WORKFLOW任务',
  `notify_status` tinyint NOT NULL DEFAULT '0' COMMENT '通知状态 0、未启用 1、启用',
  `recipient_ids` varchar(128) NOT NULL COMMENT '接收人id列表',
  `notify_threshold` int NOT NULL DEFAULT '0' COMMENT '通知阈值',
  `notify_scene` tinyint NOT NULL DEFAULT '0' COMMENT '通知场景',
  `rate_limiter_status` tinyint NOT NULL DEFAULT '0' COMMENT '限流状态 0、未启用 1、启用',
  `rate_limiter_threshold` int NOT NULL DEFAULT '0' COMMENT '每秒限流阈值',
  `description` varchar(256) NOT NULL DEFAULT '' COMMENT '描述',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_namespace_id_group_name_scene_name` (`namespace_id`,`group_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='通知配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sj_notify_config`
--

LOCK TABLES `sj_notify_config` WRITE;
/*!40000 ALTER TABLE `sj_notify_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `sj_notify_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sj_notify_recipient`
--

DROP TABLE IF EXISTS `sj_notify_recipient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sj_notify_recipient` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `recipient_name` varchar(64) NOT NULL COMMENT '接收人名称',
  `notify_type` tinyint NOT NULL DEFAULT '0' COMMENT '通知类型 1、钉钉 2、邮件 3、企业微信 4 飞书 5 webhook',
  `notify_attribute` varchar(512) NOT NULL COMMENT '配置属性',
  `description` varchar(256) NOT NULL DEFAULT '' COMMENT '描述',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_namespace_id` (`namespace_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='告警通知接收人';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sj_notify_recipient`
--

LOCK TABLES `sj_notify_recipient` WRITE;
/*!40000 ALTER TABLE `sj_notify_recipient` DISABLE KEYS */;
/*!40000 ALTER TABLE `sj_notify_recipient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sj_retry`
--

DROP TABLE IF EXISTS `sj_retry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sj_retry` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) NOT NULL COMMENT '组名称',
  `group_id` bigint NOT NULL COMMENT '组Id',
  `scene_name` varchar(64) NOT NULL COMMENT '场景名称',
  `scene_id` bigint NOT NULL COMMENT '场景ID',
  `idempotent_id` varchar(64) NOT NULL COMMENT '幂等id',
  `biz_no` varchar(64) NOT NULL DEFAULT '' COMMENT '业务编号',
  `executor_name` varchar(512) NOT NULL DEFAULT '' COMMENT '执行器名称',
  `args_str` text NOT NULL COMMENT '执行方法参数',
  `ext_attrs` text NOT NULL COMMENT '扩展字段',
  `serializer_name` varchar(32) NOT NULL DEFAULT 'jackson' COMMENT '执行方法参数序列化器名称',
  `next_trigger_at` bigint NOT NULL COMMENT '下次触发时间',
  `retry_count` int NOT NULL DEFAULT '0' COMMENT '重试次数',
  `retry_status` tinyint NOT NULL DEFAULT '0' COMMENT '重试状态 0、重试中 1、成功 2、最大重试次数',
  `task_type` tinyint NOT NULL DEFAULT '1' COMMENT '任务类型 1、重试数据 2、回调数据',
  `bucket_index` int NOT NULL DEFAULT '0' COMMENT 'bucket',
  `parent_id` bigint NOT NULL DEFAULT '0' COMMENT '父节点id',
  `deleted` bigint NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_scene_tasktype_idempotentid_deleted` (`scene_id`,`task_type`,`idempotent_id`,`deleted`),
  KEY `idx_biz_no` (`biz_no`),
  KEY `idx_idempotent_id` (`idempotent_id`),
  KEY `idx_retry_status_bucket_index` (`retry_status`,`bucket_index`),
  KEY `idx_parent_id` (`parent_id`),
  KEY `idx_create_dt` (`create_dt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='重试信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sj_retry`
--

LOCK TABLES `sj_retry` WRITE;
/*!40000 ALTER TABLE `sj_retry` DISABLE KEYS */;
/*!40000 ALTER TABLE `sj_retry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sj_retry_dead_letter`
--

DROP TABLE IF EXISTS `sj_retry_dead_letter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sj_retry_dead_letter` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) NOT NULL COMMENT '组名称',
  `group_id` bigint NOT NULL COMMENT '组Id',
  `scene_name` varchar(64) NOT NULL COMMENT '场景名称',
  `scene_id` bigint NOT NULL COMMENT '场景ID',
  `idempotent_id` varchar(64) NOT NULL COMMENT '幂等id',
  `biz_no` varchar(64) NOT NULL DEFAULT '' COMMENT '业务编号',
  `executor_name` varchar(512) NOT NULL DEFAULT '' COMMENT '执行器名称',
  `serializer_name` varchar(32) NOT NULL DEFAULT 'jackson' COMMENT '执行方法参数序列化器名称',
  `args_str` text NOT NULL COMMENT '执行方法参数',
  `ext_attrs` text NOT NULL COMMENT '扩展字段',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_namespace_id_group_name_scene_name` (`namespace_id`,`group_name`,`scene_name`),
  KEY `idx_idempotent_id` (`idempotent_id`),
  KEY `idx_biz_no` (`biz_no`),
  KEY `idx_create_dt` (`create_dt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='死信队列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sj_retry_dead_letter`
--

LOCK TABLES `sj_retry_dead_letter` WRITE;
/*!40000 ALTER TABLE `sj_retry_dead_letter` DISABLE KEYS */;
/*!40000 ALTER TABLE `sj_retry_dead_letter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sj_retry_scene_config`
--

DROP TABLE IF EXISTS `sj_retry_scene_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sj_retry_scene_config` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `scene_name` varchar(64) NOT NULL COMMENT '场景名称',
  `group_name` varchar(64) NOT NULL COMMENT '组名称',
  `scene_status` tinyint NOT NULL DEFAULT '0' COMMENT '组状态 0、未启用 1、启用',
  `max_retry_count` int NOT NULL DEFAULT '5' COMMENT '最大重试次数',
  `back_off` tinyint NOT NULL DEFAULT '1' COMMENT '1、默认等级 2、固定间隔时间 3、CRON 表达式',
  `trigger_interval` varchar(16) NOT NULL DEFAULT '' COMMENT '间隔时长',
  `notify_ids` varchar(128) NOT NULL DEFAULT '' COMMENT '通知告警场景配置id列表',
  `deadline_request` bigint unsigned NOT NULL DEFAULT '60000' COMMENT 'Deadline Request 调用链超时 单位毫秒',
  `executor_timeout` int unsigned NOT NULL DEFAULT '5' COMMENT '任务执行超时时间，单位秒',
  `route_key` tinyint NOT NULL DEFAULT '4' COMMENT '路由策略',
  `block_strategy` tinyint NOT NULL DEFAULT '1' COMMENT '阻塞策略 1、丢弃 2、覆盖 3、并行',
  `cb_status` tinyint NOT NULL DEFAULT '0' COMMENT '回调状态 0、不开启 1、开启',
  `cb_trigger_type` tinyint NOT NULL DEFAULT '1' COMMENT '1、默认等级 2、固定间隔时间 3、CRON 表达式',
  `cb_max_count` int NOT NULL DEFAULT '16' COMMENT '回调的最大执行次数',
  `cb_trigger_interval` varchar(16) NOT NULL DEFAULT '' COMMENT '回调的最大执行次数',
  `owner_id` bigint DEFAULT NULL COMMENT '负责人id',
  `labels` varchar(512) DEFAULT '' COMMENT '标签',
  `description` varchar(256) NOT NULL DEFAULT '' COMMENT '描述',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_namespace_id_group_name_scene_name` (`namespace_id`,`group_name`,`scene_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='场景配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sj_retry_scene_config`
--

LOCK TABLES `sj_retry_scene_config` WRITE;
/*!40000 ALTER TABLE `sj_retry_scene_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `sj_retry_scene_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sj_retry_summary`
--

DROP TABLE IF EXISTS `sj_retry_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sj_retry_summary` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) NOT NULL DEFAULT '' COMMENT '组名称',
  `scene_name` varchar(50) NOT NULL DEFAULT '' COMMENT '场景名称',
  `trigger_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '统计时间',
  `running_num` int NOT NULL DEFAULT '0' COMMENT '重试中-日志数量',
  `finish_num` int NOT NULL DEFAULT '0' COMMENT '重试完成-日志数量',
  `max_count_num` int NOT NULL DEFAULT '0' COMMENT '重试到达最大次数-日志数量',
  `suspend_num` int NOT NULL DEFAULT '0' COMMENT '暂停重试-日志数量',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_scene_name_trigger_at` (`namespace_id`,`group_name`,`scene_name`,`trigger_at`) USING BTREE,
  KEY `idx_trigger_at` (`trigger_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='DashBoard_Retry';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sj_retry_summary`
--

LOCK TABLES `sj_retry_summary` WRITE;
/*!40000 ALTER TABLE `sj_retry_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `sj_retry_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sj_retry_task`
--

DROP TABLE IF EXISTS `sj_retry_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sj_retry_task` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) NOT NULL COMMENT '组名称',
  `scene_name` varchar(64) NOT NULL COMMENT '场景名称',
  `retry_id` bigint NOT NULL COMMENT '重试信息Id',
  `ext_attrs` text NOT NULL COMMENT '扩展字段',
  `task_status` tinyint NOT NULL DEFAULT '1' COMMENT '重试状态',
  `task_type` tinyint NOT NULL DEFAULT '1' COMMENT '任务类型 1、重试数据 2、回调数据',
  `operation_reason` tinyint NOT NULL DEFAULT '0' COMMENT '操作原因',
  `client_info` varchar(128) DEFAULT NULL COMMENT '客户端地址 clientId#ip:port',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_group_name_scene_name` (`namespace_id`,`group_name`,`scene_name`),
  KEY `task_status` (`task_status`),
  KEY `idx_create_dt` (`create_dt`),
  KEY `idx_retry_id` (`retry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='重试任务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sj_retry_task`
--

LOCK TABLES `sj_retry_task` WRITE;
/*!40000 ALTER TABLE `sj_retry_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `sj_retry_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sj_retry_task_log_message`
--

DROP TABLE IF EXISTS `sj_retry_task_log_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sj_retry_task_log_message` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) NOT NULL COMMENT '组名称',
  `retry_id` bigint NOT NULL COMMENT '重试信息Id',
  `retry_task_id` bigint NOT NULL COMMENT '重试任务Id',
  `message` longtext NOT NULL COMMENT '异常信息',
  `log_num` int NOT NULL DEFAULT '1' COMMENT '日志数量',
  `real_time` bigint NOT NULL DEFAULT '0' COMMENT '上报时间',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_namespace_id_group_name_retry_task_id` (`namespace_id`,`group_name`,`retry_task_id`),
  KEY `idx_create_dt` (`create_dt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='任务调度日志信息记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sj_retry_task_log_message`
--

LOCK TABLES `sj_retry_task_log_message` WRITE;
/*!40000 ALTER TABLE `sj_retry_task_log_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `sj_retry_task_log_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sj_server_node`
--

DROP TABLE IF EXISTS `sj_server_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sj_server_node` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) NOT NULL COMMENT '组名称',
  `host_id` varchar(64) NOT NULL COMMENT '主机id',
  `host_ip` varchar(64) NOT NULL COMMENT '机器ip',
  `host_port` int NOT NULL COMMENT '机器端口',
  `expire_at` datetime NOT NULL COMMENT '过期时间',
  `node_type` tinyint NOT NULL COMMENT '节点类型 1、客户端 2、是服务端',
  `ext_attrs` varchar(256) DEFAULT '' COMMENT '扩展字段',
  `labels` varchar(512) DEFAULT '' COMMENT '标签',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_host_id_host_ip` (`host_id`,`host_ip`),
  KEY `idx_namespace_id_group_name` (`namespace_id`,`group_name`),
  KEY `idx_expire_at_node_type` (`expire_at`,`node_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='服务器节点';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sj_server_node`
--

LOCK TABLES `sj_server_node` WRITE;
/*!40000 ALTER TABLE `sj_server_node` DISABLE KEYS */;
/*!40000 ALTER TABLE `sj_server_node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sj_system_user`
--

DROP TABLE IF EXISTS `sj_system_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sj_system_user` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(64) NOT NULL COMMENT '账号',
  `password` varchar(128) NOT NULL COMMENT '密码',
  `role` tinyint NOT NULL DEFAULT '0' COMMENT '角色：1-普通用户、2-管理员',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sj_system_user`
--

LOCK TABLES `sj_system_user` WRITE;
/*!40000 ALTER TABLE `sj_system_user` DISABLE KEYS */;
INSERT INTO `sj_system_user` VALUES (1,'admin','465c194afb65670f38322df087f0a9bb225cc257e43eb4ac5a0c98ef5b3173ac',2,'2025-09-17 21:52:17','2025-09-17 21:52:17');
/*!40000 ALTER TABLE `sj_system_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sj_system_user_permission`
--

DROP TABLE IF EXISTS `sj_system_user_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sj_system_user_permission` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `group_name` varchar(64) NOT NULL COMMENT '组名称',
  `namespace_id` varchar(64) NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `system_user_id` bigint NOT NULL COMMENT '系统用户id',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_namespace_id_group_name_system_user_id` (`namespace_id`,`group_name`,`system_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统用户权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sj_system_user_permission`
--

LOCK TABLES `sj_system_user_permission` WRITE;
/*!40000 ALTER TABLE `sj_system_user_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `sj_system_user_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sj_workflow`
--

DROP TABLE IF EXISTS `sj_workflow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sj_workflow` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `workflow_name` varchar(64) NOT NULL COMMENT '工作流名称',
  `namespace_id` varchar(64) NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) NOT NULL COMMENT '组名称',
  `workflow_status` tinyint NOT NULL DEFAULT '1' COMMENT '工作流状态 0、关闭、1、开启',
  `trigger_type` tinyint NOT NULL COMMENT '触发类型 1.CRON 表达式 2. 固定时间',
  `trigger_interval` varchar(255) NOT NULL COMMENT '间隔时长',
  `next_trigger_at` bigint NOT NULL COMMENT '下次触发时间',
  `block_strategy` tinyint NOT NULL DEFAULT '1' COMMENT '阻塞策略 1、丢弃 2、覆盖 3、并行',
  `executor_timeout` int NOT NULL DEFAULT '0' COMMENT '任务执行超时时间，单位秒',
  `description` varchar(256) NOT NULL DEFAULT '' COMMENT '描述',
  `flow_info` text COMMENT '流程信息',
  `wf_context` text COMMENT '上下文',
  `notify_ids` varchar(128) NOT NULL DEFAULT '' COMMENT '通知告警场景配置id列表',
  `bucket_index` int NOT NULL DEFAULT '0' COMMENT 'bucket',
  `version` int NOT NULL COMMENT '版本号',
  `owner_id` bigint DEFAULT NULL COMMENT '负责人id',
  `ext_attrs` varchar(256) DEFAULT '' COMMENT '扩展字段',
  `deleted` tinyint NOT NULL DEFAULT '0' COMMENT '逻辑删除 1、删除',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_create_dt` (`create_dt`),
  KEY `idx_namespace_id_group_name` (`namespace_id`,`group_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='工作流';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sj_workflow`
--

LOCK TABLES `sj_workflow` WRITE;
/*!40000 ALTER TABLE `sj_workflow` DISABLE KEYS */;
/*!40000 ALTER TABLE `sj_workflow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sj_workflow_node`
--

DROP TABLE IF EXISTS `sj_workflow_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sj_workflow_node` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `node_name` varchar(64) NOT NULL COMMENT '节点名称',
  `group_name` varchar(64) NOT NULL COMMENT '组名称',
  `job_id` bigint NOT NULL COMMENT '任务信息id',
  `workflow_id` bigint NOT NULL COMMENT '工作流ID',
  `node_type` tinyint NOT NULL DEFAULT '1' COMMENT '1、任务节点 2、条件节点',
  `expression_type` tinyint NOT NULL DEFAULT '0' COMMENT '1、SpEl、2、Aviator 3、QL',
  `fail_strategy` tinyint NOT NULL DEFAULT '1' COMMENT '失败策略 1、跳过 2、阻塞',
  `workflow_node_status` tinyint NOT NULL DEFAULT '1' COMMENT '工作流节点状态 0、关闭、1、开启',
  `priority_level` int NOT NULL DEFAULT '1' COMMENT '优先级',
  `node_info` text COMMENT '节点信息 ',
  `version` int NOT NULL COMMENT '版本号',
  `ext_attrs` varchar(256) DEFAULT '' COMMENT '扩展字段',
  `deleted` tinyint NOT NULL DEFAULT '0' COMMENT '逻辑删除 1、删除',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_create_dt` (`create_dt`),
  KEY `idx_namespace_id_group_name` (`namespace_id`,`group_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='工作流节点';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sj_workflow_node`
--

LOCK TABLES `sj_workflow_node` WRITE;
/*!40000 ALTER TABLE `sj_workflow_node` DISABLE KEYS */;
/*!40000 ALTER TABLE `sj_workflow_node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sj_workflow_task_batch`
--

DROP TABLE IF EXISTS `sj_workflow_task_batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sj_workflow_task_batch` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) NOT NULL COMMENT '组名称',
  `workflow_id` bigint NOT NULL COMMENT '工作流任务id',
  `task_batch_status` tinyint NOT NULL DEFAULT '0' COMMENT '任务批次状态 0、失败 1、成功',
  `operation_reason` tinyint NOT NULL DEFAULT '0' COMMENT '操作原因',
  `flow_info` text COMMENT '流程信息',
  `wf_context` text COMMENT '全局上下文',
  `execution_at` bigint NOT NULL DEFAULT '0' COMMENT '任务执行时间',
  `ext_attrs` varchar(256) DEFAULT '' COMMENT '扩展字段',
  `version` int NOT NULL DEFAULT '1' COMMENT '版本号',
  `deleted` tinyint NOT NULL DEFAULT '0' COMMENT '逻辑删除 1、删除',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_job_id_task_batch_status` (`workflow_id`,`task_batch_status`),
  KEY `idx_create_dt` (`create_dt`),
  KEY `idx_namespace_id_group_name` (`namespace_id`,`group_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='工作流批次';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sj_workflow_task_batch`
--

LOCK TABLES `sj_workflow_task_batch` WRITE;
/*!40000 ALTER TABLE `sj_workflow_task_batch` DISABLE KEYS */;
/*!40000 ALTER TABLE `sj_workflow_task_batch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_client`
--

DROP TABLE IF EXISTS `sys_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_client` (
  `id` bigint NOT NULL COMMENT 'id',
  `client_id` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户端id',
  `client_key` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户端key',
  `client_secret` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户端秘钥',
  `grant_type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '授权类型',
  `device_type` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '设备类型',
  `active_timeout` int DEFAULT '1800' COMMENT 'token活跃超时时间',
  `timeout` int DEFAULT '604800' COMMENT 'token固定超时',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='系统授权表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_client`
--

LOCK TABLES `sys_client` WRITE;
/*!40000 ALTER TABLE `sys_client` DISABLE KEYS */;
INSERT INTO `sys_client` VALUES (1,'e5cd7e4891bf95d1d19206ce24a7b32e','pc','pc123','password,social','pc',1800,604800,'0','0',103,1,'2025-09-17 21:41:04',1,'2025-09-17 21:41:04'),(2,'428a8310cd442757ae699df5d894f051','app','app123','password,sms,social','android',1800,604800,'0','0',103,1,'2025-09-17 21:41:04',1,'2025-09-17 21:41:04');
/*!40000 ALTER TABLE `sys_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_config` (
  `config_id` bigint NOT NULL COMMENT '参数主键',
  `tenant_id` varchar(20) COLLATE utf8mb4_general_ci DEFAULT '000000' COMMENT '租户编号',
  `config_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) COLLATE utf8mb4_general_ci DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='参数配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES (1,'000000','主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y',103,1,'2025-09-17 21:41:04',NULL,NULL,'蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),(2,'000000','用户管理-账号初始密码','sys.user.initPassword','123456','Y',103,1,'2025-09-17 21:41:04',NULL,NULL,'初始化密码 123456'),(3,'000000','主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y',103,1,'2025-09-17 21:41:04',NULL,NULL,'深色主题theme-dark，浅色主题theme-light'),(5,'000000','账号自助-是否开启用户注册功能','sys.account.registerUser','false','Y',103,1,'2025-09-17 21:41:04',NULL,NULL,'是否开启注册用户功能（true开启，false关闭）'),(11,'000000','OSS预览列表资源开关','sys.oss.previewListResource','true','Y',103,1,'2025-09-17 21:41:04',NULL,NULL,'true:开启, false:关闭');
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL COMMENT '部门id',
  `tenant_id` varchar(20) COLLATE utf8mb4_general_ci DEFAULT '000000' COMMENT '租户编号',
  `parent_id` bigint DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(500) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '部门名称',
  `dept_category` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '部门类别编码',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `leader` bigint DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES (100,'000000',0,'0','XXX科技',NULL,0,NULL,'15888888888','xxx@qq.com','0','0',103,1,'2025-09-17 21:41:04',NULL,NULL),(101,'000000',100,'0,100','深圳总公司',NULL,1,NULL,'15888888888','xxx@qq.com','0','0',103,1,'2025-09-17 21:41:04',NULL,NULL),(102,'000000',100,'0,100','长沙分公司',NULL,2,NULL,'15888888888','xxx@qq.com','0','0',103,1,'2025-09-17 21:41:04',NULL,NULL),(103,'000000',101,'0,100,101','研发部门',NULL,1,1,'15888888888','xxx@qq.com','0','0',103,1,'2025-09-17 21:41:04',NULL,NULL),(104,'000000',101,'0,100,101','市场部门',NULL,2,NULL,'15888888888','xxx@qq.com','0','0',103,1,'2025-09-17 21:41:04',NULL,NULL),(105,'000000',101,'0,100,101','测试部门',NULL,3,NULL,'15888888888','xxx@qq.com','0','0',103,1,'2025-09-17 21:41:04',NULL,NULL),(106,'000000',101,'0,100,101','财务部门',NULL,4,NULL,'15888888888','xxx@qq.com','0','0',103,1,'2025-09-17 21:41:04',NULL,NULL),(107,'000000',101,'0,100,101','运维部门',NULL,5,NULL,'15888888888','xxx@qq.com','0','0',103,1,'2025-09-17 21:41:04',NULL,NULL),(108,'000000',102,'0,100,102','市场部门',NULL,1,NULL,'15888888888','xxx@qq.com','0','0',103,1,'2025-09-17 21:41:04',NULL,NULL),(109,'000000',102,'0,100,102','财务部门',NULL,2,NULL,'15888888888','xxx@qq.com','0','0',103,1,'2025-09-17 21:41:04',NULL,NULL);
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_data`
--

DROP TABLE IF EXISTS `sys_dict_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint NOT NULL COMMENT '字典编码',
  `tenant_id` varchar(20) COLLATE utf8mb4_general_ci DEFAULT '000000' COMMENT '租户编号',
  `dict_sort` int DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) COLLATE utf8mb4_general_ci DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='字典数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_data`
--

LOCK TABLES `sys_dict_data` WRITE;
/*!40000 ALTER TABLE `sys_dict_data` DISABLE KEYS */;
INSERT INTO `sys_dict_data` VALUES (1,'000000',1,'男','0','sys_user_sex','','','Y',103,1,'2025-09-17 21:41:04',NULL,NULL,'性别男'),(2,'000000',2,'女','1','sys_user_sex','','','N',103,1,'2025-09-17 21:41:04',NULL,NULL,'性别女'),(3,'000000',3,'未知','2','sys_user_sex','','','N',103,1,'2025-09-17 21:41:04',NULL,NULL,'性别未知'),(4,'000000',1,'显示','0','sys_show_hide','','primary','Y',103,1,'2025-09-17 21:41:04',NULL,NULL,'显示菜单'),(5,'000000',2,'隐藏','1','sys_show_hide','','danger','N',103,1,'2025-09-17 21:41:04',NULL,NULL,'隐藏菜单'),(6,'000000',1,'正常','0','sys_normal_disable','','primary','Y',103,1,'2025-09-17 21:41:04',NULL,NULL,'正常状态'),(7,'000000',2,'停用','1','sys_normal_disable','','danger','N',103,1,'2025-09-17 21:41:04',NULL,NULL,'停用状态'),(12,'000000',1,'是','Y','sys_yes_no','','primary','Y',103,1,'2025-09-17 21:41:04',NULL,NULL,'系统默认是'),(13,'000000',2,'否','N','sys_yes_no','','danger','N',103,1,'2025-09-17 21:41:04',NULL,NULL,'系统默认否'),(14,'000000',1,'通知','1','sys_notice_type','','warning','Y',103,1,'2025-09-17 21:41:04',NULL,NULL,'通知'),(15,'000000',2,'公告','2','sys_notice_type','','success','N',103,1,'2025-09-17 21:41:04',NULL,NULL,'公告'),(16,'000000',1,'正常','0','sys_notice_status','','primary','Y',103,1,'2025-09-17 21:41:04',NULL,NULL,'正常状态'),(17,'000000',2,'关闭','1','sys_notice_status','','danger','N',103,1,'2025-09-17 21:41:04',NULL,NULL,'关闭状态'),(18,'000000',1,'新增','1','sys_oper_type','','info','N',103,1,'2025-09-17 21:41:04',NULL,NULL,'新增操作'),(19,'000000',2,'修改','2','sys_oper_type','','info','N',103,1,'2025-09-17 21:41:04',NULL,NULL,'修改操作'),(20,'000000',3,'删除','3','sys_oper_type','','danger','N',103,1,'2025-09-17 21:41:04',NULL,NULL,'删除操作'),(21,'000000',4,'授权','4','sys_oper_type','','primary','N',103,1,'2025-09-17 21:41:04',NULL,NULL,'授权操作'),(22,'000000',5,'导出','5','sys_oper_type','','warning','N',103,1,'2025-09-17 21:41:04',NULL,NULL,'导出操作'),(23,'000000',6,'导入','6','sys_oper_type','','warning','N',103,1,'2025-09-17 21:41:04',NULL,NULL,'导入操作'),(24,'000000',7,'强退','7','sys_oper_type','','danger','N',103,1,'2025-09-17 21:41:04',NULL,NULL,'强退操作'),(25,'000000',8,'生成代码','8','sys_oper_type','','warning','N',103,1,'2025-09-17 21:41:04',NULL,NULL,'生成操作'),(26,'000000',9,'清空数据','9','sys_oper_type','','danger','N',103,1,'2025-09-17 21:41:04',NULL,NULL,'清空操作'),(27,'000000',1,'成功','0','sys_common_status','','primary','N',103,1,'2025-09-17 21:41:04',NULL,NULL,'正常状态'),(28,'000000',2,'失败','1','sys_common_status','','danger','N',103,1,'2025-09-17 21:41:04',NULL,NULL,'停用状态'),(29,'000000',99,'其他','0','sys_oper_type','','info','N',103,1,'2025-09-17 21:41:04',NULL,NULL,'其他操作'),(30,'000000',0,'密码认证','password','sys_grant_type','el-check-tag','default','N',103,1,'2025-09-17 21:41:04',NULL,NULL,'密码认证'),(31,'000000',0,'短信认证','sms','sys_grant_type','el-check-tag','default','N',103,1,'2025-09-17 21:41:04',NULL,NULL,'短信认证'),(32,'000000',0,'邮件认证','email','sys_grant_type','el-check-tag','default','N',103,1,'2025-09-17 21:41:04',NULL,NULL,'邮件认证'),(33,'000000',0,'小程序认证','xcx','sys_grant_type','el-check-tag','default','N',103,1,'2025-09-17 21:41:04',NULL,NULL,'小程序认证'),(34,'000000',0,'三方登录认证','social','sys_grant_type','el-check-tag','default','N',103,1,'2025-09-17 21:41:04',NULL,NULL,'三方登录认证'),(35,'000000',0,'PC','pc','sys_device_type','','default','N',103,1,'2025-09-17 21:41:04',NULL,NULL,'PC'),(36,'000000',0,'安卓','android','sys_device_type','','default','N',103,1,'2025-09-17 21:41:04',NULL,NULL,'安卓'),(37,'000000',0,'iOS','ios','sys_device_type','','default','N',103,1,'2025-09-17 21:41:04',NULL,NULL,'iOS'),(38,'000000',0,'小程序','xcx','sys_device_type','','default','N',103,1,'2025-09-17 21:41:04',NULL,NULL,'小程序'),(39,'000000',1,'已撤销','cancel','wf_business_status','','danger','N',103,1,'2025-09-17 22:01:10',NULL,NULL,'已撤销'),(40,'000000',2,'草稿','draft','wf_business_status','','info','N',103,1,'2025-09-17 22:01:10',NULL,NULL,'草稿'),(41,'000000',3,'待审核','waiting','wf_business_status','','primary','N',103,1,'2025-09-17 22:01:10',NULL,NULL,'待审核'),(42,'000000',4,'已完成','finish','wf_business_status','','success','N',103,1,'2025-09-17 22:01:10',NULL,NULL,'已完成'),(43,'000000',5,'已作废','invalid','wf_business_status','','danger','N',103,1,'2025-09-17 22:01:10',NULL,NULL,'已作废'),(44,'000000',6,'已退回','back','wf_business_status','','danger','N',103,1,'2025-09-17 22:01:10',NULL,NULL,'已退回'),(45,'000000',7,'已终止','termination','wf_business_status','','danger','N',103,1,'2025-09-17 22:01:10',NULL,NULL,'已终止'),(46,'000000',1,'自定义表单','static','wf_form_type','','success','N',103,1,'2025-09-17 22:01:10',NULL,NULL,'自定义表单'),(47,'000000',2,'动态表单','dynamic','wf_form_type','','primary','N',103,1,'2025-09-17 22:01:10',NULL,NULL,'动态表单'),(48,'000000',1,'撤销','cancel','wf_task_status','','danger','N',103,1,'2025-09-17 22:01:10',NULL,NULL,'撤销'),(49,'000000',2,'通过','pass','wf_task_status','','success','N',103,1,'2025-09-17 22:01:10',NULL,NULL,'通过'),(50,'000000',3,'待审核','waiting','wf_task_status','','primary','N',103,1,'2025-09-17 22:01:10',NULL,NULL,'待审核'),(51,'000000',4,'作废','invalid','wf_task_status','','danger','N',103,1,'2025-09-17 22:01:10',NULL,NULL,'作废'),(52,'000000',5,'退回','back','wf_task_status','','danger','N',103,1,'2025-09-17 22:01:10',NULL,NULL,'退回'),(53,'000000',6,'终止','termination','wf_task_status','','danger','N',103,1,'2025-09-17 22:01:10',NULL,NULL,'终止'),(54,'000000',7,'转办','transfer','wf_task_status','','primary','N',103,1,'2025-09-17 22:01:10',NULL,NULL,'转办'),(55,'000000',8,'委托','depute','wf_task_status','','primary','N',103,1,'2025-09-17 22:01:10',NULL,NULL,'委托'),(56,'000000',9,'抄送','copy','wf_task_status','','primary','N',103,1,'2025-09-17 22:01:10',NULL,NULL,'抄送'),(57,'000000',10,'加签','sign','wf_task_status','','primary','N',103,1,'2025-09-17 22:01:10',NULL,NULL,'加签'),(58,'000000',11,'减签','sign_off','wf_task_status','','danger','N',103,1,'2025-09-17 22:01:10',NULL,NULL,'减签'),(59,'000000',11,'超时','timeout','wf_task_status','','danger','N',103,1,'2025-09-17 22:01:10',NULL,NULL,'超时');
/*!40000 ALTER TABLE `sys_dict_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_type`
--

DROP TABLE IF EXISTS `sys_dict_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint NOT NULL COMMENT '字典主键',
  `tenant_id` varchar(20) COLLATE utf8mb4_general_ci DEFAULT '000000' COMMENT '租户编号',
  `dict_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典类型',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `tenant_id` (`tenant_id`,`dict_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='字典类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_type`
--

LOCK TABLES `sys_dict_type` WRITE;
/*!40000 ALTER TABLE `sys_dict_type` DISABLE KEYS */;
INSERT INTO `sys_dict_type` VALUES (1,'000000','用户性别','sys_user_sex',103,1,'2025-09-17 21:41:04',NULL,NULL,'用户性别列表'),(2,'000000','菜单状态','sys_show_hide',103,1,'2025-09-17 21:41:04',NULL,NULL,'菜单状态列表'),(3,'000000','系统开关','sys_normal_disable',103,1,'2025-09-17 21:41:04',NULL,NULL,'系统开关列表'),(6,'000000','系统是否','sys_yes_no',103,1,'2025-09-17 21:41:04',NULL,NULL,'系统是否列表'),(7,'000000','通知类型','sys_notice_type',103,1,'2025-09-17 21:41:04',NULL,NULL,'通知类型列表'),(8,'000000','通知状态','sys_notice_status',103,1,'2025-09-17 21:41:04',NULL,NULL,'通知状态列表'),(9,'000000','操作类型','sys_oper_type',103,1,'2025-09-17 21:41:04',NULL,NULL,'操作类型列表'),(10,'000000','系统状态','sys_common_status',103,1,'2025-09-17 21:41:04',NULL,NULL,'登录状态列表'),(11,'000000','授权类型','sys_grant_type',103,1,'2025-09-17 21:41:04',NULL,NULL,'认证授权类型'),(12,'000000','设备类型','sys_device_type',103,1,'2025-09-17 21:41:04',NULL,NULL,'客户端设备类型'),(13,'000000','业务状态','wf_business_status',103,1,'2025-09-17 22:01:10',NULL,NULL,'业务状态列表'),(14,'000000','表单类型','wf_form_type',103,1,'2025-09-17 22:01:10',NULL,NULL,'表单类型列表'),(15,'000000','任务状态','wf_task_status',103,1,'2025-09-17 22:01:10',NULL,NULL,'任务状态');
/*!40000 ALTER TABLE `sys_dict_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_logininfor`
--

DROP TABLE IF EXISTS `sys_logininfor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint NOT NULL COMMENT '访问ID',
  `tenant_id` varchar(20) COLLATE utf8mb4_general_ci DEFAULT '000000' COMMENT '租户编号',
  `user_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '用户账号',
  `client_key` varchar(32) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '客户端',
  `device_type` varchar(32) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '设备类型',
  `ipaddr` varchar(128) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '操作系统',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`),
  KEY `idx_sys_logininfor_s` (`status`),
  KEY `idx_sys_logininfor_lt` (`login_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='系统访问记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_logininfor`
--

LOCK TABLES `sys_logininfor` WRITE;
/*!40000 ALTER TABLE `sys_logininfor` DISABLE KEYS */;
INSERT INTO `sys_logininfor` VALUES (1968321757412708353,'000000','admin','pc','pc','0:0:0:0:0:0:0:1','内网IP','Chrome','OSX','0','登录成功','2025-09-17 22:30:51');
/*!40000 ALTER TABLE `sys_logininfor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  `menu_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组件路径',
  `query_param` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '路由参数',
  `is_frame` int DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '显示状态（0显示 1隐藏）',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '#' COMMENT '菜单图标',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='菜单权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'系统管理',0,1,'system',NULL,'',1,0,'M','0','0','','system',103,1,'2025-09-17 21:41:04',NULL,NULL,'系统管理目录'),(2,'系统监控',0,3,'monitor',NULL,'',1,0,'M','0','0','','monitor',103,1,'2025-09-17 21:41:04',NULL,NULL,'系统监控目录'),(3,'系统工具',0,4,'tool',NULL,'',1,0,'M','0','0','','tool',103,1,'2025-09-17 21:41:04',NULL,NULL,'系统工具目录'),(4,'PLUS官网',0,5,'https://gitee.com/dromara/RuoYi-Vue-Plus',NULL,'',0,0,'M','0','0','','guide',103,1,'2025-09-17 21:41:04',NULL,NULL,'RuoYi-Vue-Plus官网地址'),(5,'测试菜单',0,5,'demo',NULL,'',1,0,'M','0','0','','star',103,1,'2025-09-17 21:41:04',NULL,NULL,'测试菜单'),(6,'租户管理',0,2,'tenant',NULL,'',1,0,'M','0','0','','chart',103,1,'2025-09-17 21:41:04',NULL,NULL,'租户管理目录'),(100,'用户管理',1,1,'user','system/user/index','',1,0,'C','0','0','system:user:list','user',103,1,'2025-09-17 21:41:04',NULL,NULL,'用户管理菜单'),(101,'角色管理',1,2,'role','system/role/index','',1,0,'C','0','0','system:role:list','peoples',103,1,'2025-09-17 21:41:04',NULL,NULL,'角色管理菜单'),(102,'菜单管理',1,3,'menu','system/menu/index','',1,0,'C','0','0','system:menu:list','tree-table',103,1,'2025-09-17 21:41:04',NULL,NULL,'菜单管理菜单'),(103,'部门管理',1,4,'dept','system/dept/index','',1,0,'C','0','0','system:dept:list','tree',103,1,'2025-09-17 21:41:04',NULL,NULL,'部门管理菜单'),(104,'岗位管理',1,5,'post','system/post/index','',1,0,'C','0','0','system:post:list','post',103,1,'2025-09-17 21:41:04',NULL,NULL,'岗位管理菜单'),(105,'字典管理',1,6,'dict','system/dict/index','',1,0,'C','0','0','system:dict:list','dict',103,1,'2025-09-17 21:41:04',NULL,NULL,'字典管理菜单'),(106,'参数设置',1,7,'config','system/config/index','',1,0,'C','0','0','system:config:list','edit',103,1,'2025-09-17 21:41:04',NULL,NULL,'参数设置菜单'),(107,'通知公告',1,8,'notice','system/notice/index','',1,0,'C','0','0','system:notice:list','message',103,1,'2025-09-17 21:41:04',NULL,NULL,'通知公告菜单'),(108,'日志管理',1,9,'log','','',1,0,'M','0','0','','log',103,1,'2025-09-17 21:41:04',NULL,NULL,'日志管理菜单'),(109,'在线用户',2,1,'online','monitor/online/index','',1,0,'C','0','0','monitor:online:list','online',103,1,'2025-09-17 21:41:04',NULL,NULL,'在线用户菜单'),(113,'缓存监控',2,5,'cache','monitor/cache/index','',1,0,'C','0','0','monitor:cache:list','redis',103,1,'2025-09-17 21:41:04',NULL,NULL,'缓存监控菜单'),(115,'代码生成',3,2,'gen','tool/gen/index','',1,0,'C','0','0','tool:gen:list','code',103,1,'2025-09-17 21:41:04',NULL,NULL,'代码生成菜单'),(116,'修改生成配置',3,2,'gen-edit/index/:tableId','tool/gen/editTable','',1,1,'C','1','0','tool:gen:edit','#',103,1,'2025-09-17 21:41:04',NULL,NULL,'/tool/gen'),(117,'Admin监控',2,5,'Admin','monitor/admin/index','',1,0,'C','0','0','monitor:admin:list','dashboard',103,1,'2025-09-17 21:41:04',NULL,NULL,'Admin监控菜单'),(118,'文件管理',1,10,'oss','system/oss/index','',1,0,'C','0','0','system:oss:list','upload',103,1,'2025-09-17 21:41:04',NULL,NULL,'文件管理菜单'),(120,'任务调度中心',2,6,'snailjob','monitor/snailjob/index','',1,0,'C','0','0','monitor:snailjob:list','job',103,1,'2025-09-17 21:41:04',NULL,NULL,'SnailJob控制台菜单'),(121,'租户管理',6,1,'tenant','system/tenant/index','',1,0,'C','0','0','system:tenant:list','list',103,1,'2025-09-17 21:41:04',NULL,NULL,'租户管理菜单'),(122,'租户套餐管理',6,2,'tenantPackage','system/tenantPackage/index','',1,0,'C','0','0','system:tenantPackage:list','form',103,1,'2025-09-17 21:41:04',NULL,NULL,'租户套餐管理菜单'),(123,'客户端管理',1,11,'client','system/client/index','',1,0,'C','0','0','system:client:list','international',103,1,'2025-09-17 21:41:04',NULL,NULL,'客户端管理菜单'),(130,'分配用户',1,2,'role-auth/user/:roleId','system/role/authUser','',1,1,'C','1','0','system:role:edit','#',103,1,'2025-09-17 21:41:04',NULL,NULL,'/system/role'),(131,'分配角色',1,1,'user-auth/role/:userId','system/user/authRole','',1,1,'C','1','0','system:user:edit','#',103,1,'2025-09-17 21:41:04',NULL,NULL,'/system/user'),(132,'字典数据',1,6,'dict-data/index/:dictId','system/dict/data','',1,1,'C','1','0','system:dict:list','#',103,1,'2025-09-17 21:41:04',NULL,NULL,'/system/dict'),(133,'文件配置管理',1,10,'oss-config/index','system/oss/config','',1,1,'C','1','0','system:ossConfig:list','#',103,1,'2025-09-17 21:41:04',NULL,NULL,'/system/oss'),(500,'操作日志',108,1,'operlog','monitor/operlog/index','',1,0,'C','0','0','monitor:operlog:list','form',103,1,'2025-09-17 21:41:04',NULL,NULL,'操作日志菜单'),(501,'登录日志',108,2,'logininfor','monitor/logininfor/index','',1,0,'C','0','0','monitor:logininfor:list','logininfor',103,1,'2025-09-17 21:41:04',NULL,NULL,'登录日志菜单'),(1001,'用户查询',100,1,'','','',1,0,'F','0','0','system:user:query','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1002,'用户新增',100,2,'','','',1,0,'F','0','0','system:user:add','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1003,'用户修改',100,3,'','','',1,0,'F','0','0','system:user:edit','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1004,'用户删除',100,4,'','','',1,0,'F','0','0','system:user:remove','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1005,'用户导出',100,5,'','','',1,0,'F','0','0','system:user:export','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1006,'用户导入',100,6,'','','',1,0,'F','0','0','system:user:import','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1007,'重置密码',100,7,'','','',1,0,'F','0','0','system:user:resetPwd','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1008,'角色查询',101,1,'','','',1,0,'F','0','0','system:role:query','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1009,'角色新增',101,2,'','','',1,0,'F','0','0','system:role:add','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1010,'角色修改',101,3,'','','',1,0,'F','0','0','system:role:edit','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1011,'角色删除',101,4,'','','',1,0,'F','0','0','system:role:remove','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1012,'角色导出',101,5,'','','',1,0,'F','0','0','system:role:export','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1013,'菜单查询',102,1,'','','',1,0,'F','0','0','system:menu:query','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1014,'菜单新增',102,2,'','','',1,0,'F','0','0','system:menu:add','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1015,'菜单修改',102,3,'','','',1,0,'F','0','0','system:menu:edit','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1016,'菜单删除',102,4,'','','',1,0,'F','0','0','system:menu:remove','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1017,'部门查询',103,1,'','','',1,0,'F','0','0','system:dept:query','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1018,'部门新增',103,2,'','','',1,0,'F','0','0','system:dept:add','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1019,'部门修改',103,3,'','','',1,0,'F','0','0','system:dept:edit','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1020,'部门删除',103,4,'','','',1,0,'F','0','0','system:dept:remove','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1021,'岗位查询',104,1,'','','',1,0,'F','0','0','system:post:query','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1022,'岗位新增',104,2,'','','',1,0,'F','0','0','system:post:add','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1023,'岗位修改',104,3,'','','',1,0,'F','0','0','system:post:edit','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1024,'岗位删除',104,4,'','','',1,0,'F','0','0','system:post:remove','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1025,'岗位导出',104,5,'','','',1,0,'F','0','0','system:post:export','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1026,'字典查询',105,1,'#','','',1,0,'F','0','0','system:dict:query','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1027,'字典新增',105,2,'#','','',1,0,'F','0','0','system:dict:add','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1028,'字典修改',105,3,'#','','',1,0,'F','0','0','system:dict:edit','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1029,'字典删除',105,4,'#','','',1,0,'F','0','0','system:dict:remove','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1030,'字典导出',105,5,'#','','',1,0,'F','0','0','system:dict:export','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1031,'参数查询',106,1,'#','','',1,0,'F','0','0','system:config:query','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1032,'参数新增',106,2,'#','','',1,0,'F','0','0','system:config:add','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1033,'参数修改',106,3,'#','','',1,0,'F','0','0','system:config:edit','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1034,'参数删除',106,4,'#','','',1,0,'F','0','0','system:config:remove','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1035,'参数导出',106,5,'#','','',1,0,'F','0','0','system:config:export','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1036,'公告查询',107,1,'#','','',1,0,'F','0','0','system:notice:query','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1037,'公告新增',107,2,'#','','',1,0,'F','0','0','system:notice:add','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1038,'公告修改',107,3,'#','','',1,0,'F','0','0','system:notice:edit','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1039,'公告删除',107,4,'#','','',1,0,'F','0','0','system:notice:remove','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1040,'操作查询',500,1,'#','','',1,0,'F','0','0','monitor:operlog:query','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1041,'操作删除',500,2,'#','','',1,0,'F','0','0','monitor:operlog:remove','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1042,'日志导出',500,4,'#','','',1,0,'F','0','0','monitor:operlog:export','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1043,'登录查询',501,1,'#','','',1,0,'F','0','0','monitor:logininfor:query','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1044,'登录删除',501,2,'#','','',1,0,'F','0','0','monitor:logininfor:remove','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1045,'日志导出',501,3,'#','','',1,0,'F','0','0','monitor:logininfor:export','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1046,'在线查询',109,1,'#','','',1,0,'F','0','0','monitor:online:query','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1047,'批量强退',109,2,'#','','',1,0,'F','0','0','monitor:online:batchLogout','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1048,'单条强退',109,3,'#','','',1,0,'F','0','0','monitor:online:forceLogout','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1050,'账户解锁',501,4,'#','','',1,0,'F','0','0','monitor:logininfor:unlock','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1055,'生成查询',115,1,'#','','',1,0,'F','0','0','tool:gen:query','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1056,'生成修改',115,2,'#','','',1,0,'F','0','0','tool:gen:edit','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1057,'生成删除',115,3,'#','','',1,0,'F','0','0','tool:gen:remove','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1058,'导入代码',115,2,'#','','',1,0,'F','0','0','tool:gen:import','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1059,'预览代码',115,4,'#','','',1,0,'F','0','0','tool:gen:preview','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1060,'生成代码',115,5,'#','','',1,0,'F','0','0','tool:gen:code','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1061,'客户端管理查询',123,1,'#','','',1,0,'F','0','0','system:client:query','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1062,'客户端管理新增',123,2,'#','','',1,0,'F','0','0','system:client:add','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1063,'客户端管理修改',123,3,'#','','',1,0,'F','0','0','system:client:edit','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1064,'客户端管理删除',123,4,'#','','',1,0,'F','0','0','system:client:remove','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1065,'客户端管理导出',123,5,'#','','',1,0,'F','0','0','system:client:export','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1500,'测试单表',5,1,'demo','demo/demo/index','',1,0,'C','0','0','demo:demo:list','#',103,1,'2025-09-17 21:41:04',NULL,NULL,'测试单表菜单'),(1501,'测试单表查询',1500,1,'#','','',1,0,'F','0','0','demo:demo:query','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1502,'测试单表新增',1500,2,'#','','',1,0,'F','0','0','demo:demo:add','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1503,'测试单表修改',1500,3,'#','','',1,0,'F','0','0','demo:demo:edit','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1504,'测试单表删除',1500,4,'#','','',1,0,'F','0','0','demo:demo:remove','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1505,'测试单表导出',1500,5,'#','','',1,0,'F','0','0','demo:demo:export','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1506,'测试树表',5,1,'tree','demo/tree/index','',1,0,'C','0','0','demo:tree:list','#',103,1,'2025-09-17 21:41:04',NULL,NULL,'测试树表菜单'),(1507,'测试树表查询',1506,1,'#','','',1,0,'F','0','0','demo:tree:query','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1508,'测试树表新增',1506,2,'#','','',1,0,'F','0','0','demo:tree:add','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1509,'测试树表修改',1506,3,'#','','',1,0,'F','0','0','demo:tree:edit','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1510,'测试树表删除',1506,4,'#','','',1,0,'F','0','0','demo:tree:remove','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1511,'测试树表导出',1506,5,'#','','',1,0,'F','0','0','demo:tree:export','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1600,'文件查询',118,1,'#','','',1,0,'F','0','0','system:oss:query','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1601,'文件上传',118,2,'#','','',1,0,'F','0','0','system:oss:upload','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1602,'文件下载',118,3,'#','','',1,0,'F','0','0','system:oss:download','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1603,'文件删除',118,4,'#','','',1,0,'F','0','0','system:oss:remove','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1606,'租户查询',121,1,'#','','',1,0,'F','0','0','system:tenant:query','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1607,'租户新增',121,2,'#','','',1,0,'F','0','0','system:tenant:add','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1608,'租户修改',121,3,'#','','',1,0,'F','0','0','system:tenant:edit','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1609,'租户删除',121,4,'#','','',1,0,'F','0','0','system:tenant:remove','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1610,'租户导出',121,5,'#','','',1,0,'F','0','0','system:tenant:export','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1611,'租户套餐查询',122,1,'#','','',1,0,'F','0','0','system:tenantPackage:query','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1612,'租户套餐新增',122,2,'#','','',1,0,'F','0','0','system:tenantPackage:add','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1613,'租户套餐修改',122,3,'#','','',1,0,'F','0','0','system:tenantPackage:edit','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1614,'租户套餐删除',122,4,'#','','',1,0,'F','0','0','system:tenantPackage:remove','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1615,'租户套餐导出',122,5,'#','','',1,0,'F','0','0','system:tenantPackage:export','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1620,'配置列表',118,5,'#','','',1,0,'F','0','0','system:ossConfig:list','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1621,'配置添加',118,6,'#','','',1,0,'F','0','0','system:ossConfig:add','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1622,'配置编辑',118,6,'#','','',1,0,'F','0','0','system:ossConfig:edit','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(1623,'配置删除',118,6,'#','','',1,0,'F','0','0','system:ossConfig:remove','#',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(11616,'工作流',0,6,'workflow','','',1,0,'M','0','0','','workflow',103,1,'2025-09-17 22:01:10',NULL,NULL,''),(11618,'我的任务',0,7,'task','','',1,0,'M','0','0','','my-task',103,1,'2025-09-17 22:01:10',NULL,NULL,''),(11619,'我的待办',11618,2,'taskWaiting','workflow/task/taskWaiting','',1,1,'C','0','0','','waiting',103,1,'2025-09-17 22:01:10',NULL,NULL,''),(11620,'流程定义',11616,3,'processDefinition','workflow/processDefinition/index','',1,1,'C','0','0','','process-definition',103,1,'2025-09-17 22:01:10',NULL,NULL,''),(11621,'流程实例',11630,1,'processInstance','workflow/processInstance/index','',1,1,'C','0','0','','tree-table',103,1,'2025-09-17 22:01:10',NULL,NULL,''),(11622,'流程分类',11616,1,'category','workflow/category/index','',1,0,'C','0','0','workflow:category:list','category',103,1,'2025-09-17 22:01:10',NULL,NULL,''),(11623,'流程分类查询',11622,1,'#','','',1,0,'F','0','0','workflow:category:query','#',103,1,'2025-09-17 22:01:10',NULL,NULL,''),(11624,'流程分类新增',11622,2,'#','','',1,0,'F','0','0','workflow:category:add','#',103,1,'2025-09-17 22:01:10',NULL,NULL,''),(11625,'流程分类修改',11622,3,'#','','',1,0,'F','0','0','workflow:category:edit','#',103,1,'2025-09-17 22:01:10',NULL,NULL,''),(11626,'流程分类删除',11622,4,'#','','',1,0,'F','0','0','workflow:category:remove','#',103,1,'2025-09-17 22:01:10',NULL,NULL,''),(11627,'流程分类导出',11622,5,'#','','',1,0,'F','0','0','workflow:category:export','#',103,1,'2025-09-17 22:01:10',NULL,NULL,''),(11629,'我发起的',11618,1,'myDocument','workflow/task/myDocument','',1,1,'C','0','0','','guide',103,1,'2025-09-17 22:01:10',NULL,NULL,''),(11630,'流程监控',11616,4,'monitor','','',1,0,'M','0','0','','monitor',103,1,'2025-09-17 22:01:10',NULL,NULL,''),(11631,'待办任务',11630,2,'allTaskWaiting','workflow/task/allTaskWaiting','',1,1,'C','0','0','','waiting',103,1,'2025-09-17 22:01:10',NULL,NULL,''),(11632,'我的已办',11618,3,'taskFinish','workflow/task/taskFinish','',1,1,'C','0','0','','finish',103,1,'2025-09-17 22:01:10',NULL,NULL,''),(11633,'我的抄送',11618,4,'taskCopyList','workflow/task/taskCopyList','',1,1,'C','0','0','','my-copy',103,1,'2025-09-17 22:01:10',NULL,NULL,''),(11638,'请假申请',5,1,'leave','workflow/leave/index','',1,0,'C','0','0','workflow:leave:list','#',103,1,'2025-09-17 22:01:10',NULL,NULL,'请假申请菜单'),(11639,'请假申请查询',11638,1,'#','','',1,0,'F','0','0','workflow:leave:query','#',103,1,'2025-09-17 22:01:10',NULL,NULL,''),(11640,'请假申请新增',11638,2,'#','','',1,0,'F','0','0','workflow:leave:add','#',103,1,'2025-09-17 22:01:10',NULL,NULL,''),(11641,'请假申请修改',11638,3,'#','','',1,0,'F','0','0','workflow:leave:edit','#',103,1,'2025-09-17 22:01:10',NULL,NULL,''),(11642,'请假申请删除',11638,4,'#','','',1,0,'F','0','0','workflow:leave:remove','#',103,1,'2025-09-17 22:01:10',NULL,NULL,''),(11643,'请假申请导出',11638,5,'#','','',1,0,'F','0','0','workflow:leave:export','#',103,1,'2025-09-17 22:01:10',NULL,NULL,''),(11700,'流程设计',11616,5,'design/index','workflow/processDefinition/design','',1,1,'C','1','0','workflow:leave:edit','#',103,1,'2025-09-17 22:01:10',NULL,NULL,'/workflow/processDefinition'),(11701,'请假申请',11616,6,'leaveEdit/index','workflow/leave/leaveEdit','',1,1,'C','1','0','workflow:leave:edit','#',103,1,'2025-09-17 22:01:10',NULL,NULL,''),(11801,'流程表达式',11616,2,'spel','workflow/spel/index','',1,0,'C','0','0','workflow:spel:list','input',103,1,'2025-09-17 22:01:10',1,'2025-09-17 22:01:10','流程达式定义菜单'),(11802,'流程达式定义查询',11801,1,'#','',NULL,1,0,'F','0','0','workflow:spel:query','#',103,1,'2025-09-17 22:01:10',NULL,NULL,''),(11803,'流程达式定义新增',11801,2,'#','',NULL,1,0,'F','0','0','workflow:spel:add','#',103,1,'2025-09-17 22:01:10',NULL,NULL,''),(11804,'流程达式定义修改',11801,3,'#','',NULL,1,0,'F','0','0','workflow:spel:edit','#',103,1,'2025-09-17 22:01:10',NULL,NULL,''),(11805,'流程达式定义删除',11801,4,'#','',NULL,1,0,'F','0','0','workflow:spel:remove','#',103,1,'2025-09-17 22:01:10',NULL,NULL,''),(11806,'流程达式定义导出',11801,5,'#','',NULL,1,0,'F','0','0','workflow:spel:export','#',103,1,'2025-09-17 22:01:10',NULL,NULL,'');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice`
--

DROP TABLE IF EXISTS `sys_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_notice` (
  `notice_id` bigint NOT NULL COMMENT '公告ID',
  `tenant_id` varchar(20) COLLATE utf8mb4_general_ci DEFAULT '000000' COMMENT '租户编号',
  `notice_title` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='通知公告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice`
--

LOCK TABLES `sys_notice` WRITE;
/*!40000 ALTER TABLE `sys_notice` DISABLE KEYS */;
INSERT INTO `sys_notice` VALUES (1,'000000','温馨提醒：2018-07-01 新版本发布啦','2',_binary '新版本内容','0',103,1,'2025-09-17 21:41:04',NULL,NULL,'管理员'),(2,'000000','维护通知：2018-07-01 系统凌晨维护','1',_binary '维护内容','0',103,1,'2025-09-17 21:41:04',NULL,NULL,'管理员');
/*!40000 ALTER TABLE `sys_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oper_log`
--

DROP TABLE IF EXISTS `sys_oper_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint NOT NULL COMMENT '日志主键',
  `tenant_id` varchar(20) COLLATE utf8mb4_general_ci DEFAULT '000000' COMMENT '租户编号',
  `title` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '模块标题',
  `business_type` int DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '请求方式',
  `operator_type` int DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(4000) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(4000) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '返回参数',
  `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(4000) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint DEFAULT '0' COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`),
  KEY `idx_sys_oper_log_bt` (`business_type`),
  KEY `idx_sys_oper_log_s` (`status`),
  KEY `idx_sys_oper_log_ot` (`oper_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='操作日志记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oper_log`
--

LOCK TABLES `sys_oper_log` WRITE;
/*!40000 ALTER TABLE `sys_oper_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_oper_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oss`
--

DROP TABLE IF EXISTS `sys_oss`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_oss` (
  `oss_id` bigint NOT NULL COMMENT '对象存储主键',
  `tenant_id` varchar(20) COLLATE utf8mb4_general_ci DEFAULT '000000' COMMENT '租户编号',
  `file_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文件名',
  `original_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '原名',
  `file_suffix` varchar(10) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文件后缀名',
  `url` varchar(500) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'URL地址',
  `ext1` text COLLATE utf8mb4_general_ci COMMENT '扩展字段',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '上传人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人',
  `service` varchar(20) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'minio' COMMENT '服务商',
  PRIMARY KEY (`oss_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='OSS对象存储表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oss`
--

LOCK TABLES `sys_oss` WRITE;
/*!40000 ALTER TABLE `sys_oss` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_oss` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oss_config`
--

DROP TABLE IF EXISTS `sys_oss_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_oss_config` (
  `oss_config_id` bigint NOT NULL COMMENT '主键',
  `tenant_id` varchar(20) COLLATE utf8mb4_general_ci DEFAULT '000000' COMMENT '租户编号',
  `config_key` varchar(20) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '配置key',
  `access_key` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'accessKey',
  `secret_key` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '秘钥',
  `bucket_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '桶名称',
  `prefix` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '前缀',
  `endpoint` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '访问站点',
  `domain` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '自定义域名',
  `is_https` char(1) COLLATE utf8mb4_general_ci DEFAULT 'N' COMMENT '是否https（Y=是,N=否）',
  `region` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '域',
  `access_policy` char(1) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1' COMMENT '桶权限类型(0=private 1=public 2=custom)',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '1' COMMENT '是否默认（0=是,1=否）',
  `ext1` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '扩展字段',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`oss_config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='对象存储配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oss_config`
--

LOCK TABLES `sys_oss_config` WRITE;
/*!40000 ALTER TABLE `sys_oss_config` DISABLE KEYS */;
INSERT INTO `sys_oss_config` VALUES (1,'000000','minio','ruoyi','ruoyi123','ruoyi','','127.0.0.1:9000','','N','','1','0','',103,1,'2025-09-17 21:41:04',1,'2025-09-17 21:41:04',NULL),(2,'000000','qiniu','XXXXXXXXXXXXXXX','XXXXXXXXXXXXXXX','ruoyi','','s3-cn-north-1.qiniucs.com','','N','','1','1','',103,1,'2025-09-17 21:41:04',1,'2025-09-17 21:41:04',NULL),(3,'000000','aliyun','XXXXXXXXXXXXXXX','XXXXXXXXXXXXXXX','ruoyi','','oss-cn-beijing.aliyuncs.com','','N','','1','1','',103,1,'2025-09-17 21:41:04',1,'2025-09-17 21:41:04',NULL),(4,'000000','qcloud','XXXXXXXXXXXXXXX','XXXXXXXXXXXXXXX','ruoyi-1240000000','','cos.ap-beijing.myqcloud.com','','N','ap-beijing','1','1','',103,1,'2025-09-17 21:41:04',1,'2025-09-17 21:41:04',NULL),(5,'000000','image','ruoyi','ruoyi123','ruoyi','image','127.0.0.1:9000','','N','','1','1','',103,1,'2025-09-17 21:41:04',1,'2025-09-17 21:41:04',NULL);
/*!40000 ALTER TABLE `sys_oss_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_post`
--

DROP TABLE IF EXISTS `sys_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_post` (
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  `tenant_id` varchar(20) COLLATE utf8mb4_general_ci DEFAULT '000000' COMMENT '租户编号',
  `dept_id` bigint NOT NULL COMMENT '部门id',
  `post_code` varchar(64) COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `post_category` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '岗位类别编码',
  `post_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='岗位信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_post`
--

LOCK TABLES `sys_post` WRITE;
/*!40000 ALTER TABLE `sys_post` DISABLE KEYS */;
INSERT INTO `sys_post` VALUES (1,'000000',103,'ceo',NULL,'董事长',1,'0',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(2,'000000',100,'se',NULL,'项目经理',2,'0',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(3,'000000',100,'hr',NULL,'人力资源',3,'0',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(4,'000000',100,'user',NULL,'普通员工',4,'0',103,1,'2025-09-17 21:41:04',NULL,NULL,'');
/*!40000 ALTER TABLE `sys_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `tenant_id` varchar(20) COLLATE utf8mb4_general_ci DEFAULT '000000' COMMENT '租户编号',
  `role_name` varchar(30) COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) COLLATE utf8mb4_general_ci DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限 5：仅本人数据权限 6：部门及以下或本人数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'000000','超级管理员','superadmin',1,'1',1,1,'0','0',103,1,'2025-09-17 21:41:04',NULL,NULL,'超级管理员'),(3,'000000','本部门及以下','test1',3,'4',1,1,'0','0',103,1,'2025-09-17 21:41:04',NULL,NULL,''),(4,'000000','仅本人','test2',4,'5',1,1,'0','0',103,1,'2025-09-17 21:41:04',NULL,NULL,'');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_dept`
--

DROP TABLE IF EXISTS `sys_role_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色和部门关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_dept`
--

LOCK TABLES `sys_role_dept` WRITE;
/*!40000 ALTER TABLE `sys_role_dept` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_role_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色和菜单关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (3,1),(3,5),(3,100),(3,101),(3,102),(3,103),(3,104),(3,105),(3,106),(3,107),(3,108),(3,118),(3,123),(3,130),(3,131),(3,132),(3,133),(3,500),(3,501),(3,1001),(3,1002),(3,1003),(3,1004),(3,1005),(3,1006),(3,1007),(3,1008),(3,1009),(3,1010),(3,1011),(3,1012),(3,1013),(3,1014),(3,1015),(3,1016),(3,1017),(3,1018),(3,1019),(3,1020),(3,1021),(3,1022),(3,1023),(3,1024),(3,1025),(3,1026),(3,1027),(3,1028),(3,1029),(3,1030),(3,1031),(3,1032),(3,1033),(3,1034),(3,1035),(3,1036),(3,1037),(3,1038),(3,1039),(3,1040),(3,1041),(3,1042),(3,1043),(3,1044),(3,1045),(3,1050),(3,1061),(3,1062),(3,1063),(3,1064),(3,1065),(3,1500),(3,1501),(3,1502),(3,1503),(3,1504),(3,1505),(3,1506),(3,1507),(3,1508),(3,1509),(3,1510),(3,1511),(3,1600),(3,1601),(3,1602),(3,1603),(3,1620),(3,1621),(3,1622),(3,1623),(3,11616),(3,11618),(3,11619),(3,11622),(3,11623),(3,11629),(3,11632),(3,11633),(3,11638),(3,11639),(3,11640),(3,11641),(3,11642),(3,11643),(3,11701),(4,5),(4,1500),(4,1501),(4,1502),(4,1503),(4,1504),(4,1505),(4,1506),(4,1507),(4,1508),(4,1509),(4,1510),(4,1511);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_social`
--

DROP TABLE IF EXISTS `sys_social`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_social` (
  `id` bigint NOT NULL COMMENT '主键',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `tenant_id` varchar(20) COLLATE utf8mb4_general_ci DEFAULT '000000' COMMENT '租户id',
  `auth_id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '平台+平台唯一id',
  `source` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户来源',
  `open_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '平台编号唯一id',
  `user_name` varchar(30) COLLATE utf8mb4_general_ci NOT NULL COMMENT '登录账号',
  `nick_name` varchar(30) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '用户昵称',
  `email` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '用户邮箱',
  `avatar` varchar(500) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '头像地址',
  `access_token` varchar(2000) COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户的授权令牌',
  `expire_in` int DEFAULT NULL COMMENT '用户的授权令牌的有效期，部分平台可能没有',
  `refresh_token` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '刷新令牌，部分平台可能没有',
  `access_code` varchar(2000) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '平台的授权信息，部分平台可能没有',
  `union_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户的 unionid',
  `scope` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '授予的权限，部分平台可能没有',
  `token_type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '个别平台的授权信息，部分平台可能没有',
  `id_token` varchar(2000) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'id token，部分平台可能没有',
  `mac_algorithm` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '小米平台用户的附带属性，部分平台可能没有',
  `mac_key` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '小米平台用户的附带属性，部分平台可能没有',
  `code` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户的授权code，部分平台可能没有',
  `oauth_token` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Twitter平台用户的附带属性，部分平台可能没有',
  `oauth_token_secret` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Twitter平台用户的附带属性，部分平台可能没有',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='社会化关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_social`
--

LOCK TABLES `sys_social` WRITE;
/*!40000 ALTER TABLE `sys_social` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_social` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_tenant`
--

DROP TABLE IF EXISTS `sys_tenant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_tenant` (
  `id` bigint NOT NULL COMMENT 'id',
  `tenant_id` varchar(20) COLLATE utf8mb4_general_ci NOT NULL COMMENT '租户编号',
  `contact_user_name` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '联系人',
  `contact_phone` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '联系电话',
  `company_name` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '企业名称',
  `license_number` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '统一社会信用代码',
  `address` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '地址',
  `intro` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '企业简介',
  `domain` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '域名',
  `remark` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `package_id` bigint DEFAULT NULL COMMENT '租户套餐编号',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `account_count` int DEFAULT '-1' COMMENT '用户数量（-1不限制）',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '租户状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='租户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_tenant`
--

LOCK TABLES `sys_tenant` WRITE;
/*!40000 ALTER TABLE `sys_tenant` DISABLE KEYS */;
INSERT INTO `sys_tenant` VALUES (1,'000000','管理组','15888888888','XXX有限公司',NULL,NULL,'多租户通用后台管理管理系统',NULL,NULL,NULL,NULL,-1,'0','0',103,1,'2025-09-17 21:41:04',NULL,NULL);
/*!40000 ALTER TABLE `sys_tenant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_tenant_package`
--

DROP TABLE IF EXISTS `sys_tenant_package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_tenant_package` (
  `package_id` bigint NOT NULL COMMENT '租户套餐id',
  `package_name` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '套餐名称',
  `menu_ids` varchar(3000) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '关联菜单id',
  `remark` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`package_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='租户套餐表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_tenant_package`
--

LOCK TABLES `sys_tenant_package` WRITE;
/*!40000 ALTER TABLE `sys_tenant_package` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_tenant_package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `tenant_id` varchar(20) COLLATE utf8mb4_general_ci DEFAULT '000000' COMMENT '租户编号',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(10) COLLATE utf8mb4_general_ci DEFAULT 'sys_user' COMMENT '用户类型（sys_user系统用户）',
  `email` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '手机号码',
  `sex` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` bigint DEFAULT NULL COMMENT '头像地址',
  `password` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '密码',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `login_ip` varchar(128) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,'000000',103,'admin','liam_yc','sys_user','101602766@qq.com','13724243559','0',NULL,'$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','0:0:0:0:0:0:0:1','2025-09-17 22:30:51',103,1,'2025-09-17 21:41:04',-1,'2025-09-17 22:30:51','管理员'),(3,'000000',108,'test','本部门及以下 密码666666','sys_user','','','0',NULL,'$2a$10$b8yUzN0C71sbz.PhNOCgJe.Tu1yWC3RNrTyjSQ8p1W0.aaUXUJ.Ne','0','0','127.0.0.1','2025-09-17 21:41:04',103,1,'2025-09-17 21:41:04',3,'2025-09-17 21:41:04',NULL),(4,'000000',102,'test1','仅本人 密码666666','sys_user','','','0',NULL,'$2a$10$b8yUzN0C71sbz.PhNOCgJe.Tu1yWC3RNrTyjSQ8p1W0.aaUXUJ.Ne','0','0','127.0.0.1','2025-09-17 21:41:04',103,1,'2025-09-17 21:41:04',4,'2025-09-17 21:41:04',NULL);
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_post`
--

DROP TABLE IF EXISTS `sys_user_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_post` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户与岗位关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_post`
--

LOCK TABLES `sys_user_post` WRITE;
/*!40000 ALTER TABLE `sys_user_post` DISABLE KEYS */;
INSERT INTO `sys_user_post` VALUES (1,1);
/*!40000 ALTER TABLE `sys_user_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_role` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户和角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (1,1),(3,3),(4,4);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_demo`
--

DROP TABLE IF EXISTS `test_demo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_demo` (
  `id` bigint NOT NULL COMMENT '主键',
  `tenant_id` varchar(20) COLLATE utf8mb4_general_ci DEFAULT '000000' COMMENT '租户编号',
  `dept_id` bigint DEFAULT NULL COMMENT '部门id',
  `user_id` bigint DEFAULT NULL COMMENT '用户id',
  `order_num` int DEFAULT '0' COMMENT '排序号',
  `test_key` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'key键',
  `value` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '值',
  `version` int DEFAULT '0' COMMENT '版本',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人',
  `del_flag` int DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='测试单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_demo`
--

LOCK TABLES `test_demo` WRITE;
/*!40000 ALTER TABLE `test_demo` DISABLE KEYS */;
INSERT INTO `test_demo` VALUES (1,'000000',102,4,1,'测试数据权限','测试',0,103,'2025-09-17 21:41:04',1,NULL,NULL,0),(2,'000000',102,3,2,'子节点1','111',0,103,'2025-09-17 21:41:04',1,NULL,NULL,0),(3,'000000',102,3,3,'子节点2','222',0,103,'2025-09-17 21:41:04',1,NULL,NULL,0),(4,'000000',108,4,4,'测试数据','demo',0,103,'2025-09-17 21:41:04',1,NULL,NULL,0),(5,'000000',108,3,13,'子节点11','1111',0,103,'2025-09-17 21:41:04',1,NULL,NULL,0),(6,'000000',108,3,12,'子节点22','2222',0,103,'2025-09-17 21:41:04',1,NULL,NULL,0),(7,'000000',108,3,11,'子节点33','3333',0,103,'2025-09-17 21:41:04',1,NULL,NULL,0),(8,'000000',108,3,10,'子节点44','4444',0,103,'2025-09-17 21:41:04',1,NULL,NULL,0),(9,'000000',108,3,9,'子节点55','5555',0,103,'2025-09-17 21:41:04',1,NULL,NULL,0),(10,'000000',108,3,8,'子节点66','6666',0,103,'2025-09-17 21:41:04',1,NULL,NULL,0),(11,'000000',108,3,7,'子节点77','7777',0,103,'2025-09-17 21:41:04',1,NULL,NULL,0),(12,'000000',108,3,6,'子节点88','8888',0,103,'2025-09-17 21:41:04',1,NULL,NULL,0),(13,'000000',108,3,5,'子节点99','9999',0,103,'2025-09-17 21:41:04',1,NULL,NULL,0);
/*!40000 ALTER TABLE `test_demo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_leave`
--

DROP TABLE IF EXISTS `test_leave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_leave` (
  `id` bigint NOT NULL COMMENT 'id',
  `tenant_id` varchar(20) COLLATE utf8mb4_general_ci DEFAULT '000000' COMMENT '租户编号',
  `apply_code` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '申请编号',
  `leave_type` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '请假类型',
  `start_date` datetime NOT NULL COMMENT '开始时间',
  `end_date` datetime NOT NULL COMMENT '结束时间',
  `leave_days` int NOT NULL COMMENT '请假天数',
  `remark` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '请假原因',
  `status` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '状态',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='请假申请表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_leave`
--

LOCK TABLES `test_leave` WRITE;
/*!40000 ALTER TABLE `test_leave` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_leave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_tree`
--

DROP TABLE IF EXISTS `test_tree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_tree` (
  `id` bigint NOT NULL COMMENT '主键',
  `tenant_id` varchar(20) COLLATE utf8mb4_general_ci DEFAULT '000000' COMMENT '租户编号',
  `parent_id` bigint DEFAULT '0' COMMENT '父id',
  `dept_id` bigint DEFAULT NULL COMMENT '部门id',
  `user_id` bigint DEFAULT NULL COMMENT '用户id',
  `tree_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '值',
  `version` int DEFAULT '0' COMMENT '版本',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人',
  `del_flag` int DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='测试树表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_tree`
--

LOCK TABLES `test_tree` WRITE;
/*!40000 ALTER TABLE `test_tree` DISABLE KEYS */;
INSERT INTO `test_tree` VALUES (1,'000000',0,102,4,'测试数据权限',0,103,'2025-09-17 21:41:04',1,NULL,NULL,0),(2,'000000',1,102,3,'子节点1',0,103,'2025-09-17 21:41:04',1,NULL,NULL,0),(3,'000000',2,102,3,'子节点2',0,103,'2025-09-17 21:41:04',1,NULL,NULL,0),(4,'000000',0,108,4,'测试树1',0,103,'2025-09-17 21:41:04',1,NULL,NULL,0),(5,'000000',4,108,3,'子节点11',0,103,'2025-09-17 21:41:04',1,NULL,NULL,0),(6,'000000',4,108,3,'子节点22',0,103,'2025-09-17 21:41:04',1,NULL,NULL,0),(7,'000000',4,108,3,'子节点33',0,103,'2025-09-17 21:41:04',1,NULL,NULL,0),(8,'000000',5,108,3,'子节点44',0,103,'2025-09-17 21:41:04',1,NULL,NULL,0),(9,'000000',6,108,3,'子节点55',0,103,'2025-09-17 21:41:04',1,NULL,NULL,0),(10,'000000',7,108,3,'子节点66',0,103,'2025-09-17 21:41:04',1,NULL,NULL,0),(11,'000000',7,108,3,'子节点77',0,103,'2025-09-17 21:41:04',1,NULL,NULL,0),(12,'000000',10,108,3,'子节点88',0,103,'2025-09-17 21:41:04',1,NULL,NULL,0),(13,'000000',10,108,3,'子节点99',0,103,'2025-09-17 21:41:04',1,NULL,NULL,0);
/*!40000 ALTER TABLE `test_tree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_active_anniversary_reminders`
--

DROP TABLE IF EXISTS `v_active_anniversary_reminders`;
/*!50001 DROP VIEW IF EXISTS `v_active_anniversary_reminders`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_active_anniversary_reminders` AS SELECT 
 1 AS `reminder_id`,
 1 AS `anniversary_type`,
 1 AS `anniversary_id`,
 1 AS `ruid`,
 1 AS `reminder_date`,
 1 AS `reminder_time`,
 1 AS `reminder_title`,
 1 AS `reminder_content`,
 1 AS `reminder_method`,
 1 AS `is_sent`,
 1 AS `sent_time`,
 1 AS `is_read`,
 1 AS `read_time`,
 1 AS `response_action`,
 1 AS `snooze_until`,
 1 AS `priority_level`,
 1 AS `deleted`,
 1 AS `delete_time`,
 1 AS `delete_by`,
 1 AS `create_time`,
 1 AS `update_time`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_active_care_records`
--

DROP TABLE IF EXISTS `v_active_care_records`;
/*!50001 DROP VIEW IF EXISTS `v_active_care_records`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_active_care_records` AS SELECT 
 1 AS `record_id`,
 1 AS `pet_id`,
 1 AS `activity_type_id`,
 1 AS `activity_name`,
 1 AS `activity_date`,
 1 AS `duration_minutes`,
 1 AS `location`,
 1 AS `service_provider`,
 1 AS `cost`,
 1 AS `products_used`,
 1 AS `notes`,
 1 AS `next_due_date`,
 1 AS `photo_urls`,
 1 AS `rating`,
 1 AS `reminder_sent`,
 1 AS `visibility`,
 1 AS `pet_name`,
 1 AS `activity_type_name`,
 1 AS `deleted`,
 1 AS `delete_time`,
 1 AS `delete_by`,
 1 AS `create_time`,
 1 AS `update_time`,
 1 AS `create_by`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_active_couple_anniversaries`
--

DROP TABLE IF EXISTS `v_active_couple_anniversaries`;
/*!50001 DROP VIEW IF EXISTS `v_active_couple_anniversaries`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_active_couple_anniversaries` AS SELECT 
 1 AS `anniversary_id`,
 1 AS `relation_id`,
 1 AS `anniversary_type`,
 1 AS `anniversary_name`,
 1 AS `anniversary_date`,
 1 AS `is_recurring`,
 1 AS `description`,
 1 AS `importance_level`,
 1 AS `celebration_plan`,
 1 AS `photos`,
 1 AS `memories`,
 1 AS `gifts_exchanged`,
 1 AS `location`,
 1 AS `special_meaning`,
 1 AS `reminder_days_before`,
 1 AS `is_reminder_enabled`,
 1 AS `last_celebrated_year`,
 1 AS `celebration_count`,
 1 AS `visibility`,
 1 AS `deleted`,
 1 AS `delete_time`,
 1 AS `delete_by`,
 1 AS `create_time`,
 1 AS `update_time`,
 1 AS `create_by`,
 1 AS `update_by`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_active_expense_records`
--

DROP TABLE IF EXISTS `v_active_expense_records`;
/*!50001 DROP VIEW IF EXISTS `v_active_expense_records`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_active_expense_records` AS SELECT 
 1 AS `record_id`,
 1 AS `ruid`,
 1 AS `pet_id`,
 1 AS `category_id`,
 1 AS `expense_title`,
 1 AS `amount`,
 1 AS `currency`,
 1 AS `expense_date`,
 1 AS `payment_method`,
 1 AS `merchant_name`,
 1 AS `merchant_address`,
 1 AS `merchant_phone`,
 1 AS `expense_type`,
 1 AS `sharing_ratio`,
 1 AS `shared_with_ruid`,
 1 AS `actual_payer_ruid`,
 1 AS `reimbursement_status`,
 1 AS `reimbursement_amount`,
 1 AS `invoice_number`,
 1 AS `invoice_url`,
 1 AS `receipt_url`,
 1 AS `warranty_info`,
 1 AS `return_policy`,
 1 AS `description`,
 1 AS `tags`,
 1 AS `location_info`,
 1 AS `weather_info`,
 1 AS `mood_rating`,
 1 AS `necessity_level`,
 1 AS `satisfaction_rating`,
 1 AS `privacy_level`,
 1 AS `is_hidden`,
 1 AS `is_recurring`,
 1 AS `recurring_period`,
 1 AS `verification_required`,
 1 AS `verified_by_ruid`,
 1 AS `verified_time`,
 1 AS `verification_notes`,
 1 AS `ruid_nickname`,
 1 AS `pet_name`,
 1 AS `category_name`,
 1 AS `shared_with_nickname`,
 1 AS `deleted`,
 1 AS `delete_time`,
 1 AS `delete_by`,
 1 AS `create_time`,
 1 AS `update_time`,
 1 AS `create_by`,
 1 AS `update_by`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_active_health_records`
--

DROP TABLE IF EXISTS `v_active_health_records`;
/*!50001 DROP VIEW IF EXISTS `v_active_health_records`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_active_health_records` AS SELECT 
 1 AS `record_id`,
 1 AS `pet_id`,
 1 AS `record_type`,
 1 AS `value`,
 1 AS `unit`,
 1 AS `normal_range_min`,
 1 AS `normal_range_max`,
 1 AS `is_abnormal`,
 1 AS `measurement_date`,
 1 AS `measurement_method`,
 1 AS `notes`,
 1 AS `alert_sent`,
 1 AS `visibility`,
 1 AS `pet_name`,
 1 AS `deleted`,
 1 AS `delete_time`,
 1 AS `delete_by`,
 1 AS `create_time`,
 1 AS `create_by`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_active_love_diaries`
--

DROP TABLE IF EXISTS `v_active_love_diaries`;
/*!50001 DROP VIEW IF EXISTS `v_active_love_diaries`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_active_love_diaries` AS SELECT 
 1 AS `love_diary_id`,
 1 AS `relation_id`,
 1 AS `author_ruid`,
 1 AS `diary_title`,
 1 AS `diary_content`,
 1 AS `diary_date`,
 1 AS `mood`,
 1 AS `mood_score`,
 1 AS `weather`,
 1 AS `location`,
 1 AS `photo_urls`,
 1 AS `tags`,
 1 AS `is_private`,
 1 AS `shared_with_partner`,
 1 AS `partner_can_comment`,
 1 AS `temporary_share_code`,
 1 AS `temporary_share_expires`,
 1 AS `view_count`,
 1 AS `is_favorite`,
 1 AS `author_nickname`,
 1 AS `deleted`,
 1 AS `delete_time`,
 1 AS `delete_by`,
 1 AS `create_time`,
 1 AS `update_time`,
 1 AS `create_by`,
 1 AS `update_by`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_active_pet_anniversaries`
--

DROP TABLE IF EXISTS `v_active_pet_anniversaries`;
/*!50001 DROP VIEW IF EXISTS `v_active_pet_anniversaries`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_active_pet_anniversaries` AS SELECT 
 1 AS `anniversary_id`,
 1 AS `pet_id`,
 1 AS `anniversary_type`,
 1 AS `anniversary_name`,
 1 AS `anniversary_date`,
 1 AS `is_recurring`,
 1 AS `description`,
 1 AS `importance_level`,
 1 AS `celebration_plan`,
 1 AS `photos`,
 1 AS `memories`,
 1 AS `gifts_given`,
 1 AS `location`,
 1 AS `participants`,
 1 AS `reminder_days_before`,
 1 AS `is_reminder_enabled`,
 1 AS `last_celebrated_year`,
 1 AS `celebration_count`,
 1 AS `visibility`,
 1 AS `pet_name`,
 1 AS `deleted`,
 1 AS `delete_time`,
 1 AS `delete_by`,
 1 AS `create_time`,
 1 AS `update_time`,
 1 AS `create_by`,
 1 AS `update_by`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_active_pet_family_relations`
--

DROP TABLE IF EXISTS `v_active_pet_family_relations`;
/*!50001 DROP VIEW IF EXISTS `v_active_pet_family_relations`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_active_pet_family_relations` AS SELECT 
 1 AS `relation_id`,
 1 AS `pet_id`,
 1 AS `related_pet_id`,
 1 AS `relation_type`,
 1 AS `relation_desc`,
 1 AS `confirmed`,
 1 AS `confirmed_by`,
 1 AS `confirmed_time`,
 1 AS `visibility`,
 1 AS `pet_name`,
 1 AS `related_pet_name`,
 1 AS `deleted`,
 1 AS `delete_time`,
 1 AS `delete_by`,
 1 AS `create_time`,
 1 AS `update_time`,
 1 AS `create_by`,
 1 AS `update_by`,
 1 AS `remark`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_active_pet_feature_tags`
--

DROP TABLE IF EXISTS `v_active_pet_feature_tags`;
/*!50001 DROP VIEW IF EXISTS `v_active_pet_feature_tags`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_active_pet_feature_tags` AS SELECT 
 1 AS `tag_id`,
 1 AS `pet_id`,
 1 AS `tag_category`,
 1 AS `tag_name`,
 1 AS `tag_value`,
 1 AS `tag_description`,
 1 AS `is_system_tag`,
 1 AS `tag_color`,
 1 AS `sort_order`,
 1 AS `visibility`,
 1 AS `pet_name`,
 1 AS `deleted`,
 1 AS `delete_time`,
 1 AS `delete_by`,
 1 AS `create_time`,
 1 AS `update_time`,
 1 AS `create_by`,
 1 AS `update_by`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_active_pet_growth_records`
--

DROP TABLE IF EXISTS `v_active_pet_growth_records`;
/*!50001 DROP VIEW IF EXISTS `v_active_pet_growth_records`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_active_pet_growth_records` AS SELECT 
 1 AS `record_id`,
 1 AS `pet_id`,
 1 AS `growth_stage`,
 1 AS `record_date`,
 1 AS `age_months`,
 1 AS `weight`,
 1 AS `height`,
 1 AS `length`,
 1 AS `development_notes`,
 1 AS `behavioral_changes`,
 1 AS `health_status`,
 1 AS `milestone_achieved`,
 1 AS `photos`,
 1 AS `veterinarian_notes`,
 1 AS `next_checkup_date`,
 1 AS `visibility`,
 1 AS `pet_name`,
 1 AS `deleted`,
 1 AS `delete_time`,
 1 AS `delete_by`,
 1 AS `create_time`,
 1 AS `update_time`,
 1 AS `create_by`,
 1 AS `update_by`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_active_pet_photos`
--

DROP TABLE IF EXISTS `v_active_pet_photos`;
/*!50001 DROP VIEW IF EXISTS `v_active_pet_photos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_active_pet_photos` AS SELECT 
 1 AS `photo_id`,
 1 AS `pet_id`,
 1 AS `photo_url`,
 1 AS `thumbnail_url`,
 1 AS `photo_title`,
 1 AS `photo_desc`,
 1 AS `photo_date`,
 1 AS `location`,
 1 AS `tags`,
 1 AS `ai_tags`,
 1 AS `is_favorite`,
 1 AS `visibility`,
 1 AS `deleted`,
 1 AS `delete_time`,
 1 AS `delete_by`,
 1 AS `create_time`,
 1 AS `update_time`,
 1 AS `create_by`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_active_pet_preferences`
--

DROP TABLE IF EXISTS `v_active_pet_preferences`;
/*!50001 DROP VIEW IF EXISTS `v_active_pet_preferences`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_active_pet_preferences` AS SELECT 
 1 AS `preference_id`,
 1 AS `pet_id`,
 1 AS `preference_category`,
 1 AS `preference_name`,
 1 AS `preference_level`,
 1 AS `preference_desc`,
 1 AS `notes`,
 1 AS `last_observed_date`,
 1 AS `confidence_level`,
 1 AS `visibility`,
 1 AS `pet_name`,
 1 AS `deleted`,
 1 AS `delete_time`,
 1 AS `delete_by`,
 1 AS `create_time`,
 1 AS `update_time`,
 1 AS `create_by`,
 1 AS `update_by`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_active_pet_product_purchases`
--

DROP TABLE IF EXISTS `v_active_pet_product_purchases`;
/*!50001 DROP VIEW IF EXISTS `v_active_pet_product_purchases`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_active_pet_product_purchases` AS SELECT 
 1 AS `purchase_id`,
 1 AS `pet_id`,
 1 AS `ruid`,
 1 AS `product_name`,
 1 AS `product_category`,
 1 AS `brand_name`,
 1 AS `product_model`,
 1 AS `purchase_date`,
 1 AS `purchase_price`,
 1 AS `quantity`,
 1 AS `total_amount`,
 1 AS `currency`,
 1 AS `purchase_channel`,
 1 AS `store_name`,
 1 AS `order_number`,
 1 AS `receipt_photo`,
 1 AS `product_photos`,
 1 AS `purchase_reason`,
 1 AS `expected_usage`,
 1 AS `warranty_period`,
 1 AS `warranty_end_date`,
 1 AS `is_gift`,
 1 AS `gift_from`,
 1 AS `usage_status`,
 1 AS `satisfaction_rating`,
 1 AS `review_notes`,
 1 AS `repurchase_intention`,
 1 AS `visibility`,
 1 AS `pet_name`,
 1 AS `purchaser_nickname`,
 1 AS `deleted`,
 1 AS `delete_time`,
 1 AS `delete_by`,
 1 AS `create_time`,
 1 AS `update_time`,
 1 AS `create_by`,
 1 AS `update_by`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_active_pets`
--

DROP TABLE IF EXISTS `v_active_pets`;
/*!50001 DROP VIEW IF EXISTS `v_active_pets`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_active_pets` AS SELECT 
 1 AS `pet_id`,
 1 AS `pet_name`,
 1 AS `pet_nickname`,
 1 AS `owner_ruid`,
 1 AS `co_owner_ruid`,
 1 AS `breed_id`,
 1 AS `species`,
 1 AS `gender`,
 1 AS `birth_date`,
 1 AS `adoption_date`,
 1 AS `age_months`,
 1 AS `color`,
 1 AS `pattern`,
 1 AS `weight`,
 1 AS `height`,
 1 AS `length`,
 1 AS `chest_circumference`,
 1 AS `chip_number`,
 1 AS `registration_number`,
 1 AS `passport_number`,
 1 AS `avatar`,
 1 AS `photo_gallery`,
 1 AS `is_sterilized`,
 1 AS `sterilization_date`,
 1 AS `sterilization_hospital`,
 1 AS `personality_traits`,
 1 AS `behavioral_notes`,
 1 AS `dietary_preferences`,
 1 AS `allergies`,
 1 AS `medical_conditions`,
 1 AS `emergency_contact`,
 1 AS `emergency_phone`,
 1 AS `veterinarian_name`,
 1 AS `veterinarian_phone`,
 1 AS `veterinarian_address`,
 1 AS `insurance_company`,
 1 AS `insurance_policy_number`,
 1 AS `microchip_brand`,
 1 AS `microchip_implant_date`,
 1 AS `special_needs`,
 1 AS `special_notes`,
 1 AS `status`,
 1 AS `health_score`,
 1 AS `activity_level`,
 1 AS `training_level`,
 1 AS `socialization_level`,
 1 AS `visibility`,
 1 AS `is_shared_pet`,
 1 AS `sharing_agreement`,
 1 AS `qr_code_url`,
 1 AS `tags`,
 1 AS `owner_nickname`,
 1 AS `co_owner_nickname`,
 1 AS `breed_name`,
 1 AS `total_photos`,
 1 AS `total_health_records`,
 1 AS `total_care_records`,
 1 AS `last_health_check_date`,
 1 AS `last_care_date`,
 1 AS `deleted`,
 1 AS `delete_time`,
 1 AS `delete_by`,
 1 AS `create_time`,
 1 AS `update_time`,
 1 AS `create_by`,
 1 AS `update_by`,
 1 AS `remark`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_active_product_value_assessments`
--

DROP TABLE IF EXISTS `v_active_product_value_assessments`;
/*!50001 DROP VIEW IF EXISTS `v_active_product_value_assessments`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_active_product_value_assessments` AS SELECT 
 1 AS `assessment_id`,
 1 AS `purchase_id`,
 1 AS `assessment_date`,
 1 AS `assessment_type`,
 1 AS `current_value`,
 1 AS `depreciation_rate`,
 1 AS `condition_rating`,
 1 AS `usage_frequency`,
 1 AS `wear_level`,
 1 AS `functionality_status`,
 1 AS `market_price`,
 1 AS `replacement_cost`,
 1 AS `assessment_notes`,
 1 AS `photos`,
 1 AS `assessor_type`,
 1 AS `assessor_name`,
 1 AS `next_assessment_date`,
 1 AS `visibility`,
 1 AS `deleted`,
 1 AS `delete_time`,
 1 AS `delete_by`,
 1 AS `create_time`,
 1 AS `update_time`,
 1 AS `create_by`,
 1 AS `update_by`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_active_purchase_decisions`
--

DROP TABLE IF EXISTS `v_active_purchase_decisions`;
/*!50001 DROP VIEW IF EXISTS `v_active_purchase_decisions`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_active_purchase_decisions` AS SELECT 
 1 AS `decision_id`,
 1 AS `purchase_id`,
 1 AS `ruid`,
 1 AS `product_name`,
 1 AS `decision_date`,
 1 AS `decision_status`,
 1 AS `need_urgency`,
 1 AS `budget_range_min`,
 1 AS `budget_range_max`,
 1 AS `research_duration_days`,
 1 AS `alternatives_considered`,
 1 AS `decision_factors`,
 1 AS `pros_and_cons`,
 1 AS `influencing_reviews`,
 1 AS `consultation_sources`,
 1 AS `final_decision_reason`,
 1 AS `satisfaction_with_process`,
 1 AS `would_decide_same_again`,
 1 AS `lessons_learned`,
 1 AS `decision_timeline`,
 1 AS `visibility`,
 1 AS `deleted`,
 1 AS `delete_time`,
 1 AS `delete_by`,
 1 AS `create_time`,
 1 AS `update_time`,
 1 AS `create_by`,
 1 AS `update_by`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_active_reminders`
--

DROP TABLE IF EXISTS `v_active_reminders`;
/*!50001 DROP VIEW IF EXISTS `v_active_reminders`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_active_reminders` AS SELECT 
 1 AS `reminder_id`,
 1 AS `ruid`,
 1 AS `reminder_type`,
 1 AS `related_data_type`,
 1 AS `related_data_id`,
 1 AS `reminder_title`,
 1 AS `reminder_content`,
 1 AS `reminder_time`,
 1 AS `advance_days`,
 1 AS `repeat_type`,
 1 AS `repeat_interval`,
 1 AS `end_date`,
 1 AS `is_sent`,
 1 AS `send_time`,
 1 AS `send_method`,
 1 AS `is_read`,
 1 AS `read_time`,
 1 AS `snooze_until`,
 1 AS `is_active`,
 1 AS `ruid_nickname`,
 1 AS `deleted`,
 1 AS `delete_time`,
 1 AS `delete_by`,
 1 AS `create_time`,
 1 AS `update_time`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_active_users`
--

DROP TABLE IF EXISTS `v_active_users`;
/*!50001 DROP VIEW IF EXISTS `v_active_users`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_active_users` AS SELECT 
 1 AS `ruid`,
 1 AS `username`,
 1 AS `phone`,
 1 AS `email`,
 1 AS `nickname`,
 1 AS `avatar`,
 1 AS `gender`,
 1 AS `birthday`,
 1 AS `zodiac_sign`,
 1 AS `blood_type`,
 1 AS `height`,
 1 AS `weight`,
 1 AS `occupation`,
 1 AS `location_province`,
 1 AS `location_city`,
 1 AS `location_district`,
 1 AS `detailed_address`,
 1 AS `pet_start_date`,
 1 AS `favorite_pet_types`,
 1 AS `personality_tags`,
 1 AS `hobbies`,
 1 AS `status`,
 1 AS `account_type`,
 1 AS `wechat_openid`,
 1 AS `wechat_unionid`,
 1 AS `qq_openid`,
 1 AS `alipay_user_id`,
 1 AS `last_login_time`,
 1 AS `last_login_ip`,
 1 AS `login_count`,
 1 AS `password_update_time`,
 1 AS `email_verified`,
 1 AS `phone_verified`,
 1 AS `real_name_verified`,
 1 AS `create_time`,
 1 AS `update_time`,
 1 AS `create_by`,
 1 AS `update_by`,
 1 AS `deleted`,
 1 AS `delete_time`,
 1 AS `delete_by`,
 1 AS `remark`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_active_vaccine_records`
--

DROP TABLE IF EXISTS `v_active_vaccine_records`;
/*!50001 DROP VIEW IF EXISTS `v_active_vaccine_records`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_active_vaccine_records` AS SELECT 
 1 AS `record_id`,
 1 AS `pet_id`,
 1 AS `vaccine_type_id`,
 1 AS `vaccine_name`,
 1 AS `batch_number`,
 1 AS `vaccination_date`,
 1 AS `next_due_date`,
 1 AS `veterinarian`,
 1 AS `clinic_name`,
 1 AS `clinic_address`,
 1 AS `cost`,
 1 AS `side_effects`,
 1 AS `notes`,
 1 AS `certificate_url`,
 1 AS `reminder_sent`,
 1 AS `visibility`,
 1 AS `pet_name`,
 1 AS `pet_species`,
 1 AS `deleted`,
 1 AS `delete_time`,
 1 AS `delete_by`,
 1 AS `create_time`,
 1 AS `update_time`,
 1 AS `create_by`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_anniversary_reminder_stats`
--

DROP TABLE IF EXISTS `v_anniversary_reminder_stats`;
/*!50001 DROP VIEW IF EXISTS `v_anniversary_reminder_stats`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_anniversary_reminder_stats` AS SELECT 
 1 AS `ruid`,
 1 AS `nickname`,
 1 AS `total_reminders`,
 1 AS `sent_reminders`,
 1 AS `read_reminders`,
 1 AS `upcoming_reminders`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_expense_stats`
--

DROP TABLE IF EXISTS `v_expense_stats`;
/*!50001 DROP VIEW IF EXISTS `v_expense_stats`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_expense_stats` AS SELECT 
 1 AS `ruid`,
 1 AS `expense_year`,
 1 AS `expense_month`,
 1 AS `total_records`,
 1 AS `total_amount`,
 1 AS `avg_amount`,
 1 AS `shared_expenses`,
 1 AS `shared_amount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_orphan_records`
--

DROP TABLE IF EXISTS `v_orphan_records`;
/*!50001 DROP VIEW IF EXISTS `v_orphan_records`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_orphan_records` AS SELECT 
 1 AS `table_name`,
 1 AS `record_id`,
 1 AS `parent_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_pet_asset_stats`
--

DROP TABLE IF EXISTS `v_pet_asset_stats`;
/*!50001 DROP VIEW IF EXISTS `v_pet_asset_stats`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_pet_asset_stats` AS SELECT 
 1 AS `pet_id`,
 1 AS `pet_name`,
 1 AS `owner_ruid`,
 1 AS `total_purchases`,
 1 AS `total_investment`,
 1 AS `avg_purchase_cost`,
 1 AS `total_assessments`,
 1 AS `latest_total_value`,
 1 AS `depreciation_amount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_pet_complete_profile_stats`
--

DROP TABLE IF EXISTS `v_pet_complete_profile_stats`;
/*!50001 DROP VIEW IF EXISTS `v_pet_complete_profile_stats`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_pet_complete_profile_stats` AS SELECT 
 1 AS `pet_id`,
 1 AS `pet_name`,
 1 AS `owner_ruid`,
 1 AS `species`,
 1 AS `breed_name`,
 1 AS `family_relations_count`,
 1 AS `feature_tags_count`,
 1 AS `preferences_count`,
 1 AS `growth_records_count`,
 1 AS `anniversaries_count`,
 1 AS `purchases_count`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_pet_health_stats`
--

DROP TABLE IF EXISTS `v_pet_health_stats`;
/*!50001 DROP VIEW IF EXISTS `v_pet_health_stats`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_pet_health_stats` AS SELECT 
 1 AS `pet_id`,
 1 AS `pet_name`,
 1 AS `owner_ruid`,
 1 AS `total_health_records`,
 1 AS `abnormal_records`,
 1 AS `last_health_check`,
 1 AS `total_vaccines`,
 1 AS `last_vaccination`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_table_stats`
--

DROP TABLE IF EXISTS `v_table_stats`;
/*!50001 DROP VIEW IF EXISTS `v_table_stats`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_table_stats` AS SELECT 
 1 AS `TABLE_NAME`,
 1 AS `TABLE_ROWS`,
 1 AS `Size_MB`,
 1 AS `Data_MB`,
 1 AS `Index_MB`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_user_pet_stats`
--

DROP TABLE IF EXISTS `v_user_pet_stats`;
/*!50001 DROP VIEW IF EXISTS `v_user_pet_stats`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_user_pet_stats` AS SELECT 
 1 AS `ruid`,
 1 AS `nickname`,
 1 AS `total_pets`,
 1 AS `healthy_pets`,
 1 AS `sick_pets`,
 1 AS `shared_pets`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_user_purchase_stats`
--

DROP TABLE IF EXISTS `v_user_purchase_stats`;
/*!50001 DROP VIEW IF EXISTS `v_user_purchase_stats`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_user_purchase_stats` AS SELECT 
 1 AS `ruid`,
 1 AS `nickname`,
 1 AS `total_purchases`,
 1 AS `total_spent`,
 1 AS `avg_purchase_amount`,
 1 AS `pets_purchased_for`,
 1 AS `last_purchase_date`,
 1 AS `avg_satisfaction`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `v_active_anniversary_reminders`
--

/*!50001 DROP VIEW IF EXISTS `v_active_anniversary_reminders`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_active_anniversary_reminders` AS select `l_anniversary_reminders`.`reminder_id` AS `reminder_id`,`l_anniversary_reminders`.`anniversary_type` AS `anniversary_type`,`l_anniversary_reminders`.`anniversary_id` AS `anniversary_id`,`l_anniversary_reminders`.`ruid` AS `ruid`,`l_anniversary_reminders`.`reminder_date` AS `reminder_date`,`l_anniversary_reminders`.`reminder_time` AS `reminder_time`,`l_anniversary_reminders`.`reminder_title` AS `reminder_title`,`l_anniversary_reminders`.`reminder_content` AS `reminder_content`,`l_anniversary_reminders`.`reminder_method` AS `reminder_method`,`l_anniversary_reminders`.`is_sent` AS `is_sent`,`l_anniversary_reminders`.`sent_time` AS `sent_time`,`l_anniversary_reminders`.`is_read` AS `is_read`,`l_anniversary_reminders`.`read_time` AS `read_time`,`l_anniversary_reminders`.`response_action` AS `response_action`,`l_anniversary_reminders`.`snooze_until` AS `snooze_until`,`l_anniversary_reminders`.`priority_level` AS `priority_level`,`l_anniversary_reminders`.`deleted` AS `deleted`,`l_anniversary_reminders`.`delete_time` AS `delete_time`,`l_anniversary_reminders`.`delete_by` AS `delete_by`,`l_anniversary_reminders`.`create_time` AS `create_time`,`l_anniversary_reminders`.`update_time` AS `update_time` from `l_anniversary_reminders` where (`l_anniversary_reminders`.`deleted` = 0) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_active_care_records`
--

/*!50001 DROP VIEW IF EXISTS `v_active_care_records`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_active_care_records` AS select `l_care_records`.`record_id` AS `record_id`,`l_care_records`.`pet_id` AS `pet_id`,`l_care_records`.`activity_type_id` AS `activity_type_id`,`l_care_records`.`activity_name` AS `activity_name`,`l_care_records`.`activity_date` AS `activity_date`,`l_care_records`.`duration_minutes` AS `duration_minutes`,`l_care_records`.`location` AS `location`,`l_care_records`.`service_provider` AS `service_provider`,`l_care_records`.`cost` AS `cost`,`l_care_records`.`products_used` AS `products_used`,`l_care_records`.`notes` AS `notes`,`l_care_records`.`next_due_date` AS `next_due_date`,`l_care_records`.`photo_urls` AS `photo_urls`,`l_care_records`.`rating` AS `rating`,`l_care_records`.`reminder_sent` AS `reminder_sent`,`l_care_records`.`visibility` AS `visibility`,`l_care_records`.`pet_name` AS `pet_name`,`l_care_records`.`activity_type_name` AS `activity_type_name`,`l_care_records`.`deleted` AS `deleted`,`l_care_records`.`delete_time` AS `delete_time`,`l_care_records`.`delete_by` AS `delete_by`,`l_care_records`.`create_time` AS `create_time`,`l_care_records`.`update_time` AS `update_time`,`l_care_records`.`create_by` AS `create_by` from `l_care_records` where (`l_care_records`.`deleted` = 0) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_active_couple_anniversaries`
--

/*!50001 DROP VIEW IF EXISTS `v_active_couple_anniversaries`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_active_couple_anniversaries` AS select `l_couple_anniversaries`.`anniversary_id` AS `anniversary_id`,`l_couple_anniversaries`.`relation_id` AS `relation_id`,`l_couple_anniversaries`.`anniversary_type` AS `anniversary_type`,`l_couple_anniversaries`.`anniversary_name` AS `anniversary_name`,`l_couple_anniversaries`.`anniversary_date` AS `anniversary_date`,`l_couple_anniversaries`.`is_recurring` AS `is_recurring`,`l_couple_anniversaries`.`description` AS `description`,`l_couple_anniversaries`.`importance_level` AS `importance_level`,`l_couple_anniversaries`.`celebration_plan` AS `celebration_plan`,`l_couple_anniversaries`.`photos` AS `photos`,`l_couple_anniversaries`.`memories` AS `memories`,`l_couple_anniversaries`.`gifts_exchanged` AS `gifts_exchanged`,`l_couple_anniversaries`.`location` AS `location`,`l_couple_anniversaries`.`special_meaning` AS `special_meaning`,`l_couple_anniversaries`.`reminder_days_before` AS `reminder_days_before`,`l_couple_anniversaries`.`is_reminder_enabled` AS `is_reminder_enabled`,`l_couple_anniversaries`.`last_celebrated_year` AS `last_celebrated_year`,`l_couple_anniversaries`.`celebration_count` AS `celebration_count`,`l_couple_anniversaries`.`visibility` AS `visibility`,`l_couple_anniversaries`.`deleted` AS `deleted`,`l_couple_anniversaries`.`delete_time` AS `delete_time`,`l_couple_anniversaries`.`delete_by` AS `delete_by`,`l_couple_anniversaries`.`create_time` AS `create_time`,`l_couple_anniversaries`.`update_time` AS `update_time`,`l_couple_anniversaries`.`create_by` AS `create_by`,`l_couple_anniversaries`.`update_by` AS `update_by` from `l_couple_anniversaries` where (`l_couple_anniversaries`.`deleted` = 0) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_active_expense_records`
--

/*!50001 DROP VIEW IF EXISTS `v_active_expense_records`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_active_expense_records` AS select `l_expense_records`.`record_id` AS `record_id`,`l_expense_records`.`ruid` AS `ruid`,`l_expense_records`.`pet_id` AS `pet_id`,`l_expense_records`.`category_id` AS `category_id`,`l_expense_records`.`expense_title` AS `expense_title`,`l_expense_records`.`amount` AS `amount`,`l_expense_records`.`currency` AS `currency`,`l_expense_records`.`expense_date` AS `expense_date`,`l_expense_records`.`payment_method` AS `payment_method`,`l_expense_records`.`merchant_name` AS `merchant_name`,`l_expense_records`.`merchant_address` AS `merchant_address`,`l_expense_records`.`merchant_phone` AS `merchant_phone`,`l_expense_records`.`expense_type` AS `expense_type`,`l_expense_records`.`sharing_ratio` AS `sharing_ratio`,`l_expense_records`.`shared_with_ruid` AS `shared_with_ruid`,`l_expense_records`.`actual_payer_ruid` AS `actual_payer_ruid`,`l_expense_records`.`reimbursement_status` AS `reimbursement_status`,`l_expense_records`.`reimbursement_amount` AS `reimbursement_amount`,`l_expense_records`.`invoice_number` AS `invoice_number`,`l_expense_records`.`invoice_url` AS `invoice_url`,`l_expense_records`.`receipt_url` AS `receipt_url`,`l_expense_records`.`warranty_info` AS `warranty_info`,`l_expense_records`.`return_policy` AS `return_policy`,`l_expense_records`.`description` AS `description`,`l_expense_records`.`tags` AS `tags`,`l_expense_records`.`location_info` AS `location_info`,`l_expense_records`.`weather_info` AS `weather_info`,`l_expense_records`.`mood_rating` AS `mood_rating`,`l_expense_records`.`necessity_level` AS `necessity_level`,`l_expense_records`.`satisfaction_rating` AS `satisfaction_rating`,`l_expense_records`.`privacy_level` AS `privacy_level`,`l_expense_records`.`is_hidden` AS `is_hidden`,`l_expense_records`.`is_recurring` AS `is_recurring`,`l_expense_records`.`recurring_period` AS `recurring_period`,`l_expense_records`.`verification_required` AS `verification_required`,`l_expense_records`.`verified_by_ruid` AS `verified_by_ruid`,`l_expense_records`.`verified_time` AS `verified_time`,`l_expense_records`.`verification_notes` AS `verification_notes`,`l_expense_records`.`ruid_nickname` AS `ruid_nickname`,`l_expense_records`.`pet_name` AS `pet_name`,`l_expense_records`.`category_name` AS `category_name`,`l_expense_records`.`shared_with_nickname` AS `shared_with_nickname`,`l_expense_records`.`deleted` AS `deleted`,`l_expense_records`.`delete_time` AS `delete_time`,`l_expense_records`.`delete_by` AS `delete_by`,`l_expense_records`.`create_time` AS `create_time`,`l_expense_records`.`update_time` AS `update_time`,`l_expense_records`.`create_by` AS `create_by`,`l_expense_records`.`update_by` AS `update_by` from `l_expense_records` where (`l_expense_records`.`deleted` = 0) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_active_health_records`
--

/*!50001 DROP VIEW IF EXISTS `v_active_health_records`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_active_health_records` AS select `l_health_records`.`record_id` AS `record_id`,`l_health_records`.`pet_id` AS `pet_id`,`l_health_records`.`record_type` AS `record_type`,`l_health_records`.`value` AS `value`,`l_health_records`.`unit` AS `unit`,`l_health_records`.`normal_range_min` AS `normal_range_min`,`l_health_records`.`normal_range_max` AS `normal_range_max`,`l_health_records`.`is_abnormal` AS `is_abnormal`,`l_health_records`.`measurement_date` AS `measurement_date`,`l_health_records`.`measurement_method` AS `measurement_method`,`l_health_records`.`notes` AS `notes`,`l_health_records`.`alert_sent` AS `alert_sent`,`l_health_records`.`visibility` AS `visibility`,`l_health_records`.`pet_name` AS `pet_name`,`l_health_records`.`deleted` AS `deleted`,`l_health_records`.`delete_time` AS `delete_time`,`l_health_records`.`delete_by` AS `delete_by`,`l_health_records`.`create_time` AS `create_time`,`l_health_records`.`create_by` AS `create_by` from `l_health_records` where (`l_health_records`.`deleted` = 0) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_active_love_diaries`
--

/*!50001 DROP VIEW IF EXISTS `v_active_love_diaries`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_active_love_diaries` AS select `l_love_diaries`.`love_diary_id` AS `love_diary_id`,`l_love_diaries`.`relation_id` AS `relation_id`,`l_love_diaries`.`author_ruid` AS `author_ruid`,`l_love_diaries`.`diary_title` AS `diary_title`,`l_love_diaries`.`diary_content` AS `diary_content`,`l_love_diaries`.`diary_date` AS `diary_date`,`l_love_diaries`.`mood` AS `mood`,`l_love_diaries`.`mood_score` AS `mood_score`,`l_love_diaries`.`weather` AS `weather`,`l_love_diaries`.`location` AS `location`,`l_love_diaries`.`photo_urls` AS `photo_urls`,`l_love_diaries`.`tags` AS `tags`,`l_love_diaries`.`is_private` AS `is_private`,`l_love_diaries`.`shared_with_partner` AS `shared_with_partner`,`l_love_diaries`.`partner_can_comment` AS `partner_can_comment`,`l_love_diaries`.`temporary_share_code` AS `temporary_share_code`,`l_love_diaries`.`temporary_share_expires` AS `temporary_share_expires`,`l_love_diaries`.`view_count` AS `view_count`,`l_love_diaries`.`is_favorite` AS `is_favorite`,`l_love_diaries`.`author_nickname` AS `author_nickname`,`l_love_diaries`.`deleted` AS `deleted`,`l_love_diaries`.`delete_time` AS `delete_time`,`l_love_diaries`.`delete_by` AS `delete_by`,`l_love_diaries`.`create_time` AS `create_time`,`l_love_diaries`.`update_time` AS `update_time`,`l_love_diaries`.`create_by` AS `create_by`,`l_love_diaries`.`update_by` AS `update_by` from `l_love_diaries` where (`l_love_diaries`.`deleted` = 0) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_active_pet_anniversaries`
--

/*!50001 DROP VIEW IF EXISTS `v_active_pet_anniversaries`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_active_pet_anniversaries` AS select `l_pet_anniversaries`.`anniversary_id` AS `anniversary_id`,`l_pet_anniversaries`.`pet_id` AS `pet_id`,`l_pet_anniversaries`.`anniversary_type` AS `anniversary_type`,`l_pet_anniversaries`.`anniversary_name` AS `anniversary_name`,`l_pet_anniversaries`.`anniversary_date` AS `anniversary_date`,`l_pet_anniversaries`.`is_recurring` AS `is_recurring`,`l_pet_anniversaries`.`description` AS `description`,`l_pet_anniversaries`.`importance_level` AS `importance_level`,`l_pet_anniversaries`.`celebration_plan` AS `celebration_plan`,`l_pet_anniversaries`.`photos` AS `photos`,`l_pet_anniversaries`.`memories` AS `memories`,`l_pet_anniversaries`.`gifts_given` AS `gifts_given`,`l_pet_anniversaries`.`location` AS `location`,`l_pet_anniversaries`.`participants` AS `participants`,`l_pet_anniversaries`.`reminder_days_before` AS `reminder_days_before`,`l_pet_anniversaries`.`is_reminder_enabled` AS `is_reminder_enabled`,`l_pet_anniversaries`.`last_celebrated_year` AS `last_celebrated_year`,`l_pet_anniversaries`.`celebration_count` AS `celebration_count`,`l_pet_anniversaries`.`visibility` AS `visibility`,`l_pet_anniversaries`.`pet_name` AS `pet_name`,`l_pet_anniversaries`.`deleted` AS `deleted`,`l_pet_anniversaries`.`delete_time` AS `delete_time`,`l_pet_anniversaries`.`delete_by` AS `delete_by`,`l_pet_anniversaries`.`create_time` AS `create_time`,`l_pet_anniversaries`.`update_time` AS `update_time`,`l_pet_anniversaries`.`create_by` AS `create_by`,`l_pet_anniversaries`.`update_by` AS `update_by` from `l_pet_anniversaries` where (`l_pet_anniversaries`.`deleted` = 0) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_active_pet_family_relations`
--

/*!50001 DROP VIEW IF EXISTS `v_active_pet_family_relations`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_active_pet_family_relations` AS select `l_pet_family_relations`.`relation_id` AS `relation_id`,`l_pet_family_relations`.`pet_id` AS `pet_id`,`l_pet_family_relations`.`related_pet_id` AS `related_pet_id`,`l_pet_family_relations`.`relation_type` AS `relation_type`,`l_pet_family_relations`.`relation_desc` AS `relation_desc`,`l_pet_family_relations`.`confirmed` AS `confirmed`,`l_pet_family_relations`.`confirmed_by` AS `confirmed_by`,`l_pet_family_relations`.`confirmed_time` AS `confirmed_time`,`l_pet_family_relations`.`visibility` AS `visibility`,`l_pet_family_relations`.`pet_name` AS `pet_name`,`l_pet_family_relations`.`related_pet_name` AS `related_pet_name`,`l_pet_family_relations`.`deleted` AS `deleted`,`l_pet_family_relations`.`delete_time` AS `delete_time`,`l_pet_family_relations`.`delete_by` AS `delete_by`,`l_pet_family_relations`.`create_time` AS `create_time`,`l_pet_family_relations`.`update_time` AS `update_time`,`l_pet_family_relations`.`create_by` AS `create_by`,`l_pet_family_relations`.`update_by` AS `update_by`,`l_pet_family_relations`.`remark` AS `remark` from `l_pet_family_relations` where (`l_pet_family_relations`.`deleted` = 0) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_active_pet_feature_tags`
--

/*!50001 DROP VIEW IF EXISTS `v_active_pet_feature_tags`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_active_pet_feature_tags` AS select `l_pet_feature_tags`.`tag_id` AS `tag_id`,`l_pet_feature_tags`.`pet_id` AS `pet_id`,`l_pet_feature_tags`.`tag_category` AS `tag_category`,`l_pet_feature_tags`.`tag_name` AS `tag_name`,`l_pet_feature_tags`.`tag_value` AS `tag_value`,`l_pet_feature_tags`.`tag_description` AS `tag_description`,`l_pet_feature_tags`.`is_system_tag` AS `is_system_tag`,`l_pet_feature_tags`.`tag_color` AS `tag_color`,`l_pet_feature_tags`.`sort_order` AS `sort_order`,`l_pet_feature_tags`.`visibility` AS `visibility`,`l_pet_feature_tags`.`pet_name` AS `pet_name`,`l_pet_feature_tags`.`deleted` AS `deleted`,`l_pet_feature_tags`.`delete_time` AS `delete_time`,`l_pet_feature_tags`.`delete_by` AS `delete_by`,`l_pet_feature_tags`.`create_time` AS `create_time`,`l_pet_feature_tags`.`update_time` AS `update_time`,`l_pet_feature_tags`.`create_by` AS `create_by`,`l_pet_feature_tags`.`update_by` AS `update_by` from `l_pet_feature_tags` where (`l_pet_feature_tags`.`deleted` = 0) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_active_pet_growth_records`
--

/*!50001 DROP VIEW IF EXISTS `v_active_pet_growth_records`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_active_pet_growth_records` AS select `l_pet_growth_records`.`record_id` AS `record_id`,`l_pet_growth_records`.`pet_id` AS `pet_id`,`l_pet_growth_records`.`growth_stage` AS `growth_stage`,`l_pet_growth_records`.`record_date` AS `record_date`,`l_pet_growth_records`.`age_months` AS `age_months`,`l_pet_growth_records`.`weight` AS `weight`,`l_pet_growth_records`.`height` AS `height`,`l_pet_growth_records`.`length` AS `length`,`l_pet_growth_records`.`development_notes` AS `development_notes`,`l_pet_growth_records`.`behavioral_changes` AS `behavioral_changes`,`l_pet_growth_records`.`health_status` AS `health_status`,`l_pet_growth_records`.`milestone_achieved` AS `milestone_achieved`,`l_pet_growth_records`.`photos` AS `photos`,`l_pet_growth_records`.`veterinarian_notes` AS `veterinarian_notes`,`l_pet_growth_records`.`next_checkup_date` AS `next_checkup_date`,`l_pet_growth_records`.`visibility` AS `visibility`,`l_pet_growth_records`.`pet_name` AS `pet_name`,`l_pet_growth_records`.`deleted` AS `deleted`,`l_pet_growth_records`.`delete_time` AS `delete_time`,`l_pet_growth_records`.`delete_by` AS `delete_by`,`l_pet_growth_records`.`create_time` AS `create_time`,`l_pet_growth_records`.`update_time` AS `update_time`,`l_pet_growth_records`.`create_by` AS `create_by`,`l_pet_growth_records`.`update_by` AS `update_by` from `l_pet_growth_records` where (`l_pet_growth_records`.`deleted` = 0) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_active_pet_photos`
--

/*!50001 DROP VIEW IF EXISTS `v_active_pet_photos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_active_pet_photos` AS select `l_pet_photos`.`photo_id` AS `photo_id`,`l_pet_photos`.`pet_id` AS `pet_id`,`l_pet_photos`.`photo_url` AS `photo_url`,`l_pet_photos`.`thumbnail_url` AS `thumbnail_url`,`l_pet_photos`.`photo_title` AS `photo_title`,`l_pet_photos`.`photo_desc` AS `photo_desc`,`l_pet_photos`.`photo_date` AS `photo_date`,`l_pet_photos`.`location` AS `location`,`l_pet_photos`.`tags` AS `tags`,`l_pet_photos`.`ai_tags` AS `ai_tags`,`l_pet_photos`.`is_favorite` AS `is_favorite`,`l_pet_photos`.`visibility` AS `visibility`,`l_pet_photos`.`deleted` AS `deleted`,`l_pet_photos`.`delete_time` AS `delete_time`,`l_pet_photos`.`delete_by` AS `delete_by`,`l_pet_photos`.`create_time` AS `create_time`,`l_pet_photos`.`update_time` AS `update_time`,`l_pet_photos`.`create_by` AS `create_by` from `l_pet_photos` where (`l_pet_photos`.`deleted` = 0) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_active_pet_preferences`
--

/*!50001 DROP VIEW IF EXISTS `v_active_pet_preferences`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_active_pet_preferences` AS select `l_pet_preferences`.`preference_id` AS `preference_id`,`l_pet_preferences`.`pet_id` AS `pet_id`,`l_pet_preferences`.`preference_category` AS `preference_category`,`l_pet_preferences`.`preference_name` AS `preference_name`,`l_pet_preferences`.`preference_level` AS `preference_level`,`l_pet_preferences`.`preference_desc` AS `preference_desc`,`l_pet_preferences`.`notes` AS `notes`,`l_pet_preferences`.`last_observed_date` AS `last_observed_date`,`l_pet_preferences`.`confidence_level` AS `confidence_level`,`l_pet_preferences`.`visibility` AS `visibility`,`l_pet_preferences`.`pet_name` AS `pet_name`,`l_pet_preferences`.`deleted` AS `deleted`,`l_pet_preferences`.`delete_time` AS `delete_time`,`l_pet_preferences`.`delete_by` AS `delete_by`,`l_pet_preferences`.`create_time` AS `create_time`,`l_pet_preferences`.`update_time` AS `update_time`,`l_pet_preferences`.`create_by` AS `create_by`,`l_pet_preferences`.`update_by` AS `update_by` from `l_pet_preferences` where (`l_pet_preferences`.`deleted` = 0) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_active_pet_product_purchases`
--

/*!50001 DROP VIEW IF EXISTS `v_active_pet_product_purchases`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_active_pet_product_purchases` AS select `l_pet_product_purchases`.`purchase_id` AS `purchase_id`,`l_pet_product_purchases`.`pet_id` AS `pet_id`,`l_pet_product_purchases`.`ruid` AS `ruid`,`l_pet_product_purchases`.`product_name` AS `product_name`,`l_pet_product_purchases`.`product_category` AS `product_category`,`l_pet_product_purchases`.`brand_name` AS `brand_name`,`l_pet_product_purchases`.`product_model` AS `product_model`,`l_pet_product_purchases`.`purchase_date` AS `purchase_date`,`l_pet_product_purchases`.`purchase_price` AS `purchase_price`,`l_pet_product_purchases`.`quantity` AS `quantity`,`l_pet_product_purchases`.`total_amount` AS `total_amount`,`l_pet_product_purchases`.`currency` AS `currency`,`l_pet_product_purchases`.`purchase_channel` AS `purchase_channel`,`l_pet_product_purchases`.`store_name` AS `store_name`,`l_pet_product_purchases`.`order_number` AS `order_number`,`l_pet_product_purchases`.`receipt_photo` AS `receipt_photo`,`l_pet_product_purchases`.`product_photos` AS `product_photos`,`l_pet_product_purchases`.`purchase_reason` AS `purchase_reason`,`l_pet_product_purchases`.`expected_usage` AS `expected_usage`,`l_pet_product_purchases`.`warranty_period` AS `warranty_period`,`l_pet_product_purchases`.`warranty_end_date` AS `warranty_end_date`,`l_pet_product_purchases`.`is_gift` AS `is_gift`,`l_pet_product_purchases`.`gift_from` AS `gift_from`,`l_pet_product_purchases`.`usage_status` AS `usage_status`,`l_pet_product_purchases`.`satisfaction_rating` AS `satisfaction_rating`,`l_pet_product_purchases`.`review_notes` AS `review_notes`,`l_pet_product_purchases`.`repurchase_intention` AS `repurchase_intention`,`l_pet_product_purchases`.`visibility` AS `visibility`,`l_pet_product_purchases`.`pet_name` AS `pet_name`,`l_pet_product_purchases`.`purchaser_nickname` AS `purchaser_nickname`,`l_pet_product_purchases`.`deleted` AS `deleted`,`l_pet_product_purchases`.`delete_time` AS `delete_time`,`l_pet_product_purchases`.`delete_by` AS `delete_by`,`l_pet_product_purchases`.`create_time` AS `create_time`,`l_pet_product_purchases`.`update_time` AS `update_time`,`l_pet_product_purchases`.`create_by` AS `create_by`,`l_pet_product_purchases`.`update_by` AS `update_by` from `l_pet_product_purchases` where (`l_pet_product_purchases`.`deleted` = 0) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_active_pets`
--

/*!50001 DROP VIEW IF EXISTS `v_active_pets`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_active_pets` AS select `l_pets`.`pet_id` AS `pet_id`,`l_pets`.`pet_name` AS `pet_name`,`l_pets`.`pet_nickname` AS `pet_nickname`,`l_pets`.`owner_ruid` AS `owner_ruid`,`l_pets`.`co_owner_ruid` AS `co_owner_ruid`,`l_pets`.`breed_id` AS `breed_id`,`l_pets`.`species` AS `species`,`l_pets`.`gender` AS `gender`,`l_pets`.`birth_date` AS `birth_date`,`l_pets`.`adoption_date` AS `adoption_date`,`l_pets`.`age_months` AS `age_months`,`l_pets`.`color` AS `color`,`l_pets`.`pattern` AS `pattern`,`l_pets`.`weight` AS `weight`,`l_pets`.`height` AS `height`,`l_pets`.`length` AS `length`,`l_pets`.`chest_circumference` AS `chest_circumference`,`l_pets`.`chip_number` AS `chip_number`,`l_pets`.`registration_number` AS `registration_number`,`l_pets`.`passport_number` AS `passport_number`,`l_pets`.`avatar` AS `avatar`,`l_pets`.`photo_gallery` AS `photo_gallery`,`l_pets`.`is_sterilized` AS `is_sterilized`,`l_pets`.`sterilization_date` AS `sterilization_date`,`l_pets`.`sterilization_hospital` AS `sterilization_hospital`,`l_pets`.`personality_traits` AS `personality_traits`,`l_pets`.`behavioral_notes` AS `behavioral_notes`,`l_pets`.`dietary_preferences` AS `dietary_preferences`,`l_pets`.`allergies` AS `allergies`,`l_pets`.`medical_conditions` AS `medical_conditions`,`l_pets`.`emergency_contact` AS `emergency_contact`,`l_pets`.`emergency_phone` AS `emergency_phone`,`l_pets`.`veterinarian_name` AS `veterinarian_name`,`l_pets`.`veterinarian_phone` AS `veterinarian_phone`,`l_pets`.`veterinarian_address` AS `veterinarian_address`,`l_pets`.`insurance_company` AS `insurance_company`,`l_pets`.`insurance_policy_number` AS `insurance_policy_number`,`l_pets`.`microchip_brand` AS `microchip_brand`,`l_pets`.`microchip_implant_date` AS `microchip_implant_date`,`l_pets`.`special_needs` AS `special_needs`,`l_pets`.`special_notes` AS `special_notes`,`l_pets`.`status` AS `status`,`l_pets`.`health_score` AS `health_score`,`l_pets`.`activity_level` AS `activity_level`,`l_pets`.`training_level` AS `training_level`,`l_pets`.`socialization_level` AS `socialization_level`,`l_pets`.`visibility` AS `visibility`,`l_pets`.`is_shared_pet` AS `is_shared_pet`,`l_pets`.`sharing_agreement` AS `sharing_agreement`,`l_pets`.`qr_code_url` AS `qr_code_url`,`l_pets`.`tags` AS `tags`,`l_pets`.`owner_nickname` AS `owner_nickname`,`l_pets`.`co_owner_nickname` AS `co_owner_nickname`,`l_pets`.`breed_name` AS `breed_name`,`l_pets`.`total_photos` AS `total_photos`,`l_pets`.`total_health_records` AS `total_health_records`,`l_pets`.`total_care_records` AS `total_care_records`,`l_pets`.`last_health_check_date` AS `last_health_check_date`,`l_pets`.`last_care_date` AS `last_care_date`,`l_pets`.`deleted` AS `deleted`,`l_pets`.`delete_time` AS `delete_time`,`l_pets`.`delete_by` AS `delete_by`,`l_pets`.`create_time` AS `create_time`,`l_pets`.`update_time` AS `update_time`,`l_pets`.`create_by` AS `create_by`,`l_pets`.`update_by` AS `update_by`,`l_pets`.`remark` AS `remark` from `l_pets` where (`l_pets`.`deleted` = 0) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_active_product_value_assessments`
--

/*!50001 DROP VIEW IF EXISTS `v_active_product_value_assessments`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_active_product_value_assessments` AS select `l_product_value_assessments`.`assessment_id` AS `assessment_id`,`l_product_value_assessments`.`purchase_id` AS `purchase_id`,`l_product_value_assessments`.`assessment_date` AS `assessment_date`,`l_product_value_assessments`.`assessment_type` AS `assessment_type`,`l_product_value_assessments`.`current_value` AS `current_value`,`l_product_value_assessments`.`depreciation_rate` AS `depreciation_rate`,`l_product_value_assessments`.`condition_rating` AS `condition_rating`,`l_product_value_assessments`.`usage_frequency` AS `usage_frequency`,`l_product_value_assessments`.`wear_level` AS `wear_level`,`l_product_value_assessments`.`functionality_status` AS `functionality_status`,`l_product_value_assessments`.`market_price` AS `market_price`,`l_product_value_assessments`.`replacement_cost` AS `replacement_cost`,`l_product_value_assessments`.`assessment_notes` AS `assessment_notes`,`l_product_value_assessments`.`photos` AS `photos`,`l_product_value_assessments`.`assessor_type` AS `assessor_type`,`l_product_value_assessments`.`assessor_name` AS `assessor_name`,`l_product_value_assessments`.`next_assessment_date` AS `next_assessment_date`,`l_product_value_assessments`.`visibility` AS `visibility`,`l_product_value_assessments`.`deleted` AS `deleted`,`l_product_value_assessments`.`delete_time` AS `delete_time`,`l_product_value_assessments`.`delete_by` AS `delete_by`,`l_product_value_assessments`.`create_time` AS `create_time`,`l_product_value_assessments`.`update_time` AS `update_time`,`l_product_value_assessments`.`create_by` AS `create_by`,`l_product_value_assessments`.`update_by` AS `update_by` from `l_product_value_assessments` where (`l_product_value_assessments`.`deleted` = 0) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_active_purchase_decisions`
--

/*!50001 DROP VIEW IF EXISTS `v_active_purchase_decisions`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_active_purchase_decisions` AS select `l_purchase_decisions`.`decision_id` AS `decision_id`,`l_purchase_decisions`.`purchase_id` AS `purchase_id`,`l_purchase_decisions`.`ruid` AS `ruid`,`l_purchase_decisions`.`product_name` AS `product_name`,`l_purchase_decisions`.`decision_date` AS `decision_date`,`l_purchase_decisions`.`decision_status` AS `decision_status`,`l_purchase_decisions`.`need_urgency` AS `need_urgency`,`l_purchase_decisions`.`budget_range_min` AS `budget_range_min`,`l_purchase_decisions`.`budget_range_max` AS `budget_range_max`,`l_purchase_decisions`.`research_duration_days` AS `research_duration_days`,`l_purchase_decisions`.`alternatives_considered` AS `alternatives_considered`,`l_purchase_decisions`.`decision_factors` AS `decision_factors`,`l_purchase_decisions`.`pros_and_cons` AS `pros_and_cons`,`l_purchase_decisions`.`influencing_reviews` AS `influencing_reviews`,`l_purchase_decisions`.`consultation_sources` AS `consultation_sources`,`l_purchase_decisions`.`final_decision_reason` AS `final_decision_reason`,`l_purchase_decisions`.`satisfaction_with_process` AS `satisfaction_with_process`,`l_purchase_decisions`.`would_decide_same_again` AS `would_decide_same_again`,`l_purchase_decisions`.`lessons_learned` AS `lessons_learned`,`l_purchase_decisions`.`decision_timeline` AS `decision_timeline`,`l_purchase_decisions`.`visibility` AS `visibility`,`l_purchase_decisions`.`deleted` AS `deleted`,`l_purchase_decisions`.`delete_time` AS `delete_time`,`l_purchase_decisions`.`delete_by` AS `delete_by`,`l_purchase_decisions`.`create_time` AS `create_time`,`l_purchase_decisions`.`update_time` AS `update_time`,`l_purchase_decisions`.`create_by` AS `create_by`,`l_purchase_decisions`.`update_by` AS `update_by` from `l_purchase_decisions` where (`l_purchase_decisions`.`deleted` = 0) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_active_reminders`
--

/*!50001 DROP VIEW IF EXISTS `v_active_reminders`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_active_reminders` AS select `l_reminders`.`reminder_id` AS `reminder_id`,`l_reminders`.`ruid` AS `ruid`,`l_reminders`.`reminder_type` AS `reminder_type`,`l_reminders`.`related_data_type` AS `related_data_type`,`l_reminders`.`related_data_id` AS `related_data_id`,`l_reminders`.`reminder_title` AS `reminder_title`,`l_reminders`.`reminder_content` AS `reminder_content`,`l_reminders`.`reminder_time` AS `reminder_time`,`l_reminders`.`advance_days` AS `advance_days`,`l_reminders`.`repeat_type` AS `repeat_type`,`l_reminders`.`repeat_interval` AS `repeat_interval`,`l_reminders`.`end_date` AS `end_date`,`l_reminders`.`is_sent` AS `is_sent`,`l_reminders`.`send_time` AS `send_time`,`l_reminders`.`send_method` AS `send_method`,`l_reminders`.`is_read` AS `is_read`,`l_reminders`.`read_time` AS `read_time`,`l_reminders`.`snooze_until` AS `snooze_until`,`l_reminders`.`is_active` AS `is_active`,`l_reminders`.`ruid_nickname` AS `ruid_nickname`,`l_reminders`.`deleted` AS `deleted`,`l_reminders`.`delete_time` AS `delete_time`,`l_reminders`.`delete_by` AS `delete_by`,`l_reminders`.`create_time` AS `create_time`,`l_reminders`.`update_time` AS `update_time` from `l_reminders` where (`l_reminders`.`deleted` = 0) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_active_users`
--

/*!50001 DROP VIEW IF EXISTS `v_active_users`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_active_users` AS select `l_raiser_users`.`ruid` AS `ruid`,`l_raiser_users`.`username` AS `username`,`l_raiser_users`.`phone` AS `phone`,`l_raiser_users`.`email` AS `email`,`l_raiser_users`.`nickname` AS `nickname`,`l_raiser_users`.`avatar` AS `avatar`,`l_raiser_users`.`gender` AS `gender`,`l_raiser_users`.`birthday` AS `birthday`,`l_raiser_users`.`zodiac_sign` AS `zodiac_sign`,`l_raiser_users`.`blood_type` AS `blood_type`,`l_raiser_users`.`height` AS `height`,`l_raiser_users`.`weight` AS `weight`,`l_raiser_users`.`occupation` AS `occupation`,`l_raiser_users`.`location_province` AS `location_province`,`l_raiser_users`.`location_city` AS `location_city`,`l_raiser_users`.`location_district` AS `location_district`,`l_raiser_users`.`detailed_address` AS `detailed_address`,`l_raiser_users`.`pet_start_date` AS `pet_start_date`,`l_raiser_users`.`favorite_pet_types` AS `favorite_pet_types`,`l_raiser_users`.`personality_tags` AS `personality_tags`,`l_raiser_users`.`hobbies` AS `hobbies`,`l_raiser_users`.`status` AS `status`,`l_raiser_users`.`account_type` AS `account_type`,`l_raiser_users`.`wechat_openid` AS `wechat_openid`,`l_raiser_users`.`wechat_unionid` AS `wechat_unionid`,`l_raiser_users`.`qq_openid` AS `qq_openid`,`l_raiser_users`.`alipay_user_id` AS `alipay_user_id`,`l_raiser_users`.`last_login_time` AS `last_login_time`,`l_raiser_users`.`last_login_ip` AS `last_login_ip`,`l_raiser_users`.`login_count` AS `login_count`,`l_raiser_users`.`password_update_time` AS `password_update_time`,`l_raiser_users`.`email_verified` AS `email_verified`,`l_raiser_users`.`phone_verified` AS `phone_verified`,`l_raiser_users`.`real_name_verified` AS `real_name_verified`,`l_raiser_users`.`create_time` AS `create_time`,`l_raiser_users`.`update_time` AS `update_time`,`l_raiser_users`.`create_by` AS `create_by`,`l_raiser_users`.`update_by` AS `update_by`,`l_raiser_users`.`deleted` AS `deleted`,`l_raiser_users`.`delete_time` AS `delete_time`,`l_raiser_users`.`delete_by` AS `delete_by`,`l_raiser_users`.`remark` AS `remark` from `l_raiser_users` where (`l_raiser_users`.`deleted` = 0) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_active_vaccine_records`
--

/*!50001 DROP VIEW IF EXISTS `v_active_vaccine_records`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_active_vaccine_records` AS select `l_vaccine_records`.`record_id` AS `record_id`,`l_vaccine_records`.`pet_id` AS `pet_id`,`l_vaccine_records`.`vaccine_type_id` AS `vaccine_type_id`,`l_vaccine_records`.`vaccine_name` AS `vaccine_name`,`l_vaccine_records`.`batch_number` AS `batch_number`,`l_vaccine_records`.`vaccination_date` AS `vaccination_date`,`l_vaccine_records`.`next_due_date` AS `next_due_date`,`l_vaccine_records`.`veterinarian` AS `veterinarian`,`l_vaccine_records`.`clinic_name` AS `clinic_name`,`l_vaccine_records`.`clinic_address` AS `clinic_address`,`l_vaccine_records`.`cost` AS `cost`,`l_vaccine_records`.`side_effects` AS `side_effects`,`l_vaccine_records`.`notes` AS `notes`,`l_vaccine_records`.`certificate_url` AS `certificate_url`,`l_vaccine_records`.`reminder_sent` AS `reminder_sent`,`l_vaccine_records`.`visibility` AS `visibility`,`l_vaccine_records`.`pet_name` AS `pet_name`,`l_vaccine_records`.`pet_species` AS `pet_species`,`l_vaccine_records`.`deleted` AS `deleted`,`l_vaccine_records`.`delete_time` AS `delete_time`,`l_vaccine_records`.`delete_by` AS `delete_by`,`l_vaccine_records`.`create_time` AS `create_time`,`l_vaccine_records`.`update_time` AS `update_time`,`l_vaccine_records`.`create_by` AS `create_by` from `l_vaccine_records` where (`l_vaccine_records`.`deleted` = 0) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_anniversary_reminder_stats`
--

/*!50001 DROP VIEW IF EXISTS `v_anniversary_reminder_stats`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_anniversary_reminder_stats` AS select `u`.`ruid` AS `ruid`,`u`.`nickname` AS `nickname`,count(distinct `ar`.`reminder_id`) AS `total_reminders`,count(distinct (case when (`ar`.`is_sent` = 1) then `ar`.`reminder_id` end)) AS `sent_reminders`,count(distinct (case when (`ar`.`is_read` = 1) then `ar`.`reminder_id` end)) AS `read_reminders`,count(distinct (case when (`ar`.`reminder_date` >= curdate()) then `ar`.`reminder_id` end)) AS `upcoming_reminders` from (`l_raiser_users` `u` left join `l_anniversary_reminders` `ar` on(((`u`.`ruid` = `ar`.`ruid`) and (`ar`.`deleted` = 0)))) where (`u`.`deleted` = 0) group by `u`.`ruid`,`u`.`nickname` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_expense_stats`
--

/*!50001 DROP VIEW IF EXISTS `v_expense_stats`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_expense_stats` AS select `e`.`ruid` AS `ruid`,year(`e`.`expense_date`) AS `expense_year`,month(`e`.`expense_date`) AS `expense_month`,count(`e`.`record_id`) AS `total_records`,sum(`e`.`amount`) AS `total_amount`,avg(`e`.`amount`) AS `avg_amount`,count((case when (`e`.`expense_type` = 'shared') then 1 end)) AS `shared_expenses`,sum((case when (`e`.`expense_type` = 'shared') then `e`.`amount` else 0 end)) AS `shared_amount` from `l_expense_records` `e` where (`e`.`deleted` = 0) group by `e`.`ruid`,year(`e`.`expense_date`),month(`e`.`expense_date`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_orphan_records`
--

/*!50001 DROP VIEW IF EXISTS `v_orphan_records`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_orphan_records` AS select 'pet_photos' AS `table_name`,`l_pet_photos`.`photo_id` AS `record_id`,`l_pet_photos`.`pet_id` AS `parent_id` from `l_pet_photos` where `l_pet_photos`.`pet_id` in (select `l_pets`.`pet_id` from `l_pets` where (`l_pets`.`deleted` = 0)) is false union all select 'health_records' AS `table_name`,`l_health_records`.`record_id` AS `record_id`,`l_health_records`.`pet_id` AS `parent_id` from `l_health_records` where `l_health_records`.`pet_id` in (select `l_pets`.`pet_id` from `l_pets` where (`l_pets`.`deleted` = 0)) is false union all select 'care_records' AS `table_name`,`l_care_records`.`record_id` AS `record_id`,`l_care_records`.`pet_id` AS `parent_id` from `l_care_records` where `l_care_records`.`pet_id` in (select `l_pets`.`pet_id` from `l_pets` where (`l_pets`.`deleted` = 0)) is false */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_pet_asset_stats`
--

/*!50001 DROP VIEW IF EXISTS `v_pet_asset_stats`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_pet_asset_stats` AS select `p`.`pet_id` AS `pet_id`,`p`.`pet_name` AS `pet_name`,`p`.`owner_ruid` AS `owner_ruid`,count(distinct `pur`.`purchase_id`) AS `total_purchases`,coalesce(sum(`pur`.`total_amount`),0) AS `total_investment`,coalesce(avg(`pur`.`total_amount`),0) AS `avg_purchase_cost`,count(distinct `va`.`assessment_id`) AS `total_assessments`,coalesce(max(`va`.`current_value`),0) AS `latest_total_value`,coalesce((sum(`pur`.`total_amount`) - max(`va`.`current_value`)),0) AS `depreciation_amount` from ((`l_pets` `p` left join `l_pet_product_purchases` `pur` on(((`p`.`pet_id` = `pur`.`pet_id`) and (`pur`.`deleted` = 0)))) left join `l_product_value_assessments` `va` on(((`pur`.`purchase_id` = `va`.`purchase_id`) and (`va`.`deleted` = 0)))) where (`p`.`deleted` = 0) group by `p`.`pet_id`,`p`.`pet_name`,`p`.`owner_ruid` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_pet_complete_profile_stats`
--

/*!50001 DROP VIEW IF EXISTS `v_pet_complete_profile_stats`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_pet_complete_profile_stats` AS select `p`.`pet_id` AS `pet_id`,`p`.`pet_name` AS `pet_name`,`p`.`owner_ruid` AS `owner_ruid`,`p`.`species` AS `species`,`p`.`breed_name` AS `breed_name`,count(distinct `pf`.`relation_id`) AS `family_relations_count`,count(distinct `pt`.`tag_id`) AS `feature_tags_count`,count(distinct `pp`.`preference_id`) AS `preferences_count`,count(distinct `pg`.`record_id`) AS `growth_records_count`,count(distinct `pa`.`anniversary_id`) AS `anniversaries_count`,count(distinct `pur`.`purchase_id`) AS `purchases_count` from ((((((`l_pets` `p` left join `l_pet_family_relations` `pf` on(((`p`.`pet_id` = `pf`.`pet_id`) and (`pf`.`deleted` = 0)))) left join `l_pet_feature_tags` `pt` on(((`p`.`pet_id` = `pt`.`pet_id`) and (`pt`.`deleted` = 0)))) left join `l_pet_preferences` `pp` on(((`p`.`pet_id` = `pp`.`pet_id`) and (`pp`.`deleted` = 0)))) left join `l_pet_growth_records` `pg` on(((`p`.`pet_id` = `pg`.`pet_id`) and (`pg`.`deleted` = 0)))) left join `l_pet_anniversaries` `pa` on(((`p`.`pet_id` = `pa`.`pet_id`) and (`pa`.`deleted` = 0)))) left join `l_pet_product_purchases` `pur` on(((`p`.`pet_id` = `pur`.`pet_id`) and (`pur`.`deleted` = 0)))) where (`p`.`deleted` = 0) group by `p`.`pet_id`,`p`.`pet_name`,`p`.`owner_ruid`,`p`.`species`,`p`.`breed_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_pet_health_stats`
--

/*!50001 DROP VIEW IF EXISTS `v_pet_health_stats`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_pet_health_stats` AS select `p`.`pet_id` AS `pet_id`,`p`.`pet_name` AS `pet_name`,`p`.`owner_ruid` AS `owner_ruid`,count(`h`.`record_id`) AS `total_health_records`,count((case when (`h`.`is_abnormal` = 1) then 1 end)) AS `abnormal_records`,max(`h`.`measurement_date`) AS `last_health_check`,count(`v`.`record_id`) AS `total_vaccines`,max(`v`.`vaccination_date`) AS `last_vaccination` from ((`l_pets` `p` left join `l_health_records` `h` on(((`p`.`pet_id` = `h`.`pet_id`) and (`h`.`deleted` = 0)))) left join `l_vaccine_records` `v` on(((`p`.`pet_id` = `v`.`pet_id`) and (`v`.`deleted` = 0)))) where (`p`.`deleted` = 0) group by `p`.`pet_id`,`p`.`pet_name`,`p`.`owner_ruid` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_table_stats`
--

/*!50001 DROP VIEW IF EXISTS `v_table_stats`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_table_stats` AS select `information_schema`.`tables`.`TABLE_NAME` AS `TABLE_NAME`,`information_schema`.`tables`.`TABLE_ROWS` AS `TABLE_ROWS`,round((((`information_schema`.`tables`.`DATA_LENGTH` + `information_schema`.`tables`.`INDEX_LENGTH`) / 1024) / 1024),2) AS `Size_MB`,round(((`information_schema`.`tables`.`DATA_LENGTH` / 1024) / 1024),2) AS `Data_MB`,round(((`information_schema`.`tables`.`INDEX_LENGTH` / 1024) / 1024),2) AS `Index_MB` from `information_schema`.`TABLES` where ((`information_schema`.`tables`.`TABLE_SCHEMA` = database()) and (`information_schema`.`tables`.`TABLE_NAME` like 'L_%')) order by (`information_schema`.`tables`.`DATA_LENGTH` + `information_schema`.`tables`.`INDEX_LENGTH`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_user_pet_stats`
--

/*!50001 DROP VIEW IF EXISTS `v_user_pet_stats`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_user_pet_stats` AS select `u`.`ruid` AS `ruid`,`u`.`nickname` AS `nickname`,count(`p`.`pet_id`) AS `total_pets`,count((case when (`p`.`status` = 1) then 1 end)) AS `healthy_pets`,count((case when (`p`.`status` = 2) then 1 end)) AS `sick_pets`,count((case when (`p`.`is_shared_pet` = 1) then 1 end)) AS `shared_pets` from (`l_raiser_users` `u` left join `l_pets` `p` on(((`u`.`ruid` = `p`.`owner_ruid`) and (`p`.`deleted` = 0)))) where (`u`.`deleted` = 0) group by `u`.`ruid`,`u`.`nickname` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_user_purchase_stats`
--

/*!50001 DROP VIEW IF EXISTS `v_user_purchase_stats`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_user_purchase_stats` AS select `u`.`ruid` AS `ruid`,`u`.`nickname` AS `nickname`,count(distinct `p`.`purchase_id`) AS `total_purchases`,coalesce(sum(`p`.`total_amount`),0) AS `total_spent`,coalesce(avg(`p`.`total_amount`),0) AS `avg_purchase_amount`,count(distinct `p`.`pet_id`) AS `pets_purchased_for`,max(`p`.`purchase_date`) AS `last_purchase_date`,coalesce(avg(`p`.`satisfaction_rating`),0) AS `avg_satisfaction` from (`l_raiser_users` `u` left join `l_pet_product_purchases` `p` on(((`u`.`ruid` = `p`.`ruid`) and (`p`.`deleted` = 0)))) where (`u`.`deleted` = 0) group by `u`.`ruid`,`u`.`nickname` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-21  8:53:37
