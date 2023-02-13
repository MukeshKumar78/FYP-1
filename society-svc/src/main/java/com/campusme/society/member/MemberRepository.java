package com.campusme.society.member;


import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;

public interface MemberRepository extends JpaRepository<Member, Long> {
  List<Member> findBySocietyId(Long id);
  Member findByUserIdAndSocietyId(Long userId, Long societyId);
  boolean existsByUserIdAndSocietyId(Long userId, Long societyId);
   @Transactional void deleteByUserIdAndSocietyId(Long userId, Long societyId);
}
