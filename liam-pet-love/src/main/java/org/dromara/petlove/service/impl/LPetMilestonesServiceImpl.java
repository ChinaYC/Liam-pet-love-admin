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
import org.dromara.petlove.domain.bo.LPetMilestonesBo;
import org.dromara.petlove.domain.vo.LPetMilestonesVo;
import org.dromara.petlove.domain.LPetMilestones;
import org.dromara.petlove.mapper.LPetMilestonesMapper;
import org.dromara.petlove.service.ILPetMilestonesService;

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
public class LPetMilestonesServiceImpl implements ILPetMilestonesService {

    private final LPetMilestonesMapper baseMapper;

    /**
     * 查询【请填写功能名称】
     *
     * @param milestoneId 主键
     * @return 【请填写功能名称】
     */
    @Override
    public LPetMilestonesVo queryById(Long milestoneId){
        return baseMapper.selectVoById(milestoneId);
    }

    /**
     * 分页查询【请填写功能名称】列表
     *
     * @param bo        查询条件
     * @param pageQuery 分页参数
     * @return 【请填写功能名称】分页列表
     */
    @Override
    public TableDataInfo<LPetMilestonesVo> queryPageList(LPetMilestonesBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<LPetMilestones> lqw = buildQueryWrapper(bo);
        Page<LPetMilestonesVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询符合条件的【请填写功能名称】列表
     *
     * @param bo 查询条件
     * @return 【请填写功能名称】列表
     */
    @Override
    public List<LPetMilestonesVo> queryList(LPetMilestonesBo bo) {
        LambdaQueryWrapper<LPetMilestones> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<LPetMilestones> buildQueryWrapper(LPetMilestonesBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<LPetMilestones> lqw = Wrappers.lambdaQuery();
        lqw.orderByAsc(LPetMilestones::getMilestoneId);
        lqw.eq(bo.getPetId() != null, LPetMilestones::getPetId, bo.getPetId());
        lqw.eq(StringUtils.isNotBlank(bo.getMilestoneType()), LPetMilestones::getMilestoneType, bo.getMilestoneType());
        lqw.like(StringUtils.isNotBlank(bo.getMilestoneName()), LPetMilestones::getMilestoneName, bo.getMilestoneName());
        lqw.eq(StringUtils.isNotBlank(bo.getMilestoneDescription()), LPetMilestones::getMilestoneDescription, bo.getMilestoneDescription());
        lqw.eq(bo.getAchievementDate() != null, LPetMilestones::getAchievementDate, bo.getAchievementDate());
        lqw.eq(bo.getPetAgeDays() != null, LPetMilestones::getPetAgeDays, bo.getPetAgeDays());
        lqw.eq(StringUtils.isNotBlank(bo.getMilestoneValue()), LPetMilestones::getMilestoneValue, bo.getMilestoneValue());
        lqw.eq(StringUtils.isNotBlank(bo.getMilestoneUnit()), LPetMilestones::getMilestoneUnit, bo.getMilestoneUnit());
        lqw.eq(bo.getSignificanceLevel() != null, LPetMilestones::getSignificanceLevel, bo.getSignificanceLevel());
        lqw.eq(StringUtils.isNotBlank(bo.getCelebrationPlan()), LPetMilestones::getCelebrationPlan, bo.getCelebrationPlan());
        lqw.eq(StringUtils.isNotBlank(bo.getPhotoUrls()), LPetMilestones::getPhotoUrls, bo.getPhotoUrls());
        lqw.eq(StringUtils.isNotBlank(bo.getVideoUrls()), LPetMilestones::getVideoUrls, bo.getVideoUrls());
        lqw.eq(bo.getSharedWithPartner() != null, LPetMilestones::getSharedWithPartner, bo.getSharedWithPartner());
        lqw.eq(bo.getSocialMediaShared() != null, LPetMilestones::getSocialMediaShared, bo.getSocialMediaShared());
        lqw.eq(StringUtils.isNotBlank(bo.getMemoryNotes()), LPetMilestones::getMemoryNotes, bo.getMemoryNotes());
        lqw.eq(StringUtils.isNotBlank(bo.getNextMilestoneTarget()), LPetMilestones::getNextMilestoneTarget, bo.getNextMilestoneTarget());
        lqw.eq(bo.getVisibility() != null, LPetMilestones::getVisibility, bo.getVisibility());
        lqw.like(StringUtils.isNotBlank(bo.getPetName()), LPetMilestones::getPetName, bo.getPetName());
        lqw.eq(bo.getDeleted() != null, LPetMilestones::getDeleted, bo.getDeleted());
        lqw.eq(bo.getDeleteTime() != null, LPetMilestones::getDeleteTime, bo.getDeleteTime());
        lqw.eq(StringUtils.isNotBlank(bo.getDeleteBy()), LPetMilestones::getDeleteBy, bo.getDeleteBy());
        return lqw;
    }

    /**
     * 新增【请填写功能名称】
     *
     * @param bo 【请填写功能名称】
     * @return 是否新增成功
     */
    @Override
    public Boolean insertByBo(LPetMilestonesBo bo) {
        LPetMilestones add = MapstructUtils.convert(bo, LPetMilestones.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setMilestoneId(add.getMilestoneId());
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
    public Boolean updateByBo(LPetMilestonesBo bo) {
        LPetMilestones update = MapstructUtils.convert(bo, LPetMilestones.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(LPetMilestones entity){
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
