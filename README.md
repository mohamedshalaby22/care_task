# eCommerce Flutter App

## Overview
This is a Flutter-based eCommerce application that allows users to browse products, view product details, and manage a favorites list. The app uses BLoC for state management and HTTP for fetching product data from an API.

## Features
- **Home Page**: Displays a list of products fetched from an API.
- **Product Details Page**: Shows detailed information about a selected product.
- **Favorites Page**: Allows users to view and manage their favorite products.
- **Favorite Icon**: Enables users to add or remove products from their favorites list.

## Technologies & Packages Used
The app utilizes the following Flutter packages:

```
dependencies:
  cached_network_image: ^3.4.1  # Efficient image caching
  flutter_bloc: ^9.0.0          # State management using BLoC pattern
  flutter_screenutil: ^5.9.3    # Responsive UI scaling
  freezed: ^2.5.7               # Immutable data classes
  freezed_annotation: ^2.4.4    # Code generation for Freezed
  get_it: ^8.0.3                # Dependency injection
  hive_flutter: ^1.1.0          # Local storage using Hive
  http: ^1.3.0                  # HTTP requests to fetch data
  json_serializable: ^6.9.0     # JSON serialization

dev_dependencies:
  hive_generator: ^2.0.1        # Code generation for Hive
  build_runner: ^2.4.13         # Code generator utility

```

## Project Structure
```
│-- core/
│   ├── routing/               # Navigation and route management
│   ├── theming/               # Theme configurations
│   ├── di/                    # Dependency injection setup
│   ├── widgets/               # Reusable UI components
│   ├── networking/            # API baseurl
│   ├── helpers/               # Utility and helper functions
│-- features/
│   ├── favorite/
│   │   ├── data/              # Data sources and models for favorites
│   │   ├── ui/                # UI components for favorites screen
│   ├── products/
│   │   ├── data/              # Data sources and models for products
│   │   ├── logic/             # BLoC logic for managing products
│   │   ├── ui/                # UI components for products screen
│   ├── product_details/
│   │   ├── data/              # Data sources and models for product details
│   │   ├── logic/             # BLoC logic for product details
│   │   ├── ui/                # UI components for product details screen
│   ├── responsive/            # Responsive design utilities
│-- care_task_app
│-- main.dart            
       
```


### Installation Steps
1. Clone the repository:
   ```sh
   git clone https://github.com/your-repo/flutter-ecommerce-app.git
   cd flutter-ecommerce-app
   ```
2. Install dependencies:
   ```sh
   flutter pub get
   ```
3. Run the application:
   ```sh
   flutter run
   ```

## Usage
- Open the app to browse products on the home page.
- Click on a product to view its details.
- Tap the favorite icon to add/remove products from the favorites list.
- Navigate to the favorites page to see saved products.

