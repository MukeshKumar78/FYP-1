package com.campusme.gateway.service;

import java.io.Serializable;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisHash;
import org.springframework.data.repository.CrudRepository;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClient;

import reactor.core.publisher.Mono;

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

@Service
public class NotificationBrokerService {
  @Autowired
  ExpoDeviceUserRepository repository;

  // private final WebClient webClient;
  //
  // public NotificationBrokerService() {
  // this.webClient = WebClient.builder().build();
  // }

  public ExpoDeviceUser registerPushToken(String id, String token) {
    ExpoDeviceUser user = repository.findById(id).orElse(new ExpoDeviceUser());

    user.setId(id);
    user.setToken(token);

    return repository.save(user);
  }
  // public Mono<ResponseEntity<Void>> registerPushToken(Authentication
  // authentication, String token) {
  // String url = "http://notification-broker/push-token";
  //
  // return webClient.put().uri(url)
  // .body(Mono.just(new PushTokenMessage(authentication.getName(), token)),
  // PushTokenMessage.class)
  // .retrieve()
  // .toBodilessEntity();
  // }
}

class PushTokenMessage {
  String user;
  String token;

  public PushTokenMessage(String user, String token) {
    this.user = user;
    this.token = token;
  }

  public String getUser() {
    return user;
  }

  public void setUser(String user) {
    this.user = user;
  }

  public String getToken() {
    return token;
  }

  public void setToken(String token) {
    this.token = token;
  }

}
