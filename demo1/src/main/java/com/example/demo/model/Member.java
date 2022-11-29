package com.example.demo.model;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(uniqueConstraints={
        @UniqueConstraint(columnNames={"code"}),
        @UniqueConstraint(columnNames={"description"})
})
public class Member {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(nullable = false)
    private String code;

    @Column
    private String description;

    @OneToMany(mappedBy = "member")
    private Set<TeamMember> teamMember;

    @OneToMany(mappedBy = "member")
    private Set<Event> events;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @ManyToOne
    @JoinColumn(name = "society_id", nullable = false)
    private Society society;
}
