package com.campusme.model;

import com.campusme.society.Society;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(uniqueConstraints={
        @UniqueConstraint(columnNames={"code"}),
        @UniqueConstraint(columnNames={"description"})
})
public class Team {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(nullable = false)
    private String code;

    @Column
    private String description;

    @Column(nullable = false)
    private String title;

    @OneToMany(mappedBy = "team")
    private Set<TeamMember> members;

    @OneToMany(mappedBy = "team")
    private Set<TeamMessage> messages;

    @OneToMany(mappedBy = "team")
    private Set<TeamPermission> permissions;

    @ManyToOne
    @JoinColumn(name = "society_id", nullable = false)
    private Society society;
}
