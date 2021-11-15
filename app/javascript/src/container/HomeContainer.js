import React, { useState, useEffect } from 'react'
import Container from '@mui/material/Container';
import CssBaseline from '@mui/material/CssBaseline';
import Box from '@mui/material/Box';
import { createTheme, ThemeProvider } from '@mui/material/styles';
import Navbar from '../components/Navbar'
import axios from 'axios'
import User from './User'
import Refer from './Refer';

const theme = createTheme();

const HomeContainer = () => {
  const [referalData, setreferalData] = useState({})
  useEffect(() => {
    const getUser = async () => {
      const userId = sessionStorage.getItem('id')
      const url = `/api/v1/users/${userId}`
      const axiosConfig = {
        headers: {
          'Content-Type': 'application/json',
        },
      };
      try {
        const res = await axios.get(url, axiosConfig.headers)
        setreferalData(res.data)
      } catch(e) {
        e
      }
    }

    getUser()
  }, [])

  const logoutUser = async () => {
    axios.defaults.headers.common.Authorization = sessionStorage.getItem('token');
    try {
      const response = await axios.delete('/api/v1/logout');    
      sessionStorage.clear();
      window.location.href = '/login';
    } catch (error) {
      error
    }
  }  

  

  return (
    <div>
      <Navbar logoutUser={logoutUser} /><br/><br/>
      
      <ThemeProvider theme={theme}>
        <Container component="main" maxWidth="xl">
          <Refer />
          <CssBaseline /><br/>
          <Box
            lg={{
              marginTop: 20,
              display: 'flex',
              flexDirection: 'column',
              alignItems: 'center',
            }}
          >

            <User referalData={referalData} />
            
          </Box>
        </Container>
      </ThemeProvider>
    </div>
  )
}

export default HomeContainer
