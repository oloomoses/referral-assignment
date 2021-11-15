# Refer React on Rails

React on Rails authentication system with material UI and devise gem. User can refer another user by email.

## Live Link
- To be deployed soon on heroku

## Built With

- Ruby v2.7.0
- Ruby on Rails v6.1.3
- React V6
- Material UI
- RSpec-Rails for testing

## Current API Endpoints

The API will expose the following RESTful endpoints.

| Endpoint                                     | Functionality                |
|----------------------------------------------|------------------------------|
| POST /api/v1/signup                          | Signup                       |
| POST /api/v1/login                           | Login                        |
| GET /api/v1/users/:id                        | user show plus refered users |
| POST /api/v1/users/:user_id/referals         | Refer a user                 |


## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

Ruby: 2.7.0
Rails: 6.1.3

### Setup

~~~bash
$ git clone https://github.com/oloomoses/referral-assignment.git
$ cd referral-assignment
~~~

Install gems with:

```
bundle install
```

Install node_modules with:

```
yarn install
or
rails webpacker:install
```

Setup database with:


```
   rails db:create
   rails db:migrate
```

### Usage

Start server with:

```
    rails server
```

Open `http://localhost:3000/` in your browser.

### Deploy to a live server

Deploying to a live server like Heroku is easy, make sure you have the necessary credentials setup on your local machine
Heroku uses Posgres as its default data base. So ensure that you install it and remove sqlite.

```bash
heroku create
heroku rename app-new-name
git push heroku $BRANCH_NAME:master 
```
if you are already in master branch no need to add $BRANCH_NAME, just use `git push heroku master`

```bash
heroku run rails db:migrate
heroku open
```

Enjoy your newly deployed rails API


### Run tests

```
    rpsec 
```

# Authors

👤 **Oloo Moses**
- Github: [@githubhandle](https://github.com/oloomoses)
- Twitter: [@twitterhandle](https://twitter.com/olooine)
- Linkedin: [linkedin](https://www.linkedin.com/in/oloomoses/)


## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgement
[DirectShifts](https://www.directshifts.com/)