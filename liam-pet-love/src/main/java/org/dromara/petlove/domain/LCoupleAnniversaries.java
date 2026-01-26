package org.dromara.petlove.domain;

import org.dromara.common.mybatis.core.domain.BaseEntity;
import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serial;

/**
 * 【请填写功能名称】对象 L_couple_anniversaries
 *
 * @author Lion Li
 * @date 2026-01-19
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("L_couple_anniversaries")
public class LCoupleAnniversaries extends BaseEntity {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 纪念日ID
     */
    @TableId(value = "anniversary_id")
    private Long anniversaryId;

    /**
     * 情侣关系ID
     */
    private Long relationId;

    /**
     * 纪念日类型 first_meet:初次见面 first_date:第一次约会 relationship_start:恋爱开始 engagement:订婚 marriage:结婚 move_in:同居 pet_adoption:共同领养宠物 other:其他
     */
    private String anniversaryType;

    /**
     * 纪念日名称
     */
    private String anniversaryName;

    /**
     * 纪念日日期
     */
    private Date anniversaryDate;

    /**
     * 是否每年重复
     */
    private Long isRecurring;

    /**
     * 纪念日描述
     */
    private String description;

    /**
     * 重要程度 1:一般 2:重要 3:非常重要 4:特别重要 5:最重要
     */
    private Long importanceLevel;

    /**
     * 庆祝计划
     */
    private String celebrationPlan;

    /**
     * 纪念照片URLs(JSON格式)
     */
    private String photos;

    /**
     * 回忆记录
     */
    private String memories;

    /**
     * 互赠礼物记录
     */
    private String giftsExchanged;

    /**
     * 庆祝地点
     */
    private String location;

    /**
     * 特殊意义
     */
    private String specialMeaning;

    /**
     * 提前提醒天数
     */
    private Long reminderDaysBefore;

    /**
     * 是否启用提醒
     */
    private Long isReminderEnabled;

    /**
     * 最后庆祝年份
     */
    private Long lastCelebratedYear;

    /**
     * 庆祝次数
     */
    private Long celebrationCount;

    /**
     * 可见性 1:仅自己 2:情侣可见 3:公开
     */
    private Long visibility;

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
