package com.campusme.society.member.mapping;

import com.campusme.society.society.mapping.SocietyResponseDTO;
import com.campusme.society.user.mapping.AppUserResponseDTO;

public record MemberResponseDTO (
    String role,
    SocietyResponseDTO society,
    AppUserResponseDTO user
) {
}
