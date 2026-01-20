package org.dromara.system.controller;

import java.util.List;

import lombok.RequiredArgsConstructor;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.constraints.*;
import cn.dev33.satoken.annotation.SaCheckPermission;
import org.springframework.web.bind.annotation.*;
import org.springframework.validation.annotation.Validated;
import org.dromara.common.idempotent.annotation.RepeatSubmit;
import org.dromara.common.log.annotation.Log;
import org.dromara.common.web.core.BaseController;
import org.dromara.common.mybatis.core.page.PageQuery;
import org.dromara.common.core.domain.R;
import org.dromara.common.core.validate.AddGroup;
import org.dromara.common.core.validate.EditGroup;
import org.dromara.common.log.enums.BusinessType;
import org.dromara.common.excel.utils.ExcelUtil;
import org.dromara.system.domain.vo.LPetFamilyRelationsVo;
import org.dromara.system.domain.bo.LPetFamilyRelationsBo;
import org.dromara.system.service.ILPetFamilyRelationsService;
import org.dromara.common.mybatis.core.page.TableDataInfo;

/**
 * 【请填写功能名称】
 *
 * @author Lion Li
 * @date 2026-01-19
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/system/petFamilyRelations")
public class LPetFamilyRelationsController extends BaseController {

    private final ILPetFamilyRelationsService lPetFamilyRelationsService;

    /**
     * 查询【请填写功能名称】列表
     */
    @SaCheckPermission("system:petFamilyRelations:list")
    @GetMapping("/list")
    public TableDataInfo<LPetFamilyRelationsVo> list(LPetFamilyRelationsBo bo, PageQuery pageQuery) {
        return lPetFamilyRelationsService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出【请填写功能名称】列表
     */
    @SaCheckPermission("system:petFamilyRelations:export")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(LPetFamilyRelationsBo bo, HttpServletResponse response) {
        List<LPetFamilyRelationsVo> list = lPetFamilyRelationsService.queryList(bo);
        ExcelUtil.exportExcel(list, "【请填写功能名称】", LPetFamilyRelationsVo.class, response);
    }

    /**
     * 获取【请填写功能名称】详细信息
     *
     * @param relationId 主键
     */
    @SaCheckPermission("system:petFamilyRelations:query")
    @GetMapping("/{relationId}")
    public R<LPetFamilyRelationsVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long relationId) {
        return R.ok(lPetFamilyRelationsService.queryById(relationId));
    }

    /**
     * 新增【请填写功能名称】
     */
    @SaCheckPermission("system:petFamilyRelations:add")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody LPetFamilyRelationsBo bo) {
        return toAjax(lPetFamilyRelationsService.insertByBo(bo));
    }

    /**
     * 修改【请填写功能名称】
     */
    @SaCheckPermission("system:petFamilyRelations:edit")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody LPetFamilyRelationsBo bo) {
        return toAjax(lPetFamilyRelationsService.updateByBo(bo));
    }

    /**
     * 删除【请填写功能名称】
     *
     * @param relationIds 主键串
     */
    @SaCheckPermission("system:petFamilyRelations:remove")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.DELETE)
    @DeleteMapping("/{relationIds}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] relationIds) {
        return toAjax(lPetFamilyRelationsService.deleteWithValidByIds(List.of(relationIds), true));
    }
}
