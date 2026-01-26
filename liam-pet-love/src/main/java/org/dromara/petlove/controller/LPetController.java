package org.dromara.petlove.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.RequiredArgsConstructor;
import org.dromara.common.core.domain.R;
import org.dromara.common.core.validate.AddGroup;
import org.dromara.common.core.validate.EditGroup;
import org.dromara.common.excel.utils.ExcelUtil;
import org.dromara.common.idempotent.annotation.RepeatSubmit;
import org.dromara.common.log.annotation.Log;
import org.dromara.common.log.enums.BusinessType;
import org.dromara.common.mybatis.core.page.PageQuery;
import org.dromara.common.mybatis.core.page.TableDataInfo;
import org.dromara.common.web.core.BaseController;
import org.dromara.petlove.domain.bo.LPetBo;
import org.dromara.petlove.domain.vo.LPetVo;
import org.dromara.petlove.service.ILPetService;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/pet/pets")
public class LPetController extends BaseController {

    private final ILPetService lPetService;

    @SaCheckPermission("pet:pets:list")
    @GetMapping("/list")
    public TableDataInfo<LPetVo> list(LPetBo bo, PageQuery pageQuery) {
        return lPetService.queryPageList(bo, pageQuery);
    }

    @SaCheckPermission("pet:pets:export")
    @Log(title = "宠物信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(LPetBo bo, HttpServletResponse response) {
        List<LPetVo> list = lPetService.queryList(bo);
        ExcelUtil.exportExcel(list, "宠物信息", LPetVo.class, response);
    }

    @SaCheckPermission("pet:pets:query")
    @GetMapping("/{petId}")
    public R<LPetVo> getInfo(@NotNull(message = "主键不能为空") @PathVariable Long petId) {
        return R.ok(lPetService.queryById(petId));
    }

    @SaCheckPermission("pet:pets:add")
    @Log(title = "宠物信息", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody LPetBo bo) {
        return toAjax(lPetService.insertByBo(bo));
    }

    @SaCheckPermission("pet:pets:edit")
    @Log(title = "宠物信息", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody LPetBo bo) {
        return toAjax(lPetService.updateByBo(bo));
    }

    @SaCheckPermission("pet:pets:remove")
    @Log(title = "宠物信息", businessType = BusinessType.DELETE)
    @DeleteMapping("/{petIds}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空") @PathVariable Long[] petIds) {
        return toAjax(lPetService.deleteWithValidByIds(List.of(petIds), true));
    }
}
