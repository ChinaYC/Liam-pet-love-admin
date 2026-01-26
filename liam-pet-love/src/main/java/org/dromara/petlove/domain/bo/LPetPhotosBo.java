package org.dromara.petlove.domain.bo;

import org.dromara.petlove.domain.LPetPhotos;
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
 * 【请填写功能名称】业务对象 L_pet_photos
 *
 * @author Lion Li
 * @date 2026-01-19
 */
@Data
@EqualsAndHashCode(callSuper = true)
@AutoMapper(target = LPetPhotos.class, reverseConvertGenerate = false)
public class LPetPhotosBo extends BaseEntity {

    /**
     * 照片ID
     */
    @NotNull(message = "照片ID不能为空", groups = { EditGroup.class })
    private Long photoId;

    /**
     * 宠物ID
     */
    @NotNull(message = "宠物ID不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long petId;

    /**
     * 照片URL
     */
    @NotBlank(message = "照片URL不能为空", groups = { AddGroup.class, EditGroup.class })
    private String photoUrl;

    /**
     * 缩略图URL
     */
    private String thumbnailUrl;

    /**
     * 照片标题
     */
    private String photoTitle;

    /**
     * 照片描述
     */
    private String photoDesc;

    /**
     * 拍摄时间
     */
    private Date photoDate;

    /**
     * 拍摄地点
     */
    private String location;

    /**
     * 标签(逗号分隔)
     */
    private String tags;

    /**
     * AI识别标签
     */
    private String aiTags;

    /**
     * 是否收藏
     */
    @NotNull(message = "是否收藏不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long isFavorite;

    /**
     * 可见性 1:仅自己 2:情侣可见
     */
    @NotNull(message = "可见性 1:仅自己 2:情侣可见不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long visibility;

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
