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

echo -e "${BLUE}=== 数据库升级执行工具 ===${NC}"
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

# 执行SQL文件的函数
execute_sql_file() {
    local sql_file="$1"
    local description="$2"
    
    echo -e "${YELLOW}正在执行: $description${NC}"
    echo -e "${BLUE}文件: $sql_file${NC}"
    
    if [ ! -f "$sql_file" ]; then
        echo -e "${RED}❌ SQL文件不存在: $sql_file${NC}"
        return 1
    fi
    
    # 创建备份点
    echo -e "${YELLOW}创建数据库备份点...${NC}"
    backup_file="backup_$(date +%Y%m%d_%H%M%S).sql"
    mysqldump -h"$DB_HOST" -P"$DB_PORT" -u"$DB_USER" -p"$DB_PASS" "$DB_NAME" > "$backup_file" 2>/dev/null
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✅ 备份已创建: $backup_file${NC}"
    else
        echo -e "${YELLOW}⚠️  备份创建失败，继续执行更新${NC}"
    fi
    
    # 执行SQL文件
    mysql -h"$DB_HOST" -P"$DB_PORT" -u"$DB_USER" -p"$DB_PASS" "$DB_NAME" < "$sql_file" 2>&1
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✅ $description 执行成功${NC}"
        return 0
    else
        echo -e "${RED}❌ $description 执行失败${NC}"
        return 1
    fi
}

# 检查菜单是否存在
check_menu_exists() {
    local menu_id="$1"
    mysql -h"$DB_HOST" -P"$DB_PORT" -u"$DB_USER" -p"$DB_PASS" -s -N -e "
        SELECT COUNT(*) 
        FROM sys_menu 
        WHERE menu_id='$menu_id';" "$DB_NAME" 2>/dev/null
}

echo -e "${YELLOW}开始执行数据库升级...${NC}"
echo ""

# 首先运行验证脚本检查当前状态
echo -e "${BLUE}=== 检查当前数据库状态 ===${NC}"
./validate_sql.sh

echo ""
echo -e "${BLUE}=== 开始执行缺失的更新 ===${NC}"

# 检查是否需要执行 5.4.1-5.5.0 的菜单更新
if [ "$(check_menu_exists '11801')" != "1" ]; then
    echo -e "${YELLOW}检测到缺失 5.4.1-5.5.0 菜单数据，执行部分更新...${NC}"
    
    # 使用部分更新文件
    if [ -f "update/update_5.4.1-5.5.0_partial.sql" ]; then
        execute_sql_file "update/update_5.4.1-5.5.0_partial.sql" "5.4.1-5.5.0 部分更新 (菜单和数据)"
    else
        echo -e "${YELLOW}部分更新文件不存在，执行完整更新...${NC}"
        execute_sql_file "update/update_5.4.1-5.5.0.sql" "5.4.1-5.5.0 完整更新"
    fi
else
    echo -e "${GREEN}✅ 5.4.1-5.5.0 菜单数据已存在，跳过更新${NC}"
fi

# 检查是否需要执行缺失字段更新
echo ""
echo -e "${YELLOW}检查是否需要执行缺失字段更新...${NC}"
if [ -f "update/add_missing_fields.sql" ]; then
    read -p "是否执行 add_missing_fields.sql？(y/n): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        execute_sql_file "update/add_missing_fields.sql" "添加缺失字段"
    fi
fi

echo ""
echo -e "${BLUE}=== 升级完成，重新验证数据库状态 ===${NC}"
./validate_sql.sh

echo ""
echo -e "${GREEN}🎉 数据库升级流程完成！${NC}"
echo -e "${YELLOW}请检查上方的验证结果确认所有更新都已正确应用。${NC}"

# 清理旧备份文件（保留最新的5个）
echo ""
echo -e "${YELLOW}清理旧备份文件...${NC}"
ls -t backup_*.sql 2>/dev/null | tail -n +6 | xargs rm -f 2>/dev/null
echo -e "${GREEN}✅ 备份文件清理完成${NC}"


