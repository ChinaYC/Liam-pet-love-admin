package org.dromara.petlove.domain.vo;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.dromara.petlove.domain.LAnniversaries;
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
 * 【请填写功能名称】视图对象 L_anniversaries
 *
 * @author Lion Li
 * @date 2026-01-19
 */
@Data
@ExcelIgnoreUnannotated
@AutoMapper(target = LAnniversaries.class)
public class LAnniversariesVo implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 纪念日ID
     */
    @ExcelProperty(value = "纪念日ID")
    private Long anniversaryId;

    /**
     * 关系ID
     */
    @ExcelProperty(value = "关系ID")
    private Long relationId;

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
     * 纪念日类型 relationship:恋爱纪念 birthday:生日 holiday:节日 custom:自定义
     */
    @ExcelProperty(value = "纪念日类型 relationship:恋爱纪念 birthday:生日 holiday:节日 custom:自定义")
    private String anniversaryType;

    /**
     * 重复类型 none:不重复 yearly:每年 monthly:每月
     */
    @ExcelProperty(value = "重复类型 none:不重复 yearly:每年 monthly:每月")
    private String repeatType;

    /**
     * 描述
     */
    @ExcelProperty(value = "描述")
    private String description;

    /**
     * 提前提醒天数
     */
    @ExcelProperty(value = "提前提醒天数")
    private Long reminderDays;

    /**
     * 是否启用提醒
     */
    @ExcelProperty(value = "是否启用提醒")
    private Long isReminderEnabled;

    /**
     * 庆祝计划
     */
    @ExcelProperty(value = "庆祝计划")
    private String celebrationPlan;

    /**
     * 相关照片URLs(JSON格式)
     */
    @ExcelProperty(value = "相关照片URLs(JSON格式)")
    private String photoUrls;

    /**
     * 是否启用
     */
    @ExcelProperty(value = "是否启用")
    private Long isActive;


}
