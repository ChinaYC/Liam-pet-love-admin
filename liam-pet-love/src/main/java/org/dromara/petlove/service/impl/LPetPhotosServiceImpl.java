package org.dromara.petlove.service.impl;

import org.dromara.common.core.utils.MapstructUtils;
import org.dromara.common.core.utils.StringUtils;
import org.dromara.common.mybatis.core.page.TableDataInfo;
import org.dromara.common.mybatis.core.page.PageQuery;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.dromara.petlove.domain.bo.LPetPhotosBo;
import org.dromara.petlove.domain.vo.LPetPhotosVo;
import org.dromara.petlove.domain.LPetPhotos;
import org.dromara.petlove.mapper.LPetPhotosMapper;
import org.dromara.petlove.service.ILPetPhotosService;

import java.util.List;
import java.util.Map;
import java.util.Collection;

/**
 * 【请填写功能名称】Service业务层处理
 *
 * @author Lion Li
 * @date 2026-01-19
 */
@Slf4j
@RequiredArgsConstructor
@Service
public class LPetPhotosServiceImpl implements ILPetPhotosService {

    private final LPetPhotosMapper baseMapper;

    /**
     * 查询【请填写功能名称】
     *
     * @param photoId 主键
     * @return 【请填写功能名称】
     */
    @Override
    public LPetPhotosVo queryById(Long photoId){
        return baseMapper.selectVoById(photoId);
    }

    /**
     * 分页查询【请填写功能名称】列表
     *
     * @param bo        查询条件
     * @param pageQuery 分页参数
     * @return 【请填写功能名称】分页列表
     */
    @Override
    public TableDataInfo<LPetPhotosVo> queryPageList(LPetPhotosBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<LPetPhotos> lqw = buildQueryWrapper(bo);
        Page<LPetPhotosVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询符合条件的【请填写功能名称】列表
     *
     * @param bo 查询条件
     * @return 【请填写功能名称】列表
     */
    @Override
    public List<LPetPhotosVo> queryList(LPetPhotosBo bo) {
        LambdaQueryWrapper<LPetPhotos> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<LPetPhotos> buildQueryWrapper(LPetPhotosBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<LPetPhotos> lqw = Wrappers.lambdaQuery();
        lqw.orderByAsc(LPetPhotos::getPhotoId);
        lqw.eq(bo.getPetId() != null, LPetPhotos::getPetId, bo.getPetId());
        lqw.eq(StringUtils.isNotBlank(bo.getPhotoUrl()), LPetPhotos::getPhotoUrl, bo.getPhotoUrl());
        lqw.eq(StringUtils.isNotBlank(bo.getThumbnailUrl()), LPetPhotos::getThumbnailUrl, bo.getThumbnailUrl());
        lqw.eq(StringUtils.isNotBlank(bo.getPhotoTitle()), LPetPhotos::getPhotoTitle, bo.getPhotoTitle());
        lqw.eq(StringUtils.isNotBlank(bo.getPhotoDesc()), LPetPhotos::getPhotoDesc, bo.getPhotoDesc());
        lqw.eq(bo.getPhotoDate() != null, LPetPhotos::getPhotoDate, bo.getPhotoDate());
        lqw.eq(StringUtils.isNotBlank(bo.getLocation()), LPetPhotos::getLocation, bo.getLocation());
        lqw.eq(StringUtils.isNotBlank(bo.getTags()), LPetPhotos::getTags, bo.getTags());
        lqw.eq(StringUtils.isNotBlank(bo.getAiTags()), LPetPhotos::getAiTags, bo.getAiTags());
        lqw.eq(bo.getIsFavorite() != null, LPetPhotos::getIsFavorite, bo.getIsFavorite());
        lqw.eq(bo.getVisibility() != null, LPetPhotos::getVisibility, bo.getVisibility());
        lqw.eq(bo.getDeleted() != null, LPetPhotos::getDeleted, bo.getDeleted());
        lqw.eq(bo.getDeleteTime() != null, LPetPhotos::getDeleteTime, bo.getDeleteTime());
        lqw.eq(StringUtils.isNotBlank(bo.getDeleteBy()), LPetPhotos::getDeleteBy, bo.getDeleteBy());
        return lqw;
    }

    /**
     * 新增【请填写功能名称】
     *
     * @param bo 【请填写功能名称】
     * @return 是否新增成功
     */
    @Override
    public Boolean insertByBo(LPetPhotosBo bo) {
        LPetPhotos add = MapstructUtils.convert(bo, LPetPhotos.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setPhotoId(add.getPhotoId());
        }
        return flag;
    }

    /**
     * 修改【请填写功能名称】
     *
     * @param bo 【请填写功能名称】
     * @return 是否修改成功
     */
    @Override
    public Boolean updateByBo(LPetPhotosBo bo) {
        LPetPhotos update = MapstructUtils.convert(bo, LPetPhotos.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(LPetPhotos entity){
        //TODO 做一些数据校验,如唯一约束
    }

    /**
     * 校验并批量删除【请填写功能名称】信息
     *
     * @param ids     待删除的主键集合
     * @param isValid 是否进行有效性校验
     * @return 是否删除成功
     */
    @Override
    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if(isValid){
            //TODO 做一些业务上的校验,判断是否需要校验
        }
        return baseMapper.deleteByIds(ids) > 0;
    }
}
