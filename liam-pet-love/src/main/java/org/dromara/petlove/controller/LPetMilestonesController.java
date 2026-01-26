package org.dromara.petlove.controller;

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
import org.dromara.petlove.domain.vo.LPetMilestonesVo;
import org.dromara.petlove.domain.bo.LPetMilestonesBo;
import org.dromara.petlove.service.ILPetMilestonesService;
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
@RequestMapping("/system/petMilestones")
public class LPetMilestonesController extends BaseController {

    private final ILPetMilestonesService lPetMilestonesService;

    /**
     * 查询【请填写功能名称】列表
     */
    @SaCheckPermission("system:petMilestones:list")
    @GetMapping("/list")
    public TableDataInfo<LPetMilestonesVo> list(LPetMilestonesBo bo, PageQuery pageQuery) {
        return lPetMilestonesService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出【请填写功能名称】列表
     */
    @SaCheckPermission("system:petMilestones:export")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(LPetMilestonesBo bo, HttpServletResponse response) {
        List<LPetMilestonesVo> list = lPetMilestonesService.queryList(bo);
        ExcelUtil.exportExcel(list, "【请填写功能名称】", LPetMilestonesVo.class, response);
    }

    /**
     * 获取【请填写功能名称】详细信息
     *
     * @param milestoneId 主键
     */
    @SaCheckPermission("system:petMilestones:query")
    @GetMapping("/{milestoneId}")
    public R<LPetMilestonesVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long milestoneId) {
        return R.ok(lPetMilestonesService.queryById(milestoneId));
    }

    /**
     * 新增【请填写功能名称】
     */
    @SaCheckPermission("system:petMilestones:add")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody LPetMilestonesBo bo) {
        return toAjax(lPetMilestonesService.insertByBo(bo));
    }

    /**
     * 修改【请填写功能名称】
     */
    @SaCheckPermission("system:petMilestones:edit")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody LPetMilestonesBo bo) {
        return toAjax(lPetMilestonesService.updateByBo(bo));
    }

    /**
     * 删除【请填写功能名称】
     *
     * @param milestoneIds 主键串
     */
    @SaCheckPermission("system:petMilestones:remove")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.DELETE)
    @DeleteMapping("/{milestoneIds}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] milestoneIds) {
        return toAjax(lPetMilestonesService.deleteWithValidByIds(List.of(milestoneIds), true));
    }
}
