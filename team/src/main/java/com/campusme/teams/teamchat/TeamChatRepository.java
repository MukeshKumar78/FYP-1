package com.campusme.teams.teamchat;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface TeamChatRepository extends PagingAndSortingRepository<TeamChatMessage, Long> {
  @Query("select c from TeamChatMessage c join c.team t where t.code = ?1")
  Page<TeamChatMessage> findByTeamCode(String code, Pageable paging);
}
