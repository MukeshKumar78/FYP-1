package com.campusme.securitysvc.home.metrics;

import java.util.List;

import lombok.Data;

@Data
public class RequestsMetric {
  String name;
  String baseUnit;
  List<Measurement> measurements;
}

@Data
class Measurement {
  String statistic;
  Double value;

  @Override
  public String toString() {
    return String.format("%s: %s", statistic.toLowerCase(), value);
  }
}
