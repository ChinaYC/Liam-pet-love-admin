package org.dromara.generator;

import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.test.context.ActiveProfiles;

import java.util.Date;
import java.util.List;
import java.util.Map;

@SpringBootTest
@Tag("dev")
@ActiveProfiles("test")
public class MenuFixTest {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Test
    public void fixMenus() {
        System.out.println("====== Starting Menu Fix ======");

        // Constants
        Long petParentId = 2000L;
        Long loveParentId = 3000L;
        
        // 1. Update Existing Menus (Fix Paths)
        updateMenu(2050L, "system/petPhotos/index", "petPhotos");
        updateMenu(2061L, "system/petMilestones/index", "petMilestones");
        updateMenu(3031L, "system/anniversaries/index", "anniversaries");
        updateMenu(3032L, "system/anniversaryReminders/index", "anniversaryReminders");

        // 2. Insert Missing Menus
        // Check and insert 'abnormalRecords'
        checkAndInsert("abnormalRecords", "异常情况记录", petParentId, "system/abnormalRecords/index", "abnormalRecords");
        
        // Check and insert 'careRecords'
        checkAndInsert("careRecords", "护理活动记录", petParentId, "system/careRecords/index", "careRecords");
        
        // Check and insert 'petFamilyRelations'
        checkAndInsert("petFamilyRelations", "宠物家族关系", petParentId, "system/petFamilyRelations/index", "petFamilyRelations");
        
        // Check and insert 'petGrowthRecords'
        checkAndInsert("petGrowthRecords", "宠物成长记录", petParentId, "system/petGrowthRecords/index", "petGrowthRecords");
        
        // Check and insert 'coupleAnniversaries'
        checkAndInsert("coupleAnniversaries", "情侣纪念日", loveParentId, "system/coupleAnniversaries/index", "coupleAnniversaries");

        System.out.println("====== Menu Fix Completed ======");
    }

    private void updateMenu(Long menuId, String component, String path) {
        String checkSql = "SELECT count(*) FROM sys_menu WHERE menu_id = ?";
        Integer count = jdbcTemplate.queryForObject(checkSql, Integer.class, menuId);
        if (count != null && count > 0) {
            String sql = "UPDATE sys_menu SET component = ?, path = ? WHERE menu_id = ?";
            jdbcTemplate.update(sql, component, path, menuId);
            System.out.println("Updated menu " + menuId + " with component: " + component);
        } else {
            System.out.println("Menu " + menuId + " not found, skipping update.");
        }
    }

    private void checkAndInsert(String businessName, String menuName, Long parentId, String component, String path) {
        // Check if exists by component to avoid duplicates
        String checkSql = "SELECT count(*) FROM sys_menu WHERE component = ?";
        Integer count = jdbcTemplate.queryForObject(checkSql, Integer.class, component);
        
        if (count == null || count == 0) {
            // Get new ID
            Long newId = jdbcTemplate.queryForObject("SELECT MAX(menu_id) + 1 FROM sys_menu", Long.class);
            
            String insertSql = "INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_time, update_time) " +
                    "VALUES (?, ?, ?, 1, ?, ?, 1, 0, 'C', '0', '0', ?, '#', NOW(), NOW())";
            
            String perms = "system:" + businessName + ":list";
            
            jdbcTemplate.update(insertSql, newId, menuName, parentId, path, component, perms);
            System.out.println("Inserted new menu '" + menuName + "' with ID: " + newId);
            
            // Insert Buttons (CRUD)
            insertButton(newId, businessName, "查询", "query");
            insertButton(newId, businessName, "新增", "add");
            insertButton(newId, businessName, "修改", "edit");
            insertButton(newId, businessName, "删除", "remove");
            insertButton(newId, businessName, "导出", "export");
            
        } else {
            System.out.println("Menu for " + businessName + " already exists, skipping insert.");
        }
    }
    
    private void insertButton(Long parentId, String businessName, String buttonName, String type) {
         Long newId = jdbcTemplate.queryForObject("SELECT MAX(menu_id) + 1 FROM sys_menu", Long.class);
         String insertSql = "INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_time) " +
                    "VALUES (?, ?, ?, 1, '', '', 1, 0, 'F', '0', '0', ?, '#', NOW())";
         String perms = "system:" + businessName + ":" + type;
         jdbcTemplate.update(insertSql, newId, buttonName, parentId, perms);
    }
}
