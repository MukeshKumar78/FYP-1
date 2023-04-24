package com.campusme.teams.teamchat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.Message;
import org.springframework.messaging.MessageChannel;
import org.springframework.messaging.simp.stomp.StompCommand;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.messaging.support.ChannelInterceptor;
import org.springframework.messaging.support.MessageHeaderAccessor;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.security.oauth2.jwt.JwtDecoder;
import org.springframework.stereotype.Component;
import com.campusme.teams.user.AppUserDetailsService;
import com.campusme.teams.member.MemberRepository;
import com.campusme.teams.user.AppUser;
import com.campusme.teams.user.AppUserAuthenticationToken;

@Component
public class TeamChatSubscriptionInterceptor implements ChannelInterceptor {
  @Autowired
  AppUserDetailsService appUserDetailsService;
  @Autowired
  private JwtDecoder decoder;
  @Autowired
  private MemberRepository memberRepository;

  @Override
  public Message<?> preSend(final Message<?> message, final MessageChannel channel) {
    final StompHeaderAccessor accessor = MessageHeaderAccessor.getAccessor(message, StompHeaderAccessor.class);
    final String destination = accessor.getDestination();

    System.out.println(accessor.getDestination());

    if (StompCommand.SUBSCRIBE == accessor.getCommand() && destination.startsWith("/team/")) {
      String team = destination.replaceAll("/team/", "");
      AppUserAuthenticationToken token = this.authenticateAuthorizationHeader(accessor);
      AppUser user = (AppUser) token.getPrincipal();

      System.out.printf("SUBSCRIBE REQUEST: user(%s) team(%s)\n", user.getCode(), team);
      if (!memberRepository.existsByUserCodeAndTeamCode(user.getCode(), team)) {
        accessor.setUser(null);
      } else {
        accessor.setUser(token);
      }
    }

    return message;
  }

  private AppUserAuthenticationToken authenticateAuthorizationHeader(StompHeaderAccessor accessor) {
    final String auth = accessor.getFirstNativeHeader("Authorization");

    Jwt jwt = decoder.decode(auth);
    UserDetails userDetails = appUserDetailsService.loadByPrincipal(jwt);

    if (userDetails instanceof AppUser user) {
      AppUserAuthenticationToken token = new AppUserAuthenticationToken(user, user.getAuthorities());
      System.out.println(token.getName());
      System.out.println(token.getAuthorities());
      return token;
    } else {
      return null;
    }
  }
}
