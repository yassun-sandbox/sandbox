import React, { Component } from 'react';
import { render } from 'react-dom';
import { Router, Route, hashHistory } from 'react-router';

class App extends Component {
    render() {
        return (
            <div>
                Hello, react-router!
            </div>
        );
    }
}

render((
    <Router history={hashHistory}>
        <Route path="/" component={App} />
    </Router>
), document.querySelector('#app'));
