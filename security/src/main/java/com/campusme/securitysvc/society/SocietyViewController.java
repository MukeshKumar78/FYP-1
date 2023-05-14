package com.campusme.securitysvc.society;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
class SocietyCreateForm {
  Long tenure;
  SocietyCreateDTO society;
}

@Data
@AllArgsConstructor
class SocietyEditForm {
  Society society;
  List<Member> members;
}

@Controller
public class SocietyViewController {

  @Autowired
  private SocietyService service;

  @GetMapping("/tenure")
  public String tenure(Model model) {
    List<Tenure> tenures = service.findAllTenures();

    model.addAttribute("tenures", tenures);
    return "tenure";
  }

  @GetMapping("/society")
  public String society(Model model) {
    List<Society> societies = service.findAllSocieties();

    model.addAttribute("societies", societies);
    return "society";
  }

  @GetMapping("/society/edit/{code}")
  public String edit(@PathVariable("code") String code, Model model) {
    Society society = service.findByCode(code)
        .orElseThrow(() -> new IllegalArgumentException("Invalid society code:" + code));

    List<Member> members = service.findSocietyMembers(code);

    model.addAttribute("form", new SocietyEditForm(society, members));
    return "update-society";
  }

  @PostMapping("/society/member/delete")
  public String deleteMember(MemberDTO dto, BindingResult result, Model model) {
    service.deleteMembership(dto);

    return "redirect:/society/edit/" + dto.getSociety();
  }

  @PostMapping("/society/member/add")
  public String addMember(MemberDTO dto, BindingResult result, Model model) {
    service.addMembership(dto);

    return "redirect:/society/edit/" + dto.getSociety();
  }

  @PostMapping(path = "/society/create", consumes = { MediaType.MULTIPART_FORM_DATA_VALUE })
  public String addSociety(@Validated @ModelAttribute SocietyCreateForm form, BindingResult result, Model model) {
    if (result.hasErrors()) {
      System.out.println(result.toString());
      model.addAttribute("form", form);
      return "add-society";
    }

    service.save(form.tenure, form.society);
    return "redirect:/society";
  }

  @GetMapping("society/add")
  public String showAddForm(@RequestParam Long tenure, Model model) {
    SocietyCreateForm societyForm = new SocietyCreateForm();
    societyForm.setTenure(tenure);

    model.addAttribute("form", societyForm);

    return "add-society";
  }

  // @PostMapping("/update/{id}")
  // public String updateUser(@PathVariable("id") long id, RoleCreateDTO roleDTO,
  // BindingResult result, Model model) {
  // Role role = new Role(
  // id,
  // roleDTO.getCode(),
  // roleDTO.getDescription(),
  // roleDTO.getName(),
  // roleDTO.getPermissionCodeList().stream()
  // .filter(perm -> perm.selected)
  // .map(perm -> permissionRepository.findByCode(perm.code))
  // .collect(Collectors.toSet()));

  // roleRepository.save(role);

  // return "redirect:/";
  // }

  // @GetMapping("/delete/{id}")
  // public String deleteRole(@PathVariable("id") long id, Model model) {
  // Role role = roleRepository.findById(id)
  // .orElseThrow(() -> new IllegalArgumentException("Invalid role Id:" + id));
  // roleRepository.delete(role);
  // return "redirect:/";
  // }
}
