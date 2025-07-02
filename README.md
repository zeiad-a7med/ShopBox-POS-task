# ShopBox POS - Flutter Application

A modern Point of Sale (POS) Flutter application built with clean architecture and state-of-the-art development practices.

## 📱 Features

- **Product Management**: Browse products with a responsive grid layout
- **Shopping Cart**: Add, remove, and modify items in the cart
- **Combo Offers**: Automatic combo detection and application
- **Payment Processing**: Multiple payment methods (Cash, Card, Voucher)
- **Splash Screen**: Branded app launch experience
- **Network Handling**: Robust offline/online state management
- **Real-time Updates**: Live cart counter and product updates

## 🏗️ Architecture

This project follows **Clean Architecture** principles with **Feature-First** organization, ensuring maintainability, testability, and scalability.

### Architecture Layers

```
lib/
├── core/                          # Shared application core
│   ├── constants/                 # App-wide constants
│   ├── routes/                    # Navigation and routing
│   ├── helpers/                   # Utility classes
│   │   ├── dio/                   # HTTP client setup
│   │   ├── network_helper/        # Network connectivity
│   │   └── sharedPreference/      # Local storage
│   └── common/                    # Shared models/utilities
├── features/                      # Feature modules
│   ├── products/                  # Product management feature
│   │   ├── data/                  # Data sources and repositories
│   │   ├── domain/                # Business logic and entities
│   │   │   ├── models/            # Data models
│   │   │   ├── repository/        # Repository interfaces
│   │   │   └── usecases/          # Business use cases
│   │   └── presentation/          # UI components
│   │       ├── controller/        # State management
│   │       └── widgets/           # UI widgets
│   └── shoppingCart/              # Shopping cart feature
│       ├── domain/                # Cart business logic
│       └── presentation/          # Cart UI components
├── utils/                         # Utility functions
├── app.dart                       # App configuration
├── main.dart                      # Application entry point
└── splash_screen.dart             # Splash screen widget
```

### Key Design Patterns

#### 1. **Clean Architecture**
- **Domain Layer**: Contains business entities, use cases, and repository interfaces
- **Data Layer**: Implements repositories and handles data sources
- **Presentation Layer**: UI components and state management

#### 2. **State Management - Riverpod**
- **Providers**: For dependency injection and state management
- **Notifiers**: For complex state logic
- **Consumers**: For reactive UI updates

#### 3. **Data Models - Freezed**
- **Immutable Models**: Using Freezed for data classes
- **JSON Serialization**: Automatic serialization/deserialization
- **Union Types**: Type-safe state management

#### 4. **Navigation - GoRouter**
- **Declarative Routing**: Type-safe navigation
- **Deep Linking**: Support for deep links
- **Route Guards**: Navigation protection

## 🛠️ Tech Stack

### Core Dependencies
- **Flutter SDK**: ^3.8.0
- **Dart**: ^3.8.0

### State Management
- **flutter_riverpod**: ^2.6.1 - Reactive state management
- **riverpod_annotation**: ^2.6.1 - Code generation for providers

### Navigation
- **go_router**: ^15.2.3 - Declarative routing solution

### Networking
- **dio**: ^5.6.0 - HTTP client for API calls
- **connectivity_plus**: ^6.1.4 - Network connectivity detection

### Data Modeling
- **freezed**: ^3.0.6 - Code generation for data classes
- **json_annotation**: ^4.9.0 - JSON serialization

### UI/UX
- **flutter_screenutil**: ^5.9.3 - Responsive design
- **flutter_rating_bar**: ^4.0.1 - Product rating display
- **top_snackbar_flutter**: ^3.1.0 - Enhanced notifications

### Local Storage
- **shared_preferences**: ^2.5.3 - Local data persistence

### Development Tools
- **build_runner**: 2.4.15 - Code generation
- **flutter_launcher_icons**: ^0.14.4 - App icon generation
- **import_sorter**: ^4.6.0 - Import organization
- **flutter_lints**: ^5.0.0 - Code quality

## 🚀 Setup and Installation

