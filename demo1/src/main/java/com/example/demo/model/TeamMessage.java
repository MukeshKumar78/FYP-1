package com.example.demo.model;

import javax.persistence.*;
import java.util.Set;
import java.util.Date;

@Entity
@Table(uniqueConstraints={
        @UniqueConstraint(columnNames={"code"}),
        @UniqueConstraint(columnNames={"description"})
})
public class TeamMessage {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(nullable = false)
    private String code;

    @Column
    private String description;

    @Column
    private Date sentAt;

    @Column(columnDefinition="TEXT")
    private String text;

    @ManyToOne
    @JoinColumn(name = "sender_id", nullable = false)
    private TeamMember sender;

    @ManyToOne
    @JoinColumn(name = "team_id", nullable = false)
    private Team team;
}
