![](https://img.shields.io/badge/Microverse-blueviolet)

## Movie Review app

> Welcome to my Movie Review web application. This project was built with `Ruby on Rails` and `PostgreSQL` in the back-end and `Sass` in the front-end. `Rspec` was used in the testing phase and `Heroku` was used for deployment.

# Home page
![Home page](./app/assets/images/home_page.png)

# Sign up page
![Sign up page](./app/assets/images/signup_page.png)

# Sign in page
![Sign in page](./app/assets/images/login_page.png)

# User profile page
![User profile page](./app/assets/images/user_profile_page.png)

# Edit profile page
![User profile page](./app/assets/images/edit_profile_page.png)

## Features

- The user logs in to the app, only by typing the username
- The user is presented with the homepage
- The Left-side menu includes only links to Home and profile
- In the Homepage:
  - *Opinions* tab are in the center(sorted by most recent) with a simple form for creating an opinion, to publish must use the "enter"
  - All the opinions are sorted by most recent that display the opinion text and author details
  - Right-side section shows who to follow, users not followed by the logged user(sorted by most recent)
- In the profile page
  - In the the center there's only Cover picture and *Opinions* tab
  - Right-side section shows:
      - User photo.
      - Button to follow a user.
      - Stats: total number of opinions, number of followers and number of following users.
      - List of people who follow this user

## Built With

- Ruby v2.7.2
- Ruby on Rails v6.1.3
- Rspec
- Linux
- Sass
- PostgreSQL

## Live Demo

[Demo](https://movie-review-rails-capstone.herokuapp.com)


## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

Ruby: 2.7.2
Rails: >=6.1.3
Postgres: >=9.5

### Setup

Instal gems with:

```
bundle install
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

### Run tests

```
    rpsec --format documentation
```

## Author

👤 **Alvaro Ruiz**

- Github: [@alvarorf](https://github.com/alvarorf)
- Twitter: [@aaruizf](https://twitter.com/aaruizf)
- Linkedin: [Álvaro Ruiz](https://www.linkedin.com/in/alvaro-andr%C3%A9s-ruiz-florez/)

