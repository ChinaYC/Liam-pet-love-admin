package org.dromara.petlove.domain.vo;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.dromara.petlove.domain.LAbnormalRecords;
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
 * 【请填写功能名称】视图对象 L_abnormal_records
 *
 * @author Lion Li
 * @date 2026-01-19
 */
@Data
@ExcelIgnoreUnannotated
@AutoMapper(target = LAbnormalRecords.class)
public class LAbnormalRecordsVo implements Serializable {

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
     * 异常类型
     */
    @ExcelProperty(value = "异常类型")
    private String abnormalType;

    /**
     * 症状描述
     */
    @ExcelProperty(value = "症状描述")
    private String symptoms;

    /**
     * 严重程度 1:轻微 2:一般 3:严重 4:紧急
     */
    @ExcelProperty(value = "严重程度 1:轻微 2:一般 3:严重 4:紧急")
    private Long severityLevel;

    /**
     * 发生时间
     */
    @ExcelProperty(value = "发生时间")
    private Date occurrenceTime;

    /**
     * 持续时间
     */
    @ExcelProperty(value = "持续时间")
    private String duration;

    /**
     * 诱发因素
     */
    @ExcelProperty(value = "诱发因素")
    private String triggerFactor;

    /**
     * 采取的治疗措施
     */
    @ExcelProperty(value = "采取的治疗措施")
    private String treatmentTaken;

    /**
     * 恢复状态 0:未恢复 1:好转 2:完全恢复
     */
    @ExcelProperty(value = "恢复状态 0:未恢复 1:好转 2:完全恢复")
    private Long recoveryStatus;

    /**
     * 相关照片URLs(JSON格式)
     */
    @ExcelProperty(value = "相关照片URLs(JSON格式)")
    private String photoUrls;

    /**
     * 是否咨询兽医
     */
    @ExcelProperty(value = "是否咨询兽医")
    private Long veterinarianConsulted;

    /**
     * 兽医建议
     */
    @ExcelProperty(value = "兽医建议")
    private String vetAdvice;

    /**
     * 是否需要跟进
     */
    @ExcelProperty(value = "是否需要跟进")
    private Long followUpRequired;

    /**
     * 跟进日期
     */
    @ExcelProperty(value = "跟进日期")
    private Date followUpDate;

    /**
     * 备注
     */
    @ExcelProperty(value = "备注")
    private String notes;

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
