# Flutter News App

## Overview
This is a Flutter-based news app that fetches and displays trending and breaking news articles from various sources using NewsAPI. The app features a clean and intuitive user interface, and it is built with a focus on usability and performance.

## Features
- Displays **Trending News** (from NewsAPI) based on specific query parameters.
- Displays **Breaking News** from the TechCrunch news source.
- Displays news articles filtered by **Categories** (e.g., Technology, Sports, Business).
- Handles **network connectivity** by showing warnings if the internet is disconnected.
- **Splash Screen** to show branding on app launch.

## Requirements
- **Flutter**: This app requires Flutter SDK version 3.24.3.
- **NewsAPI**: To fetch news data, you need an API key from [NewsAPI](https://newsapi.org/).
- **Android Studio / Visual Studio Code**: For development and running the application.

## Setup Instructions

1. **Clone the Repository**  
   Clone the repository to your local machine:
   ```bash
   git clone https://github.com/Hitesh-Meghwal/newsapp.git
2. **Install Flutter**  
   Ensure Flutter is installed on your machine by following the instructions at Flutter Install.
3. **Install Chocolatey**
    - Open PowerShell as Administrator.
    - Run the following command to install Chocolatey:
    ```bash
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
4. **Install  FVM**  
    Install FVM: In the same PowerShell window, run the following command:
    ```bash
    choco install fvm
5. **Verify  FVM**  
    Run the following command to verify that FVM is installed:
    ```bash
    fvm --version
5. **Installed SDK**  
    Run the following command to install:
    ```bash
    fvm install 3.24.1
5. **Used SDK**  
    Run the following command to use sdk in project:
    ```bash
    fvm use 3.24.1
6. **Install Dependencies**  
    Navigate to the project directory and run the following command to install the required dependencies:
    ```bash
    flutter pub get
7. **Set Up NewsAPI Key**  
    - Go to NewsAPI and create an account to get your API key.
    - Replace the apiKey in AppConstant.dart with your own API key.
    - Example:
    ```bash
    static const String getTrendingNews =
   "https://newsapi.org/v2/everything?q=tesla&from=2024-12-04&sortBy=publishedAt&apiKey=YOUR_API_KEY"


8. **Run The Application**  
    ```bash
    flutter run
## Folder Structure
    lib/
    ├── controllers/  # Contains the logic for handling user inputs and updating the view.
    ├── models/       # Contains the data models and business logic for the app.
    ├── res/          # Contains assets such as images, icons, and other resources.
    ├── services/     # Contains the services responsible for interacting with APIs or data sources.
    ├── utils/        # Contains utility classes and helper functions.
    ├── views/        # Contains UI components and pages for displaying data.
    ├── main.dart     # Entry point of the application, where the app is initialized.
   

## Architecture
- This application uses the MVC (Model-View-Controller) architecture, which separates the business logic from the UI, providing better maintainability and scalability.
- Model: Handles the data and business logic. It includes API services, data models, and other core functionalities.
- View: The UI components that display the data. It includes pages, widgets, and layouts.
- Controller: Acts as the mediator between the Model and the View. It processes user inputs and updates the view by modifying the data.

## GetX: State Management Overview
- In this app, GetX is used as the state management solution. GetX is a reactive state management library that allows us to handle complex states in a simple and efficient manner. Here's how it works in the app:
- Reactive State: Variables wrapped with Rx (like RxInt, RxList, etc.) are observed by the UI. Any change in these variables will automatically trigger a UI rebuild.
- Dependency Injection: GetX handles dependency injection, which means services (like the API service) are injected into the controllers easily, reducing boilerplate code.
- Routing: GetX simplifies routing with methods like Get.to() and Get.offAll(), making navigation between screens smooth and efficient.
- Performance: GetX is designed to minimize unnecessary widget rebuilds, ensuring the app performs optimally even when dealing with large datasets.

## Third Party Library Used (Dependencies)
**get: ^4.6.6**
- GetX is a powerful and efficient state management solution for Flutter applications. It simplifies route management, state management, and dependency injection, offering a minimalistic API for building reactive apps.


**google_fonts: ^6.2.1**
- Google Fonts allows easy integration of over 1000 fonts from Google’s font library, ensuring beautiful and consistent typography across the application.

**carousel_slider: ^5.0.0**
- Carousel Slider is used to create a slider component for displaying a series of items in a scrollable, swipeable fashion, perfect for image carousels or similar dynamic content displays.

**smooth_page_indicator: ^1.2.0+3**
- This package provides smooth and customizable page indicators for carousels, page views, or any other component that requires a visual cue for the current page or item.

**dio: ^5.7.0**
- Dio is a robust HTTP client for Flutter, making it easier to handle API requests. It supports features like request cancellation, file downloading, and network interceptors.

**cached_network_image: ^3.4.1**
- This package helps with loading and caching images from the network efficiently, reducing network usage and improving load times by saving images locally.

**logger: ^2.5.0**
- Logger is a logging utility for Flutter. It provides easy-to-use methods for logging messages, making it simpler to track errors and application flow during development.

**loading_animation_widget: ^1.3.0**
- This package provides multiple types of animated loading widgets to enhance the user experience during loading states by showing animated progress indicators.

**webview_flutter: ^4.10.0**
- WebView Flutter is a plugin that allows embedding web content (HTML pages, websites) inside a Flutter application, enabling hybrid apps and rich web content integration.

**flutter_svg: ^2.0.16**
- Flutter SVG enables the use of Scalable Vector Graphics (SVG) images in your Flutter app, providing high-quality vector images that scale well on all screen sizes.

**connectivity_plus: ^6.1.1**
Connectivity Plus provides a way to check the device's network status and connectivity, ensuring that the app can react to connectivity changes (e.g., switching from Wi-Fi to mobile data).

**toastification: ^2.3.0**
- Toastification is a package that allows for showing customizable toast messages, providing a simple way to display notifications to users without disrupting the app’s flow.

**shared_preferences: ^2.3.5**
- Shared Preferences is a simple key-value storage solution for storing small amounts of data locally, such as user preferences, settings, or login states.

**cupertino_icons: ^1.0.8**
- This package provides iOS-style icons for Flutter applications, enabling a consistent design language that aligns with iOS platform guidelines.
