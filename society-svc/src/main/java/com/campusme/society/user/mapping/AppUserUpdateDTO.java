package com.campusme.society.user.mapping;

import java.util.List;

import com.campusme.society.member.mapping.MemberResponseDTO;

public record AppUserUpdateDTO (
    String firstName,
    String lastName,
    String photo,
    String email,
    List<MemberResponseDTO> memberships
) {
}
