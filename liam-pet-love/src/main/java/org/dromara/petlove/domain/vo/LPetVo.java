package org.dromara.petlove.domain.vo;

import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;
import org.dromara.petlove.domain.LPet;
import java.io.Serial;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

@Data
@AutoMapper(target = LPet.class)
public class LPetVo implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    private Long petId;
    private String petName;
    private String petNickname;
    private Long ownerRuid;
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
