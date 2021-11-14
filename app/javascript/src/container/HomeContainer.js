import React from 'react'
import Navbar from '../components/Navbar'
import axios from 'axios'

const HomeContainer = () => {
  const logoutUser = async () => {
    axios.defaults.headers.common.Authorization = sessionStorage.getItem('token');
    try {
      const response = await axios.delete('/api/v1/logout');
      // sessionStorage.removeItem('token');      
      sessionStorage.clear();
      window.location.href = '/login';
    } catch (error) {
      console.log(error)
    }
  }

  return (
    <div>
      <Navbar logoutUser={logoutUser} />
      <h2>This is the home components</h2>
    </div>
  )
}

export default HomeContainer
