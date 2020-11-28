# GiveDirectly Coding Challenge
- Challenge version 1.4

## Ruby version
2.7.0

## System dependencies
- Rails 6.0.3.4
- Sqlite3 v1.4.2

## Configuration
- Clone the repository
- No need of local variables
- Execute in the terminal:

```
$ bundle install
```

## Database creation
- Execute on the terminal:
```
$ rake db:create
```

## Database initialization
- Run the migrations on the terminal:
```
$ rake db:migrate
```
- Run the seeder on the terminal:
```
$ rake db:seed
```

## Deployment instructions
- Execute on the terminal:
```
$ rails s
```

## Accessible routes:
- POST /api/v1/request
- GET /api/v1/request  
- GET /api/v1/request/:id
- DELETE /api/v1/request/:id