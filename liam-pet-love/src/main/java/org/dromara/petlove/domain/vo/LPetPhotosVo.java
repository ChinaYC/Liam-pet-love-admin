package org.dromara.petlove.domain.vo;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.dromara.petlove.domain.LPetPhotos;
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
 * 【请填写功能名称】视图对象 L_pet_photos
 *
 * @author Lion Li
 * @date 2026-01-19
 */
@Data
@ExcelIgnoreUnannotated
@AutoMapper(target = LPetPhotos.class)
public class LPetPhotosVo implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 照片ID
     */
    @ExcelProperty(value = "照片ID")
    private Long photoId;

    /**
     * 宠物ID
     */
    @ExcelProperty(value = "宠物ID")
    private Long petId;

    /**
     * 照片URL
     */
    @ExcelProperty(value = "照片URL")
    private String photoUrl;

    /**
     * 缩略图URL
     */
    @ExcelProperty(value = "缩略图URL")
    private String thumbnailUrl;

    /**
     * 照片标题
     */
    @ExcelProperty(value = "照片标题")
    private String photoTitle;

    /**
     * 照片描述
     */
    @ExcelProperty(value = "照片描述")
    private String photoDesc;

    /**
     * 拍摄时间
     */
    @ExcelProperty(value = "拍摄时间")
    private Date photoDate;

    /**
     * 拍摄地点
     */
    @ExcelProperty(value = "拍摄地点")
    private String location;

    /**
     * 标签(逗号分隔)
     */
    @ExcelProperty(value = "标签(逗号分隔)")
    private String tags;

    /**
     * AI识别标签
     */
    @ExcelProperty(value = "AI识别标签")
    private String aiTags;

    /**
     * 是否收藏
     */
    @ExcelProperty(value = "是否收藏")
    private Long isFavorite;

    /**
     * 可见性 1:仅自己 2:情侣可见
     */
    @ExcelProperty(value = "可见性 1:仅自己 2:情侣可见")
    private Long visibility;

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
