package com.example.demo.Models;

import jdk.javadoc.internal.doclets.toolkit.taglets.snippet.Style;
import sun.awt.image.ImageWatched;

import javax.persistence.*;
import java.sql.Time;
import java.util.Date;
import java.util.Set;

@Entity
public class Event {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @ManyToOne
    @JoinColumn(name = "society_id", nullable = false)
    private Society societyId;

    @Column
    private String name;

    @Column
    private Date startDate;

    @Column
    private Date endDate;

    @Column
    private Time startTime;

    @Column
    private Time endTime;

    @Column
    private boolean published;

    @Column
    private int likes;

    @OneToMany(mappedBy = "event")
    private Set<Comment> comments;

    @OneToMany(mappedBy = "event")
    private Set<EventUpdate> eventUpdate;

    @Column
    private String attachment;

    @Column
    private String text;

    @Column
    private String link;

    @Column
    private String code;

    @Column
    private String description;

    @ManyToOne
    @JoinColumn(name = "society_id")
    private Society society;

    public Society getSociety() {
        return society;
    }

    public void setSociety(Society society) {
        this.society = society;
    }
}
