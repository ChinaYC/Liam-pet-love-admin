package org.dromara.generator;

import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.test.context.ActiveProfiles;

import javax.sql.DataSource;
import java.util.List;
import java.util.Map;

@SpringBootTest
@Tag("dev")
@ActiveProfiles("test") // Assuming a test profile exists or default is fine
public class MenuInspectionTest {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Test
    public void inspectMenus() {
        System.out.println("====== Menu Inspection Start ======");

        // 1. Check Top-Level Menus (Potential Parents)
        String parentQuery = "SELECT menu_id, menu_name, parent_id, path FROM sys_menu WHERE parent_id = 0 OR parent_id IS NULL OR menu_name LIKE '%宠物%' OR menu_name LIKE '%恋爱%' OR menu_name LIKE '%纪念%'";
        List<Map<String, Object>> parents = jdbcTemplate.queryForList(parentQuery);
        System.out.println("--- Potential Parent Menus ---");
        for (Map<String, Object> row : parents) {
            System.out.println(row);
        }

        // 2. Check Existing Business Menus
        String[] businessNames = {
            "异常情况", "abnormal",
            "护理", "care",
            "照片", "photo",
            "成长", "growth",
            "里程碑", "milestone",
            "家族", "family",
            "纪念日", "anniversary",
            "提醒", "reminder"
        };
        
        System.out.println("\n--- Existing Business Menus ---");
        for (String key : businessNames) {
            String query = "SELECT menu_id, menu_name, parent_id, path, component, perms FROM sys_menu WHERE menu_name LIKE ? OR path LIKE ? OR component LIKE ?";
            String pattern = "%" + key + "%";
            List<Map<String, Object>> menus = jdbcTemplate.queryForList(query, pattern, pattern, pattern);
            if (!menus.isEmpty()) {
                System.out.println("Matches for key: " + key);
                for (Map<String, Object> row : menus) {
                    System.out.println(row);
                }
            }
        }
        
        // 3. Get Max Menu ID
        Long maxId = jdbcTemplate.queryForObject("SELECT MAX(menu_id) FROM sys_menu", Long.class);
        System.out.println("\n--- Max Menu ID ---");
        System.out.println("Max ID: " + maxId);

        System.out.println("====== Menu Inspection End ======");
    }
}
