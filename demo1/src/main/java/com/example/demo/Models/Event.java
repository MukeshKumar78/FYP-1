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

    // name of the event, or the title.
    @Column
    private String title;

    // start-date and end-date for the event
    @Column
    private Date startDate;

    @Column
    private Date endDate;

    // start-time and end-time for the event.
    @Column
    private Time startTime;

    @Column
    private Time endTime;

    // To distinguish between publish and unpublished event.
    @Column
    private boolean published;

    // get average rating.
    @Column
    private int sumOfRatings;

    @Column
    private int totalRatings;

    // Multiple comments for the event
    @OneToMany(mappedBy = "event")
    private Set<Comment> comments;

    // Multiple Posts for the event
    @OneToMany(mappedBy = "event")
    private Set<EventUpdate> eventUpdate;

    // Multiple file attachments for the event.
    @Column
    private Set<String> attachment;

    // Event content as text.
    @Column
    private String text;

    // Link for event registration
    @Column
    private String regLink;

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
