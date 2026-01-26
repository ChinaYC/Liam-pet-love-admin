package org.dromara.petlove.domain.bo;

import org.dromara.petlove.domain.LPetFamilyRelations;
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
 * 【请填写功能名称】业务对象 L_pet_family_relations
 *
 * @author Lion Li
 * @date 2026-01-19
 */
@Data
@EqualsAndHashCode(callSuper = true)
@AutoMapper(target = LPetFamilyRelations.class, reverseConvertGenerate = false)
public class LPetFamilyRelationsBo extends BaseEntity {

    /**
     * 关系ID
     */
    @NotNull(message = "关系ID不能为空", groups = { EditGroup.class })
    private Long relationId;

    /**
     * 宠物ID
     */
    @NotNull(message = "宠物ID不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long petId;

    /**
     * 关联宠物ID
     */
    @NotNull(message = "关联宠物ID不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long relatedPetId;

    /**
     * 关系类型 parent:父母 child:子女 sibling:兄弟姐妹 mate:配偶 grandparent:祖父母 grandchild:孙子女
     */
    @NotBlank(message = "关系类型 parent:父母 child:子女 sibling:兄弟姐妹 mate:配偶 grandparent:祖父母 grandchild:孙子女不能为空", groups = { AddGroup.class, EditGroup.class })
    private String relationType;

    /**
     * 关系描述
     */
    private String relationDesc;

    /**
     * 是否确认关系
     */
    @NotNull(message = "是否确认关系不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long confirmed;

    /**
     * 确认人ID
     */
    private Long confirmedBy;

    /**
     * 确认时间
     */
    private Date confirmedTime;

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
     * 关联宠物名称(冗余字段)
     */
    private String relatedPetName;

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

    /**
     * 备注
     */
    private String remark;


}
