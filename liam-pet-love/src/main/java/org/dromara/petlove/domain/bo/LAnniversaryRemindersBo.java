package org.dromara.petlove.domain.bo;

import org.dromara.petlove.domain.LAnniversaryReminders;
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
 * 【请填写功能名称】业务对象 L_anniversary_reminders
 *
 * @author Lion Li
 * @date 2026-01-19
 */
@Data
@EqualsAndHashCode(callSuper = true)
@AutoMapper(target = LAnniversaryReminders.class, reverseConvertGenerate = false)
public class LAnniversaryRemindersBo extends BaseEntity {

    /**
     * 提醒ID
     */
    @NotNull(message = "提醒ID不能为空", groups = { EditGroup.class })
    private Long reminderId;

    /**
     * 纪念日类型 pet:宠物纪念日 couple:情侣纪念日
     */
    @NotBlank(message = "纪念日类型 pet:宠物纪念日 couple:情侣纪念日不能为空", groups = { AddGroup.class, EditGroup.class })
    private String anniversaryType;

    /**
     * 纪念日ID
     */
    @NotNull(message = "纪念日ID不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long anniversaryId;

    /**
     * 用户ID
     */
    @NotNull(message = "用户ID不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long ruid;

    /**
     * 提醒日期
     */
    @NotNull(message = "提醒日期不能为空", groups = { AddGroup.class, EditGroup.class })
    private Date reminderDate;

    /**
     * 提醒时间
     */
    private Date reminderTime;

    /**
     * 提醒标题
     */
    @NotBlank(message = "提醒标题不能为空", groups = { AddGroup.class, EditGroup.class })
    private String reminderTitle;

    /**
     * 提醒内容
     */
    private String reminderContent;

    /**
     * 提醒方式 system:系统通知 email:邮件 sms:短信 wechat:微信
     */
    @NotBlank(message = "提醒方式 system:系统通知 email:邮件 sms:短信 wechat:微信不能为空", groups = { AddGroup.class, EditGroup.class })
    private String reminderMethod;

    /**
     * 是否已发送
     */
    @NotNull(message = "是否已发送不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long isSent;

    /**
     * 发送时间
     */
    private Date sentTime;

    /**
     * 是否已读
     */
    @NotNull(message = "是否已读不能为空", groups = { AddGroup.class, EditGroup.class })
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
    @NotNull(message = "优先级 1:低 2:一般 3:高 4:紧急 5:最高不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long priorityLevel;

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
