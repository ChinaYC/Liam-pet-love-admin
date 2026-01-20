package org.dromara.system.domain;

import org.dromara.common.mybatis.core.domain.BaseEntity;
import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serial;

/**
 * 【请填写功能名称】对象 L_anniversaries
 *
 * @author Lion Li
 * @date 2026-01-19
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("L_anniversaries")
public class LAnniversaries extends BaseEntity {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 纪念日ID
     */
    @TableId(value = "anniversary_id")
    private Long anniversaryId;

    /**
     * 关系ID
     */
    private Long relationId;

    /**
     * 纪念日名称
     */
    private String anniversaryName;

    /**
     * 纪念日日期
     */
    private Date anniversaryDate;

    /**
     * 纪念日类型 relationship:恋爱纪念 birthday:生日 holiday:节日 custom:自定义
     */
    private String anniversaryType;

    /**
     * 重复类型 none:不重复 yearly:每年 monthly:每月
     */
    private String repeatType;

    /**
     * 描述
     */
    private String description;

    /**
     * 提前提醒天数
     */
    private Long reminderDays;

    /**
     * 是否启用提醒
     */
    private Long isReminderEnabled;

    /**
     * 庆祝计划
     */
    private String celebrationPlan;

    /**
     * 相关照片URLs(JSON格式)
     */
    private String photoUrls;

    /**
     * 是否启用
     */
    private Long isActive;


}
