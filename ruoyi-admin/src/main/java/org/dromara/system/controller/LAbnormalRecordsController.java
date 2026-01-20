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
import org.dromara.system.domain.vo.LAbnormalRecordsVo;
import org.dromara.system.domain.bo.LAbnormalRecordsBo;
import org.dromara.system.service.ILAbnormalRecordsService;
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
@RequestMapping("/system/abnormalRecords")
public class LAbnormalRecordsController extends BaseController {

    private final ILAbnormalRecordsService lAbnormalRecordsService;

    /**
     * 查询【请填写功能名称】列表
     */
    @SaCheckPermission("system:abnormalRecords:list")
    @GetMapping("/list")
    public TableDataInfo<LAbnormalRecordsVo> list(LAbnormalRecordsBo bo, PageQuery pageQuery) {
        return lAbnormalRecordsService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出【请填写功能名称】列表
     */
    @SaCheckPermission("system:abnormalRecords:export")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(LAbnormalRecordsBo bo, HttpServletResponse response) {
        List<LAbnormalRecordsVo> list = lAbnormalRecordsService.queryList(bo);
        ExcelUtil.exportExcel(list, "【请填写功能名称】", LAbnormalRecordsVo.class, response);
    }

    /**
     * 获取【请填写功能名称】详细信息
     *
     * @param recordId 主键
     */
    @SaCheckPermission("system:abnormalRecords:query")
    @GetMapping("/{recordId}")
    public R<LAbnormalRecordsVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long recordId) {
        return R.ok(lAbnormalRecordsService.queryById(recordId));
    }

    /**
     * 新增【请填写功能名称】
     */
    @SaCheckPermission("system:abnormalRecords:add")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody LAbnormalRecordsBo bo) {
        return toAjax(lAbnormalRecordsService.insertByBo(bo));
    }

    /**
     * 修改【请填写功能名称】
     */
    @SaCheckPermission("system:abnormalRecords:edit")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody LAbnormalRecordsBo bo) {
        return toAjax(lAbnormalRecordsService.updateByBo(bo));
    }

    /**
     * 删除【请填写功能名称】
     *
     * @param recordIds 主键串
     */
    @SaCheckPermission("system:abnormalRecords:remove")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.DELETE)
    @DeleteMapping("/{recordIds}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] recordIds) {
        return toAjax(lAbnormalRecordsService.deleteWithValidByIds(List.of(recordIds), true));
    }
}
