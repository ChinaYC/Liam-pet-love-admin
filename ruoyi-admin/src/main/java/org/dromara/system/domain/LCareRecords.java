package org.dromara.system.domain;

import org.dromara.common.mybatis.core.domain.BaseEntity;
import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serial;

/**
 * 【请填写功能名称】对象 L_care_records
 *
 * @author Lion Li
 * @date 2026-01-19
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("L_care_records")
public class LCareRecords extends BaseEntity {

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
     * 活动类型ID
     */
    private Long activityTypeId;

    /**
     * 活动名称
     */
    private String activityName;

    /**
     * 活动时间
     */
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
    private Long reminderSent;

    /**
     * 可见性 1:仅自己 2:情侣可见
     */
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
