package org.dromara.generator;

import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.test.context.ActiveProfiles;

import java.util.List;
import java.util.Map;

@SpringBootTest
@Tag("dev")
@ActiveProfiles("test")
public class TableCheckTest {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Test
    public void checkTables() {
        System.out.println("====== Table Check ======");
        
        String[] tablesToCheck = {"L_pet_info", "L_breed", "L_pet_breed", "sys_menu"};
        
        for (String tableName : tablesToCheck) {
            try {
                // Use a safe query to check existence
                jdbcTemplate.execute("SELECT 1 FROM " + tableName + " LIMIT 1");
                System.out.println("[EXISTS] " + tableName);
                
                // Print columns
                List<Map<String, Object>> columns = jdbcTemplate.queryForList("SHOW COLUMNS FROM " + tableName);
                System.out.print("Columns: ");
                for (Map<String, Object> col : columns) {
                    System.out.print(col.get("Field") + " ");
                }
                System.out.println("\n");
                
            } catch (Exception e) {
                System.out.println("[MISSING] " + tableName);
            }
        }
        
        System.out.println("====== Check End ======");
    }
}
