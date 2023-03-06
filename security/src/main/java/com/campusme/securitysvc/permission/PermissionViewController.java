package com.campusme.securitysvc.permission;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/permissions/")
public class PermissionViewController {

  @Autowired
  private PermissionRepository permissionRepository;

  @GetMapping("index")
  public String showPermissionList(Model model) {
    model.addAttribute("permissions", permissionRepository.findAll());
    return "index";
  }

  @PostMapping("add")
  public String addPermission(@Validated Permission permission, BindingResult result, Model model) {
    if (result.hasErrors()) {
      return "add-permission";
    }

    permissionRepository.save(permission);
    return "redirect:/index";
  }

  @GetMapping("edit/{id}")
  public String showUpdateForm(@PathVariable("id") long id, Model model) {
    Permission permission = permissionRepository.findById(id)
        .orElseThrow(() -> new IllegalArgumentException("Invalid permission Id:" + id));

    model.addAttribute("permission", permission);
    return "update-permission";
  }

  @GetMapping("delete/{id}")
  public String deletePermission(@PathVariable("id") long id, Model model) {
    Permission permission = permissionRepository.findById(id)
        .orElseThrow(() -> new IllegalArgumentException("Invalid permission Id:" + id));
    permissionRepository.delete(permission);
    return "redirect:/index";
  }
}
