# Bloggy

Project created in flutter using `Provider`, with authentication by `firebase`. Also using REST API to get data from `bloggy-api.herokuapp.com`, API documentation is available on <https://documenter.getpostman.com/view/8110984/SVSHqohE>.

## Content table

- [Build and run project](#how-to-build-project)
- [Features](#features)
- [Folder structure](#folder-structure)

## How to build project

**Step 1:**

Download or clone this repo by using the link below:

```text
https://github.com/PepperoniOnzo/bloggy
```

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies:

```bash
flutter pub get 
```

**Step 3:**

Open emulator in which will build application. Run the following command in console to build the app:

```bash
flutter run lib\main.dart 
```

## Features

Application include the following features:

1. Authentication flow (Firebase)
2. Display a list of all Posts
3. Display a specific Post and its comments
4. Create a new Post
5. Update Post's information – title and body
6. Delete a Post
7. Create a new Comment

## Folder Structure

Here is the folder structure I have been using in this project

```text
lib/
|- data/
|- screens/
|- views/
|- widgets/
|- main.dart
```

## Data

Contains all constants and configuration for the application. It also include the data models, routes and services.

```text
data/
|- constants/
    |- colors.dart
    |- configurations.dart
    |- snack_bar_errors.dart
    |- theme.dart
|- models/
    |- comment.dart
    |- post.dart
    |- validation.dart
|- routes/
    |- routes.dart
|- services/
    |- firebase_service.dart
    |- http_service.dart
```

## Screens

This directory contains all screens of the application.

```text
screens/
```

## Views

Business logic of the application. Implement communication with data models and services.

```text
views/
|- view_auth.dart
|- view_home.dart
|- view_validation.dart
```

## Widgets

This directory contains all UI of the application. For each screen widgets loacated in a separate folder making it easy to combine group of files related to that particular screen.

```text
widgets/
|- auth_module/
|- home_module/
|- loading_module/
|- post_details/
```
