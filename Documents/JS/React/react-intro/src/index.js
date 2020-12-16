import React from 'react'
import ReactDOM from 'react-dom'
import App from './App'



//what we want to render, then where we want it to render
ReactDOM.render (
  <>
    <App/>
    {/* <h1 className='title'>Hi there!</h1>
    <Greeting />
    <p>some text</p> */}
  </>,
  document.getElementById('root')
)