package com.example.demo.Models;

import javax.persistence.*;
import java.util.Set;
@Entity
public class Society {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @OneToOne(mappedBy = "society")
    private DefinedSociety definedSocietyId;

    @OneToMany(mappedBy = "society")
    private Set<Member> members;

    @OneToMany(mappedBy = "society")
    private Set<Event> events;

    @Column
    private Tenure tenureId;

    @Column
    private String code;

    @Column
    private String description;

    @ManyToOne
    @JoinColumn(name = "user_1_id")
    private User1 user1;

    public User1 getUser1() {
        return user1;
    }

    public void setUser1(User1 user1) {
        this.user1 = user1;
    }
}
