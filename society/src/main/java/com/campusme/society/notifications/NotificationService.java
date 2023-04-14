package com.campusme.society.notifications;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
class Message {
  List<String> users;
  Notification notification;
}

@Service
public class NotificationService {
  private final String CHANNEL = "push-notifications";

  @Autowired
  private RedisTemplate<String, Object> redisTemplate;

  public void publish(Notification notification, List<String> users) {
    Message message = new Message(users, notification);

    redisTemplate.convertAndSend(CHANNEL, message);
  }
}
