package org.dromara.petlove.domain;

import org.dromara.common.tenant.core.TenantEntity;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import java.math.BigDecimal;
import java.util.Date;
import java.io.Serial;

@Data
@EqualsAndHashCode(callSuper = true)
@TableName("L_pets")
public class LPet extends TenantEntity {

    @Serial
    private static final long serialVersionUID = 1L;

    @TableId(value = "pet_id")
    private Long petId;

    private String petName;
    private String petNickname;
    private Long ownerRuid;
    private Long coOwnerRuid;
    private Long breedId;
    private String species;
    private Long gender;
    private Date birthDate;
    private Date adoptionDate;
    private Long ageMonths;
    private String color;
    private String pattern;
    private BigDecimal weight;
    private BigDecimal height;
    private BigDecimal length;
    private BigDecimal chestCircumference;
    private String chipNumber;
    private String registrationNumber;
    private String passportNumber;
    private String avatar;
    private String photoGallery;
    private Long isSterilized;
    private Date sterilizationDate;
    private String sterilizationHospital;
    private String dietaryPreferences;
    private String allergies;
    private String medicalConditions;
    private String emergencyContact;
    private String emergencyPhone;
    private String veterinarianName;
    private String veterinarianPhone;
    private String veterinarianAddress;
    private String insuranceCompany;
    private String insurancePolicyNumber;
    private String microchipBrand;
    private Date microchipImplantDate;
    private Long status;
    private Long visibility;
    private Long isSharedPet;
    private String qrCodeUrl;
    private String tags;
    private String ownerNickname;
    private String coOwnerNickname;
    private String breedName;
    private Long totalPhotos;
    private Long totalHealthRecords;
    private Long totalCareRecords;
    private Date lastHealthCheckDate;
    private Date lastCareDate;
    private Long deleted;
    private Date deleteTime;
    private String deleteBy;
    private String remark;
}
