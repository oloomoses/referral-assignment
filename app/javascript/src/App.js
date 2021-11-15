import React from 'react';
import { Routes, Route, Navigate } from 'react-router-dom';
import HomeContainer from './container/HomeContainer';
import LoginContainer from './container/LoginContainer';
import RegisterContainer from './container/RegisterContainer';
import NotFound from './components/NotFound';

function App() {
  const token = sessionStorage.getItem('token')
  return (
    <Routes>
      <Route 
        path='/' 
        element={
          token ? <HomeContainer /> : <Navigate to='/login' />
        } 
      />
      <Route path='/login' element={<LoginContainer />}/>
      <Route path='/register' element={<RegisterContainer />}/>
      <Route path='*' element={<NotFound />} />
    </Routes>
  )
}

export default App
