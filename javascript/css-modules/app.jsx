import React from 'react';
import ReactDOM from 'react-dom';
import styles from './app.css'

class App extends React.Component {
  render() {
    return <div className={styles.hogeHoge}>hello</div>;
  }
}

ReactDOM.render(<App/>, document.getElementById('content'));
