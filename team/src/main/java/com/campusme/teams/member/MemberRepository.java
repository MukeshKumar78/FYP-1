package com.campusme.teams.member;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;

public interface MemberRepository extends JpaRepository<Member, Long> {
  List<Member> findByTeamCode(String code);

  Optional<Member> findByUserCodeAndTeamCode(String userCode, String teamCode);

  List<Member> findByUserCode(String userCode);

  boolean existsByUserIdAndTeamId(Long userId, Long teamId);

  @Transactional
  void deleteByUserIdAndTeamId(Long userId, Long teamId);
}
