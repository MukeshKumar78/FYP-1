package com.example.demo.model;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(uniqueConstraints={
        @UniqueConstraint(columnNames={"code"}),
        @UniqueConstraint(columnNames={"description"})
})
public class Permission {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(nullable = false)
    private String title;

    @Column(nullable = false)
    private String code;

    @Column
    private String description;

    @OneToMany(mappedBy = "permission")
    private Set<RolePermission> rolePermission;

    @OneToMany(mappedBy = "permission")
    private Set<TeamPermission> teamPermission;
}
