package com.campusme.society.user.mapping;

import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;

import com.campusme.society.member.mapping.MemberResponseDTO;

public record AppUserResponseDTO (
    Long id,
    String firstName,
    String lastName,
    Collection<? extends GrantedAuthority> authorities, 
    String photo,
    String email,
    List<MemberResponseDTO> memberships
) {
}
