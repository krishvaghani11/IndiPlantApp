# IndiPlant: Indian Plant Identification & Info App

IndiPlant is a Flutter application built to help users explore and identify the diverse flora of India. It provides comprehensive botanical details, Hindi/English names, and identification guides (leaves, flowers, bark) for various categories like medicinal, sacred, and fruit-bearing trees.

## Features

- **Category Browsing**: Filter plants by types (Medicinal, Sacred, Fruit-bearing, etc.)
- **Indian Context**: Native names in Hindi and English with cultural significance.
- **Identification Guide**: Detailed descriptions of leaves, bark, flowers, and fruits for every entry.
- **Search**: Fast global search by common name or botanical name.
- **Material 3 Design**: Clean, nature-inspired UI with smooth transitions.
- **Offline Ready**: Uses local data storage for high performance.

## Prerequisites

- Flutter SDK (v3.0.0 or higher)
- Dart SDK
- Android Studio / VS Code with Flutter extension
- An Android/iOS Emulator or Physical Device

## Installation

1. Clone the repository or extract the files.
2. Navigate to the project directory:
    cd indi_plant
3. Install dependencies:
    flutter pub get
4. Run the application:
    flutter run

## Project Structure

- `lib/models/`: Data classes for Plants and Identification guides.
- `lib/data/`: Static botanical data for Indian species.
- `lib/providers/`: Riverpod state management for filtering and searching.
- `lib/screens/`: UI screens (Home, Category, Details).
- `lib/widgets/`: Reusable components (PlantCard, SearchDelegate).
- `lib/theme/`: Material 3 theme configuration.

## Data Included

Currently includes major Indian species such as:
- Neem (Azadirachta indica)
- Peepal (Ficus religiosa)
- Banyan (Ficus benghalensis)
- Mango (Mangifera indica)
- Holy Basil (Tulsi)
- Ashwagandha

## Troubleshooting

- **Images not loading**: Ensure you have an active internet connection as images are fetched from Unsplash CDN.
- **Build errors**: Run `flutter clean` and then `flutter pub get`.
- **Icon issues**: Ensure `uses-material-design: true` is set in `pubspec.yaml`.
