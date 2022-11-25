package com.example.demo.model;

import javax.persistence.*;
import java.sql.Time;
import java.util.Date;
import java.util.Set;

@Entity
@Table(uniqueConstraints={
        @UniqueConstraint(columnNames={"code"}),
        @UniqueConstraint(columnNames={"description"})
})
public class Event {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(nullable = false)
    private String code;

    @Column
    private String description;

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
    private long sumOfRatings;

    @Column
    private long totalRatings;

    // Multiple comments for the event
    @OneToMany(mappedBy = "event")
    private Set<Comment> comments;

    // Multiple Posts for the event
    @OneToMany(mappedBy = "event")
    private Set<Post> post;

    // Multiple file attachments for the event.
    @OneToMany(mappedBy = "event")
    private Set<EventAttachment> attachment;

    // Event content as text.
    @Column(columnDefinition="TEXT")
    private String text;

    // Link for event registration
    @Column(columnDefinition="TEXT")
    private String regLink;

    @ManyToOne
    @JoinColumn(name = "society_id", nullable = false)
    private Society society;
}
