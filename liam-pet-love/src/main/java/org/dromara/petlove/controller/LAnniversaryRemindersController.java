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
import org.dromara.petlove.domain.vo.LAnniversaryRemindersVo;
import org.dromara.petlove.domain.bo.LAnniversaryRemindersBo;
import org.dromara.petlove.service.ILAnniversaryRemindersService;
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
@RequestMapping("/system/anniversaryReminders")
public class LAnniversaryRemindersController extends BaseController {

    private final ILAnniversaryRemindersService lAnniversaryRemindersService;

    /**
     * 查询【请填写功能名称】列表
     */
    @SaCheckPermission("system:anniversaryReminders:list")
    @GetMapping("/list")
    public TableDataInfo<LAnniversaryRemindersVo> list(LAnniversaryRemindersBo bo, PageQuery pageQuery) {
        return lAnniversaryRemindersService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出【请填写功能名称】列表
     */
    @SaCheckPermission("system:anniversaryReminders:export")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(LAnniversaryRemindersBo bo, HttpServletResponse response) {
        List<LAnniversaryRemindersVo> list = lAnniversaryRemindersService.queryList(bo);
        ExcelUtil.exportExcel(list, "【请填写功能名称】", LAnniversaryRemindersVo.class, response);
    }

    /**
     * 获取【请填写功能名称】详细信息
     *
     * @param reminderId 主键
     */
    @SaCheckPermission("system:anniversaryReminders:query")
    @GetMapping("/{reminderId}")
    public R<LAnniversaryRemindersVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long reminderId) {
        return R.ok(lAnniversaryRemindersService.queryById(reminderId));
    }

    /**
     * 新增【请填写功能名称】
     */
    @SaCheckPermission("system:anniversaryReminders:add")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody LAnniversaryRemindersBo bo) {
        return toAjax(lAnniversaryRemindersService.insertByBo(bo));
    }

    /**
     * 修改【请填写功能名称】
     */
    @SaCheckPermission("system:anniversaryReminders:edit")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody LAnniversaryRemindersBo bo) {
        return toAjax(lAnniversaryRemindersService.updateByBo(bo));
    }

    /**
     * 删除【请填写功能名称】
     *
     * @param reminderIds 主键串
     */
    @SaCheckPermission("system:anniversaryReminders:remove")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.DELETE)
    @DeleteMapping("/{reminderIds}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] reminderIds) {
        return toAjax(lAnniversaryRemindersService.deleteWithValidByIds(List.of(reminderIds), true));
    }
}
