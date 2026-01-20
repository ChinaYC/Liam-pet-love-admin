package org.dromara.system.domain;

import org.dromara.common.mybatis.core.domain.BaseEntity;
import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serial;

/**
 * 【请填写功能名称】对象 L_anniversary_reminders
 *
 * @author Lion Li
 * @date 2026-01-19
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("L_anniversary_reminders")
public class LAnniversaryReminders extends BaseEntity {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 提醒ID
     */
    @TableId(value = "reminder_id")
    private Long reminderId;

    /**
     * 纪念日类型 pet:宠物纪念日 couple:情侣纪念日
     */
    private String anniversaryType;

    /**
     * 纪念日ID
     */
    private Long anniversaryId;

    /**
     * 用户ID
     */
    private Long ruid;

    /**
     * 提醒日期
     */
    private Date reminderDate;

    /**
     * 提醒时间
     */
    private Date reminderTime;

    /**
     * 提醒标题
     */
    private String reminderTitle;

    /**
     * 提醒内容
     */
    private String reminderContent;

    /**
     * 提醒方式 system:系统通知 email:邮件 sms:短信 wechat:微信
     */
    private String reminderMethod;

    /**
     * 是否已发送
     */
    private Long isSent;

    /**
     * 发送时间
     */
    private Date sentTime;

    /**
     * 是否已读
     */
    private Long isRead;

    /**
     * 阅读时间
     */
    private Date readTime;

    /**
     * 响应操作
     */
    private String responseAction;

    /**
     * 延迟到
     */
    private Date snoozeUntil;

    /**
     * 优先级 1:低 2:一般 3:高 4:紧急 5:最高
     */
    private Long priorityLevel;

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
