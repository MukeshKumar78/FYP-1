import React, { ReactNode } from 'react';

interface PostBarProps {
  children: ReactNode;
}

const PostBar: React.FC<PostBarProps> = (props: PostBarProps) => {
  return (
    <div
      style={{
        borderWidth: '1px',
        width: '100%',
        maxWidth: 480,
        display: 'inline-flex',
        marginLeft: '11%',
        marginTop: '40px',
      }}
    >
      {props.children}
    </div>
  );
};

export default PostBar;
