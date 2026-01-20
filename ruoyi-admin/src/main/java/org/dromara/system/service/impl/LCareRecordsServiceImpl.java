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
import org.dromara.system.domain.bo.LCareRecordsBo;
import org.dromara.system.domain.vo.LCareRecordsVo;
import org.dromara.system.domain.LCareRecords;
import org.dromara.system.mapper.LCareRecordsMapper;
import org.dromara.system.service.ILCareRecordsService;

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
public class LCareRecordsServiceImpl implements ILCareRecordsService {

    private final LCareRecordsMapper baseMapper;

    /**
     * 查询【请填写功能名称】
     *
     * @param recordId 主键
     * @return 【请填写功能名称】
     */
    @Override
    public LCareRecordsVo queryById(Long recordId){
        return baseMapper.selectVoById(recordId);
    }

    /**
     * 分页查询【请填写功能名称】列表
     *
     * @param bo        查询条件
     * @param pageQuery 分页参数
     * @return 【请填写功能名称】分页列表
     */
    @Override
    public TableDataInfo<LCareRecordsVo> queryPageList(LCareRecordsBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<LCareRecords> lqw = buildQueryWrapper(bo);
        Page<LCareRecordsVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询符合条件的【请填写功能名称】列表
     *
     * @param bo 查询条件
     * @return 【请填写功能名称】列表
     */
    @Override
    public List<LCareRecordsVo> queryList(LCareRecordsBo bo) {
        LambdaQueryWrapper<LCareRecords> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<LCareRecords> buildQueryWrapper(LCareRecordsBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<LCareRecords> lqw = Wrappers.lambdaQuery();
        lqw.orderByAsc(LCareRecords::getRecordId);
        lqw.eq(bo.getPetId() != null, LCareRecords::getPetId, bo.getPetId());
        lqw.eq(bo.getActivityTypeId() != null, LCareRecords::getActivityTypeId, bo.getActivityTypeId());
        lqw.like(StringUtils.isNotBlank(bo.getActivityName()), LCareRecords::getActivityName, bo.getActivityName());
        lqw.eq(bo.getActivityDate() != null, LCareRecords::getActivityDate, bo.getActivityDate());
        lqw.eq(bo.getDurationMinutes() != null, LCareRecords::getDurationMinutes, bo.getDurationMinutes());
        lqw.eq(StringUtils.isNotBlank(bo.getLocation()), LCareRecords::getLocation, bo.getLocation());
        lqw.eq(StringUtils.isNotBlank(bo.getServiceProvider()), LCareRecords::getServiceProvider, bo.getServiceProvider());
        lqw.eq(bo.getCost() != null, LCareRecords::getCost, bo.getCost());
        lqw.eq(StringUtils.isNotBlank(bo.getProductsUsed()), LCareRecords::getProductsUsed, bo.getProductsUsed());
        lqw.eq(StringUtils.isNotBlank(bo.getNotes()), LCareRecords::getNotes, bo.getNotes());
        lqw.eq(bo.getNextDueDate() != null, LCareRecords::getNextDueDate, bo.getNextDueDate());
        lqw.eq(StringUtils.isNotBlank(bo.getPhotoUrls()), LCareRecords::getPhotoUrls, bo.getPhotoUrls());
        lqw.eq(bo.getRating() != null, LCareRecords::getRating, bo.getRating());
        lqw.eq(bo.getReminderSent() != null, LCareRecords::getReminderSent, bo.getReminderSent());
        lqw.eq(bo.getVisibility() != null, LCareRecords::getVisibility, bo.getVisibility());
        lqw.like(StringUtils.isNotBlank(bo.getPetName()), LCareRecords::getPetName, bo.getPetName());
        lqw.like(StringUtils.isNotBlank(bo.getActivityTypeName()), LCareRecords::getActivityTypeName, bo.getActivityTypeName());
        lqw.eq(bo.getDeleted() != null, LCareRecords::getDeleted, bo.getDeleted());
        lqw.eq(bo.getDeleteTime() != null, LCareRecords::getDeleteTime, bo.getDeleteTime());
        lqw.eq(StringUtils.isNotBlank(bo.getDeleteBy()), LCareRecords::getDeleteBy, bo.getDeleteBy());
        return lqw;
    }

    /**
     * 新增【请填写功能名称】
     *
     * @param bo 【请填写功能名称】
     * @return 是否新增成功
     */
    @Override
    public Boolean insertByBo(LCareRecordsBo bo) {
        LCareRecords add = MapstructUtils.convert(bo, LCareRecords.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setRecordId(add.getRecordId());
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
    public Boolean updateByBo(LCareRecordsBo bo) {
        LCareRecords update = MapstructUtils.convert(bo, LCareRecords.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(LCareRecords entity){
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
