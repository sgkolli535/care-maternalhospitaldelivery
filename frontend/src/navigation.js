import React, { Component, Fragment } from 'react';
import logo from './logo.png';
import profile from './profile.png';
import './App.css';
import { Navbar, NavItem, NavDropdown, MenuItem, Nav, Form, FormControl, Button } from 'react-bootstrap';
import ReactDOM from 'react-dom';
import { BrowserRouter as Router, Switch, Route, Link } from 'react-router-dom';

function Navigation() {
	return (
		<Navbar className = "color-nav" expand="lg">
  <Navbar.Brand><img src = { logo } alt="carelogo" className="carelogo"></img></Navbar.Brand>
  <Navbar.Collapse id="basic-navbar-nav">
    <Nav className="links">
      <Nav.Link style={{color: "#B97740"}} className="link">Home</Nav.Link>
      <Nav.Link style={{color: "#B97740"}} className="link">Directory</Nav.Link>
      <Nav.Link style={{color: "#B97740"}} className="link">Messages</Nav.Link>
    </Nav>
    <Navbar.Brand id="profile">Welcome, User<img src = { profile } alt="profile"></img></Navbar.Brand>
  </Navbar.Collapse>
</Navbar>
		);
}

export default Navigation;