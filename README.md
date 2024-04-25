# users_task

A simple Flutter application for create and view users.

## Table of Contents
- [Introduction](#introduction)
- [Features](#features)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Project Structure](#project-structure)

## Introduction

Welcome to the Users App! This Flutter application allows users to create, read users items.

## Features
- Google Login Screen: Implement a screen where users can log in using their Google accounts.
. API Integration:
- Upon successful login, extract the username or email from the Google account information.
- Use the extracted information to create a new user by sending a POST request to the API endpoint.
- Navigate to a new screen to display the list of users retrieved from the API using the "List Users" function.

## Getting Started

### Prerequisites

Make sure you have Flutter and Dart installed on your machine. If not, follow the [official Flutter installation guide](https://flutter.dev/docs/get-started/install).

### Installation

1. Clone the repository:

    ```bash
    git clone https://github.com/karar0120/users-task.git
    cd users-app-flutter
    ```

2. Install dependencies:

    ```bash
    flutter pub get
    ```

3. Run the app:

    ```bash
    flutter run
    ```

## Project Structure

    .
    ├── core                       # For all common and core files.
    │   ├── error                  # contains all Exceptions and Failures classes
    │   ├── presentation           # Common presentation files
    |   │   └── blocs              # Common blocs
    |   │   └── pages              # Core pages
    |   │   └── widgets            # Common widgets
    │   └── route                  # Routes for navigation
    │   └── theme                  # Theme data
    │   └── usecases               # Common usecases
    |
    ├── data                       # Data Files of Feature 1
    │   ├── datasources            # DataSources Abstract Files and Implementations
    │   │   └── feature            # Feature 1 (for exp : Todo Feature)
    │   │       └── sub-feat.      # Sub feature
    │   ├── models                 # Models for data
    │   │   └── feature            # Feature 1 (for exp : Todo Feature)
    │   │       └── sub-feat.      # Sub feature
    │   └── repositories           # Repositories Implementation Classes
    │       └── feature            # Feature 1 (for exp : Todo Feature)
    │           └── sub-feat.      # Sub feature
    ├── domain                     # Domain
    │   ├── entities               # Entities For Feature 1
    │   │   └── feature            # Feature 1 (for exp : Todo Feature)
    │   │       └── sub-feat.      # Sub feature
    │   ├── usecases               # Usecases of Feature 1
    │   │   └── feature            # Feature 1 (for exp : Todo Feature)
    │   │       └── sub-feat.      # Sub feature
    │   └── repositories           # Repositories Abstract Classes
    │       └── feature            # Feature 1 (for exp : Todo Feature)
    │           └── sub-feat.      # Sub feature
    └── presentation               # Presentation files
        ├── blocs                  # Blocs
        │   └── feature            # Feature 1 (for exp : Todo Feature)
        │       └── sub-feat.      # Sub feature
        ├── pages                  # Pages
        │   └── feature            # Feature 1 (for exp : Todo Feature)
        │       └── sub-feat.      # Sub feature
        └── widgets                # Widgets
            └── feature            # Feature 1 (for exp : Todo Feature)
                └── sub-feat.      # Sub feature

## Architecture

This app uses [***Clean Architecture by Robert C Martin***]

<img src="https://github.com/ResoCoder/flutter-tdd-clean-architecture-course/blob/master/architecture-proposal.png" style="display: block; margin-left: auto; margin-right: auto; width: 75%;"/>

Image Source : [ResoCoder](https://resocoder.com)

## Branches

    .
    ├── master                       # Contains the latest release
           ├── dev                   # Contains the latest development
                ├── feature1         # feature 1 created from dev
                ├── feature2         # feature 2 created from dev
                ├── feature3         # feature 3 created from dev
                ├── bugFix1          # bugfix 1 created from dev
                ├── bugFix2          # bugfix 1 created from dev
                ├── docChange1       # docChange 1 created from dev
                ├── docChange1       # docChange 2 created from dev

## Pet List:

- Google Login Screen:
- Develop a screen with a Google Sign-In button.
- Utilize the Google Sign-In plugin for Flutter to handle authentication.
- Upon successful authentication, extract the relevant user information (e.g., username, email).
# :iphone: Screens
![Screenshot_1714014786](https://github.com/karar0120/users-task/assets/92108624/9c6becc9-989c-4c9b-9817-012c8cf8f742)



## API Integration:
- Implement a function to send a POST request to the API endpoint for creating a new user.
- Use the extracted user information (username or email) as part of the request payload.
- Handle the response from the API appropriately (e.g., display success or error message).

  
## User List Screen:
- Create a new screen to display the list of users retrieved from the API.
- Implement the "List Users" function to fetch the user data from the API endpoint.
- Display the list of users in a user-friendly format (e.g., using a ListView).
- Implemented pagination to load the next page when scrolling to the bottom of the list.
# :iphone: Screens
![Screenshot_1714014800](https://github.com/karar0120/users-task/assets/92108624/7f738d03-a057-4cbd-b1b8-b40e27d2328c)
![Screenshot_1714014856](https://github.com/karar0120/users-task/assets/92108624/d9f5fed0-4717-4f42-b57f-c27879b40642)
![Screenshot_1714014858](https://github.com/karar0120/users-task/assets/92108624/db59ba63-f24c-41a1-b4a6-218a830103fc)

