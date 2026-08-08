# MyAnimeList Client

A Flutter app for browsing and tracking anime/manga via the [MyAnimeList API](https://myanimelist.net/apiconfig/references/api/v2).

## Features

- Browse trending, seasonal, and popular anime
- View detailed anime info (synopsis, genres, studios, themes)
- Manage your anime list (status, score, episodes watched, dates)
- User profile with watch statistics
- Guest mode for unauthenticated browsing
- OAuth2 sign-in with MyAnimeList

## Tech Stack

| Layer | Library |
|-------|---------|
| UI framework | Flutter 3.44 / Dart 3.8 |
| State management | Riverpod |
| Networking | Dio |
| Auth | OAuth2 (PKCE) via WebView |
| Models | Freezed + json_serializable |
| Token storage | flutter_secure_storage |
| Config | flutter_dotenv |

## Getting Started

### Prerequisites

- Flutter SDK >=3.8.0
- A MyAnimeList API client ID

### Setup

1. Clone the repo
2. Create a `config.env` file in the project root:
   ```
   CLIENT_ID=your_mal_client_id
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Generate model code:
   ```bash
   dart run build_runner build
   ```
5. Run the app:
   ```bash
   flutter run
   ```

## Testing

```bash
flutter test
```

## Architecture

See [ARCHITECTURE.md](ARCHITECTURE.md) for details on project structure, layers, and design decisions.
