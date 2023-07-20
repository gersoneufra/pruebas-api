# Purchase Api

> This project was built using Ruby on Rails and Postgres.

## 💡 Approach 

### Models
- Created the Entity-Relationship Diagram (ERD) according to the initial - requirements, with two entities: "User" and "Order" to perform a purchase.
- For the "Orders" entity, predefined values are used for the payment status and order status.
- In the "Orders" entity, the payment date can be entered if the payment status is set to "paid".
- In the "Orders" entity, the delivery date can be entered if the order status is set to "delivered".

### Controllers
- User: Get a list of users, get a user by ID, add a new user, update the user's name, update the user's email, delete a user.
- Orders: Get a list of orders, get an order by ID, get all orders delivered on a specific date (day), add a new order, modify the payment status of an order, modify the dispatch status of an order, delete an order.


## Built With

- **Languages & Technologies:**
  - Ruby on Rails
  - Postgres

## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

- [Ruby](https://www.ruby-lang.org/en/downloads/)
- [Rails](https://rubyonrails.org/)
- [Postgres](https://www.postgresql.org/)

### Setup

Download the code from this repository, by following these two steps:
  - Click on the ``Code`` button, above the files list.
  - Click on the ``Donwload ZIP`` button to download the code.

### Install

#### 1- Install the project dependencies

1.1- Install the [Ruby Bundler](https://bundler.io/) using this command on the root project's directory:
```console
$ gem install bundler
```

1.2- Then, install all the project dependencies using this command:

```console
$ bundle install
```

#### 2- Set up the project's database

2.1- In your project go to file : ` config/database.yml ` 

2.2- On development and test section replace the username and the password of your own postgres credentials

```
  username: your_postgres_username
  password: your_postgres_password
```

#### 3- Build the project's database schema

3.1- Run the database migrations to build the project's database with the correct tables:

```console
$ rails db:create db:migrate
```

### Usage

To use this application, run this command on the root project's directory: 

```console
$ rails s
```

## Author

👤 **Dino Quispe**

- GitHub: [@dqarias](https://github.com/dqarias)
- Twitter: [@DinoRonald7](https://twitter.com/DinoRonald7?t=Zanx9DXMEG9C_PNF3woZFg&s=08)
- LinkedIn: [Dino Quispe](https://www.linkedin.com/in/dino-ronald-quispe-arias/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

## Show your support

Give a ⭐️ if you like this project!

## 📝 License

This project is [MIT](./MIT.md) licensed.

