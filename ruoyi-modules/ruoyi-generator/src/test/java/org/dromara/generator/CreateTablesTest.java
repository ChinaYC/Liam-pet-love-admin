package org.dromara.generator;

import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.core.io.FileSystemResource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.init.ScriptUtils;
import org.springframework.test.context.ActiveProfiles;

import javax.sql.DataSource;
import java.io.File;
import java.sql.Connection;

@SpringBootTest
@Tag("dev")
@ActiveProfiles("test")
public class CreateTablesTest {

    @Autowired
    private DataSource dataSource;

    @Test
    public void createTables() throws Exception {
        System.out.println("====== Creating Missing Tables ======");
        File sqlFile = new File("/Volumes/T7/code/ruoyi/Liam-pet-love/create_missing_tables.sql");
        if (!sqlFile.exists()) {
            throw new RuntimeException("SQL file not found: " + sqlFile.getAbsolutePath());
        }
        
        try (Connection conn = dataSource.getConnection()) {
            ScriptUtils.executeSqlScript(conn, new FileSystemResource(sqlFile));
            System.out.println("Executed SQL script successfully.");
        }
        System.out.println("====== Creation Completed ======");
    }
}
