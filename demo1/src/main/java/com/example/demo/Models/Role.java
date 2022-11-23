package com.example.demo.Models;

import javax.persistence.*;
import java.util.Set;

public class Role {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column
    @OneToMany(mappedBy = "role")
    private Set<Permission> Permission;

    @Column
    private String code;

    @Column
    private String description;
}
