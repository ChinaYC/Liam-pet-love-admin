package org.dromara.petlove.domain;

import org.dromara.common.mybatis.core.domain.BaseEntity;
import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serial;

/**
 * 【请填写功能名称】对象 L_pet_family_relations
 *
 * @author Lion Li
 * @date 2026-01-19
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("L_pet_family_relations")
public class LPetFamilyRelations extends BaseEntity {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 关系ID
     */
    @TableId(value = "relation_id")
    private Long relationId;

    /**
     * 宠物ID
     */
    private Long petId;

    /**
     * 关联宠物ID
     */
    private Long relatedPetId;

    /**
     * 关系类型 parent:父母 child:子女 sibling:兄弟姐妹 mate:配偶 grandparent:祖父母 grandchild:孙子女
     */
    private String relationType;

    /**
     * 关系描述
     */
    private String relationDesc;

    /**
     * 是否确认关系
     */
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
