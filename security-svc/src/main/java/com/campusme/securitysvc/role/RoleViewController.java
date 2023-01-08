package com.campusme.securitysvc.role;

import java.util.ArrayList;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.campusme.securitysvc.permission.PermissionRepository;

@Controller
public class RoleViewController {

  @Autowired
  private RoleRepository roleRepository;

  @Autowired
  private PermissionRepository permissionRepository;

  @GetMapping("/")
  public String showRoleList(Model model) {
    model.addAttribute("roles", roleRepository.findAll());
    return "index";
  }

  @PostMapping("role/add")
  public String addRole(@Validated Role role, BindingResult result, Model model) {
    if (result.hasErrors()) {
      return "add-role";
    }

    roleRepository.save(role);
    return "redirect:/index";
  }

  @GetMapping("role/edit/{id}")
  public String showUpdateForm(@PathVariable("id") long id, Model model) {
    Role role = roleRepository.findById(id)
        .orElseThrow(() -> new IllegalArgumentException("Invalid role Id:" + id));

    RoleCreateDTO roleForm = new RoleCreateDTO(role.getId(), role.getCode(), role.getDescription(), role.getName(),
        new ArrayList<>());

    permissionRepository.findAll()
        .stream()
        .forEach(permission -> {
          Boolean selected = role.getPermissions().stream().anyMatch(p -> p.getCode().equals(permission.getCode()));
          roleForm.getPermissionCodeList().add(new PermissionWithSelection(selected, permission.getCode()));
        });

    model.addAttribute("form", roleForm);

    return "update-role";
  }

  @PostMapping("/update/{id}")
  public String updateUser(@PathVariable("id") long id, RoleCreateDTO roleDTO, BindingResult result, Model model) {
    Role role = new Role(
        id,
        roleDTO.getCode(),
        roleDTO.getDescription(),
        roleDTO.getName(),
        roleDTO.getPermissionCodeList().stream()
            .filter(perm -> perm.selected)
            .map(perm -> permissionRepository.findByCode(perm.code))
            .collect(Collectors.toSet()));

    roleRepository.save(role);

    return "redirect:/";
  }

  @GetMapping("/delete/{id}")
  public String deleteRole(@PathVariable("id") long id, Model model) {
    Role role = roleRepository.findById(id)
        .orElseThrow(() -> new IllegalArgumentException("Invalid role Id:" + id));
    roleRepository.delete(role);
    return "redirect:/";
  }
}
