package com.campusme.gateway.service;

import java.io.Serializable;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisHash;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

/**
 * Represents a mobile device user who can receive push notifications
 */
@RedisHash("user")
class ExpoDeviceUser implements Serializable {
  private String id;
  private String token;

  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }

  public String getToken() {
    return token;
  }

  public void setToken(String token) {
    this.token = token;
  }
}

@Repository
interface ExpoDeviceUserRepository extends CrudRepository<ExpoDeviceUser, String> {
}

/**
 * This service connects to a redis server and handles storage of push
 * notification tokens
 */
@Service
public class NotificationBrokerService {
  @Autowired
  ExpoDeviceUserRepository repository;

  /**
   * Upserts a push notificatio token for given user
   *
   * @param id    String The user's identifier
   * @param token String The user's push notification token
   */
  public ExpoDeviceUser registerPushToken(String id, String token) {
    ExpoDeviceUser user = repository.findById(id).orElse(new ExpoDeviceUser());

    user.setId(id);
    user.setToken(token);

    return repository.save(user);
  }
}
