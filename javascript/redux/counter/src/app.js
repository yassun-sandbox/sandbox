import expect from 'expect'
import { createStore } from 'redux'

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

// store
const store = createStore(counter)
// subscribe
store.subscribe(() => {
  document.body.innerText = store.getState()
})
document.addEventListener('click', () => {
  store.dispatch({ type: 'INCREMENT' })
})

