import React from 'react'
import { Routes, Route } from 'react-router-dom'
import HomeContainer from './container/HomeContainer'
import LoginContainer from './container/LoginContainer'
import RegisterContainer from './container/RegisterContainer'

function App() {
  return (
    <Routes>
      <Route path='/' element={<HomeContainer />}/>
      <Route path='/login' element={<LoginContainer />}/>
      <Route path='/register' element={<RegisterContainer />}/>
    </Routes>
  )
}

export default App
