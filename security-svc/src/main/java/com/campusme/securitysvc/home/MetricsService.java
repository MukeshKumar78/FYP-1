package com.campusme.securitysvc.home;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.campusme.securitysvc.home.metrics.RequestsMetric;
import com.campusme.securitysvc.society.SocietyService;


/**
 * Encapsulates the HTTP API clients and provides metrics-related methods
 */
@Service
public class MetricsService {
  @Autowired
  private final SocietyService societyService;

  public MetricsService(SocietyService societyService) {
    this.societyService = societyService;
  }

  public RequestsMetric getSocietyRequestsMetrics() {
    return societyService.getSocietyRequestsMetrics();
  }

}
