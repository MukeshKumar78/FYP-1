package com.example.demo.Models;

import javax.persistence.*;

@Entity
public class Member {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @ManyToOne
    @JoinColumn(name = "society_id", nullable = false)
    private Society societyId;


    @Column
    private String code;

    @Column
    private String description;

    @ManyToOne
    @JoinColumn(name = "user_1_id")
    private User1 user1;

    @ManyToOne
    @JoinColumn(name = "society_id")
    private Society society;

    public Society getSociety() {
        return society;
    }

    public void setSociety(Society society) {
        this.society = society;
    }


    public User1 getUser1() {
        return user1;
    }

    public void setUser1(User1 user1) {
        this.user1 = user1;
    }
}
