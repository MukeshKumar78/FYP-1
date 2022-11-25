package com.example.demo.model;

import javax.persistence.*;

@Entity
@Table(uniqueConstraints={
        @UniqueConstraint(columnNames={"code"}),
        @UniqueConstraint(columnNames={"description"})
})
public class EventAttachment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(nullable = false)
    private String code;

    @Column
    private String description;

    @Column(columnDefinition="TEXT")
    private String link;

    @ManyToOne
    @JoinColumn(name="event_id", nullable = false)
    public Event event;
}
