import React from 'react';
import PropTypes from 'prop-types';

const User = ({referalData}) => {
  
  

  return (
    <div>
     <strong>Users I have refered</strong><br/>
     <hr/>
      <ol>
          {referalData.referals?.map((user, i) =>{

            return (<li key={i}>{ user.email }</li>)

          })}
      </ol>
    </div>
  )
}

User.propType = {
  referalData: PropTypes.objectOf().isRequired,
}

export default User
