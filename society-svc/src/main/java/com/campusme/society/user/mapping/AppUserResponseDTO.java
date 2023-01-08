package com.campusme.society.user.mapping;

import java.util.List;

import com.campusme.society.member.mapping.MemberResponseDTO;

public record AppUserResponseDTO (
    Long id,
    String firstName,
    String lastName,
    String photo,
    String email,
    List<MemberResponseDTO> memberships
) {
}
