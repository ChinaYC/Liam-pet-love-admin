#!/bin/bash

# 数据库连接配置
DB_HOST="localhost"
DB_PORT="3306"
DB_NAME="Liam_pet_love_bd"
DB_USER="root"
DB_PASS="Lyc123456"

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}=== 数据库升级状态检查工具 ===${NC}"
echo -e "${BLUE}数据库: ${DB_NAME}${NC}"
echo ""

# 检查MySQL连接
echo -e "${YELLOW}正在检查数据库连接...${NC}"
mysql -h"$DB_HOST" -P"$DB_PORT" -u"$DB_USER" -p"$DB_PASS" -e "SELECT 1;" "$DB_NAME" > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo -e "${RED}❌ 数据库连接失败！请检查配置${NC}"
    exit 1
fi
echo -e "${GREEN}✅ 数据库连接成功${NC}"
echo ""

# 检查函数
check_table_exists() {
    local table_name="$1"
    mysql -h"$DB_HOST" -P"$DB_PORT" -u"$DB_USER" -p"$DB_PASS" -s -N -e "
        SELECT COUNT(*) 
        FROM information_schema.TABLES 
        WHERE TABLE_SCHEMA='$DB_NAME' 
        AND TABLE_NAME='$table_name';" 2>/dev/null
}

check_column_exists() {
    local table_name="$1"
    local column_name="$2"
    mysql -h"$DB_HOST" -P"$DB_PORT" -u"$DB_USER" -p"$DB_PASS" -s -N -e "
        SELECT COUNT(*) 
        FROM information_schema.COLUMNS 
        WHERE TABLE_SCHEMA='$DB_NAME' 
        AND TABLE_NAME='$table_name' 
        AND COLUMN_NAME='$column_name';" 2>/dev/null
}

check_menu_exists() {
    local menu_id="$1"
    mysql -h"$DB_HOST" -P"$DB_PORT" -u"$DB_USER" -p"$DB_PASS" -s -N -e "
        SELECT COUNT(*) 
        FROM sys_menu 
        WHERE menu_id='$menu_id';" "$DB_NAME" 2>/dev/null
}

# 统计变量
total_checks=0
passed_checks=0
failed_checks=0
missing_updates=()

echo -e "${YELLOW}开始检查数据库结构...${NC}"
echo ""

# 检查 5.0-5.1 更新
echo -e "${BLUE}检查 5.0-5.1 更新...${NC}"
total_checks=$((total_checks + 1))
if [ "$(check_column_exists 'gen_table' 'data_name')" = "1" ]; then
    echo -e "${GREEN}✅ [5.0-5.1] 字段 gen_table.data_name 存在${NC}"
    passed_checks=$((passed_checks + 1))
else
    echo -e "${RED}❌ [5.0-5.1] 字段 gen_table.data_name 不存在${NC}"
    failed_checks=$((failed_checks + 1))
    missing_updates+=("5.0-5.1")
fi

total_checks=$((total_checks + 1))
if [ "$(check_table_exists 'sys_social')" = "1" ]; then
    echo -e "${GREEN}✅ [5.0-5.1] 表 sys_social 存在${NC}"
    passed_checks=$((passed_checks + 1))
else
    echo -e "${RED}❌ [5.0-5.1] 表 sys_social 不存在${NC}"
    failed_checks=$((failed_checks + 1))
    missing_updates+=("5.0-5.1")
fi

total_checks=$((total_checks + 1))
if [ "$(check_table_exists 'sys_client')" = "1" ]; then
    echo -e "${GREEN}✅ [5.0-5.1] 表 sys_client 存在${NC}"
    passed_checks=$((passed_checks + 1))
else
    echo -e "${RED}❌ [5.0-5.1] 表 sys_client 不存在${NC}"
    failed_checks=$((failed_checks + 1))
    missing_updates+=("5.0-5.1")
fi

# 检查 5.1.0-5.1.1 更新
echo -e "${BLUE}检查 5.1.0-5.1.1 更新...${NC}"
total_checks=$((total_checks + 1))
if [ "$(check_column_exists 'sys_logininfor' 'client_key')" = "1" ]; then
    echo -e "${GREEN}✅ [5.1.0-5.1.1] 字段 sys_logininfor.client_key 存在${NC}"
    passed_checks=$((passed_checks + 1))
else
    echo -e "${RED}❌ [5.1.0-5.1.1] 字段 sys_logininfor.client_key 不存在${NC}"
    failed_checks=$((failed_checks + 1))
    missing_updates+=("5.1.0-5.1.1")
fi

# 检查 5.1.2-5.2.0 更新
echo -e "${BLUE}检查 5.1.2-5.2.0 更新...${NC}"
total_checks=$((total_checks + 1))
if [ "$(check_column_exists 'sys_dept' 'dept_category')" = "1" ]; then
    echo -e "${GREEN}✅ [5.1.2-5.2.0] 字段 sys_dept.dept_category 存在${NC}"
    passed_checks=$((passed_checks + 1))
else
    echo -e "${RED}❌ [5.1.2-5.2.0] 字段 sys_dept.dept_category 不存在${NC}"
    failed_checks=$((failed_checks + 1))
    missing_updates+=("5.1.2-5.2.0")
