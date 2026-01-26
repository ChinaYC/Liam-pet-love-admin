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
import org.dromara.petlove.domain.vo.LCoupleAnniversariesVo;
import org.dromara.petlove.domain.bo.LCoupleAnniversariesBo;
import org.dromara.petlove.service.ILCoupleAnniversariesService;
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
@RequestMapping("/system/coupleAnniversaries")
public class LCoupleAnniversariesController extends BaseController {

    private final ILCoupleAnniversariesService lCoupleAnniversariesService;

    /**
     * 查询【请填写功能名称】列表
     */
    @SaCheckPermission("system:coupleAnniversaries:list")
    @GetMapping("/list")
    public TableDataInfo<LCoupleAnniversariesVo> list(LCoupleAnniversariesBo bo, PageQuery pageQuery) {
        return lCoupleAnniversariesService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出【请填写功能名称】列表
     */
    @SaCheckPermission("system:coupleAnniversaries:export")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(LCoupleAnniversariesBo bo, HttpServletResponse response) {
        List<LCoupleAnniversariesVo> list = lCoupleAnniversariesService.queryList(bo);
        ExcelUtil.exportExcel(list, "【请填写功能名称】", LCoupleAnniversariesVo.class, response);
    }

    /**
     * 获取【请填写功能名称】详细信息
     *
     * @param anniversaryId 主键
     */
    @SaCheckPermission("system:coupleAnniversaries:query")
    @GetMapping("/{anniversaryId}")
    public R<LCoupleAnniversariesVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long anniversaryId) {
        return R.ok(lCoupleAnniversariesService.queryById(anniversaryId));
    }

    /**
     * 新增【请填写功能名称】
     */
    @SaCheckPermission("system:coupleAnniversaries:add")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody LCoupleAnniversariesBo bo) {
        return toAjax(lCoupleAnniversariesService.insertByBo(bo));
    }

    /**
     * 修改【请填写功能名称】
     */
    @SaCheckPermission("system:coupleAnniversaries:edit")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody LCoupleAnniversariesBo bo) {
        return toAjax(lCoupleAnniversariesService.updateByBo(bo));
    }

    /**
     * 删除【请填写功能名称】
     *
     * @param anniversaryIds 主键串
     */
    @SaCheckPermission("system:coupleAnniversaries:remove")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.DELETE)
    @DeleteMapping("/{anniversaryIds}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] anniversaryIds) {
        return toAjax(lCoupleAnniversariesService.deleteWithValidByIds(List.of(anniversaryIds), true));
    }
}
