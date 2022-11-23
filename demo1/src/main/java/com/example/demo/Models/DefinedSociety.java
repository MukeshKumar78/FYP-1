package com.example.demo.Models;

import javax.persistence.*;

@Entity
public class DefinedSociety {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column
    private String code;

    @Column
    private String description;

    @OneToOne(orphanRemoval = true)
    @JoinTable(name = "defined_society_society",
            joinColumns = @JoinColumn(name = "defined_society_id"),
            inverseJoinColumns = @JoinColumn(name = "society_id"))
    private Society society;

    public Society getSociety() {
        return society;
    }

    public void setSociety(Society society) {
        this.society = society;
    }
}
