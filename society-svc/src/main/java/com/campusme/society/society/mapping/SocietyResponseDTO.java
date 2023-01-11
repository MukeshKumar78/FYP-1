package com.campusme.society.society.mapping;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class SocietyResponseDTO {
    Long id;
    String code;
    String description;
    String name;
    String fullName;
    String image;
    Date createdAt;
    TenureResponseDTO tenure;
}
