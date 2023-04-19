import React, { ReactNode } from 'react';

type PostBarProps = {
  children?: ReactNode;
}

const PostBar: React.FC<PostBarProps> = (props: PostBarProps) => {
  return (
    <div
      style={{
        overflowY: 'scroll',
        borderWidth: '1px',
        width: '100%',
        maxWidth: 480,
        height: '100vh',
        display: 'inline-flex',
        marginTop: '40px',
      }}
    >
      {props.children}
    </div>
  );
};

export default PostBar;
