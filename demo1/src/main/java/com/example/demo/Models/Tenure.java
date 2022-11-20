package com.example.demo.Models;

import javax.persistence.*;


enum durationType {
    annually,
    semester,
}

@Entity
public class Tenure {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column
    private String code;

    @Column
    private durationType duration;

    // description is tenure date
    @Column
    private String description;
}

