package com.campusme.teams.teamchat;

import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.RestController;

import lombok.Data;

@RestController
public class TeamChatController {

  @MessageMapping("/chat.send")
  @SendTo("/chat/{teamId}")
  public String sendMessage(
      @DestinationVariable Long teamId,
      @Payload String message,
      UserDetails userDetails) {
    return message;
  }
}
