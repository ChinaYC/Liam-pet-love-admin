package org.dromara.system.domain.vo;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.dromara.system.domain.LPetMilestones;
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
 * 【请填写功能名称】视图对象 L_pet_milestones
 *
 * @author Lion Li
 * @date 2026-01-19
 */
@Data
@ExcelIgnoreUnannotated
@AutoMapper(target = LPetMilestones.class)
public class LPetMilestonesVo implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 里程碑ID
     */
    @ExcelProperty(value = "里程碑ID")
    private Long milestoneId;

    /**
     * 宠物ID
     */
    @ExcelProperty(value = "宠物ID")
    private Long petId;

    /**
     * 里程碑类型 age:年龄 weight:体重 training:训练 health:健康 behavior:行为
     */
    @ExcelProperty(value = "里程碑类型 age:年龄 weight:体重 training:训练 health:健康 behavior:行为")
    private String milestoneType;

    /**
     * 里程碑名称
     */
    @ExcelProperty(value = "里程碑名称")
    private String milestoneName;

    /**
     * 里程碑描述
     */
    @ExcelProperty(value = "里程碑描述")
    private String milestoneDescription;

    /**
     * 达成日期
     */
    @ExcelProperty(value = "达成日期")
    private Date achievementDate;

    /**
     * 宠物年龄(天)
     */
    @ExcelProperty(value = "宠物年龄(天)")
    private Long petAgeDays;

    /**
     * 里程碑数值
     */
    @ExcelProperty(value = "里程碑数值")
    private String milestoneValue;

    /**
     * 数值单位
     */
    @ExcelProperty(value = "数值单位")
    private String milestoneUnit;

    /**
     * 重要程度 1-5分
     */
    @ExcelProperty(value = "重要程度 1-5分")
    private Long significanceLevel;

    /**
     * 庆祝计划
     */
    @ExcelProperty(value = "庆祝计划")
    private String celebrationPlan;

    /**
     * 纪念照片URLs(JSON格式)
     */
    @ExcelProperty(value = "纪念照片URLs(JSON格式)")
    private String photoUrls;

    /**
     * 纪念视频URLs(JSON格式)
     */
    @ExcelProperty(value = "纪念视频URLs(JSON格式)")
    private String videoUrls;

    /**
     * 是否与伴侣分享
     */
    @ExcelProperty(value = "是否与伴侣分享")
    private Long sharedWithPartner;

    /**
     * 是否分享到社交媒体
     */
    @ExcelProperty(value = "是否分享到社交媒体")
    private Long socialMediaShared;

    /**
     * 回忆备注
     */
    @ExcelProperty(value = "回忆备注")
    private String memoryNotes;

    /**
     * 下一个里程碑目标
     */
    @ExcelProperty(value = "下一个里程碑目标")
    private String nextMilestoneTarget;

    /**
     * 可见性 1:仅自己 2:情侣可见 3:公开
     */
    @ExcelProperty(value = "可见性 1:仅自己 2:情侣可见 3:公开")
    private Long visibility;

    /**
     * 宠物名称(冗余字段)
     */
    @ExcelProperty(value = "宠物名称(冗余字段)")
    private String petName;

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
