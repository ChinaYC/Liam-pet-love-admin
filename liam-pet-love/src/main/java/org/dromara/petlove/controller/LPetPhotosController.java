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
import org.dromara.petlove.domain.vo.LPetPhotosVo;
import org.dromara.petlove.domain.bo.LPetPhotosBo;
import org.dromara.petlove.service.ILPetPhotosService;
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
@RequestMapping("/system/petPhotos")
public class LPetPhotosController extends BaseController {

    private final ILPetPhotosService lPetPhotosService;

    /**
     * 查询【请填写功能名称】列表
     */
    @SaCheckPermission("system:petPhotos:list")
    @GetMapping("/list")
    public TableDataInfo<LPetPhotosVo> list(LPetPhotosBo bo, PageQuery pageQuery) {
        return lPetPhotosService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出【请填写功能名称】列表
     */
    @SaCheckPermission("system:petPhotos:export")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(LPetPhotosBo bo, HttpServletResponse response) {
        List<LPetPhotosVo> list = lPetPhotosService.queryList(bo);
        ExcelUtil.exportExcel(list, "【请填写功能名称】", LPetPhotosVo.class, response);
    }

    /**
     * 获取【请填写功能名称】详细信息
     *
     * @param photoId 主键
     */
    @SaCheckPermission("system:petPhotos:query")
    @GetMapping("/{photoId}")
    public R<LPetPhotosVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long photoId) {
        return R.ok(lPetPhotosService.queryById(photoId));
    }

    /**
     * 新增【请填写功能名称】
     */
    @SaCheckPermission("system:petPhotos:add")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody LPetPhotosBo bo) {
        return toAjax(lPetPhotosService.insertByBo(bo));
    }

    /**
     * 修改【请填写功能名称】
     */
    @SaCheckPermission("system:petPhotos:edit")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody LPetPhotosBo bo) {
        return toAjax(lPetPhotosService.updateByBo(bo));
    }

    /**
     * 删除【请填写功能名称】
     *
     * @param photoIds 主键串
     */
    @SaCheckPermission("system:petPhotos:remove")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.DELETE)
    @DeleteMapping("/{photoIds}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] photoIds) {
        return toAjax(lPetPhotosService.deleteWithValidByIds(List.of(photoIds), true));
    }
}
