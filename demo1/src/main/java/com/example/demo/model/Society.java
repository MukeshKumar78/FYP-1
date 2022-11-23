package com.example.demo.model;

import javax.persistence.*;
import java.util.Set;
@Entity
@Table(uniqueConstraints={
        @UniqueConstraint(columnNames={"code"}),
        @UniqueConstraint(columnNames={"description"})
})
public class Society {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @ManyToOne
    @JoinColumn(name = "defined_society_id", nullable = false)
    private DefinedSociety definedSociety;

    @OneToMany(mappedBy = "society")
    private Set<Member> members;

    @OneToMany(mappedBy = "society")
    private Set<Event> events;

    @OneToMany(mappedBy = "society")
    private Set<Role> roles;

    @OneToOne
    @JoinColumn(name ="tenure_id", referencedColumnName = "id", nullable = false)
    private Tenure tenure;

    @Column(nullable = false)
    private String code;

    @Column(nullable = false)
    private String description;
}
