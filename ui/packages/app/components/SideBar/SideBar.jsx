import React, { useState } from 'react'
import { RiMenu3Line, RiCloseLine, RiSettingsFill,RiNotification2Fill } from 'react-icons/ri'
import { AiFillHome } from 'react-icons/ai'
import {FaUser} from 'react-icons/fa'
import {IoNotifications} from 'react-icons/io'


import Link from 'next/link'
import styles from './sidebar.css'

const SideBar = () => {
  const [toggleMenu, setToggleMenu] = useState(false)
  const [activeButton, setActiveButton] = useState(1)

  function handleButtonClick(buttonId) {
    console.log(buttonId)
    setActiveButton(buttonId)
  }

  const Menu = () => (
    <div style={{ display: 'flex', flexDirection: 'column' }}>
      <button
        className={`gpt3__sidebar-links_container_button ${
          activeButton === 1 ? 'active' : ''
        }`}
        onClick={() => handleButtonClick(1)}
      >
        <Link className="gpt3__sidebar-links_container_button-link" href="/">
          <div style={{ display: 'flex', flexDirection: 'row' }}>
            <AiFillHome style={{fontSize:"20px", marginRight: "10px", marginTop: "2px"}}
              className={`gpt3__sidebar-links_container_button-link-icon ${
                activeButton === 1 ? 'active' : ''
              }`}
            ></AiFillHome >
            <div className="gpt3__sidebar-links_container_button-link-label">
              Home{' '}
            </div>
          </div>
        </Link>
      </button>
      <button
        className={`gpt3__sidebar-links_container_button ${
          activeButton === 2 ? 'active' : ''
        }`}
        onClick={() => handleButtonClick(2)}
      >
        <Link className="gpt3__sidebar-links_container_button-link" href="/">
          <div style={{ display: 'flex', flexDirection: 'row' }}>
            <FaUser style={{fontSize:"18px", marginRight: "12px", marginTop: "3px"}}
              className={`gpt3__sidebar-links_container_button-link-icon ${
                activeButton === 2 ? 'active' : ''
              }`}
            ></FaUser>
            <div className="gpt3__sidebar-links_container_button-link-label">
              Profile{' '}
            </div>
          </div>
        </Link>
      </button>
      <button
        className={`gpt3__sidebar-links_container_button ${
          activeButton === 3 ? 'active' : ''
        }`}
        onClick={() => handleButtonClick(3)}
      >
        <Link className="gpt3__sidebar-links_container_button-link" href="/">
          <div style={{ display: 'flex', flexDirection: 'row' }}>
            <RiSettingsFill style={{fontSize:"20px", marginRight: "10px", marginTop: "3px"}}
              className={`gpt3__sidebar-links_container_button-link-icon ${
                activeButton === 2 ? 'active' : ''
              }`}
            ></RiSettingsFill>
            <div className="gpt3__sidebar-links_container_button-link-label">
              Settings{' '}
            </div>
          </div>
        </Link>
      </button>
      <button
        className={`gpt3__sidebar-links_container_button ${
          activeButton === 4 ? 'active' : ''
        }`}
        onClick={() => handleButtonClick(4)}
      >
        <Link className="gpt3__sidebar-links_container_button-link" href="/">
          <div style={{ display: 'flex', flexDirection: 'row' }}>
            <RiNotification2Fill style={{fontSize:"19px", marginRight: "11px", marginTop: "3px"}}
              className={`gpt3__sidebar-links_container_button-link-icon ${
                activeButton === 2 ? 'active' : ''
              }`}
            ></RiNotification2Fill>
            <div className="gpt3__sidebar-links_container_button-link-label">
              Notifications{' '}
            </div>
          </div>
        </Link>
      </button>
    </div>
  )

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
          <RiCloseLine
            color="#fff"
            size={27}
            onClick={() => setToggleMenu(false)}
          />
        ) : (
          <RiMenu3Line
            color="#fff"
            size={27}
            onClick={() => setToggleMenu(true)}
          />
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
  )
}

export default SideBar
