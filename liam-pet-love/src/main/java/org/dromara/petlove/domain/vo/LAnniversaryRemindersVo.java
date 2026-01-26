package org.dromara.petlove.domain.vo;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.dromara.petlove.domain.LAnniversaryReminders;
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
 * 【请填写功能名称】视图对象 L_anniversary_reminders
 *
 * @author Lion Li
 * @date 2026-01-19
 */
@Data
@ExcelIgnoreUnannotated
@AutoMapper(target = LAnniversaryReminders.class)
public class LAnniversaryRemindersVo implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 提醒ID
     */
    @ExcelProperty(value = "提醒ID")
    private Long reminderId;

    /**
     * 纪念日类型 pet:宠物纪念日 couple:情侣纪念日
     */
    @ExcelProperty(value = "纪念日类型 pet:宠物纪念日 couple:情侣纪念日")
    private String anniversaryType;

    /**
     * 纪念日ID
     */
    @ExcelProperty(value = "纪念日ID")
    private Long anniversaryId;

    /**
     * 用户ID
     */
    @ExcelProperty(value = "用户ID")
    private Long ruid;

    /**
     * 提醒日期
     */
    @ExcelProperty(value = "提醒日期")
    private Date reminderDate;

    /**
     * 提醒时间
     */
    @ExcelProperty(value = "提醒时间")
    private Date reminderTime;

    /**
     * 提醒标题
     */
    @ExcelProperty(value = "提醒标题")
    private String reminderTitle;

    /**
     * 提醒内容
     */
    @ExcelProperty(value = "提醒内容")
    private String reminderContent;

    /**
     * 提醒方式 system:系统通知 email:邮件 sms:短信 wechat:微信
     */
    @ExcelProperty(value = "提醒方式 system:系统通知 email:邮件 sms:短信 wechat:微信")
    private String reminderMethod;

    /**
     * 是否已发送
     */
    @ExcelProperty(value = "是否已发送")
    private Long isSent;

    /**
     * 发送时间
     */
    @ExcelProperty(value = "发送时间")
    private Date sentTime;

    /**
     * 是否已读
     */
    @ExcelProperty(value = "是否已读")
    private Long isRead;

    /**
     * 阅读时间
     */
    @ExcelProperty(value = "阅读时间")
    private Date readTime;

    /**
     * 响应操作
     */
    @ExcelProperty(value = "响应操作")
    private String responseAction;

    /**
     * 延迟到
     */
    @ExcelProperty(value = "延迟到")
    private Date snoozeUntil;

    /**
     * 优先级 1:低 2:一般 3:高 4:紧急 5:最高
     */
    @ExcelProperty(value = "优先级 1:低 2:一般 3:高 4:紧急 5:最高")
    private Long priorityLevel;

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
