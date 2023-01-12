package com.campusme.society.config.persistence;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CodeGenerator {

  @Autowired
  private EntityManager em;

  public String generate(Object obj, String source, String target) {
    String code = source.replace(" ", "-").toLowerCase();

    List<String> codes = em.createQuery(
      String.format("SELECT code from %s WHERE code LIKE '%s%%'",
        obj.getClass().getSimpleName(), code))
    .getResultList();

    if(codes.isEmpty())
      return code;

    if(codes.size() == 1)
      return String.format("%s-%d",code, 1);

    long max = codes.stream()
      .map(c -> {
        if(c.contains(code + "-"))
          return c.replace(code + "-", "");
        return "0";
      })
      .mapToLong(Long::parseLong)
      .max().getAsLong();

    return String.format("%s-%d",code, max + 1);
  }

}
