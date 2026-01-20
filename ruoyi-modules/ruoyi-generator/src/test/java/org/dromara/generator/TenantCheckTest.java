package org.dromara.generator;

import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.test.context.ActiveProfiles;

import java.util.List;
import java.util.Map;
import java.util.ArrayList;

@SpringBootTest
@Tag("dev")
@ActiveProfiles("test")
public class TenantCheckTest {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Test
    public void checkTenantColumns() {
        System.out.println("====== Tenant Column Check ======");
        
        String[] tablesToCheck = {
            "L_pet_family_relations",
            "L_pet_photos",
            "L_pet_growth_records",
            "L_pet_milestones",
            "L_abnormal_records",
            "L_care_records",
            "L_anniversaries",
            "L_anniversary_reminders",
            "L_couple_anniversaries",
            "L_pet_info",
            "L_breed",
            "L_pet_breed"
        };
        
        List<String> missingTables = new ArrayList<>();
        List<String> missingTenantId = new ArrayList<>();
        List<String> hasTenantId = new ArrayList<>();

        for (String tableName : tablesToCheck) {
            try {
                // Check existence
                jdbcTemplate.execute("SELECT 1 FROM " + tableName + " LIMIT 1");
                
                // Check columns
                List<Map<String, Object>> columns = jdbcTemplate.queryForList("SHOW COLUMNS FROM " + tableName);
                boolean tenantIdFound = false;
                for (Map<String, Object> col : columns) {
                    if ("tenant_id".equalsIgnoreCase((String) col.get("Field"))) {
                        tenantIdFound = true;
                        break;
                    }
                }
                
                if (tenantIdFound) {
                    hasTenantId.add(tableName);
                    System.out.println("[OK] " + tableName + " has tenant_id");
                } else {
                    missingTenantId.add(tableName);
                    System.out.println("[NO TENANT] " + tableName + " missing tenant_id");
                }
                
            } catch (Exception e) {
                missingTables.add(tableName);
                System.out.println("[MISSING TABLE] " + tableName);
            }
        }
        
        System.out.println("\nSummary:");
        System.out.println("Missing Tables: " + missingTables);
        System.out.println("Missing tenant_id: " + missingTenantId);
        System.out.println("Good Tables: " + hasTenantId);
        
        System.out.println("====== Check End ======");
    }
}