### Prerequisites
- Flutter SDK (version 3.8.0 or higher)
- Dart SDK (version 3.8.0 or higher)
- Android Studio / VS Code
- Git

### Installation Steps

1. **Clone the Repository**
   ```bash
   git clone repository-url
   cd ShopBox-POS-task
   ```

2. **Install Dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate Code**
   ```bash
   flutter packages pub run build_runner build --delete-conflicting-outputs
   ```

4. **Run the Application**
   ```bash
   # For development
   flutter run
   
   # For release
   flutter run --release
   ```

### Additional Setup Commands

**Generate App Icons**
```bash
flutter pub run flutter_launcher_icons:main
```

**Sort Imports**
```bash
flutter pub run import_sorter:main
```

**Clean and Rebuild**
```bash
flutter clean
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

## 📱 Running the App

### Development Mode
```bash
flutter run
```

### Release Mode
```bash
flutter run --release
```

### Build APK
```bash
flutter build apk --release
```

### Build for iOS
```bash
flutter build ios --release
```

## 🧪 Testing

### Run Unit Tests
```bash
flutter test
```

### Run Integration Tests
```bash
flutter test integration_test/
```

### Test Coverage
```bash
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
```

## 🔧 Development Workflow

### Code Generation
This project uses code generation for:
- **Freezed Models**: Immutable data classes
- **JSON Serialization**: Automatic JSON handling
- **Riverpod Providers**: State management providers

Run code generation:
```bash
flutter packages pub run build_runner build
```

Watch for changes:
```bash
flutter packages pub run build_runner watch
```

### State Management Flow

1. **UI Events** → Controller (Notifier)
2. **Controller** → Use Case
3. **Use Case** → Repository
4. **Repository** → Data Source
5. **Data Source** → External API/Local Storage

### Adding New Features

1. Create feature folder in `lib/features/`
2. Implement domain models with Freezed
3. Create repository interface and implementation
4. Add use cases for business logic
5. Implement UI with Riverpod state management
6. Add navigation routes
7. Update dependency injection

## 📂 Project Structure Details

### Core Module
- **Constants**: App-wide configuration and settings
- **Routes**: Navigation setup and route definitions
- **Helpers**: Utility classes for HTTP, network, and storage
- **Common**: Shared models and utilities

### Features Module
Each feature follows clean architecture:
- **Data**: Repository implementations and data sources
- **Domain**: Business logic, entities, and use cases
- **Presentation**: UI components and state management

### Key Files
- `main.dart`: Application entry point and initialization
- `app.dart`: App configuration and theme setup
- `splash_screen.dart`: Branded launch screen
- `pubspec.yaml`: Dependencies and asset configuration

## 🎨 UI/UX Features

- **Responsive Design**: Adapts to different screen sizes
- **Material Design**: Following Material Design guidelines
- **Custom Theming**: Consistent color scheme and typography
- **Loading States**: Smooth loading indicators
- **Error Handling**: User-friendly error messages
- **Empty States**: Helpful empty state screens

## 🌐 Network Handling

- **Connectivity Detection**: Real-time network status monitoring
- **Error Recovery**: Automatic retry mechanisms
- **Offline Support**: Graceful degradation when offline
- **API Integration**: RESTful API communication with Dio

## 💾 Data Persistence

- **Local Storage**: SharedPreferences for app settings
- **State Persistence**: Maintaining app state across sessions
- **Cache Management**: Efficient data caching strategies

## 🔐 Security Features

- **Input Validation**: Sanitizing user inputs
- **Error Handling**: Secure error messaging
- **Network Security**: HTTPS communication

## 📈 Performance Optimizations

- **Lazy Loading**: Efficient widget loading
- **Image Optimization**: Optimized image loading and caching
- **Memory Management**: Proper widget disposal
- **Build Optimization**: Efficient widget rebuilds

## 🚀 Deployment

### Android Deployment
1. Configure signing in `android/app/build.gradle`
2. Build release APK: `flutter build apk --release`
3. Upload to Google Play Store

### iOS Deployment
1. Configure signing in Xcode
2. Build release: `flutter build ios --release`
3. Archive and upload to App Store


