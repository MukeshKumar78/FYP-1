package com.example.demo.Models;

import javax.persistence.*;
import java.util.Set;
@Entity
public class Society {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column
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

}
