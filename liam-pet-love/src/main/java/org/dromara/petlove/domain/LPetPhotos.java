package org.dromara.petlove.domain;

import org.dromara.common.mybatis.core.domain.BaseEntity;
import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serial;

/**
 * 【请填写功能名称】对象 L_pet_photos
 *
 * @author Lion Li
 * @date 2026-01-19
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("L_pet_photos")
public class LPetPhotos extends BaseEntity {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 照片ID
     */
    @TableId(value = "photo_id")
    private Long photoId;

    /**
     * 宠物ID
     */
    private Long petId;

    /**
     * 照片URL
     */
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
    private Long isFavorite;

    /**
     * 可见性 1:仅自己 2:情侣可见
     */
    private Long visibility;

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
