import React from 'react';
import Button from '@mui/material/Button';
import TextField from '@mui/material/TextField';
import Grid from '@mui/material/Grid';
import Box from '@mui/material/Box';
import axios from 'axios';

const Refer = () => {

  const handleSubmit = (event) => {
    event.preventDefault();
    
    const data = new FormData(event.currentTarget);
    const userData = {
      email: data.get('email'),     
    };

    console.log(postReferal(userData))

  };

  const postReferal = async (userData) => {
    const userId = sessionStorage.getItem('id')
    const url = `/api/v1/users/${userId}/referals`
    const axiosConfig = {
      headers: {
        'Content-Type': 'application/json',
      },
    };
    try {
      const res = await axios.post(url, userData, axiosConfig.headers)
      console.log(res.data)
    } catch(e) {
      console.log(e.response)
    }
    
  };

  return (
    <div>
      <Box component="form" onSubmit={handleSubmit} noValidate lg={{ mt: 1 }}>
            <Box container xs={{
              display: 'flex',
              flexDirection: 'row',
              alignItems: 'center',
            }}>
              <Grid item xs={3}>
                Refer with email
              </Grid>

              <Grid item xs={5}> 
                <TextField
                  margin="normal"
                  required
                  fullWidth
                  id="email"
                  label="Email Address"
                  name="email"
                  autoComplete="email"
                  autoFocus
                />                

              </Grid>

              <Grid item xs={3}>
                <Button
                  type="submit"
                  fullWidth
                  variant="contained"
                  xs={{ mt: 3, mb: 2 }}
                >
                  Refer
                </Button>
              </Grid>
            </Box>
          </Box>
    </div>
  )
}

export default Refer
