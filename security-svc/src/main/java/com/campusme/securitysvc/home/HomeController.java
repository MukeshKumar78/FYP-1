package com.campusme.securitysvc.home;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

  @GetMapping("/entities")
  public String showEntitiesPage(Model model) {
    return "entities";
  }
}
