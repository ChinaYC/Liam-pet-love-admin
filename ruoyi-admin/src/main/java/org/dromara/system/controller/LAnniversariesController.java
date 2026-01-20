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
import org.dromara.system.domain.vo.LAnniversariesVo;
import org.dromara.system.domain.bo.LAnniversariesBo;
import org.dromara.system.service.ILAnniversariesService;
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
@RequestMapping("/system/anniversaries")
public class LAnniversariesController extends BaseController {

    private final ILAnniversariesService lAnniversariesService;

    /**
     * 查询【请填写功能名称】列表
     */
    @SaCheckPermission("system:anniversaries:list")
    @GetMapping("/list")
    public TableDataInfo<LAnniversariesVo> list(LAnniversariesBo bo, PageQuery pageQuery) {
        return lAnniversariesService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出【请填写功能名称】列表
     */
    @SaCheckPermission("system:anniversaries:export")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(LAnniversariesBo bo, HttpServletResponse response) {
        List<LAnniversariesVo> list = lAnniversariesService.queryList(bo);
        ExcelUtil.exportExcel(list, "【请填写功能名称】", LAnniversariesVo.class, response);
    }

    /**
     * 获取【请填写功能名称】详细信息
     *
     * @param anniversaryId 主键
     */
    @SaCheckPermission("system:anniversaries:query")
    @GetMapping("/{anniversaryId}")
    public R<LAnniversariesVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long anniversaryId) {
        return R.ok(lAnniversariesService.queryById(anniversaryId));
    }

    /**
     * 新增【请填写功能名称】
     */
    @SaCheckPermission("system:anniversaries:add")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody LAnniversariesBo bo) {
        return toAjax(lAnniversariesService.insertByBo(bo));
    }

    /**
     * 修改【请填写功能名称】
     */
    @SaCheckPermission("system:anniversaries:edit")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody LAnniversariesBo bo) {
        return toAjax(lAnniversariesService.updateByBo(bo));
    }

    /**
     * 删除【请填写功能名称】
     *
     * @param anniversaryIds 主键串
     */
    @SaCheckPermission("system:anniversaries:remove")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.DELETE)
    @DeleteMapping("/{anniversaryIds}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] anniversaryIds) {
        return toAjax(lAnniversariesService.deleteWithValidByIds(List.of(anniversaryIds), true));
    }
}
