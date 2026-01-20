package org.dromara.system.service.impl;

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
import org.dromara.system.domain.bo.LPetFamilyRelationsBo;
import org.dromara.system.domain.vo.LPetFamilyRelationsVo;
import org.dromara.system.domain.LPetFamilyRelations;
import org.dromara.system.mapper.LPetFamilyRelationsMapper;
import org.dromara.system.service.ILPetFamilyRelationsService;

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
public class LPetFamilyRelationsServiceImpl implements ILPetFamilyRelationsService {

    private final LPetFamilyRelationsMapper baseMapper;

    /**
     * 查询【请填写功能名称】
     *
     * @param relationId 主键
     * @return 【请填写功能名称】
     */
    @Override
    public LPetFamilyRelationsVo queryById(Long relationId){
        return baseMapper.selectVoById(relationId);
    }

    /**
     * 分页查询【请填写功能名称】列表
     *
     * @param bo        查询条件
     * @param pageQuery 分页参数
     * @return 【请填写功能名称】分页列表
     */
    @Override
    public TableDataInfo<LPetFamilyRelationsVo> queryPageList(LPetFamilyRelationsBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<LPetFamilyRelations> lqw = buildQueryWrapper(bo);
        Page<LPetFamilyRelationsVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询符合条件的【请填写功能名称】列表
     *
     * @param bo 查询条件
     * @return 【请填写功能名称】列表
     */
    @Override
    public List<LPetFamilyRelationsVo> queryList(LPetFamilyRelationsBo bo) {
        LambdaQueryWrapper<LPetFamilyRelations> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<LPetFamilyRelations> buildQueryWrapper(LPetFamilyRelationsBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<LPetFamilyRelations> lqw = Wrappers.lambdaQuery();
        lqw.orderByAsc(LPetFamilyRelations::getRelationId);
        lqw.eq(bo.getPetId() != null, LPetFamilyRelations::getPetId, bo.getPetId());
        lqw.eq(bo.getRelatedPetId() != null, LPetFamilyRelations::getRelatedPetId, bo.getRelatedPetId());
        lqw.eq(StringUtils.isNotBlank(bo.getRelationType()), LPetFamilyRelations::getRelationType, bo.getRelationType());
        lqw.eq(StringUtils.isNotBlank(bo.getRelationDesc()), LPetFamilyRelations::getRelationDesc, bo.getRelationDesc());
        lqw.eq(bo.getConfirmed() != null, LPetFamilyRelations::getConfirmed, bo.getConfirmed());
        lqw.eq(bo.getConfirmedBy() != null, LPetFamilyRelations::getConfirmedBy, bo.getConfirmedBy());
        lqw.eq(bo.getConfirmedTime() != null, LPetFamilyRelations::getConfirmedTime, bo.getConfirmedTime());
        lqw.eq(bo.getVisibility() != null, LPetFamilyRelations::getVisibility, bo.getVisibility());
        lqw.like(StringUtils.isNotBlank(bo.getPetName()), LPetFamilyRelations::getPetName, bo.getPetName());
        lqw.like(StringUtils.isNotBlank(bo.getRelatedPetName()), LPetFamilyRelations::getRelatedPetName, bo.getRelatedPetName());
        lqw.eq(bo.getDeleted() != null, LPetFamilyRelations::getDeleted, bo.getDeleted());
        lqw.eq(bo.getDeleteTime() != null, LPetFamilyRelations::getDeleteTime, bo.getDeleteTime());
        lqw.eq(StringUtils.isNotBlank(bo.getDeleteBy()), LPetFamilyRelations::getDeleteBy, bo.getDeleteBy());
        return lqw;
    }

    /**
     * 新增【请填写功能名称】
     *
     * @param bo 【请填写功能名称】
     * @return 是否新增成功
     */
    @Override
    public Boolean insertByBo(LPetFamilyRelationsBo bo) {
        LPetFamilyRelations add = MapstructUtils.convert(bo, LPetFamilyRelations.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setRelationId(add.getRelationId());
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
    public Boolean updateByBo(LPetFamilyRelationsBo bo) {
        LPetFamilyRelations update = MapstructUtils.convert(bo, LPetFamilyRelations.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(LPetFamilyRelations entity){
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
