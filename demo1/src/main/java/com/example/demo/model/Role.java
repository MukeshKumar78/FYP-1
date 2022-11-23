package com.example.demo.model;

import org.hibernate.annotations.ColumnDefault;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(uniqueConstraints={
        @UniqueConstraint(columnNames={"code"}),
        @UniqueConstraint(columnNames={"description"})
})
public class Role {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(nullable = false)
    private String code;

    @Column(nullable = false)
    private String description;

    @Column
    private String title;

    @OneToMany(mappedBy = "role")
    private Set<Permission> permission;

    @ManyToOne
    @JoinColumn(name = "society_id", nullable = false)
    private Society society;

    @OneToOne(mappedBy = "role")
    private TeamMember teamMember;
}
