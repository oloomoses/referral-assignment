import React from 'react';
import PropTypes from 'prop-types';

const User = ({userData}) => {
  

  return (
    <div>
     <strong>My email: {userData.email}</strong>
     <hr/>
     <strong>Users I have refered</strong>
    </div>
  )
}

User.propType = {
  userData: PropTypes.objectOf().isRequired,
}

export default User
