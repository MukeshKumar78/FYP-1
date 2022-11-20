package com.example.demo.Models;

import javax.persistence.*;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Entity
public class User1 {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column
    private long universityId;

    @Column
    private String firstName;

    @Column
    private String lastName;

    @Column
    private String email;

    @OneToMany(mappedBy = "user1")
    private Set<Member> members;

    @Column
    private String code;

    @Column
    private String description;

}
