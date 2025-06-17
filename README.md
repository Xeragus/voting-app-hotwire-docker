# 🗳️ Voting App - Hotwire, Docker

A containerized, real-time polling app built with **Ruby on Rails 8**, **Hotwire**, **Bootstrap**, and **PostgreSQL**.



### 🚀 Getting Started

These instructions will get your development environment set up and running in Docker.

Before we begin, clone the repo and enter the root folder. There, create the .env file with the following env vars, and add your values - or just copy the ones provided below:
```
DATABASE_USERNAME=voting_b2b_admin
DATABASE_PASSWORD=b2b123123
DATABASE_HOST=localhost
```


### 📦 1. Build and Start Containers

Note: Ensure Docker is installed and running before proceeding.

```bash
docker compose up --build
```
This command will:

- Build the web container (your Rails app)

- Start the db container (PostgreSQL)

- Mount your local files for live code reload



### 🛠 2. Set Up the Database

Once the containers are up, open a new terminal tab and run:

```
docker compose exec web rails db:create db:migrate db:seed
docker compose exec web bundle exec rake assets:precompile
```
This will create and seed the database, and compile the assets.

### 🌐 3. Access the App

Open your browser and go to:

```
http://localhost:3000
```

### 4. Running the Tests

To run the tests:
```
rspec
```
