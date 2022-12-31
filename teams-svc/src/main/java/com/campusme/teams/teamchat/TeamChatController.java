package com.campusme.teams.teamchat;

import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TeamChatController {

    @MessageMapping("/chat.send")
    @SendTo("/topic/{teamId}")
    public TeamChatMessage sendMessage(
      @DestinationVariable long teamId, 
      @Payload TeamChatMessage chatMessage, 
      UserDetails userDetails) {
        return chatMessage;
    }
}
