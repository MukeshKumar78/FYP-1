package com.example.demo.model;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(uniqueConstraints={
        @UniqueConstraint(columnNames={"code"}),
        @UniqueConstraint(columnNames={"description"})
})
public class DefinedSociety {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(nullable = false)
    private String code;

    @Column(nullable = false)
    private String description;

    @OneToMany(mappedBy = "definedSociety")
    private List<Society> society;
}
