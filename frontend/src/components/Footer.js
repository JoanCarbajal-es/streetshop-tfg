import React from 'react';
import logoIcon from '../assets/logo-icon.png';
import '../styles/Footer.css';

function Footer() {
    return (
        <footer className="footer">
            <img src={logoIcon} alt="StreetShop" className="footer__logo" />
            <p>© {new Date().getFullYear()} StreetShop — All rights reserved</p>
        </footer>
    );
}

export default Footer;