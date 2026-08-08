# Architecture

## Directory Structure

```
lib/
├── data/
│   ├── api/myanimelist/    # HTTP clients (base, guest, user, mixins)
│   ├── auth/               # OAuth2 flow (PKCE, token storage)
│   ├── exceptions/         # Typed exception hierarchy
│   └── model/              # Freezed data classes
├── providers/              # Riverpod providers (state management)
├── ui/
│   ├── components/         # Reusable widgets
│   │   └── nova/           # Design system components
│   ├── dev/                # Dev-only screens (component gallery)
│   ├── screens/            # App screens
│   │   └── home/           # Home screen variants (guest/user)
│   └── theme/              # Theme configuration
└── utils/
    ├── constants/           # Design tokens (color, size, typography)
    ├── extension_methods/   # String extensions
    ├── formatters/          # Display formatting helpers
    └── helpers/             # Business logic helpers (seasons)
```

## Layers

```
┌─────────────────────────────────────────┐
│  UI (Screens + Components)              │
│  ConsumerWidget / ConsumerStatefulWidget │
├─────────────────────────────────────────┤
│  Providers (Riverpod)                   │
│  tokenProvider → clientProvider →        │
│  homeDataProvider / detailProvider /     │
│  profileProvider                        │
├─────────────────────────────────────────┤
│  Data (API Clients)                     │
│  MALBaseClient ← MALGuestClient         │
│               ← MALUserClient           │
│                  + UserListApi mixin     │
│                  + ProfileApi mixin      │
├─────────────────────────────────────────┤
│  Models (Freezed)                       │
│  Immutable data classes with JSON       │
└─────────────────────────────────────────┘
```

## State Management (Riverpod)

The app uses a reactive provider chain:

1. **`tokenProvider`** — holds the current `OAuthToken?`. Set on app boot and after login.
2. **`malClientProvider`** — watches the token and returns the appropriate client (`MALUserClient` or `MALGuestClient`).
3. **`mediaModeProvider`** — app-wide anime/manga mode (persisted to
   SharedPreferences, seeded at boot). Drives which home rails show, what
   search targets, and which list "My List" opens.
4. **Feature providers** watch the client and fetch data:
   - home rail providers — anime: trending/seasonal/popular (+ suggestions
     for users); manga: `mangaRankingProvider(type)` family
   - `animeDetailProvider(id)` / `mangaDetailProvider(id)` — details by ID (family providers)
   - `profileProvider` — user profile and statistics

When the token changes (login/logout), the entire chain invalidates and rebuilds automatically.

## API Client Design

The client uses mixin-based composition to avoid duplication:

- **`MALBaseClient`** — shared endpoints (search, details, ranking, seasonal)
- **`MALGuestClient`** — guest-specific overrides (ranking/seasonal without auth)
- **`MALUserClient`** — user-specific overrides + mixes in `UserListApi` and `ProfileApi`

All API errors go through `mapDioException()` which converts Dio errors into a sealed `NovaException` hierarchy for typed error handling.

## Error Handling

Three layers of resilience:

1. **`runZonedGuarded`** — catches uncaught async errors
2. **`ErrorWidget.builder`** — replaces the red error screen with a friendly fallback
3. **`NovaErrorBoundary`** — wraps widget subtrees with retry capability

User-facing errors display via `showNovaErrorSnackbar()` which maps exception types to friendly messages.

## Design System (Nova)

Custom component library prefixed with `Nova`:

- **Tokens**: `NovaColors`, `NovaSize`, `NovaType` — centralized design values
- **Components**: `NovaPosterImage`, `NovaScore`, `NovaSkeleton`, `NovaAvatar`, `NovaChoiceChip`, etc.
- **Gallery**: Dev-only screen (`NovaGallery`) for previewing components in isolation
