package org.dromara.generator;

import org.dromara.generator.service.IGenTableService;
import org.dromara.generator.domain.GenTable;
import org.dromara.generator.mapper.GenTableMapper;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.test.context.SpringBootTest;
import org.junit.jupiter.api.Tag;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import java.util.List;

@SpringBootTest
@Tag("dev")
public class GenCodeTest {

    @Autowired
    private IGenTableService genTableService;

    @Autowired
    private GenTableMapper genTableMapper;

    @Test
    public void testGenerate() {
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
        String dataName = "master";

        for (String tableName : tableNames) {
            System.out.println("Processing table: " + tableName);
            GenTable existingTable = genTableMapper.selectOne(new LambdaQueryWrapper<GenTable>()
                .eq(GenTable::getTableName, tableName)
                .eq(GenTable::getDataName, dataName));

            if (existingTable == null) {
                        System.out.println("Importing table: " + tableName);
                        List<GenTable> tableList = genTableService.selectDbTableListByNames(new String[]{tableName}, dataName);
                        if (!tableList.isEmpty()) {
                            genTableService.importGenTable(tableList, dataName);
                            existingTable = genTableMapper.selectOne(new LambdaQueryWrapper<GenTable>()
                                .eq(GenTable::getTableName, tableName)
                                .eq(GenTable::getDataName, dataName));
                        }
                    }

                    if (existingTable != null) {
                        // Ensure genType and genPath are correct
                        existingTable.setGenType("1"); // Custom path
                        existingTable.setGenPath("/Volumes/T7/code/ruoyi/Liam-pet-love");
                        genTableMapper.updateById(existingTable);

                        System.out.println("Generating code for table: " + tableName);
                        System.out.println("Table Details: ID=" + existingTable.getTableId() 
                            + ", Module=" + existingTable.getModuleName() 
                            + ", Business=" + existingTable.getBusinessName()
                            + ", TplCategory=" + existingTable.getTplCategory()
                            + ", GenPath=" + existingTable.getGenPath());

                        genTableService.generatorCode(existingTable.getTableId());
                    } else {
                System.out.println("Failed to find or import table: " + tableName);
            }
        }
    }

    @SpringBootApplication
    static class TestApp {}
}
