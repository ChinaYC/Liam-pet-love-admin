package org.dromara.system.domain.bo;

import org.dromara.system.domain.LPetGrowthRecords;
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
 * 【请填写功能名称】业务对象 L_pet_growth_records
 *
 * @author Lion Li
 * @date 2026-01-19
 */
@Data
@EqualsAndHashCode(callSuper = true)
@AutoMapper(target = LPetGrowthRecords.class, reverseConvertGenerate = false)
public class LPetGrowthRecordsBo extends BaseEntity {

    /**
     * 记录ID
     */
    @NotNull(message = "记录ID不能为空", groups = { EditGroup.class })
    private Long recordId;

    /**
     * 宠物ID
     */
    @NotNull(message = "宠物ID不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long petId;

    /**
     * 成长阶段 newborn:新生儿 infant:幼儿 juvenile:少年 adult:成年 senior:老年
     */
    @NotBlank(message = "成长阶段 newborn:新生儿 infant:幼儿 juvenile:少年 adult:成年 senior:老年不能为空", groups = { AddGroup.class, EditGroup.class })
    private String growthStage;

    /**
     * 记录日期
     */
    @NotNull(message = "记录日期不能为空", groups = { AddGroup.class, EditGroup.class })
    private Date recordDate;

    /**
     * 年龄(月)
     */
    @NotNull(message = "年龄(月)不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long ageMonths;

    /**
     * 体重(kg)
     */
    private Long weight;

    /**
     * 身高(cm)
     */
    private Long height;

    /**
     * 体长(cm)
     */
    private Long length;

    /**
     * 发育情况记录
     */
    private String developmentNotes;

    /**
     * 行为变化记录
     */
    private String behavioralChanges;

    /**
     * 健康状况
     */
    private String healthStatus;

    /**
     * 达成的里程碑
     */
    private String milestoneAchieved;

    /**
     * 照片URLs(JSON格式)
     */
    private String photos;

    /**
     * 兽医备注
     */
    private String veterinarianNotes;

    /**
     * 下次检查日期
     */
    private Date nextCheckupDate;

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
