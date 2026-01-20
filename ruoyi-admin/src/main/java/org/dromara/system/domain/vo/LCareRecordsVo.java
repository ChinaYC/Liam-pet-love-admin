package org.dromara.system.domain.vo;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.dromara.system.domain.LCareRecords;
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
 * 【请填写功能名称】视图对象 L_care_records
 *
 * @author Lion Li
 * @date 2026-01-19
 */
@Data
@ExcelIgnoreUnannotated
@AutoMapper(target = LCareRecords.class)
public class LCareRecordsVo implements Serializable {

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
     * 活动类型ID
     */
    @ExcelProperty(value = "活动类型ID")
    private Long activityTypeId;

    /**
     * 活动名称
     */
    @ExcelProperty(value = "活动名称")
    private String activityName;

    /**
     * 活动时间
     */
    @ExcelProperty(value = "活动时间")
    private Date activityDate;

    /**
     * 持续时间(分钟)
     */
    @ExcelProperty(value = "持续时间(分钟)")
    private Long durationMinutes;

    /**
     * 地点
     */
    @ExcelProperty(value = "地点")
    private String location;

    /**
     * 服务提供者
     */
    @ExcelProperty(value = "服务提供者")
    private String serviceProvider;

    /**
     * 费用
     */
    @ExcelProperty(value = "费用")
    private Long cost;

    /**
     * 使用的产品
     */
    @ExcelProperty(value = "使用的产品")
    private String productsUsed;

    /**
     * 备注
     */
    @ExcelProperty(value = "备注")
    private String notes;

    /**
     * 下次应做时间
     */
    @ExcelProperty(value = "下次应做时间")
    private Date nextDueDate;

    /**
     * 相关照片URLs(JSON格式)
     */
    @ExcelProperty(value = "相关照片URLs(JSON格式)")
    private String photoUrls;

    /**
     * 满意度评分 1-5分
     */
    @ExcelProperty(value = "满意度评分 1-5分")
    private Long rating;

    /**
     * 是否已发送提醒
     */
    @ExcelProperty(value = "是否已发送提醒")
    private Long reminderSent;

    /**
     * 可见性 1:仅自己 2:情侣可见
     */
    @ExcelProperty(value = "可见性 1:仅自己 2:情侣可见")
    private Long visibility;

    /**
     * 宠物名称(冗余字段)
     */
    @ExcelProperty(value = "宠物名称(冗余字段)")
    private String petName;

    /**
     * 活动类型名称(冗余字段)
     */
    @ExcelProperty(value = "活动类型名称(冗余字段)")
    private String activityTypeName;

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
