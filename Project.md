# VMS Flutter Client - Clean Architecture Desktop App

## Overview
This project is a Flutter desktop application built with clean architecture principles, using BLoC for state management, Provider for dependency injection, and go_router for navigation. The architecture supports both REST API and Socket.IO communication with protobuf serialization.

## Architecture

### Clean Architecture Layers

```
lib/
├── main.dart                    # App entry point
├── core/                       # Core utilities and base classes
│   ├── base_view.dart          # Base view for all screens
│   ├── base_bloc.dart          # Base BLoC classes
│   └── app_router.dart         # Navigation configuration
├── di/                         # Dependency injection
│   └── dependency_injection.dart
├── domain/                     # Business logic layer
│   ├── IRepositories/          # Repository interfaces (I prefix)
│   │   └── i_base_repository.dart
│   ├── entities/               # Business entities
│   └── usecases/              # Business use cases
│       ├── base_input.dart     # Base input class
│       ├── base_output.dart    # Base output class
│       ├── base_use_case.dart  # Base use case interface
│       ├── future_use_case.dart # Async use case implementation
│       └── stream_use_case.dart # Stream use case implementation
├── data/                       # Data layer
│   ├── datasources/           # External data sources
│   │   ├── base_api_client.dart    # API client interface
│   │   └── socket_api_client.dart  # Socket.IO implementation
│   ├── repositories/          # Repository implementations
│   │   └── base_repository.dart
│   └── models/                # Data models
└── screens/                   # Presentation layer
    └── home/                  # Home screen feature
        ├── home_bloc.dart     # Home screen BLoC (state management)
        └── home_screen.dart   # Home screen StatefulWidget + View
```

## Key Technologies

### Dependencies
- **flutter_bloc** (^8.1.6): State management
- **equatable** (^2.0.5): Value equality
- **provider** (^6.1.2): Dependency injection
- **go_router** (^14.6.1): Navigation
- **socket_io_client** (^3.0.1): Socket.IO communication
- **protobuf** (^3.1.0): Data serialization

### Desktop Support
- ✅ Windows
- ✅ macOS  
- ✅ Linux

## Architecture Principles

### 1. Dependency Inversion
- Domain layer defines interfaces (IRepositories)
- Data layer implements these interfaces
- Dependencies flow inward toward the domain

### 2. Use Case Pattern
Your existing use case structure:
- `BaseUseCase<Input, Output>`: Abstract base class
- `FutureUseCase`: For async operations
- `StreamUseCase`: For reactive data streams
- `BaseInput`/`BaseOutput`: Type-safe input/output

### 3. BLoC Pattern & Navigation
- **BaseBloc**: Custom base class extending flutter_bloc
- **BaseEvent**: Base event class with Equatable
- **BaseState**: Base state class with Equitable
- **BaseView**: Base view class for UI rendering
- **Screen Structure**: StatefulWidget for lifecycle + View for UI
- **Router Responsibility**: Navigation routing + dependency injection only
- **Screen Responsibility**: Business logic event triggering in initState

### 4. Data Sources
- **BaseApiClient**: Abstract interface supporting both REST and Socket.IO
- **SocketApiClient**: Socket.IO implementation with protobuf support
- Easily extensible for REST API implementation

### 5. Separation of Concerns
- **AppRouter**: Handles navigation and BLoC dependency injection
- **Screen (StatefulWidget)**: Manages lifecycle and triggers BLoC events
- **View (BaseView)**: Focuses purely on UI rendering and user interactions

## Getting Started

### 1. Install Dependencies
```bash
flutter pub get
```

### 2. Run the App
```bash
# Desktop (Windows)
flutter run -d windows

# Desktop (macOS)
flutter run -d macos

# Desktop (Linux)
flutter run -d linux
```

### 3. Development Workflow

#### Adding a New Screen
1. Create folder in `screens/[screen_name]/`
2. Create `[screen_name]_bloc.dart` extending BaseBloc
3. Create `[screen_name]_screen.dart` as StatefulWidget with initState for event triggering
4. Create `[screen_name]_view.dart` extending BaseView for UI rendering
5. Add route with BlocProvider to `core/app_router.dart` for dependency injection

#### Adding a New Use Case
1. Create input class extending `BaseInput`
2. Create output class extending `BaseOutput`
3. Create use case extending `FutureUseCase` or `StreamUseCase`
4. Register in dependency injection if needed

#### Adding a New Repository
1. Create interface in `domain/IRepositories/` with `I` prefix
2. Create implementation in `data/repositories/`
3. Register in `di/dependency_injection.dart`

## Project Structure Benefits

### 1. Scalability
- Modular architecture allows easy feature addition
- Clear separation of concerns
- Independent layer testing

### 2. Maintainability
- Single responsibility principle
- Dependency injection for loose coupling
- Consistent naming conventions

### 3. Testability
- Business logic isolated in use cases
- Mockable interfaces
- BLoC pattern supports unit testing

### 4. Desktop Optimization
- go_router provides excellent desktop navigation
- Provider handles dependency management efficiently
- BLoC pattern works well with desktop interactions

## Communication Layer

### Socket.IO + Protobuf
The data layer is designed to support:
- **Real-time communication** via Socket.IO
- **Efficient serialization** via Protocol Buffers
- **Type safety** through generated protobuf classes
- **Fallback support** for REST API (interface ready)

### API Client Interface
```dart
abstract class BaseApiClient {
  Future<void> connect();
  Future<void> disconnect();
  void send(Map<String, dynamic> data);
  Stream<Map<String, dynamic>> listen();
  bool get isConnected;
}
```

## Next Steps

1. **Add protobuf generation**: Set up protobuf compiler for message definitions
2. **Implement business features**: Add specific use cases and entities
3. **Add error handling**: Implement comprehensive error management
4. **Add testing**: Unit tests for use cases, widget tests for screens
5. **Add logging**: Implement structured logging for debugging
6. **Add configuration**: Environment-specific settings

## Notes

- Repository interfaces use `I` prefix (e.g., `IBaseRepository`) for clarity
- Base classes don't use `I` prefix to avoid confusion
- Socket.IO client is pre-configured for localhost:3000
- The architecture supports both synchronous and asynchronous operations
- Desktop-first design with mobile compatibility maintained