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
console.log(store.getState())

//dispatch
store.dispatch({type: 'INCREMENT'})
console.log(store.getState())

//expect(
//  counter(0, {type: 'INCREMENT'})
//).toEqual(1)
//
//expect(
//  counter(1, {type: 'INCREMENT'})
//).toEqual(2)
//
//expect(
//  counter(2, {type: 'DECREMENT'})
//).toEqual(1)
//
//expect(
//  counter(1, {type: 'UNKNOWN'})
//).toEqual(1)
//
//expect(
//  counter(undefined, {})
//).toEqual(0)
//
//console.log('test passed!')
