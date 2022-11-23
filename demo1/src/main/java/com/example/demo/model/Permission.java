package com.example.demo.model;

import javax.persistence.*;

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

    @Column(nullable = false)
    private String description;

    @ManyToOne
    @JoinColumn(name = "role_id", nullable = false)
    private Role role;
}
