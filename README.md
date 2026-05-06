# Dutchie Mobile Coding Challenge

## Setup

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (stable), with Web enabled (`flutter config --enable-web`).
- [Dart SDK](https://dart.dev/get-dart) (bundled with Flutter is sufficient).

### Start the mock API

From the repo root:

```bash
cd api
dart pub get
dart run bin/server.dart
```

You should see `Listening on http://localhost:1123` (or the host/port you configured).

Endpoints:

- `GET http://localhost:1123/albums` — JSON array of **10** albums; each album has **one** `genre`, an Unsplash-backed `imageUrl`, and **many** `songs`.
- `GET http://localhost:1123/artists` — JSON array of **10** artists; each artist lists **many** `albumIds` (references into the album set).

### Start the Flutter app

Start the app in a **second** terminal:

```bash
cd app
flutter pub get
flutter run
```

Or open the repo folder in VS Code/Cursor/Windsurf and use **Run and Debug**: for **Mock Music API** and **Flutter**

## Interview candidate task

Complete **one** of the following for your assessment (your choice):

1. **Album & artist pages** — Replace the placeholder **Albums** and **Artists** screens with real views backed by the API (you may extend endpoints). Include **sorting** on at least one screen (e.g. by title or genre or duration).
2. **Playlist** — Implement creating a playlist and **adding songs** to it (local state is fine; persistence optional).

When you are done, note any assumptions and how to run your changes in your PR.
