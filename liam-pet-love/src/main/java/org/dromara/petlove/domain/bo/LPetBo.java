package org.dromara.petlove.domain.bo;

import org.dromara.petlove.domain.LPet;
import org.dromara.common.mybatis.core.domain.BaseEntity;
import org.dromara.common.core.validate.AddGroup;
import org.dromara.common.core.validate.EditGroup;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;
import lombok.EqualsAndHashCode;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import java.math.BigDecimal;
import java.util.Date;

@Data
@EqualsAndHashCode(callSuper = true)
@AutoMapper(target = LPet.class, reverseConvertGenerate = false)
public class LPetBo extends BaseEntity {

    @NotNull(message = "宠物ID不能为空", groups = { EditGroup.class })
    private Long petId;

    @NotBlank(message = "宠物名字不能为空", groups = { AddGroup.class, EditGroup.class })
    private String petName;

    private String petNickname;

    @NotNull(message = "主人ID不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long ownerRuid;

    @NotBlank(message = "物种不能为空", groups = { AddGroup.class, EditGroup.class })
    private String species;

    private Long gender;
    private Date birthDate;
    private Long ageMonths;
    private BigDecimal weight;
    private Long status;
    private Long visibility;
    private String ownerNickname;
    private Long deleted;
}
