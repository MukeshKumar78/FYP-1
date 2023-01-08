package com.campusme.society.user.mapping;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Mappings;

import com.campusme.society.member.mapping.MemberMapper;
import com.campusme.society.user.AppUser;

@Mapper(uses = MemberMapper.class ,componentModel = "spring")
public interface AppUserMapper {
  @Mappings({
      @Mapping(target = "memberships", qualifiedByName = { "MemberMapper", "toDtoWithoutUser" }) })
  AppUserResponseDTO entityToDTO(AppUser user);
}
