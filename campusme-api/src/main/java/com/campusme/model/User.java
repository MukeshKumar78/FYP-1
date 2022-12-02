package com.campusme.model;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "app_user",
        uniqueConstraints={
        @UniqueConstraint(columnNames={"code"}),
        @UniqueConstraint(columnNames={"description"}),
        @UniqueConstraint(columnNames={"email"})
})
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column
    private String firstName;

    @Column
    private String lastName;

    @Column(nullable = false)
    private String email;

    @OneToMany(mappedBy = "user")
    private Set<Member> members;

    @Column(nullable = false)
    private String code;

    @Column
    private String description;

//    // Societies from which user doesn't want to receive notification from.
//    @OneToMany(mappedBy = "user")
//    private Set<Society> mutedSociety;

}
