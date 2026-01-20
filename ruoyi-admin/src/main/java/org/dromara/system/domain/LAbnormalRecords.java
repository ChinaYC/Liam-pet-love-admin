package org.dromara.system.domain;

import org.dromara.common.mybatis.core.domain.BaseEntity;
import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serial;

/**
 * 【请填写功能名称】对象 L_abnormal_records
 *
 * @author Lion Li
 * @date 2026-01-19
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("L_abnormal_records")
public class LAbnormalRecords extends BaseEntity {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 记录ID
     */
    @TableId(value = "record_id")
    private Long recordId;

    /**
     * 宠物ID
     */
    private Long petId;

    /**
     * 异常类型
     */
    private String abnormalType;

    /**
     * 症状描述
     */
    private String symptoms;

    /**
     * 严重程度 1:轻微 2:一般 3:严重 4:紧急
     */
    private Long severityLevel;

    /**
     * 发生时间
     */
    private Date occurrenceTime;

    /**
     * 持续时间
     */
    private String duration;

    /**
     * 诱发因素
     */
    private String triggerFactor;

    /**
     * 采取的治疗措施
     */
    private String treatmentTaken;

    /**
     * 恢复状态 0:未恢复 1:好转 2:完全恢复
     */
    private Long recoveryStatus;

    /**
     * 相关照片URLs(JSON格式)
     */
    private String photoUrls;

    /**
     * 是否咨询兽医
     */
    private Long veterinarianConsulted;

    /**
     * 兽医建议
     */
    private String vetAdvice;

    /**
     * 是否需要跟进
     */
    private Long followUpRequired;

    /**
     * 跟进日期
     */
    private Date followUpDate;

    /**
     * 备注
     */
    private String notes;

    /**
     * 可见性 1:仅自己 2:情侣可见
     */
    private Long visibility;

    /**
     * 宠物名称(冗余字段)
     */
    private String petName;

    /**
     * 是否删除 0:否 1:是
     */
    private Long deleted;

    /**
     * 删除时间
     */
    private Date deleteTime;

    /**
     * 删除者
     */
    private String deleteBy;


}
