package com.campusme.society.member;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface MemberRepository extends JpaRepository<Member, Long> {
  List<Member> findBySocietyId(long id);
  Member findByUserIdAndSocietyId(long userId, long societyId);
}
