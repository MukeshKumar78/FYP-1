package com.campusme.society.society.mapping;

import java.util.List;

import org.mapstruct.IterableMapping;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Mappings;
import org.mapstruct.Named;

import com.campusme.society.society.BaseSociety;
import com.campusme.society.society.Society;
import com.campusme.society.society.Tenure;

@Mapper(componentModel = "spring")
@Named("SocietyMapper")
public interface SocietyMapper {

  // Ignore Tenure.societies when mapping a society collection
  List<SocietyResponseDTO> societyListToDTO(List<Society> value);

  @Mapping(
    target = "tenure", 
    qualifiedByName = { "tenureToDTOWithoutSocieties" })
  SocietyResponseDTO societyToDTO(Society value);

  @Named("tenureToDTOWithoutSocieties") 
  @Mapping(
    target = "societies", 
    ignore = true)
  TenureResponseDTO tenureToDTOWithoutSocieties(Tenure value);



  // Ignore Society.tenure when mapping a Tenure collection
  List<TenureResponseDTO> tenureListToDTO(List<Tenure> value);

  @Mapping(
    target = "societies", 
    qualifiedByName = { "societyListToDTOWithoutTenure" })
  TenureResponseDTO tenureToDTO(Tenure value);

  @Named("societyListToDTOWithoutTenure") 
  @IterableMapping(
    qualifiedByName = "societyToDTOWithoutTenure")
  List<SocietyResponseDTO> societyListToDTOWithoutTenure(List<Society> value);

  @Named("societyToDTOWithoutTenure")
  @Mapping(
    target = "tenure", 
    ignore=true)
  SocietyResponseDTO societyToDTOWithoutTenure(Society value);


  // @Mapping(target = "image", ignore = true)
  // Society DTOtoSociety(SocietyCreateRequestDTO value);

  @Mapping(target = "image", ignore = true)
  BaseSociety DTOtoSociety(SocietyCreateRequestDTO value);
  SocietyResponseDTO societyToDTO(BaseSociety value);
}
