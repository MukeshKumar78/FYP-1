package com.campusme.society.post.mapping;

import com.campusme.society.post.Post;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

import java.util.List;
@Mapper(componentModel = "spring")
public interface PostMapper {
    List<PostResponseDTO> entityListToDTO(Iterable<Post> posts);

    PostResponseDTO entityToDTO(Post value);

    List<Post> dtoToEntity(Iterable<PostCreateRequestDTO> posts);

    // attachments handled on controller layer
    @Mapping(target="attachments", ignore=true)
    Post dtoToEntity(PostCreateRequestDTO post);
}
