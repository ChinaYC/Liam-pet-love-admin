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
import org.dromara.petlove.domain.bo.LCoupleAnniversariesBo;
import org.dromara.petlove.domain.vo.LCoupleAnniversariesVo;
import org.dromara.petlove.domain.LCoupleAnniversaries;
import org.dromara.petlove.mapper.LCoupleAnniversariesMapper;
import org.dromara.petlove.service.ILCoupleAnniversariesService;

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
public class LCoupleAnniversariesServiceImpl implements ILCoupleAnniversariesService {

    private final LCoupleAnniversariesMapper baseMapper;

    /**
     * 查询【请填写功能名称】
     *
     * @param anniversaryId 主键
     * @return 【请填写功能名称】
     */
    @Override
    public LCoupleAnniversariesVo queryById(Long anniversaryId){
        return baseMapper.selectVoById(anniversaryId);
    }

    /**
     * 分页查询【请填写功能名称】列表
     *
     * @param bo        查询条件
     * @param pageQuery 分页参数
     * @return 【请填写功能名称】分页列表
     */
    @Override
    public TableDataInfo<LCoupleAnniversariesVo> queryPageList(LCoupleAnniversariesBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<LCoupleAnniversaries> lqw = buildQueryWrapper(bo);
        Page<LCoupleAnniversariesVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询符合条件的【请填写功能名称】列表
     *
     * @param bo 查询条件
     * @return 【请填写功能名称】列表
     */
    @Override
    public List<LCoupleAnniversariesVo> queryList(LCoupleAnniversariesBo bo) {
        LambdaQueryWrapper<LCoupleAnniversaries> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<LCoupleAnniversaries> buildQueryWrapper(LCoupleAnniversariesBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<LCoupleAnniversaries> lqw = Wrappers.lambdaQuery();
        lqw.orderByAsc(LCoupleAnniversaries::getAnniversaryId);
        lqw.eq(bo.getRelationId() != null, LCoupleAnniversaries::getRelationId, bo.getRelationId());
        lqw.eq(StringUtils.isNotBlank(bo.getAnniversaryType()), LCoupleAnniversaries::getAnniversaryType, bo.getAnniversaryType());
        lqw.like(StringUtils.isNotBlank(bo.getAnniversaryName()), LCoupleAnniversaries::getAnniversaryName, bo.getAnniversaryName());
        lqw.eq(bo.getAnniversaryDate() != null, LCoupleAnniversaries::getAnniversaryDate, bo.getAnniversaryDate());
        lqw.eq(bo.getIsRecurring() != null, LCoupleAnniversaries::getIsRecurring, bo.getIsRecurring());
        lqw.eq(StringUtils.isNotBlank(bo.getDescription()), LCoupleAnniversaries::getDescription, bo.getDescription());
        lqw.eq(bo.getImportanceLevel() != null, LCoupleAnniversaries::getImportanceLevel, bo.getImportanceLevel());
        lqw.eq(StringUtils.isNotBlank(bo.getCelebrationPlan()), LCoupleAnniversaries::getCelebrationPlan, bo.getCelebrationPlan());
        lqw.eq(StringUtils.isNotBlank(bo.getPhotos()), LCoupleAnniversaries::getPhotos, bo.getPhotos());
        lqw.eq(StringUtils.isNotBlank(bo.getMemories()), LCoupleAnniversaries::getMemories, bo.getMemories());
        lqw.eq(StringUtils.isNotBlank(bo.getGiftsExchanged()), LCoupleAnniversaries::getGiftsExchanged, bo.getGiftsExchanged());
        lqw.eq(StringUtils.isNotBlank(bo.getLocation()), LCoupleAnniversaries::getLocation, bo.getLocation());
        lqw.eq(StringUtils.isNotBlank(bo.getSpecialMeaning()), LCoupleAnniversaries::getSpecialMeaning, bo.getSpecialMeaning());
        lqw.eq(bo.getReminderDaysBefore() != null, LCoupleAnniversaries::getReminderDaysBefore, bo.getReminderDaysBefore());
        lqw.eq(bo.getIsReminderEnabled() != null, LCoupleAnniversaries::getIsReminderEnabled, bo.getIsReminderEnabled());
        lqw.eq(bo.getLastCelebratedYear() != null, LCoupleAnniversaries::getLastCelebratedYear, bo.getLastCelebratedYear());
        lqw.eq(bo.getCelebrationCount() != null, LCoupleAnniversaries::getCelebrationCount, bo.getCelebrationCount());
        lqw.eq(bo.getVisibility() != null, LCoupleAnniversaries::getVisibility, bo.getVisibility());
        lqw.eq(bo.getDeleted() != null, LCoupleAnniversaries::getDeleted, bo.getDeleted());
        lqw.eq(bo.getDeleteTime() != null, LCoupleAnniversaries::getDeleteTime, bo.getDeleteTime());
        lqw.eq(StringUtils.isNotBlank(bo.getDeleteBy()), LCoupleAnniversaries::getDeleteBy, bo.getDeleteBy());
        return lqw;
    }

    /**
     * 新增【请填写功能名称】
     *
     * @param bo 【请填写功能名称】
     * @return 是否新增成功
     */
    @Override
    public Boolean insertByBo(LCoupleAnniversariesBo bo) {
        LCoupleAnniversaries add = MapstructUtils.convert(bo, LCoupleAnniversaries.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setAnniversaryId(add.getAnniversaryId());
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
    public Boolean updateByBo(LCoupleAnniversariesBo bo) {
        LCoupleAnniversaries update = MapstructUtils.convert(bo, LCoupleAnniversaries.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(LCoupleAnniversaries entity){
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
