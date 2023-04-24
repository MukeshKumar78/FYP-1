package com.campusme.teams.teamchat;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.actuate.trace.http.HttpTrace.Principal;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import com.campusme.teams.member.Member;
import com.campusme.teams.member.MemberRepository;
import com.campusme.teams.user.AppUser;
import com.campusme.teams.user.AppUserAuthenticationToken;

import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

@RestController
public class TeamChatController {
  @Autowired
  private MemberRepository memberRepository;
  @Autowired
  private TeamChatRepository teamChatRepository;

  @MessageMapping("/chat/{team}")
  @SendTo("/team/{team}")
  public TeamChatMessage sendMessage(String message,
      @AuthenticationPrincipal AppUserAuthenticationToken auth,
      @DestinationVariable String team) {

    Member member = memberRepository.findByUserCodeAndTeamCode(((AppUser) auth.getPrincipal()).getCode(), team)
        .orElseThrow(
            () -> new ResponseStatusException(HttpStatus.FORBIDDEN, "Not a member"));

    return teamChatRepository.save(
        TeamChatMessage.builder()
            .content(message)
            .team(member.getTeam())
            .sender(member.getUser())
            .build());

    // // return principal.getName();
    // return TeamChatMessage.builder()
    // .content(message)
    // .membership(member).build();
  }

  @GetMapping("/team/chat/{team}")
  @PreAuthorize("@webSecurity.isMember(#auth.getPrincipal(), #team)")
  public List<TeamChatMessage> findMessages(
      AppUserAuthenticationToken auth,
      @PathVariable String team,
      @RequestParam(defaultValue = "0") Integer skip,
      @RequestParam(defaultValue = "10") Integer size,
      @RequestParam(defaultValue = "createdAt") String sortBy) {

    Pageable paging = new ChunkRequest(skip, size, Sort.by(sortBy).descending());

    return teamChatRepository.findByTeamCode(team, paging).getContent();
  }
}

// https://stackoverflow.com/a/32763885
class ChunkRequest implements Pageable {
  private final int offset;
  private final int limit;

  // this attribute can be let out if you don't need it
  private Sort sort;

  public ChunkRequest(int offset, int limit, Sort sort) {
    if (offset < 0)
      throw new IllegalArgumentException("Offset must not be less than zero!");

    if (limit < 0)
      throw new IllegalArgumentException("Limit must not be less than zero!");

    this.offset = offset;
    this.limit = limit;

    if (sort != null) {
      this.sort = sort;
    }
  }

  public ChunkRequest(int offset, int limit) {
    this(offset, limit, null);
  }

  @Override
  public int getPageNumber() {
    return 0;
  }

  @Override
  public int getPageSize() {
    return limit;
  }

  @Override
  public long getOffset() {
    return offset;
  }

  @Override
  public Sort getSort() {
    return this.sort;
  }

  @Override
  public Pageable next() {
    return null;
  }

  @Override
  public Pageable previousOrFirst() {
    return this;
  }

  @Override
  public Pageable first() {
    return this;
  }

  @Override
  public Pageable withPage(int pageNumber) {
    return null;
  }

  @Override
  public boolean hasPrevious() {
    return false;
  }
}
