import React, { useState } from 'react';
import { RiMenu3Line, RiCloseLine, RiSettingsFill, RiNotification2Fill } from 'react-icons/ri';
import { AiFillHome } from 'react-icons/ai';
import { FaUser } from 'react-icons/fa';
import Link from 'next/link';
import './sidebar.css';

interface MenuItem {
  id: number;
  icon: JSX.Element;
  label: string;
  link: string
}

const SideBar: React.FC = () => {
  const [toggleMenu, setToggleMenu] = useState(false);
  const [activeButton, setActiveButton] = useState(1);

  function handleButtonClick(buttonId: number) {
    console.log(buttonId);
    setActiveButton(buttonId);
  }

  const Menu: React.FC = () => (
    <div style={{ display: 'flex', flexDirection: 'column' }}>
      {menuItems.map((menuItem) => (
        <button
          key={menuItem.id}
          className={`gpt3__sidebar-links_container_button ${activeButton === menuItem.id ? 'active' : ''
            }`}
          onClick={() => handleButtonClick(menuItem.id)}
        >
          <Link className="gpt3__sidebar-links_container_button-link" href={menuItem.link}>
            <div style={{ display: 'flex', flexDirection: 'row' }}>
              {menuItem.icon}
              <div className="gpt3__sidebar-links_container_button-link-label">
                {menuItem.label}
              </div>
            </div>
          </Link>
        </button>
      ))}
    </div>
  );

  const menuItems: MenuItem[] = [
    {
      id: 1,
      icon: <AiFillHome style={{ fontSize: '20px', marginRight: '10px', marginTop: '2px' }} />,
      label: 'Home',
      link: '/'
    },
    {
      id: 2,
      icon: <FaUser style={{ fontSize: '18px', marginRight: '12px', marginTop: '3px' }} />,
      label: 'Profile',
      link: '/profile'
    },
    {
      id: 3,
      icon: <RiSettingsFill style={{ fontSize: '20px', marginRight: '10px', marginTop: '3px' }} />,
      label: 'Settings',
      link: '/404'
    },
    {
      id: 4,
      icon: <RiNotification2Fill style={{ fontSize: '19px', marginRight: '11px', marginTop: '3px' }} />,
      label: 'Notifications',
      link: '/404'
    },
  ];

  return (
    <div className="gpt3__sidebar">
      <div className="gpt3__sidebar-links">
        <div className="gpt3__sidebar-links_logo">{/* logo */}</div>
        <div className="gpt3__sidebar-links_container">
          <Menu />
        </div>
      </div>
      <div className="gpt3__sidebar-menu">
        {toggleMenu ? (
          <RiCloseLine color="#fff" size={27} onClick={() => setToggleMenu(false)} />
        ) : (
          <RiMenu3Line color="#fff" size={27} onClick={() => setToggleMenu(true)} />
        )}
        {toggleMenu && (
          <div className="gpt3__sidebar-menu_container scale-up-center">
            <div className="gpt3__sidebar-menu_container-links">
              <Menu />
            </div>
          </div>
        )}
      </div>
    </div>
  );
};

export default SideBar;
