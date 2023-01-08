package com.campusme.society.member.mapping;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Mappings;
import org.mapstruct.Named;

import com.campusme.society.member.Member;

@Named("MemberMapper")
@Mapper(componentModel = "spring")
public interface MemberMapper {
  @Named("toDtoWithoutUser")
  @Mappings({
      @Mapping(target = "user", ignore = true),
  })
  MemberResponseDTO toDtoWithoutUser(Member member);
}
