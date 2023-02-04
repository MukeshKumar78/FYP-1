package com.campusme.society.member.mapping;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Mappings;
import org.mapstruct.Named;

import com.campusme.society.member.Member;
import com.campusme.society.society.mapping.SocietyMapper;

@Named("MemberMapper")
@Mapper(
  uses = SocietyMapper.class,
  componentModel = "spring"
)
public interface MemberMapper {
  @Named("toDtoWithoutUser")
  @Mappings({
      @Mapping(target = "user", ignore = true),
      @Mapping(target = "society", qualifiedByName = { "SocietyMapper", "societyToDTOWithoutTenure" })
  })
  MemberResponseDTO toDtoWithoutUserAndSocietyTenure(Member member);
}