fi

# 检查 5.3.0-5.3.1 更新
echo -e "${BLUE}检查 5.3.0-5.3.1 更新...${NC}"
total_checks=$((total_checks + 1))
if [ "$(check_column_exists 'flow_node' 'ext')" = "1" ]; then
    echo -e "${GREEN}✅ [5.3.0-5.3.1] 字段 flow_node.ext 存在${NC}"
    passed_checks=$((passed_checks + 1))
else
    echo -e "${RED}❌ [5.3.0-5.3.1] 字段 flow_node.ext 不存在${NC}"
    failed_checks=$((failed_checks + 1))
    missing_updates+=("5.3.0-5.3.1")
fi

# 检查 5.3.1-5.4.0 更新
echo -e "${BLUE}检查 5.3.1-5.4.0 更新...${NC}"
total_checks=$((total_checks + 1))
if [ "$(check_column_exists 'flow_task' 'flow_status')" = "1" ]; then
    echo -e "${GREEN}✅ [5.3.1-5.4.0] 字段 flow_task.flow_status 存在${NC}"
    passed_checks=$((passed_checks + 1))
else
    echo -e "${RED}❌ [5.3.1-5.4.0] 字段 flow_task.flow_status 不存在${NC}"
    failed_checks=$((failed_checks + 1))
    missing_updates+=("5.3.1-5.4.0")
fi

# 检查 5.4.1-5.5.0 更新
echo -e "${BLUE}检查 5.4.1-5.5.0 更新...${NC}"
total_checks=$((total_checks + 1))
if [ "$(check_table_exists 'flow_spel')" = "1" ]; then
    echo -e "${GREEN}✅ [5.4.1-5.5.0] 表 flow_spel 存在${NC}"
    passed_checks=$((passed_checks + 1))
else
    echo -e "${RED}❌ [5.4.1-5.5.0] 表 flow_spel 不存在${NC}"
    failed_checks=$((failed_checks + 1))
    missing_updates+=("5.4.1-5.5.0")
fi

total_checks=$((total_checks + 1))
if [ "$(check_column_exists 'flow_definition' 'create_by')" = "1" ]; then
    echo -e "${GREEN}✅ [5.4.1-5.5.0] 字段 flow_definition.create_by 存在${NC}"
    passed_checks=$((passed_checks + 1))
else
    echo -e "${RED}❌ [5.4.1-5.5.0] 字段 flow_definition.create_by 不存在${NC}"
    failed_checks=$((failed_checks + 1))
    missing_updates+=("5.4.1-5.5.0")
fi

echo ""
echo -e "${YELLOW}检查菜单数据...${NC}"

# 检查菜单数据
total_checks=$((total_checks + 1))
if [ "$(check_menu_exists '11801')" = "1" ]; then
    echo -e "${GREEN}✅ [5.4.1-5.5.0] 菜单 ID:11801 存在${NC}"
    passed_checks=$((passed_checks + 1))
else
    echo -e "${RED}❌ [5.4.1-5.5.0] 菜单 ID:11801 不存在${NC}"
    failed_checks=$((failed_checks + 1))
    missing_updates+=("5.4.1-5.5.0")
fi

echo ""
echo -e "${BLUE}=== 检查结果汇总 ===${NC}"
echo -e "总检查项: ${total_checks}"
echo -e "${GREEN}通过: ${passed_checks}${NC}"
echo -e "${RED}失败: ${failed_checks}${NC}"

if [ ${#missing_updates[@]} -gt 0 ]; then
    echo ""
    echo -e "${RED}=== 需要执行的更新脚本 ===${NC}"
    
    # 去重并排序
    unique_updates=($(printf "%s\n" "${missing_updates[@]}" | sort -u))
    
    for update in "${unique_updates[@]}"; do
        echo -e "${YELLOW}📝 需要执行: update_${update}.sql${NC}"
        
        # 检查对应的SQL文件是否存在
        sql_file="update/update_${update}.sql"
        if [ -f "$sql_file" ]; then
            echo -e "   ${GREEN}✅ SQL文件存在: $sql_file${NC}"
        else
            echo -e "   ${RED}❌ SQL文件不存在: $sql_file${NC}"
        fi
    done
    
    echo ""
    echo -e "${YELLOW}建议按以下顺序执行更新:${NC}"
    echo -e "${BLUE}1. update_5.0-5.1.sql${NC}"
    echo -e "${BLUE}2. update_5.1.0-5.1.1.sql${NC}"
    echo -e "${BLUE}3. update_5.1.1-5.1.2.sql${NC}"
    echo -e "${BLUE}4. update_5.1.2-5.2.0.sql${NC}"
    echo -e "${BLUE}5. update_5.3.0-5.3.1.sql${NC}"
    echo -e "${BLUE}6. update_5.3.1-5.4.0.sql${NC}"
    echo -e "${BLUE}7. update_5.4.1-5.5.0.sql${NC}"
    echo -e "${BLUE}8. add_missing_fields.sql (如果需要)${NC}"
else
    echo -e "${GREEN}🎉 所有更新都已应用！${NC}"
fi

echo ""
echo -e "${BLUE}=== 检查完成 ===${NC}"