package org.dromara.petlove.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.dromara.common.core.utils.MapstructUtils;
import org.dromara.common.core.utils.StringUtils;
import org.dromara.common.mybatis.core.page.PageQuery;
import org.dromara.common.mybatis.core.page.TableDataInfo;
import org.dromara.petlove.domain.LPet;
import org.dromara.petlove.domain.bo.LPetBo;
import org.dromara.petlove.domain.vo.LPetVo;
import org.dromara.petlove.mapper.LPetMapper;
import org.dromara.petlove.service.ILPetService;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.List;

@Slf4j
@RequiredArgsConstructor
@Service
public class LPetServiceImpl implements ILPetService {

    private final LPetMapper baseMapper;

    @Override
    public LPetVo queryById(Long petId) {
        return baseMapper.selectVoById(petId);
    }

    @Override
    public TableDataInfo<LPetVo> queryPageList(LPetBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<LPet> lqw = buildQueryWrapper(bo);
        Page<LPetVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    @Override
    public List<LPetVo> queryList(LPetBo bo) {
        LambdaQueryWrapper<LPet> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<LPet> buildQueryWrapper(LPetBo bo) {
        LambdaQueryWrapper<LPet> lqw = Wrappers.lambdaQuery();
        lqw.orderByAsc(LPet::getPetId);
        lqw.eq(bo.getPetId() != null, LPet::getPetId, bo.getPetId());
        lqw.like(StringUtils.isNotBlank(bo.getPetName()), LPet::getPetName, bo.getPetName());
        lqw.like(StringUtils.isNotBlank(bo.getPetNickname()), LPet::getPetNickname, bo.getPetNickname());
        lqw.eq(bo.getOwnerRuid() != null, LPet::getOwnerRuid, bo.getOwnerRuid());
        lqw.eq(StringUtils.isNotBlank(bo.getSpecies()), LPet::getSpecies, bo.getSpecies());
        lqw.eq(bo.getGender() != null, LPet::getGender, bo.getGender());
        lqw.eq(bo.getBirthDate() != null, LPet::getBirthDate, bo.getBirthDate());
        lqw.eq(bo.getAgeMonths() != null, LPet::getAgeMonths, bo.getAgeMonths());
        lqw.eq(bo.getWeight() != null, LPet::getWeight, bo.getWeight());
        lqw.eq(bo.getStatus() != null, LPet::getStatus, bo.getStatus());
        lqw.eq(bo.getVisibility() != null, LPet::getVisibility, bo.getVisibility());
        lqw.like(StringUtils.isNotBlank(bo.getOwnerNickname()), LPet::getOwnerNickname, bo.getOwnerNickname());
        lqw.eq(bo.getDeleted() != null, LPet::getDeleted, bo.getDeleted());
        return lqw;
    }

    @Override
    public Boolean insertByBo(LPetBo bo) {
        LPet add = MapstructUtils.convert(bo, LPet.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setPetId(add.getPetId());
        }
        return flag;
    }

    @Override
    public Boolean updateByBo(LPetBo bo) {
        LPet update = MapstructUtils.convert(bo, LPet.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    private void validEntityBeforeSave(LPet entity) {
    }

    @Override
    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if (isValid) {
        }
        return baseMapper.deleteByIds(ids) > 0;
    }
}
