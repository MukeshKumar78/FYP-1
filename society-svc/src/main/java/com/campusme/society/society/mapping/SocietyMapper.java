package com.campusme.society.society.mapping;


import org.mapstruct.Mapper;

import com.campusme.society.society.Society;
import com.campusme.society.society.Tenure;

@Mapper(componentModel = "spring")
public interface SocietyMapper {
  SocietyResponseDTO societyToDTO(Society value);

  TenureResponseDTO tenureToDTO(Tenure value);
}
