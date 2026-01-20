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
import org.dromara.system.domain.bo.LPetGrowthRecordsBo;
import org.dromara.system.domain.vo.LPetGrowthRecordsVo;
import org.dromara.system.domain.LPetGrowthRecords;
import org.dromara.system.mapper.LPetGrowthRecordsMapper;
import org.dromara.system.service.ILPetGrowthRecordsService;

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
public class LPetGrowthRecordsServiceImpl implements ILPetGrowthRecordsService {

    private final LPetGrowthRecordsMapper baseMapper;

    /**
     * 查询【请填写功能名称】
     *
     * @param recordId 主键
     * @return 【请填写功能名称】
     */
    @Override
    public LPetGrowthRecordsVo queryById(Long recordId){
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
    public TableDataInfo<LPetGrowthRecordsVo> queryPageList(LPetGrowthRecordsBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<LPetGrowthRecords> lqw = buildQueryWrapper(bo);
        Page<LPetGrowthRecordsVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询符合条件的【请填写功能名称】列表
     *
     * @param bo 查询条件
     * @return 【请填写功能名称】列表
     */
    @Override
    public List<LPetGrowthRecordsVo> queryList(LPetGrowthRecordsBo bo) {
        LambdaQueryWrapper<LPetGrowthRecords> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<LPetGrowthRecords> buildQueryWrapper(LPetGrowthRecordsBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<LPetGrowthRecords> lqw = Wrappers.lambdaQuery();
        lqw.orderByAsc(LPetGrowthRecords::getRecordId);
        lqw.eq(bo.getPetId() != null, LPetGrowthRecords::getPetId, bo.getPetId());
        lqw.eq(StringUtils.isNotBlank(bo.getGrowthStage()), LPetGrowthRecords::getGrowthStage, bo.getGrowthStage());
        lqw.eq(bo.getRecordDate() != null, LPetGrowthRecords::getRecordDate, bo.getRecordDate());
        lqw.eq(bo.getAgeMonths() != null, LPetGrowthRecords::getAgeMonths, bo.getAgeMonths());
        lqw.eq(bo.getWeight() != null, LPetGrowthRecords::getWeight, bo.getWeight());
        lqw.eq(bo.getHeight() != null, LPetGrowthRecords::getHeight, bo.getHeight());
        lqw.eq(bo.getLength() != null, LPetGrowthRecords::getLength, bo.getLength());
        lqw.eq(StringUtils.isNotBlank(bo.getDevelopmentNotes()), LPetGrowthRecords::getDevelopmentNotes, bo.getDevelopmentNotes());
        lqw.eq(StringUtils.isNotBlank(bo.getBehavioralChanges()), LPetGrowthRecords::getBehavioralChanges, bo.getBehavioralChanges());
        lqw.eq(StringUtils.isNotBlank(bo.getHealthStatus()), LPetGrowthRecords::getHealthStatus, bo.getHealthStatus());
        lqw.eq(StringUtils.isNotBlank(bo.getMilestoneAchieved()), LPetGrowthRecords::getMilestoneAchieved, bo.getMilestoneAchieved());
        lqw.eq(StringUtils.isNotBlank(bo.getPhotos()), LPetGrowthRecords::getPhotos, bo.getPhotos());
        lqw.eq(StringUtils.isNotBlank(bo.getVeterinarianNotes()), LPetGrowthRecords::getVeterinarianNotes, bo.getVeterinarianNotes());
        lqw.eq(bo.getNextCheckupDate() != null, LPetGrowthRecords::getNextCheckupDate, bo.getNextCheckupDate());
        lqw.eq(bo.getVisibility() != null, LPetGrowthRecords::getVisibility, bo.getVisibility());
        lqw.like(StringUtils.isNotBlank(bo.getPetName()), LPetGrowthRecords::getPetName, bo.getPetName());
        lqw.eq(bo.getDeleted() != null, LPetGrowthRecords::getDeleted, bo.getDeleted());
        lqw.eq(bo.getDeleteTime() != null, LPetGrowthRecords::getDeleteTime, bo.getDeleteTime());
        lqw.eq(StringUtils.isNotBlank(bo.getDeleteBy()), LPetGrowthRecords::getDeleteBy, bo.getDeleteBy());
        return lqw;
    }

    /**
     * 新增【请填写功能名称】
     *
     * @param bo 【请填写功能名称】
     * @return 是否新增成功
     */
    @Override
    public Boolean insertByBo(LPetGrowthRecordsBo bo) {
        LPetGrowthRecords add = MapstructUtils.convert(bo, LPetGrowthRecords.class);
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
    public Boolean updateByBo(LPetGrowthRecordsBo bo) {
        LPetGrowthRecords update = MapstructUtils.convert(bo, LPetGrowthRecords.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(LPetGrowthRecords entity){
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
