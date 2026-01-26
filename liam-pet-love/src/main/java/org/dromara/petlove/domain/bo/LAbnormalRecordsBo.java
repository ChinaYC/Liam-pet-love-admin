package org.dromara.petlove.domain.bo;

import org.dromara.petlove.domain.LAbnormalRecords;
import org.dromara.common.mybatis.core.domain.BaseEntity;
import org.dromara.common.core.validate.AddGroup;
import org.dromara.common.core.validate.EditGroup;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;
import lombok.EqualsAndHashCode;
import jakarta.validation.constraints.*;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 【请填写功能名称】业务对象 L_abnormal_records
 *
 * @author Lion Li
 * @date 2026-01-19
 */
@Data
@EqualsAndHashCode(callSuper = true)
@AutoMapper(target = LAbnormalRecords.class, reverseConvertGenerate = false)
public class LAbnormalRecordsBo extends BaseEntity {

    /**
     * 记录ID
     */
    @NotNull(message = "记录ID不能为空", groups = { EditGroup.class })
    private Long recordId;

    /**
     * 宠物ID
     */
    @NotNull(message = "宠物ID不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long petId;

    /**
     * 异常类型
     */
    @NotBlank(message = "异常类型不能为空", groups = { AddGroup.class, EditGroup.class })
    private String abnormalType;

    /**
     * 症状描述
     */
    @NotBlank(message = "症状描述不能为空", groups = { AddGroup.class, EditGroup.class })
    private String symptoms;

    /**
     * 严重程度 1:轻微 2:一般 3:严重 4:紧急
     */
    @NotNull(message = "严重程度 1:轻微 2:一般 3:严重 4:紧急不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long severityLevel;

    /**
     * 发生时间
     */
    @NotNull(message = "发生时间不能为空", groups = { AddGroup.class, EditGroup.class })
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
    @NotNull(message = "恢复状态 0:未恢复 1:好转 2:完全恢复不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long recoveryStatus;

    /**
     * 相关照片URLs(JSON格式)
     */
    private String photoUrls;

    /**
     * 是否咨询兽医
     */
    @NotNull(message = "是否咨询兽医不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long veterinarianConsulted;

    /**
     * 兽医建议
     */
    private String vetAdvice;

    /**
     * 是否需要跟进
     */
    @NotNull(message = "是否需要跟进不能为空", groups = { AddGroup.class, EditGroup.class })
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
    @NotNull(message = "可见性 1:仅自己 2:情侣可见不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long visibility;

    /**
     * 宠物名称(冗余字段)
     */
    private String petName;

    /**
     * 是否删除 0:否 1:是
     */
    @NotNull(message = "是否删除 0:否 1:是不能为空", groups = { AddGroup.class, EditGroup.class })
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
