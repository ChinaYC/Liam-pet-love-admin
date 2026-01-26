package org.dromara.petlove.domain.vo;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.dromara.petlove.domain.LPetGrowthRecords;
import cn.idev.excel.annotation.ExcelIgnoreUnannotated;
import cn.idev.excel.annotation.ExcelProperty;
import org.dromara.common.excel.annotation.ExcelDictFormat;
import org.dromara.common.excel.convert.ExcelDictConvert;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;
import java.util.Date;



/**
 * 【请填写功能名称】视图对象 L_pet_growth_records
 *
 * @author Lion Li
 * @date 2026-01-19
 */
@Data
@ExcelIgnoreUnannotated
@AutoMapper(target = LPetGrowthRecords.class)
public class LPetGrowthRecordsVo implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 记录ID
     */
    @ExcelProperty(value = "记录ID")
    private Long recordId;

    /**
     * 宠物ID
     */
    @ExcelProperty(value = "宠物ID")
    private Long petId;

    /**
     * 成长阶段 newborn:新生儿 infant:幼儿 juvenile:少年 adult:成年 senior:老年
     */
    @ExcelProperty(value = "成长阶段 newborn:新生儿 infant:幼儿 juvenile:少年 adult:成年 senior:老年")
    private String growthStage;

    /**
     * 记录日期
     */
    @ExcelProperty(value = "记录日期")
    private Date recordDate;

    /**
     * 年龄(月)
     */
    @ExcelProperty(value = "年龄(月)")
    private Long ageMonths;

    /**
     * 体重(kg)
     */
    @ExcelProperty(value = "体重(kg)")
    private Long weight;

    /**
     * 身高(cm)
     */
    @ExcelProperty(value = "身高(cm)")
    private Long height;

    /**
     * 体长(cm)
     */
    @ExcelProperty(value = "体长(cm)")
    private Long length;

    /**
     * 发育情况记录
     */
    @ExcelProperty(value = "发育情况记录")
    private String developmentNotes;

    /**
     * 行为变化记录
     */
    @ExcelProperty(value = "行为变化记录")
    private String behavioralChanges;

    /**
     * 健康状况
     */
    @ExcelProperty(value = "健康状况")
    private String healthStatus;

    /**
     * 达成的里程碑
     */
    @ExcelProperty(value = "达成的里程碑")
    private String milestoneAchieved;

    /**
     * 照片URLs(JSON格式)
     */
    @ExcelProperty(value = "照片URLs(JSON格式)")
    private String photos;

    /**
     * 兽医备注
     */
    @ExcelProperty(value = "兽医备注")
    private String veterinarianNotes;

    /**
     * 下次检查日期
     */
    @ExcelProperty(value = "下次检查日期")
    private Date nextCheckupDate;

    /**
     * 可见性 1:仅自己 2:情侣可见 3:公开
     */
    @ExcelProperty(value = "可见性 1:仅自己 2:情侣可见 3:公开")
    private Long visibility;

    /**
     * 宠物名称(冗余字段)
     */
    @ExcelProperty(value = "宠物名称(冗余字段)")
    private String petName;

    /**
     * 是否删除 0:否 1:是
     */
    @ExcelProperty(value = "是否删除 0:否 1:是")
    private Long deleted;

    /**
     * 删除时间
     */
    @ExcelProperty(value = "删除时间")
    private Date deleteTime;

    /**
     * 删除者
     */
    @ExcelProperty(value = "删除者")
    private String deleteBy;


}
