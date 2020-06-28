# Recyclomedia

![Backend CI/CD Pipeline](https://github.com/Iconicto/recyclomedia/workflows/Backend%20CI/CD%20Pipeline/badge.svg?branch=master)

# Backend

Recyclomedia backend is made using django rest framework and backed by postgress database. You can find full API documentation made with postman below. Also Django Rest's API explorer view can be accesed from [recyclomedia.iconicto.com/api](https://recyclomedia.iconicto.com/api).

## System Architecture

![system-architecture](docs/imgs/system-architecture.png)

## Backend Features

- Protected routes
  - Post made by user X can't be modified/deleted by user Y
  - Sepreate web based dashboard for organizations manage events that are hosted by them
        - Event created by organization A can't be modified/deleted by organization B
- Role Based access control
- Static contains are delivered by custom CDN ([cdn.iconicto.com](https://cdn.iconicto.com/))
- End to End TLS
- Horizontal and Vertical scaling (thanks Kubernetes)

### Admin's View vs Org Admins View

#### Dashboard

![Dashboard](docs/imgs/screenshot_1.png)

#### Event Page

![Event Page](docs/imgs/screenshot_2.png)

## API documentation

[documenter.getpostman.com/view/6342371/T17AkB4T?version=latest](https://documenter.getpostman.com/view/6342371/T17AkB4T?version=latest)

## API Routes

### User

#### Get Users

```http
GET /api/users/ HTTP/1.1
Host: recyclomedia.iconicto.com
```

#### Get User Info

```http
GET /api/users/me/ HTTP/1.1
Host: recyclomedia.iconicto.com
```

#### Create User

```http
POST /api/users/ HTTP/1.1
Host: recyclomedia.iconicto.com
```

#### Update User

```http
PATCH /api/users/ HTTP/1.1
Host: recyclomedia.iconicto.com
```

### Posts

#### Get Posts

```http
GET /api/users/ HTTP/1.1
Host: recyclomedia.iconicto.com
```

#### Create Post

```http
POST /api/posts/ HTTP/1.1
Host: recyclomedia.iconicto.com
```

#### Update Post

```http
PATCH /api/posts/<POSTID>/ HTTP/1.1
Host: recyclomedia.iconicto.com
```

#### Delete Post

```http
DELETE /api/posts/<POSTID>/ HTTP/1.1
Host: recyclomedia.iconicto.com
```

### Events

#### Get Events

```http
GET /api/events/ HTTP/1.1
Host: recyclomedia.iconicto.com
```

### Organizations

#### Get Organizations

```http
GET /api/organizations/ HTTP/1.1
Host: recyclomedia.iconicto.com
```

### Badges

#### Get Badges

```http
GET /api/badges/ HTTP/1.1
Host: recyclomedia.iconicto.com
```
