package com.example.demo.Models;

import javax.persistence.*;
import java.util.Set;

@Entity
public class EventUpdate {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    // Multiple attachments for the Post (EventUpdate)
    @Column
    private Set<String> attachment;

    // Event Content as text;
    @Column
    private String text;


    @Column
    private String code;

    @Column
    private String description;


    // EventUpdate is for an specific Event;
    @ManyToOne
    @JoinColumn(name = "event_id")
    private Event event;

    public Event getEvent() {
        return event;
    }

    public void setEvent(Event event) {
        this.event = event;
    }
}
