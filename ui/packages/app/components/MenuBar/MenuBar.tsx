import React from 'react';
import Link from 'next/link';

const MenuBar: React.FC = () => {
  return (
    <div>
      <nav>
        <ul>
          <li>
            <Link href="/">TLC</Link>
          </li>
          <li>
            <Link href="/">DECS</Link>
          </li>
          <li>
            <Link href="/">TEMP</Link>
          </li>
          <li>
            <Link href="/">HEMP</Link>
          </li>
          <li>
            <Link href="/">TEMP2</Link>
          </li>
          <li>
            <Link href="/">TEMP3</Link>
          </li>
          <li>
            <Link href="/">TEMP4</Link>
          </li>
          <li>
            <Link href="/">TEMP5</Link>
          </li>
          <li>
            <Link href="/">TEMP6</Link>
          </li>
          <li>
            <Link href="/">TEMP7</Link>
          </li>
        </ul>
      </nav>
    </div>
  );
};

export default MenuBar;
