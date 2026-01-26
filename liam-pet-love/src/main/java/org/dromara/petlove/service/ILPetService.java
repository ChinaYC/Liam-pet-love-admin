package org.dromara.petlove.service;

import org.dromara.common.mybatis.core.page.PageQuery;
import org.dromara.common.mybatis.core.page.TableDataInfo;
import org.dromara.petlove.domain.bo.LPetBo;
import org.dromara.petlove.domain.vo.LPetVo;

import java.util.Collection;
import java.util.List;

public interface ILPetService {

    LPetVo queryById(Long petId);

    TableDataInfo<LPetVo> queryPageList(LPetBo bo, PageQuery pageQuery);

    List<LPetVo> queryList(LPetBo bo);

    Boolean insertByBo(LPetBo bo);

    Boolean updateByBo(LPetBo bo);

    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);
}
