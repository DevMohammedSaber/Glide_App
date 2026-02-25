# Glide - The Ultimate Mobility & Delivery Super-App

Glide is a comprehensive, feature-rich Flutter "Super-App" designed to handle urban mobility and delivery needs in one unified platform. From ride-hailing and bus bookings to car rentals and multi-vertical delivery services, Glide provides a seamless experience for customers, drivers, and dispatchers.

## 🚀 Core Features

- **Ride-Hailing**: Real-time taxi booking with estimated fares, driver tracking, and multiple service types.
- **Bus Booking**: Integrated bus schedule management and ticket booking with QR code validation.
- **Car Rentals**: Rent vehicles with or without chauffeurs for short or long durations.
- **Multi-Vertical Delivery**: Food, grocery, pharmacy, parcel, and marketplace delivery services.
- **Smart Logistics**: Zone and sub-zone management for optimized driver dispatching.
- **Financial Suite**: Integrated wallet system, multi-method payments (Credit/Debit, Cash, Wallet), and transaction history.
- **Safety & Communication**: Real-time SOS alerts, in-app messaging, and automated document reminders for drivers.

## 🛠️ Tech Stack

- **Framework**: [Flutter](https://flutter.dev/) (SDK ^3.6.2)
- **State Management**: [flutter_bloc](https://pub.dev/packages/flutter_bloc) (BLoC pattern)
- **Navigation**: [go_router](https://pub.dev/packages/go_router)
- **Dependency Injection**: [get_it](https://pub.dev/packages/get_it) with [injectable](https://pub.dev/packages/injectable)
- **Networking**: [dio](https://pub.dev/packages/dio) for robust API interactions.
- **Backend Services**: [Firebase](https://firebase.google.com/) (Authentication, Core Services).
- **Local Storage**: [shared_preferences](https://pub.dev/packages/shared_preferences) & [flutter_secure_storage](https://pub.dev/packages/flutter_secure_storage).
- **UI & UX**: 
  - [flutter_screenutil](https://pub.dev/packages/flutter_screenutil) for responsive design.
  - [flutter_svg](https://pub.dev/packages/flutter_svg) & [font_awesome_flutter](https://pub.dev/packages/font_awesome_flutter).
  - [google_maps_flutter](https://pub.dev/packages/google_maps_flutter) for mapping.
  - [carousel_slider](https://pub.dev/packages/carousel_slider) & [pinput](https://pub.dev/packages/pinput).

## 📂 Project Structure

The project follows a **Feature-First Architecture**, ensuring high modularity and scalability:

```text
lib/
├── core/             # Global configurations, utilities, and common widgets
│   ├── networking/   # API clients and interceptors
│   ├── utils/        # Themes, routers, and constants
│   └── widgets/      # Shared UI components
├── features/         # Functional modules
│   ├── authentication/ # Login, signup, and OTP
│   ├── home/           # Main dashboard and service switching
│   ├── booking/        # Ride and service booking flows
│   ├── profile/        # User accounts and settings
│   └── history/        # Transaction and ride history
└── main.dart         # App entry point
```

## 🏁 Getting Started

### Prerequisites

- Flutter SDK (latest stable version)
- Android Studio / VS Code
- CocoaPods (for iOS)

### Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/your-username/glide-app.git
   cd glide-app
   ```

2. **Install dependencies**:
   ```bash
   flutter pub get
   ```

3. **Generate generated files** (if any):
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. **Run the app**:
   ```bash
   flutter run
   ```

## 📊 Database Schema

An ERD diagram is available in the root directory: [erd_diagram.sql](file:///Users/mohamed-saber/Desktop/freelance/Glide_App/erd_diagram.sql)

---
*Built with ❤️ for a better urban experience.*
