package org.dromara.petlove.domain.bo;

import org.dromara.petlove.domain.LPetMilestones;
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
 * 【请填写功能名称】业务对象 L_pet_milestones
 *
 * @author Lion Li
 * @date 2026-01-19
 */
@Data
@EqualsAndHashCode(callSuper = true)
@AutoMapper(target = LPetMilestones.class, reverseConvertGenerate = false)
public class LPetMilestonesBo extends BaseEntity {

    /**
     * 里程碑ID
     */
    @NotNull(message = "里程碑ID不能为空", groups = { EditGroup.class })
    private Long milestoneId;

    /**
     * 宠物ID
     */
    @NotNull(message = "宠物ID不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long petId;

    /**
     * 里程碑类型 age:年龄 weight:体重 training:训练 health:健康 behavior:行为
     */
    @NotBlank(message = "里程碑类型 age:年龄 weight:体重 training:训练 health:健康 behavior:行为不能为空", groups = { AddGroup.class, EditGroup.class })
    private String milestoneType;

    /**
     * 里程碑名称
     */
    @NotBlank(message = "里程碑名称不能为空", groups = { AddGroup.class, EditGroup.class })
    private String milestoneName;

    /**
     * 里程碑描述
     */
    private String milestoneDescription;

    /**
     * 达成日期
     */
    @NotNull(message = "达成日期不能为空", groups = { AddGroup.class, EditGroup.class })
    private Date achievementDate;

    /**
     * 宠物年龄(天)
     */
    private Long petAgeDays;

    /**
     * 里程碑数值
     */
    private String milestoneValue;

    /**
     * 数值单位
     */
    private String milestoneUnit;

    /**
     * 重要程度 1-5分
     */
    private Long significanceLevel;

    /**
     * 庆祝计划
     */
    private String celebrationPlan;

    /**
     * 纪念照片URLs(JSON格式)
     */
    private String photoUrls;

    /**
     * 纪念视频URLs(JSON格式)
     */
    private String videoUrls;

    /**
     * 是否与伴侣分享
     */
    @NotNull(message = "是否与伴侣分享不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long sharedWithPartner;

    /**
     * 是否分享到社交媒体
     */
    @NotNull(message = "是否分享到社交媒体不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long socialMediaShared;

    /**
     * 回忆备注
     */
    private String memoryNotes;

    /**
     * 下一个里程碑目标
     */
    private String nextMilestoneTarget;

    /**
     * 可见性 1:仅自己 2:情侣可见 3:公开
     */
    @NotNull(message = "可见性 1:仅自己 2:情侣可见 3:公开不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long visibility;

    /**
     * 宠物名称(冗余字段)
     */
    private String petName;

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
