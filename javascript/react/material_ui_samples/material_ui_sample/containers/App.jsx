import React, { Component } from 'react';
import { connect } from 'react-redux';
import Header from '../components/Header';
import MainSection from '../components/MainSection';

class App extends Component {
  render() {
    return (
      <div>
        <Header />
        <MainSection />
      </div>
    );
  }
}

export default App;
