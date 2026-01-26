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
import org.dromara.petlove.domain.vo.LPetGrowthRecordsVo;
import org.dromara.petlove.domain.bo.LPetGrowthRecordsBo;
import org.dromara.petlove.service.ILPetGrowthRecordsService;
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
@RequestMapping("/system/petGrowthRecords")
public class LPetGrowthRecordsController extends BaseController {

    private final ILPetGrowthRecordsService lPetGrowthRecordsService;

    /**
     * 查询【请填写功能名称】列表
     */
    @SaCheckPermission("system:petGrowthRecords:list")
    @GetMapping("/list")
    public TableDataInfo<LPetGrowthRecordsVo> list(LPetGrowthRecordsBo bo, PageQuery pageQuery) {
        return lPetGrowthRecordsService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出【请填写功能名称】列表
     */
    @SaCheckPermission("system:petGrowthRecords:export")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(LPetGrowthRecordsBo bo, HttpServletResponse response) {
        List<LPetGrowthRecordsVo> list = lPetGrowthRecordsService.queryList(bo);
        ExcelUtil.exportExcel(list, "【请填写功能名称】", LPetGrowthRecordsVo.class, response);
    }

    /**
     * 获取【请填写功能名称】详细信息
     *
     * @param recordId 主键
     */
    @SaCheckPermission("system:petGrowthRecords:query")
    @GetMapping("/{recordId}")
    public R<LPetGrowthRecordsVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long recordId) {
        return R.ok(lPetGrowthRecordsService.queryById(recordId));
    }

    /**
     * 新增【请填写功能名称】
     */
    @SaCheckPermission("system:petGrowthRecords:add")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody LPetGrowthRecordsBo bo) {
        return toAjax(lPetGrowthRecordsService.insertByBo(bo));
    }

    /**
     * 修改【请填写功能名称】
     */
    @SaCheckPermission("system:petGrowthRecords:edit")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody LPetGrowthRecordsBo bo) {
        return toAjax(lPetGrowthRecordsService.updateByBo(bo));
    }

    /**
     * 删除【请填写功能名称】
     *
     * @param recordIds 主键串
     */
    @SaCheckPermission("system:petGrowthRecords:remove")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.DELETE)
    @DeleteMapping("/{recordIds}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] recordIds) {
        return toAjax(lPetGrowthRecordsService.deleteWithValidByIds(List.of(recordIds), true));
    }
}
