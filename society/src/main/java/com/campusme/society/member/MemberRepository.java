package com.campusme.society.member;


import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;

public interface MemberRepository extends JpaRepository<Member, Long> {
  List<Member> findBySocietyCode(String code);
  Optional<Member> findByUserCodeAndSocietyCode(String userCode, String societyCode);
  boolean existsByUserIdAndSocietyId(Long userId, Long societyId);
   @Transactional void deleteByUserIdAndSocietyId(Long userId, Long societyId);
}
