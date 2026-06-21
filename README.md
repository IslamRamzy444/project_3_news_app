# News App

[![Flutter Version](https://img.shields.io/badge/Flutter-3.22-blue)](https://flutter.dev)
[![Provider](https://img.shields.io/badge/State%20Management-Provider-green)](https://pub.dev/packages/provider)
[![NewsAPI](https://img.shields.io/badge/API-NewsAPI.org-orange)](https://newsapi.org/)

A global news browsing app that fetches articles by category and source. Built with Provider, theming, localization, and multiple architecture branches (MVVM, Repository Pattern, BLoC).

---

## Screenshots

<img width="720" height="1600" alt="screenshot1" src="https://github.com/user-attachments/assets/c91b0889-f7dd-40fb-9dd4-e64a1030588d" />

<img width="720" height="1600" alt="screenshot2" src="https://github.com/user-attachments/assets/ffcb786e-876f-4320-bf8d-c937a4232917" />

<img width="720" height="1600" alt="screenshot3" src="https://github.com/user-attachments/assets/602a9fa1-b887-413e-a47c-e9070d5fdaa7" />

<img width="720" height="1600" alt="screenshot4" src="https://github.com/user-attachments/assets/f23b580f-1b2b-40b9-9486-ecba34b430d1" />

<img width="720" height="1600" alt="screenshot5" src="https://github.com/user-attachments/assets/cf6e5a5f-8b7e-424f-9aa4-cc6849482957" />

<img width="720" height="1600" alt="screenshot6" src="https://github.com/user-attachments/assets/cfcbac71-4a24-44a2-ad5f-d6b4abe324bb" />

<img width="720" height="1600" alt="screenshot7" src="https://github.com/user-attachments/assets/7db378fe-1396-440f-9a5d-686bf806b518" />

<img width="720" height="1600" alt="screenshot8" src="https://github.com/user-attachments/assets/f8e7ea0d-8f5f-4177-873a-87b6af17659c" />

<img width="720" height="1600" alt="screenshot9" src="https://github.com/user-attachments/assets/70ec35cd-ee7e-4e2f-97b1-8ae509902cb4" />

<img width="720" height="1600" alt="screenshot10" src="https://github.com/user-attachments/assets/3819dd82-3756-4d62-a729-32a68c5ef49e" />

---

## Demo Video

*Click to view full app walkthrough (includes offline caching demo)*

[Demonstration Video — News App Overview & Caching] https://drive.google.com/file/d/1Az5PiSGTJPU-jbTAfZvXuD2pa0aHmhQV/view?usp=sharing

---

## Features

| Feature | Description |
|---------|-------------|
| 📰 **News Categories** | Browse news by multiple categories |
| 📡 **Sources Tab** | Each category has a tab bar with different sources |
| 📄 **Article View** | Read article summaries with full article via WebView |
| 🌍 **Localization** | Full English/Arabic support |
| 🌗 **Theming** | Light and dark mode toggle via drawer |
| 🖥️ **WebView** | Full article viewing inside the app |
| 💾 **Offline Caching** | Hive caching with connectivity check (available on repository pattern branch) |

---

## Tech Stack

| Category | Technologies |
|----------|--------------|
| **Framework** | Flutter |
| **State Management** | Provider (main), BLoC (branch), MVVM (branches) |
| **Networking** | HTTP, Retrofit (branch) |
| **Local Storage** | Hive (with generator), SharedPreferences |
| **Caching** | Hive (branch) |
| **Connectivity** | connectivity_plus |
| **UI** | cached_network_image, timeago, webview_flutter |
| **Dependency Injection** | Manual (branch), injectable (branch) |

---

## Architecture Branches

This project has multiple branches exploring different architectural patterns:

| Branch | Pattern | Key Features |
|--------|---------|--------------|
| `main` | File separation + Provider | Core app functionality |
| `mvvm-provider` | MVVM with Provider | ViewModel + ChangeNotifier |
| `mvvm-bloc` | MVVM with BLoC | Event-driven state management |
| `repository-pattern` | Repository Pattern | Network check, Hive caching, manual DI |
| `injectable-di` | Dependency Injection | injectable package |
| `retrofit` | Retrofit Integration | API calls with Retrofit |

---

## Project Structure (Main Branch(develop))

lib/
├── api/
│ ├── api_constants.dart # API key, base URL
│ ├── api_endpoints.dart # API endpoints
│ └── api_manager.dart # HTTP requests
├── models/
│ └── article.dart # Article data model
├── providers/
│ ├── app_language_provider.dart
│ ├── app_theme_provider.dart
│ └── news_provider.dart # Fetches and manages news data
├── ui/
│ └── home/
│ ├── home_screen.dart # Main screen with categories grid
│ ├── categories/ # Category widgets
│ ├── news/ # Article widgets + WebView screen
│ ├── sources/ # Source tab widgets
│ └── drawer/ # Custom drawer widget
├── utils/
│ ├── app_colors.dart
│ ├── app_assets.dart
│ ├── app_styles.dart
│ └── app_routes.dart
└── l10n/ # Localization files (en/ar)

---

## What I'd Do Differently Today

- Implement vertical pagination for articles
- Add search functionality by word or topic
- Fully integrate the repository pattern with caching in main branch
- Add unit tests
- Use code generation for models

---

## Known Limitations

| Issue | Status |
|-------|--------|
| Vertical pagination | ⚠️ Not implemented due to time constraints |
| Article search | ⚠️ Not implemented |
| Repository pattern | ✅ Available on separate branch |
| Caching | ✅ Available on repository-pattern branch |

---

## Setup Instructions

### Prerequisites
- Flutter SDK installed
- API key from [NewsAPI.org](https://newsapi.org/)

### Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/IslamRamzy444/project_3_news_app.git
   cd project_3_news_app
   
2. **Get dependencies**
   ```bash
   flutter pub get
   
3. **Add your API key**
   
   Open `lib/api/api_constants.dart` and add your NewsAPI key:
   ```dart
   static const String apiKey = "YOUR_API_KEY_HERE";
   ```
4. **Run the app**
   ```bash
   flutter run
---
## Acknowledgments

- News data: [NewsAPI.org](https://newsapi.org/)
- Route Academy for project guidance
- Packages: provider, http, cached_network_image, webview_flutter, hive, connectivity_plus

---

## Status

✅ Fully functional: News categories, sources, articles, WebView, theme, localization  
✅ Multiple architecture branches available for exploration  
⚠️ Vertical pagination and search not implemented (time constraints)  
⚠️ Legacy project from Route Academy (2025)

---

## Connect With Me

- **GitHub**: [IslamRamzy444](https://github.com/IslamRamzy444)
- **LinkedIn**: [Islam Ramzy](https://www.linkedin.com/in/islamramzy/)
