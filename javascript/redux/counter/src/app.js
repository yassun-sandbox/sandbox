import expect from 'expect'
import { createStore } from 'redux'
import React from 'react'
import ReactDOM from 'react-dom'

const counter = (state = 0, action) => {
  switch(action.type) {
    case 'INCREMENT':
      return state + 1
    case 'DECREMENT':
      return state - 1
    default:
      return state
  }
}

const Counter = ({value}) => (
  <h1>{value}</h1>
)

const store = createStore(counter)

const render = () => {
  ReactDOM.render(
    <Counter value={store.getState()} />,
    document.getElementById('root')
  )
}

store.subscribe(render)

render()

document.addEventListener('click', () => {
  store.dispatch({ type: 'INCREMENT' })
})

