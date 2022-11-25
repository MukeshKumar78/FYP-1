package com.example.demo.model;

import javax.persistence.*;
import java.util.Set;


enum durationType {
    annual,
    semester
}

@Entity
@Table(uniqueConstraints={
        @UniqueConstraint(columnNames={"code"}),
        @UniqueConstraint(columnNames={"description"})
})
public class Tenure {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(nullable = false)
    private String code;

    // description is tenure date
    @Column
    private String description;

    @Column(length = 64)
    @Enumerated(EnumType.STRING)
    private durationType duration;

    @OneToMany(mappedBy = "tenure")
    private Set<Society> societies;
}

