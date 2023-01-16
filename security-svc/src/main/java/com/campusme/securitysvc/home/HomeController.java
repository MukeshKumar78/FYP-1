package com.campusme.securitysvc.home;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

  @Autowired
  MetricsService metricsService;

  @GetMapping("/")
  public String showRoleList(Model model) {
    
    model.addAttribute("societysvc", metricsService.getSocietyRequestsMetrics());

    return "index";
  }
}
