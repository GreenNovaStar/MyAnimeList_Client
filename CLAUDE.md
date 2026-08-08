# CLAUDE.md

Flutter client for the MyAnimeList API v2. See [README.md](README.md) for
setup and [ARCHITECTURE.md](ARCHITECTURE.md) for the directory layout and
layer diagram — don't duplicate those here.

## Commands

```bash
flutter test                                  # run the test suite
flutter analyze                               # static analysis
dart format lib/ test/                        # format (pre-commit enforces this)
dart run build_runner build                   # regenerate freezed/json models
dart run build_runner build --delete-conflicting-outputs   # if outputs conflict
```

## Gotchas

- **Pre-commit hook runs format + analyze + the full test suite.** A commit
  fails if `dart format` would change anything — run it before committing.
- **Models are generated.** Anything in `lib/data/model/` uses freezed +
  json_serializable; after editing a model, rerun build_runner. `build.yaml`
  sets `field_rename: snake` globally, so camelCase Dart fields map to
  snake_case JSON automatically — no `@JsonKey(name:)` for ordinary fields.
- **`config.env` (gitignored) must exist** in the project root with
  `CLIENT_ID=<mal client id>`, or startup and `getEnv()` fail. Tests seed it
  with `dotenv.loadFromString` instead.
- **The package is named `android_app`** — imports are
  `package:android_app/...`, not the repo name.

## Conventions

- **DRY is a project goal.** API endpoints go through `MALBaseClient.guard()`/
  `getAndParse()`; shared display formatting lives in `lib/utils/formatters/`;
  don't re-inline patterns that already have a helper.
- **Only add to `lib/utils` what is actually reused.** Dead helpers get
  deleted, not kept "just in case".
- **UI is intentionally untested** while the design is in flux. The data and
  utils layers have coverage (`test/`) — keep it passing and extend it when
  touching those layers.
- **Prototype/dev-only screens live in `lib/ui/dev/`** (component gallery,
  design variants) and are deleted once a design settles.
- **Guest vs user:** `MALGuestClient` and `MALUserClient` differ only in auth
  headers; user-only endpoints live in the `UserListApi`/`ProfileApi` mixins.
  UI decides by checking `client is MALUserClient` or nullable provider data
  (e.g. `home.suggestions`).
