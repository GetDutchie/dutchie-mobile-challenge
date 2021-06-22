# Dutchie Mobile Coding Challenge

This challenge is composed of a small backend in the `/api` directory and the frontend flutter app in `flutter_challenge`. See below on how to get both running properly:

### API

The api is a simple endpoint written in JavaScript to provide a small dataset using GraphQL. To run the api:

- Install [yarn](https://classic.yarnpkg.com/en/docs/install/#mac-stable)
- cd into `/api`
- run the command `yarn && yarn start`
- You should see "Listening on port 5000!" in the terminal and the GraphiQL UI should be accessible at http://localhost:5000/graphql.

### Flutter App

The Flutter App was created using Flutter 2.2.2 on channel stable. To get it running:

- Open the `/flutter_challenge` directory using your preferred IDE (we recommend VS Code)
- Select your device/emulator of choice (the app is optimized for mobile phones only)
- Run the app using the "Run App" launch command in VS Code or by running `flutter run lib/app/main.dart`

**Once you've got both the API & the App running, follow the instructions in-app!**
