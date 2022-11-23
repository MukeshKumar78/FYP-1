package com.example.demo.model;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(uniqueConstraints={
        @UniqueConstraint(columnNames={"code"}),
        @UniqueConstraint(columnNames={"description"})
})
public class Post {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    // Multiple attachments for the Post (EventUpdate)
    @OneToMany(mappedBy = "post")
    private Set<PostAttachment> attachment;

    // Event Content as text;
    @Column(columnDefinition="TEXT")
    private String text;

    @Column(nullable = false)
    private String code;

    @Column(nullable = false)
    private String description;

    // EventUpdate is for a specific Event;
    @ManyToOne
    @JoinColumn(name = "event_id", nullable = false)
    private Event event;
}
