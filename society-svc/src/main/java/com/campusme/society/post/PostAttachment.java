package com.campusme.society.post;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Builder
@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
public class PostAttachment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column
    private String uri;

    @ManyToOne
    @JoinColumn(name = "post_id", nullable = false)
    private Post post;


}
