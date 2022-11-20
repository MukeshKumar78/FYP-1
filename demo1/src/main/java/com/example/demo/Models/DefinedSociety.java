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


}
