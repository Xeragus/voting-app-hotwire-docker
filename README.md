# 🗳️ Voting App - B2B Media Group Interview

A containerized, real-time polling app built with **Ruby on Rails 8**, **Hotwire**, **Bootstrap**, and **PostgreSQL**.



### 🚀 Getting Started

These instructions will get your development environment set up and running in Docker.


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
```
This will create and seed the database.

### 🌐 3. Access the App

Open your browser and go to:

```
http://localhost:3000
```