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
import org.springframework.web.bind.annotation.RequestMapping;

import com.campusme.securitysvc.permission.PermissionRepository;

@Controller
@RequestMapping("/role")
public class RoleViewController {

  @Autowired
  private RoleRepository roleRepository;

  @Autowired
  private PermissionRepository permissionRepository;

  @GetMapping("")
  public String display(Model model) {
    model.addAttribute("roles", roleRepository.findAll());
    return "roles";
  }

  @PostMapping("/add")
  public String add(@Validated Role role, BindingResult result, Model model) {
    if (result.hasErrors()) {
      return "add-role";
    }

    roleRepository.save(role);
    return "redirect:/role";
  }

  @GetMapping("/edit/{id}")
  public String updateForm(@PathVariable("id") long id, Model model) {
    Role role = roleRepository.findById(id)
        .orElseThrow(() -> new IllegalArgumentException("Invalid role Id:" + id));

    RoleCreateDTO roleForm = RoleCreateDTO.builder()
    .id(role.getId())
    .code(role.getCode())
    .description(role.getDescription())
    .name(role.getName())
    .precedence(role.getPrecedence())
    .permissionCodeList( new ArrayList<>()).build();

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
  public String update(@PathVariable("id") long id, RoleCreateDTO roleDTO, BindingResult result, Model model) {
    Role role = Role.builder()
      .id(id)
      .code(roleDTO.getCode())
      .description(roleDTO.getDescription())
      .name(roleDTO.getName())
      .permissions(
        roleDTO.getPermissionCodeList().stream()
            .filter(perm -> perm.selected)
            .map(perm -> permissionRepository.findByCode(perm.code))
            .collect(Collectors.toSet()))
      .precedence(roleDTO.getPrecedence())
      .build();

    roleRepository.save(role);

    return "redirect:/role";
  }

  @GetMapping("/delete/{id}")
  public String delete(@PathVariable("id") long id, Model model) {
    Role role = roleRepository.findById(id)
        .orElseThrow(() -> new IllegalArgumentException("Invalid role Id:" + id));
    roleRepository.delete(role);
    return "redirect:/role";
  }
}
