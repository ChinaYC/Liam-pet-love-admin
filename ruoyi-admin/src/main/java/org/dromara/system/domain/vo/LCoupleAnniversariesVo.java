package org.dromara.system.domain.vo;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.dromara.system.domain.LCoupleAnniversaries;
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
 * 【请填写功能名称】视图对象 L_couple_anniversaries
 *
 * @author Lion Li
 * @date 2026-01-19
 */
@Data
@ExcelIgnoreUnannotated
@AutoMapper(target = LCoupleAnniversaries.class)
public class LCoupleAnniversariesVo implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 纪念日ID
     */
    @ExcelProperty(value = "纪念日ID")
    private Long anniversaryId;

    /**
     * 情侣关系ID
     */
    @ExcelProperty(value = "情侣关系ID")
    private Long relationId;

    /**
     * 纪念日类型 first_meet:初次见面 first_date:第一次约会 relationship_start:恋爱开始 engagement:订婚 marriage:结婚 move_in:同居 pet_adoption:共同领养宠物 other:其他
     */
    @ExcelProperty(value = "纪念日类型 first_meet:初次见面 first_date:第一次约会 relationship_start:恋爱开始 engagement:订婚 marriage:结婚 move_in:同居 pet_adoption:共同领养宠物 other:其他")
    private String anniversaryType;

    /**
     * 纪念日名称
     */
    @ExcelProperty(value = "纪念日名称")
    private String anniversaryName;

    /**
     * 纪念日日期
     */
    @ExcelProperty(value = "纪念日日期")
    private Date anniversaryDate;

    /**
     * 是否每年重复
     */
    @ExcelProperty(value = "是否每年重复")
    private Long isRecurring;

    /**
     * 纪念日描述
     */
    @ExcelProperty(value = "纪念日描述")
    private String description;

    /**
     * 重要程度 1:一般 2:重要 3:非常重要 4:特别重要 5:最重要
     */
    @ExcelProperty(value = "重要程度 1:一般 2:重要 3:非常重要 4:特别重要 5:最重要")
    private Long importanceLevel;

    /**
     * 庆祝计划
     */
    @ExcelProperty(value = "庆祝计划")
    private String celebrationPlan;

    /**
     * 纪念照片URLs(JSON格式)
     */
    @ExcelProperty(value = "纪念照片URLs(JSON格式)")
    private String photos;

    /**
     * 回忆记录
     */
    @ExcelProperty(value = "回忆记录")
    private String memories;

    /**
     * 互赠礼物记录
     */
    @ExcelProperty(value = "互赠礼物记录")
    private String giftsExchanged;

    /**
     * 庆祝地点
     */
    @ExcelProperty(value = "庆祝地点")
    private String location;

    /**
     * 特殊意义
     */
    @ExcelProperty(value = "特殊意义")
    private String specialMeaning;

    /**
     * 提前提醒天数
     */
    @ExcelProperty(value = "提前提醒天数")
    private Long reminderDaysBefore;

    /**
     * 是否启用提醒
     */
    @ExcelProperty(value = "是否启用提醒")
    private Long isReminderEnabled;

    /**
     * 最后庆祝年份
     */
    @ExcelProperty(value = "最后庆祝年份")
    private Long lastCelebratedYear;

    /**
     * 庆祝次数
     */
    @ExcelProperty(value = "庆祝次数")
    private Long celebrationCount;

    /**
     * 可见性 1:仅自己 2:情侣可见 3:公开
     */
    @ExcelProperty(value = "可见性 1:仅自己 2:情侣可见 3:公开")
    private Long visibility;

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
