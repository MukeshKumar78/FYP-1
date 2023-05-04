import { useAuth } from 'app/features/auth/hooks';
import { useHeader } from 'app/hooks/headers/index.web';
import { ReactNode, useState } from 'react';
import { RiMenu3Line, RiCloseLine } from 'react-icons/ri';
import { Menu } from '../SideBar/SideBar'
import Image from 'next/image'
import './postbar.css';
import { AnimatedLink } from '..';
import { Avatar } from '../Avatar';

type PostBarProps = {
  children?: ReactNode;
}

function NavBar() {
  const [sidebarOpen, setSidebarOpen] = useState(false);
  const { header: Header } = useHeader();
  const { user } = useAuth();

  return (
    <div style={{ display: 'flex', marginBottom: 5, alignItems: 'center', flexDirection: 'row', justifyContent: 'space-between' }}>
      <div className='sidebar-toggle'>
        <AnimatedLink onPress={() => setSidebarOpen(true)}>
          <RiMenu3Line size={27} />
        </AnimatedLink>
      </div>
      <div onClick={() => setSidebarOpen(false)} className='content' style={{ width: +sidebarOpen * 100 + '%', maxWidth: '720px' }}>
        <AnimatedLink onPress={() => setSidebarOpen(false)}>
          <RiMenu3Line style={{ margin: 5 }} size={27} />
        </AnimatedLink>
        <Menu />
      </div>
      {Header}
      <Avatar user={user} />
    </div>
  )
}

function PostBar(props: PostBarProps) {

  return (
    <div style={{ flex: 1, maxWidth: '720px' }}>
      <NavBar />
      {props.children}
    </div>
  );
};

export default PostBar;
