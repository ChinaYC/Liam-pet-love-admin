package org.dromara.test;

import org.dromara.generator.domain.GenTable;
import org.dromara.generator.mapper.GenTableMapper;
import org.dromara.generator.service.IGenTableService;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.ArrayList;
import java.util.List;

@SpringBootTest
@DisplayName("自动代码生成测试")
@Tag("dev")
public class GeneratorTest {

    @Autowired
    private IGenTableService genTableService;

    @Autowired
    private GenTableMapper genTableMapper;

    @DisplayName("批量导入并生成代码")
    @Test
    public void testAutoGenerate() {
        // 需要生成的表名列表
        String[] tableNames = {
            "L_abnormal_records",
            "L_care_records",
            "L_pet_photos",
            "L_pet_growth_records",
            "L_pet_milestones",
            "L_pet_family_relations",
            "L_anniversaries",
            "L_anniversary_reminders",
            "L_couple_anniversaries"
        };

        for (String tableName : tableNames) {
            System.out.println("正在处理表: " + tableName);
            
            // 1. 检查表是否已存在于 gen_table
            GenTable existingTable = genTableMapper.selectGenTableByName(tableName);
            Long tableId;

            if (existingTable != null) {
                System.out.println(" - 表已存在，跳过导入");
                tableId = existingTable.getTableId();
            } else {
                System.out.println(" - 表不存在，开始导入...");
                List<GenTable> tableList = new ArrayList<>();
                GenTable table = new GenTable();
                table.setTableName(tableName);
                tableList.add(table);
                
                // 导入表结构，使用 master 数据源
                genTableService.importGenTable(tableList, "master");
                
                // 重新查询获取 ID
                existingTable = genTableMapper.selectGenTableByName(tableName);
                tableId = existingTable.getTableId();
                System.out.println(" - 导入完成，ID: " + tableId);
            }

            // 2. 生成代码
            System.out.println(" - 开始生成代码...");
            genTableService.generatorCode(tableId);
            System.out.println(" - 代码生成完成！");
            System.out.println("----------------------------------------");
        }
    }
}
