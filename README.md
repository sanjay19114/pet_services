# Pet Services Aggregator

A Flutter UI application that aggregates pet services like grooming, veterinary clinics, and boarding centers - similar to a "Trivago for pets". This is a UI-only demonstration without backend integration.

## Features

### 🏠 Home Screen
- Clean, modern interface with search functionality
- Horizontal scrollable service categories (Grooming, Veterinary, Boarding, Daycare, Training)
- Featured pet centers with ratings and quick booking options
- Location-based real pet services from Bangalore

### 📋 Service Listing Screen
- Filtered list of pet service providers by category
- Service cards showing images, names, ratings, availability status
- Pet types supported for each service
- Advanced filtering and sorting options

### 🏥 Pet Center Detail Screen
- Detailed service information with SliverAppBar for smooth scrolling
- Contact information and location details
- Service offerings with pricing
- Professional staff profiles with ratings
- Booking appointment functionality (UI demo)

### 🔧 Additional Features
- Filter modal with sorting options (Rating, Reviews, Name)
- Open/Closed status filtering
- Responsive design with smooth animations
- Custom widget architecture for reusability

## Screens Overview

1. **Home Screen**: Entry point with search, categories, and featured services
2. **Service Listing Screen**: Filtered list view of all pet services
3. **Pet Center Detail Screen**: Comprehensive details about individual services

## Real Data

The app uses real pet service data from Bangalore, including:
- **Bangalore Pet Hospital** (Koramangala) - Veterinary services
- **Pawsitive Grooming Studio** (Indiranagar) - Pet grooming
- **Happy Tails Pet Resort** (Whitefield) - Pet boarding

## Setup Instructions

### Prerequisites
- Flutter SDK (3.0.0 or higher)
- Dart SDK (2.17.0 or higher)
- Android Studio / VS Code with Flutter extensions

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd pet_services_aggregator
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Create assets folder structure**
   ```
   assets/
   └── images/
       ├── pet_hospital.jpg
       ├── grooming_studio.jpg
       ├── pet_resort.jpg
       ├── daycare.jpg
       ├── training_academy.jpg
       ├── doctor1.jpg
       ├── doctor2.jpg
       ├── groomer1.jpg
       ├── groomer2.jpg
       ├── caretaker1.jpg
       ├── caretaker2.jpg
       ├── supervisor1.jpg
       └── trainer1.jpg
   ```

4. **Update pubspec.yaml**
   ```yaml
   flutter:
     assets:
       - assets/images/
   ```

5. **Run the application**
   ```bash
   flutter run
   ```

## Project Structure

```
lib/
├── main.dart                    # App entry point
├── models/
│   └── pet_service.dart        # Data models
├── data/
│   └── mock_data.dart          # Mock data for services
├── screens/
│   ├── home_screen.dart        # Home screen implementation
│   ├── service_listing_screen.dart  # Service listing screen
│   └── pet_center_detail_screen.dart  # Detail screen
└── widgets/
    ├── service_category_card.dart      # Category selection widget
    ├── featured_service_card.dart      # Featured service display
    ├── service_list_card.dart          # Service list item
    ├── professional_card.dart          # Staff profile widget
    └── filter_modal.dart               # Filter and sort modal
```

## Key Components

### Models
- `PetService`: Main service data model
- `ServiceOffering`: Individual service with pricing
- `Professional`: Staff member information
- `ServiceCategory`: Service type categorization

### Widgets
- **ServiceCategoryCard**: Displays service categories with icons
- **FeaturedServiceCard**: Shows featured services on home screen
- **ServiceListCard**: Individual service in listing view
- **ProfessionalCard**: Staff member display
- **FilterModal**: Advanced filtering interface

## Technical Highlights

- **Custom ScrollView**: Implemented SliverAppBar for smooth detail screen experience
- **Material Design**: Following Material Design 3 principles
- **Responsive Layout**: Adaptive design for different screen sizes
- **State Management**: Using Flutter's built-in StatefulWidget
- **Navigation**: Smooth transitions between screens
- **Custom Widgets**: Reusable component architecture

## Color Scheme

- Primary Blue: `#4A90E2`
- Success Green: `#50C878`
- Warning Red: `#FF6B6B`
- Accent Yellow: `#FFD93D`
- Purple: `#9B59B6`
- Background: `#F8F9FA`

## Testing

Run the app in different scenarios:
1. Browse service categories
2. Filter services by type
3. View service details
4. Test booking flow (UI demo)
5. Apply filters and sorting

## Future Enhancements

- Backend integration with REST APIs
- User authentication and profiles
- Real booking system integration
- Push notifications
- Maps integration for location services
- Payment gateway integration
- Reviews and ratings system