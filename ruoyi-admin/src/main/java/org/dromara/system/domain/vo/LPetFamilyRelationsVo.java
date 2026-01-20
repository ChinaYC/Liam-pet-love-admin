package org.dromara.system.domain.vo;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.dromara.system.domain.LPetFamilyRelations;
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
 * 【请填写功能名称】视图对象 L_pet_family_relations
 *
 * @author Lion Li
 * @date 2026-01-19
 */
@Data
@ExcelIgnoreUnannotated
@AutoMapper(target = LPetFamilyRelations.class)
public class LPetFamilyRelationsVo implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 关系ID
     */
    @ExcelProperty(value = "关系ID")
    private Long relationId;

    /**
     * 宠物ID
     */
    @ExcelProperty(value = "宠物ID")
    private Long petId;

    /**
     * 关联宠物ID
     */
    @ExcelProperty(value = "关联宠物ID")
    private Long relatedPetId;

    /**
     * 关系类型 parent:父母 child:子女 sibling:兄弟姐妹 mate:配偶 grandparent:祖父母 grandchild:孙子女
     */
    @ExcelProperty(value = "关系类型 parent:父母 child:子女 sibling:兄弟姐妹 mate:配偶 grandparent:祖父母 grandchild:孙子女")
    private String relationType;

    /**
     * 关系描述
     */
    @ExcelProperty(value = "关系描述")
    private String relationDesc;

    /**
     * 是否确认关系
     */
    @ExcelProperty(value = "是否确认关系")
    private Long confirmed;

    /**
     * 确认人ID
     */
    @ExcelProperty(value = "确认人ID")
    private Long confirmedBy;

    /**
     * 确认时间
     */
    @ExcelProperty(value = "确认时间")
    private Date confirmedTime;

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
     * 关联宠物名称(冗余字段)
     */
    @ExcelProperty(value = "关联宠物名称(冗余字段)")
    private String relatedPetName;

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

    /**
     * 备注
     */
    @ExcelProperty(value = "备注")
    private String remark;


}
