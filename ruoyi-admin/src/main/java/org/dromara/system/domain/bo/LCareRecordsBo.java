package org.dromara.system.domain.bo;

import org.dromara.system.domain.LCareRecords;
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
 * 【请填写功能名称】业务对象 L_care_records
 *
 * @author Lion Li
 * @date 2026-01-19
 */
@Data
@EqualsAndHashCode(callSuper = true)
@AutoMapper(target = LCareRecords.class, reverseConvertGenerate = false)
public class LCareRecordsBo extends BaseEntity {

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
     * 活动类型ID
     */
    private Long activityTypeId;

    /**
     * 活动名称
     */
    @NotBlank(message = "活动名称不能为空", groups = { AddGroup.class, EditGroup.class })
    private String activityName;

    /**
     * 活动时间
     */
    @NotNull(message = "活动时间不能为空", groups = { AddGroup.class, EditGroup.class })
    private Date activityDate;

    /**
     * 持续时间(分钟)
     */
    private Long durationMinutes;

    /**
     * 地点
     */
    private String location;

    /**
     * 服务提供者
     */
    private String serviceProvider;

    /**
     * 费用
     */
    private Long cost;

    /**
     * 使用的产品
     */
    private String productsUsed;

    /**
     * 备注
     */
    private String notes;

    /**
     * 下次应做时间
     */
    private Date nextDueDate;

    /**
     * 相关照片URLs(JSON格式)
     */
    private String photoUrls;

    /**
     * 满意度评分 1-5分
     */
    private Long rating;

    /**
     * 是否已发送提醒
     */
    @NotNull(message = "是否已发送提醒不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long reminderSent;

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
     * 活动类型名称(冗余字段)
     */
    private String activityTypeName;

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
