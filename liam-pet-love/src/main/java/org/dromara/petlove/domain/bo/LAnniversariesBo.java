package org.dromara.petlove.domain.bo;

import org.dromara.petlove.domain.LAnniversaries;
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
 * 【请填写功能名称】业务对象 L_anniversaries
 *
 * @author Lion Li
 * @date 2026-01-19
 */
@Data
@EqualsAndHashCode(callSuper = true)
@AutoMapper(target = LAnniversaries.class, reverseConvertGenerate = false)
public class LAnniversariesBo extends BaseEntity {

    /**
     * 纪念日ID
     */
    @NotNull(message = "纪念日ID不能为空", groups = { EditGroup.class })
    private Long anniversaryId;

    /**
     * 关系ID
     */
    @NotNull(message = "关系ID不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long relationId;

    /**
     * 纪念日名称
     */
    @NotBlank(message = "纪念日名称不能为空", groups = { AddGroup.class, EditGroup.class })
    private String anniversaryName;

    /**
     * 纪念日日期
     */
    @NotNull(message = "纪念日日期不能为空", groups = { AddGroup.class, EditGroup.class })
    private Date anniversaryDate;

    /**
     * 纪念日类型 relationship:恋爱纪念 birthday:生日 holiday:节日 custom:自定义
     */
    @NotBlank(message = "纪念日类型 relationship:恋爱纪念 birthday:生日 holiday:节日 custom:自定义不能为空", groups = { AddGroup.class, EditGroup.class })
    private String anniversaryType;

    /**
     * 重复类型 none:不重复 yearly:每年 monthly:每月
     */
    @NotBlank(message = "重复类型 none:不重复 yearly:每年 monthly:每月不能为空", groups = { AddGroup.class, EditGroup.class })
    private String repeatType;

    /**
     * 描述
     */
    private String description;

    /**
     * 提前提醒天数
     */
    @NotNull(message = "提前提醒天数不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long reminderDays;

    /**
     * 是否启用提醒
     */
    @NotNull(message = "是否启用提醒不能为空", groups = { AddGroup.class, EditGroup.class })
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
    @NotNull(message = "是否启用不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long isActive;


}
