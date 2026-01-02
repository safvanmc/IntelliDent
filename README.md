# IntelliDent Dental AI – Flutter Machine Test

## Project Overview

IntelliDent Dental AI is the first UAE-based AI-powered dental diagnostic platform. This Flutter application demonstrates a production-quality implementation with clean architecture, BLoC state management, and modern UI/UX design.

The app features a complete onboarding flow and a login screen with comprehensive form validation, showcasing best practices in Flutter development.

## Features Implemented

### ✅ Onboarding Flow
- **3-screen onboarding experience** with smooth PageView transitions
- Each screen includes:
  - Title and description
  - Icon/visual placeholder (tooth/AI/scan concepts)
  - Navigation controls (Skip, Next, Previous, Get Started)
- Page indicators for visual feedback
- BLoC-managed state for page navigation

### ✅ Login Screen with Validation
- **Email field** with format validation
- **Password field** with minimum length validation (6 characters)
- **Password visibility toggle**
- **Inline error messages** for real-time feedback
- **Form state management** using BLoC
- **Disabled button** when form is invalid
- **Loading state** during submission

### ✅ Architecture & Code Quality
- **Clean Architecture** with clear separation of concerns
- **BLoC Pattern** for state management (no setState for business logic)
- **Material 3** design system
- **Reusable widgets** for maintainability
- **Comprehensive validation** utilities
- **Professional healthcare UI** with IntelliDent brand colors

## Architecture Explanation

This project follows **Clean Architecture** principles, organizing code into distinct layers:


### Benefits of This Architecture

1. **Separation of Concerns**: Each layer has a specific responsibility
2. **Testability**: Business logic is isolated and easily testable
3. **Maintainability**: Changes in one layer don't affect others
4. **Scalability**: Easy to add new features following the same pattern
5. **Reusability**: Core utilities and widgets can be reused across features

## State Management: BLoC Pattern

### Why BLoC?

We chose **BLoC (Business Logic Component)** pattern for the following reasons:

1. **Predictable State Management**: Clear flow of events → states
2. **Separation of UI and Business Logic**: UI is purely reactive
3. **Testability**: Easy to test business logic independently
4. **Scalability**: Handles complex state management scenarios
5. **Industry Standard**: Widely adopted in Flutter community

### BLoC Implementation

Each feature has its own BLoC with:
- **Events**: User actions and system events
- **States**: UI states derived from events
- **BLoC**: Business logic that transforms events into states

#### Onboarding BLoC
- Manages page navigation state
- Handles skip/next/previous actions
- Tracks current page index

#### Login BLoC
- Manages form field states
- Handles validation logic
- Manages submission state

## Folder Structure Explanation

### Core Layer (`lib/core/`)
Contains app-wide utilities and configurations:
- **`theme/`**: Material 3 theme configuration with IntelliDent brand colors
- **`constants/`**: Brand colors and app-wide constants
- **`utils/`**: Validation utilities and helper functions

### Data Layer (`lib/data/`)
Contains data models and repositories:
- **`models/`**: Onboarding data model and data source

### Presentation Layer (`lib/presentation/`)
Contains all UI-related code organized by feature:
- **`onboarding/`**: Complete onboarding feature
  - `bloc/`: Onboarding state management
  - `screens/`: Onboarding screen
  - `widgets/`: Reusable onboarding widgets
- **`auth/`**: Authentication feature
  - `bloc/`: Login state management
  - `screens/`: Login screen
  - `widgets/`: Reusable auth widgets

### Routes (`lib/routes/`)
Centralized route definitions for navigation.

## Brand Theme

The app uses IntelliDent Dental AI brand colors:

- **Primary Color**: `#1FA6D1` (Dental Blue)
- **Secondary Color**: `#4FC3E8` (Light Medical Blue)
- **Background**: `#FFFFFF` (White)
- **Text Primary**: `#1C1C1C` (Dark Gray)
- **Text Secondary**: `#6B7280` (Medium Gray)

UI Style:
- Clean and minimal design
- Healthcare/AI aesthetic
- Material 3 components
- Rounded corners
- Soft shadows

## How to Run the Project

### Prerequisites

- Flutter SDK (latest stable version)
- Dart SDK
- Android Studio / VS Code with Flutter extensions
- Android/iOS emulator or physical device

### Installation Steps

1. **Clone the repository** (if applicable) or navigate to the project directory

2. **Install dependencies**:
   ```bash
   flutter pub get
   ```

3. **Run the app**:
   ```bash
   flutter run
   ```

### Running on Specific Platforms

- **Android**: `flutter run -d android`
- **iOS**: `flutter run -d ios`
- **Web**: `flutter run -d chrome`
- **Windows**: `flutter run -d windows`

### Build Commands

- **Android APK**: `flutter build apk`
- **iOS**: `flutter build ios`
- **Web**: `flutter build web`

## Dependencies

- **flutter_bloc**: `^8.1.6` - State management using BLoC pattern
- **equatable**: `^2.0.5` - Value equality for state objects

## Project Structure Highlights

### Onboarding Flow
- Uses `PageView` for smooth horizontal scrolling
- BLoC manages page index and navigation
- Reusable `OnboardingPage` widget for each screen
- Page indicators show current position
- Skip button allows users to bypass onboarding

### Login Screen
- Form validation using `TextFormField`
- Real-time validation feedback
- Password visibility toggle
- Disabled button state when form is invalid
- Loading indicator during submission

## Code Quality

- ✅ Clean, readable, and well-commented code
- ✅ Follows Flutter best practices
- ✅ Consistent naming conventions
- ✅ Proper error handling
- ✅ No hardcoded strings (ready for localization)
- ✅ Reusable widgets and utilities


## Feature Highlights

### 🧭 Bottom Navigation Bar

- **Description**: Quickly switch between the main sections: Home, History (API Demo), and Profile.
- **Implementation**: Uses Flutter's `BottomNavigationBar` inside a rounded, modern container UI.
- **State Management**: Powered by `flutter_bloc` (see `NavigationBloc`), ensuring seamless tab changes.
- **Customization**: The navigation bar is custom-styled for IntelliDent, with icons for Home, History, and Profile.

### 💡 Dental Tips Section (Home Screen)

- **Description**: Displays a curated list of essential dental tips on the Home screen.
- **Implementation**:
  - Utilizes a BLoC (`DentalTipsBloc`) for fetching and managing tips.
  - Loading and error handling for smooth UX.
  - Tips are presented in a visually appealing, scrollable list.
- **Features**:
  - Friendly introductory texts
  - Refresh and retry capabilities

### 📈 API Demo (History Screen)

- **Description**: Demonstrates the integration with APIs by listing historical data or API responses.
- **Implementation**:
  - Managed by `HistoryBloc`, loading and paginating results via events and states (`HistoryInitialized`, `HistoryLoadMore`).
  - Pull-to-refresh and infinite scroll supported.
  - Error states and retry option in case of failed requests.
- **Features**:
  - Easy-to-read card layout for API entries
  - Debug logging for loading more items
  - Designed for extensibility with any API that returns a list

> **Tip:** All of these features are built using clean BLoC architecture, providing separation of UI and business logic. Check the `lib/presentation/navigation/screens/main_navigation_screen.dart`, `lib/presentation/home/screens/home_screen.dart`, and `lib/presentation/history/screens/history_screen.dart` files for implementation details.





## Developer

**Developer Name**: Muhammed safvan mc
**Developer Contact**: +971582246267
**Developer mail**: safwanmc81@gmail.com


---

**IntelliDent Dental AI** - Revolutionizing dental care with AI technology 🇦🇪
