import React, { Component } from 'react';
import { render } from 'react-dom';
import { IndexRoute, Link, Router, Route, hashHistory } from 'react-router';

class App extends Component {
    render() {
        return (
            <div>
                <ul>
                    <li><Link to="/">index</Link></li>
                    <li><Link to="/a">page A</Link></li>
                    <li><Link to="/b">page B</Link></li>
                    <li><Link to="/123">page 123</Link></li>
                </ul>
                <div>
                    { this.props.children }
                </div>
            </div>
        );
    }
}

class Index extends Component {
    render() {
        return <div>Index</div>;
    }
}

class PageA extends Component {
    render() {
        return <div>A</div>;
    }
}

class PageB extends Component {
    render() {
        return <div>B</div>;
    }
}

class PageParam extends Component {
    render() {
        return <div>{ this.props.params.id }</div>;
    }
}

render((
    <Router history={hashHistory}>
        <Route path="/" component={App}>
            <IndexRoute component={Index} />
            <Route path="/a" component={PageA} />
            <Route path="/b" component={PageB} />
            <Route path="/:id" component={PageParam} />
        </Route>
    </Router>
), document.querySelector('#app'));

