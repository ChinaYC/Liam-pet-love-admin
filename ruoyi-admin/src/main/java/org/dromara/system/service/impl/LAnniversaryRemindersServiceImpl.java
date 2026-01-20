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
import org.dromara.system.domain.bo.LAnniversaryRemindersBo;
import org.dromara.system.domain.vo.LAnniversaryRemindersVo;
import org.dromara.system.domain.LAnniversaryReminders;
import org.dromara.system.mapper.LAnniversaryRemindersMapper;
import org.dromara.system.service.ILAnniversaryRemindersService;

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
public class LAnniversaryRemindersServiceImpl implements ILAnniversaryRemindersService {

    private final LAnniversaryRemindersMapper baseMapper;

    /**
     * 查询【请填写功能名称】
     *
     * @param reminderId 主键
     * @return 【请填写功能名称】
     */
    @Override
    public LAnniversaryRemindersVo queryById(Long reminderId){
        return baseMapper.selectVoById(reminderId);
    }

    /**
     * 分页查询【请填写功能名称】列表
     *
     * @param bo        查询条件
     * @param pageQuery 分页参数
     * @return 【请填写功能名称】分页列表
     */
    @Override
    public TableDataInfo<LAnniversaryRemindersVo> queryPageList(LAnniversaryRemindersBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<LAnniversaryReminders> lqw = buildQueryWrapper(bo);
        Page<LAnniversaryRemindersVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询符合条件的【请填写功能名称】列表
     *
     * @param bo 查询条件
     * @return 【请填写功能名称】列表
     */
    @Override
    public List<LAnniversaryRemindersVo> queryList(LAnniversaryRemindersBo bo) {
        LambdaQueryWrapper<LAnniversaryReminders> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<LAnniversaryReminders> buildQueryWrapper(LAnniversaryRemindersBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<LAnniversaryReminders> lqw = Wrappers.lambdaQuery();
        lqw.orderByAsc(LAnniversaryReminders::getReminderId);
        lqw.eq(StringUtils.isNotBlank(bo.getAnniversaryType()), LAnniversaryReminders::getAnniversaryType, bo.getAnniversaryType());
        lqw.eq(bo.getAnniversaryId() != null, LAnniversaryReminders::getAnniversaryId, bo.getAnniversaryId());
        lqw.eq(bo.getRuid() != null, LAnniversaryReminders::getRuid, bo.getRuid());
        lqw.eq(bo.getReminderDate() != null, LAnniversaryReminders::getReminderDate, bo.getReminderDate());
        lqw.eq(bo.getReminderTime() != null, LAnniversaryReminders::getReminderTime, bo.getReminderTime());
        lqw.eq(StringUtils.isNotBlank(bo.getReminderTitle()), LAnniversaryReminders::getReminderTitle, bo.getReminderTitle());
        lqw.eq(StringUtils.isNotBlank(bo.getReminderContent()), LAnniversaryReminders::getReminderContent, bo.getReminderContent());
        lqw.eq(StringUtils.isNotBlank(bo.getReminderMethod()), LAnniversaryReminders::getReminderMethod, bo.getReminderMethod());
        lqw.eq(bo.getIsSent() != null, LAnniversaryReminders::getIsSent, bo.getIsSent());
        lqw.eq(bo.getSentTime() != null, LAnniversaryReminders::getSentTime, bo.getSentTime());
        lqw.eq(bo.getIsRead() != null, LAnniversaryReminders::getIsRead, bo.getIsRead());
        lqw.eq(bo.getReadTime() != null, LAnniversaryReminders::getReadTime, bo.getReadTime());
        lqw.eq(StringUtils.isNotBlank(bo.getResponseAction()), LAnniversaryReminders::getResponseAction, bo.getResponseAction());
        lqw.eq(bo.getSnoozeUntil() != null, LAnniversaryReminders::getSnoozeUntil, bo.getSnoozeUntil());
        lqw.eq(bo.getPriorityLevel() != null, LAnniversaryReminders::getPriorityLevel, bo.getPriorityLevel());
        lqw.eq(bo.getDeleted() != null, LAnniversaryReminders::getDeleted, bo.getDeleted());
        lqw.eq(bo.getDeleteTime() != null, LAnniversaryReminders::getDeleteTime, bo.getDeleteTime());
        lqw.eq(StringUtils.isNotBlank(bo.getDeleteBy()), LAnniversaryReminders::getDeleteBy, bo.getDeleteBy());
        return lqw;
    }

    /**
     * 新增【请填写功能名称】
     *
     * @param bo 【请填写功能名称】
     * @return 是否新增成功
     */
    @Override
    public Boolean insertByBo(LAnniversaryRemindersBo bo) {
        LAnniversaryReminders add = MapstructUtils.convert(bo, LAnniversaryReminders.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setReminderId(add.getReminderId());
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
    public Boolean updateByBo(LAnniversaryRemindersBo bo) {
        LAnniversaryReminders update = MapstructUtils.convert(bo, LAnniversaryReminders.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(LAnniversaryReminders entity){
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
