# Nectar — Online Grocery Shop

Nectar is a Flutter e-commerce app for groceries: browse products and categories, view product details, add items to the basket and manage your account. It is available in **English and Arabic**.

## Features

- **Onboarding** — splash and welcome screens
- **Auth** — sign up and log in with email and password; the session is saved on the device
- **Shop** — promo banners, exclusive offers and categories
- **Explore** — grid of all products
- **Categories** — all categories and the products of each one
- **Product details** — quantity picker, description, rating and "Add To Basket"
- **Cart** — the user's basket from the API
- **Favorite** — favorites list (UI only for now)
- **Account** — profile info and log out
- **Localization** — English (Poppins) and Arabic (IBM Plex Sans Arabic, RTL)

## Tech stack

| Concern | Package / approach |
|---|---|
| State management | `flutter_bloc` (Cubit) + `equatable` |
| Architecture | MVVM per feature: `service` → `manager` (cubit) → `screens` / `widgets` |
| Networking | `dio` behind a `ServerGate` singleton returning `CustomResponse<T>` |
| Dependency injection | `get_it` |
| Routing | Named routes (`NamedRoutes` + `AppRoutes`) |
| Local storage | `shared_preferences` via `CacheHelper` |
| Localization | `easy_localization` with generated `LocaleKeys` |
| Responsive sizes | `flutter_screenutil` |
| Assets & fonts | `flutter_gen` |
| Toasts | `flash` |

## Project structure

```
lib/
  core/
    blocs/          # safe Cubit + app-wide cart cubit
    extensions/     # context, widget and string extensions (unified_extensions.dart barrel)
    resources/      # API endpoints, constants, sizes, font sizes, shadows
    services/       # ServerGate (Dio), service locator, cache, bloc observer
    shared/         # models, routes and reusable widgets
    utils/          # theme, colors, logger
  features/
    intro/          # splash, onboarding
    auth/           # login, register
    layout/         # bottom navigation shell
    shop/ explore/ cart/ favorite/ account/
    categories/     # list + category products
    product_details/
  gen/              # generated files — don't edit by hand
  main.dart
assets/
  images/  fonts/  translations/ (en.json, ar.json)
```

Each feature follows the same layout:

```
features/<feature>/
  data/models/   manager/ (cubit + state)   screens/   service/   widgets/
```

## Getting started

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
dart run easy_localization:generate -S assets/translations -f keys -O lib/gen -o locale_keys.g.dart
flutter run
```

Before committing:

```bash
flutter analyze
```

Build a release APK:

```bash
flutter build apk --split-per-abi
```

## API

The app uses the Eraa Store REST API. The base URL and every endpoint are in `lib/core/resources/api_constants.dart`.

## Adding text

1. Add the key to **both** `assets/translations/en.json` and `ar.json`.
2. Regenerate the keys (command above).
3. Use it as `LocaleKeys.<key>.tr()`.

## Author

**Muath Sharawy** — Flutter developer

- Email: muath0sharawy@gmail.com
- LinkedIn: [linkedin.com/in/muathsharawy99](https://linkedin.com/in/muathsharawy99)
- GitHub: [github.com/muathsharawy99](https://github.com/muathsharawy99)
- Portfolio: [muathsharawy.web.app](https://muathsharawy.web.app)
