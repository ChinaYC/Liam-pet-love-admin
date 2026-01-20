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
import org.dromara.system.domain.bo.LAbnormalRecordsBo;
import org.dromara.system.domain.vo.LAbnormalRecordsVo;
import org.dromara.system.domain.LAbnormalRecords;
import org.dromara.system.mapper.LAbnormalRecordsMapper;
import org.dromara.system.service.ILAbnormalRecordsService;

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
public class LAbnormalRecordsServiceImpl implements ILAbnormalRecordsService {

    private final LAbnormalRecordsMapper baseMapper;

    /**
     * 查询【请填写功能名称】
     *
     * @param recordId 主键
     * @return 【请填写功能名称】
     */
    @Override
    public LAbnormalRecordsVo queryById(Long recordId){
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
    public TableDataInfo<LAbnormalRecordsVo> queryPageList(LAbnormalRecordsBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<LAbnormalRecords> lqw = buildQueryWrapper(bo);
        Page<LAbnormalRecordsVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询符合条件的【请填写功能名称】列表
     *
     * @param bo 查询条件
     * @return 【请填写功能名称】列表
     */
    @Override
    public List<LAbnormalRecordsVo> queryList(LAbnormalRecordsBo bo) {
        LambdaQueryWrapper<LAbnormalRecords> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<LAbnormalRecords> buildQueryWrapper(LAbnormalRecordsBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<LAbnormalRecords> lqw = Wrappers.lambdaQuery();
        lqw.orderByAsc(LAbnormalRecords::getRecordId);
        lqw.eq(bo.getPetId() != null, LAbnormalRecords::getPetId, bo.getPetId());
        lqw.eq(StringUtils.isNotBlank(bo.getAbnormalType()), LAbnormalRecords::getAbnormalType, bo.getAbnormalType());
        lqw.eq(StringUtils.isNotBlank(bo.getSymptoms()), LAbnormalRecords::getSymptoms, bo.getSymptoms());
        lqw.eq(bo.getSeverityLevel() != null, LAbnormalRecords::getSeverityLevel, bo.getSeverityLevel());
        lqw.eq(bo.getOccurrenceTime() != null, LAbnormalRecords::getOccurrenceTime, bo.getOccurrenceTime());
        lqw.eq(StringUtils.isNotBlank(bo.getDuration()), LAbnormalRecords::getDuration, bo.getDuration());
        lqw.eq(StringUtils.isNotBlank(bo.getTriggerFactor()), LAbnormalRecords::getTriggerFactor, bo.getTriggerFactor());
        lqw.eq(StringUtils.isNotBlank(bo.getTreatmentTaken()), LAbnormalRecords::getTreatmentTaken, bo.getTreatmentTaken());
        lqw.eq(bo.getRecoveryStatus() != null, LAbnormalRecords::getRecoveryStatus, bo.getRecoveryStatus());
        lqw.eq(StringUtils.isNotBlank(bo.getPhotoUrls()), LAbnormalRecords::getPhotoUrls, bo.getPhotoUrls());
        lqw.eq(bo.getVeterinarianConsulted() != null, LAbnormalRecords::getVeterinarianConsulted, bo.getVeterinarianConsulted());
        lqw.eq(StringUtils.isNotBlank(bo.getVetAdvice()), LAbnormalRecords::getVetAdvice, bo.getVetAdvice());
        lqw.eq(bo.getFollowUpRequired() != null, LAbnormalRecords::getFollowUpRequired, bo.getFollowUpRequired());
        lqw.eq(bo.getFollowUpDate() != null, LAbnormalRecords::getFollowUpDate, bo.getFollowUpDate());
        lqw.eq(StringUtils.isNotBlank(bo.getNotes()), LAbnormalRecords::getNotes, bo.getNotes());
        lqw.eq(bo.getVisibility() != null, LAbnormalRecords::getVisibility, bo.getVisibility());
        lqw.like(StringUtils.isNotBlank(bo.getPetName()), LAbnormalRecords::getPetName, bo.getPetName());
        lqw.eq(bo.getDeleted() != null, LAbnormalRecords::getDeleted, bo.getDeleted());
        lqw.eq(bo.getDeleteTime() != null, LAbnormalRecords::getDeleteTime, bo.getDeleteTime());
        lqw.eq(StringUtils.isNotBlank(bo.getDeleteBy()), LAbnormalRecords::getDeleteBy, bo.getDeleteBy());
        return lqw;
    }

    /**
     * 新增【请填写功能名称】
     *
     * @param bo 【请填写功能名称】
     * @return 是否新增成功
     */
    @Override
    public Boolean insertByBo(LAbnormalRecordsBo bo) {
        LAbnormalRecords add = MapstructUtils.convert(bo, LAbnormalRecords.class);
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
    public Boolean updateByBo(LAbnormalRecordsBo bo) {
        LAbnormalRecords update = MapstructUtils.convert(bo, LAbnormalRecords.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(LAbnormalRecords entity){
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
