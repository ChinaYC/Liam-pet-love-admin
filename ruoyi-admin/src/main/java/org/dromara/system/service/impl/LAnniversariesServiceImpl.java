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
import org.dromara.system.domain.bo.LAnniversariesBo;
import org.dromara.system.domain.vo.LAnniversariesVo;
import org.dromara.system.domain.LAnniversaries;
import org.dromara.system.mapper.LAnniversariesMapper;
import org.dromara.system.service.ILAnniversariesService;

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
public class LAnniversariesServiceImpl implements ILAnniversariesService {

    private final LAnniversariesMapper baseMapper;

    /**
     * 查询【请填写功能名称】
     *
     * @param anniversaryId 主键
     * @return 【请填写功能名称】
     */
    @Override
    public LAnniversariesVo queryById(Long anniversaryId){
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
    public TableDataInfo<LAnniversariesVo> queryPageList(LAnniversariesBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<LAnniversaries> lqw = buildQueryWrapper(bo);
        Page<LAnniversariesVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询符合条件的【请填写功能名称】列表
     *
     * @param bo 查询条件
     * @return 【请填写功能名称】列表
     */
    @Override
    public List<LAnniversariesVo> queryList(LAnniversariesBo bo) {
        LambdaQueryWrapper<LAnniversaries> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<LAnniversaries> buildQueryWrapper(LAnniversariesBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<LAnniversaries> lqw = Wrappers.lambdaQuery();
        lqw.orderByAsc(LAnniversaries::getAnniversaryId);
        lqw.eq(bo.getRelationId() != null, LAnniversaries::getRelationId, bo.getRelationId());
        lqw.like(StringUtils.isNotBlank(bo.getAnniversaryName()), LAnniversaries::getAnniversaryName, bo.getAnniversaryName());
        lqw.eq(bo.getAnniversaryDate() != null, LAnniversaries::getAnniversaryDate, bo.getAnniversaryDate());
        lqw.eq(StringUtils.isNotBlank(bo.getAnniversaryType()), LAnniversaries::getAnniversaryType, bo.getAnniversaryType());
        lqw.eq(StringUtils.isNotBlank(bo.getRepeatType()), LAnniversaries::getRepeatType, bo.getRepeatType());
        lqw.eq(StringUtils.isNotBlank(bo.getDescription()), LAnniversaries::getDescription, bo.getDescription());
        lqw.eq(bo.getReminderDays() != null, LAnniversaries::getReminderDays, bo.getReminderDays());
        lqw.eq(bo.getIsReminderEnabled() != null, LAnniversaries::getIsReminderEnabled, bo.getIsReminderEnabled());
        lqw.eq(StringUtils.isNotBlank(bo.getCelebrationPlan()), LAnniversaries::getCelebrationPlan, bo.getCelebrationPlan());
        lqw.eq(StringUtils.isNotBlank(bo.getPhotoUrls()), LAnniversaries::getPhotoUrls, bo.getPhotoUrls());
        lqw.eq(bo.getIsActive() != null, LAnniversaries::getIsActive, bo.getIsActive());
        return lqw;
    }

    /**
     * 新增【请填写功能名称】
     *
     * @param bo 【请填写功能名称】
     * @return 是否新增成功
     */
    @Override
    public Boolean insertByBo(LAnniversariesBo bo) {
        LAnniversaries add = MapstructUtils.convert(bo, LAnniversaries.class);
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
    public Boolean updateByBo(LAnniversariesBo bo) {
        LAnniversaries update = MapstructUtils.convert(bo, LAnniversaries.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(LAnniversaries entity){
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
