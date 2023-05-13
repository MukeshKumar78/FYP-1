import React, { useState } from 'react';
import { RiGroupFill, RiSearchFill, RiChat1Fill, RiLogoutCircleFill, RiNotification2Fill } from 'react-icons/ri';
import { AiFillHome } from 'react-icons/ai';
import { FaUser } from 'react-icons/fa';
import Link from 'next/link';
import Image from 'next/image'
import './sidebar.css';
import { useRouter } from 'next/router';

interface MenuItem {
  icon: JSX.Element;
  label: string;
  link: string
}

const menuItems: MenuItem[] = [
  {
    icon: <AiFillHome style={{ fontSize: '20px', marginRight: '10px', marginTop: '2px' }} />,
    label: 'Home',
    link: '/'
  },
  {
    icon: <FaUser style={{ fontSize: '18px', marginRight: '12px', marginTop: '3px' }} />,
    label: 'Profile',
    link: '/profile'
  },
  {
    icon: <RiChat1Fill style={{ fontSize: '18px', marginRight: '12px', marginTop: '3px' }} />,
    label: 'Your Teams',
    link: '/team/chats'
  },
  {
    icon: <RiSearchFill style={{ fontSize: '20px', marginRight: '10px', marginTop: '3px' }} />,
    label: 'Search',
    link: '/event/search'
  },
  {
    icon: <RiGroupFill style={{ fontSize: '20px', marginRight: '10px', marginTop: '3px' }} />,
    label: 'Societies',
    link: '/society'
  },
  {
    icon: <RiLogoutCircleFill style={{ fontSize: '19px', marginRight: '11px', marginTop: '3px' }} />,
    label: 'Logout',
    link: '/logout'
  }
];

export function Menu() {
  const router = useRouter()

  return <div style={{ display: 'flex', flexDirection: 'column' }}>
    <Image src="/logo.png" width={70} height={70} alt="CampusMe" style={{ margin: 10 }} />
    {menuItems.map((menuItem, i) => (
      <Link
        key={i}
        className={`gpt3__sidebar-links_container_button ${router.route === menuItem.link ? 'active' : ''
          }`}
        href={menuItem.link}
      >
        <div style={{ display: 'flex', flexDirection: 'row' }}>
          {menuItem.icon}
          <div className="gpt3__sidebar-links_container_button-link-label">
            {menuItem.label}
          </div>
        </div>
      </Link>
    ))}
  </div>
};

function SideBar() {
  return (
    <div className="gpt3__sidebar">
      <div className="gpt3__sidebar-links">
        <div className="gpt3__sidebar-links_logo">{/* logo */}</div>
        <div className="gpt3__sidebar-links_container">
          <Menu />
        </div>
      </div>
    </div>
  );
};

export default SideBar;
