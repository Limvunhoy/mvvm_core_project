# mvvm_core_project

This README provides an overview of the recommended folder structure for a Flutter project. A well-organized folder structure can help improve code maintainability and collaboration among team members.

## Note

This project uses Flutter version `3.13.1` and Dart version `3.1.0`

## Getting Started

Follow these steps to get started

**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/Limvunhoy/mvvm_core_project.git
```

**Step 2:**

```
cd mvvm_core_project
```

**Step 3:**

```
flutter pub get
```

**Step 4:**

You can run all the tests in the `test` folder

## Project Structure

Here is the core folder structure

```
flutter-app/
|- android
|- build
|- ios
|- lib
|- test
```

Here is the Flutter `lib` folder structure

```
lib/
|- common/
|- constraints/
|- core/
|- data/
|- domain/
|- presentation/
|- presentation/
|- utilities/
|- main.dart
```

### Common

The `common` directory typically contains common widgets and components that are reused across different parts of your application.

```
common/
|- app_logo.dart
|- base_button.dart
|- base_view.dart
|- platform_widget.dart
|- ....
```

### Constants

The `constants` directory is where you define constants, configurations, and constraints used throughout your application.

```
constants/
|- app_color.dart
|- end_points.dart
|- gap.dart
|- ...
```

### Core

The `core` directory typically contains core functionalities and services essential for your application's operation.

```
core/
|- app_route.dart
|- locator.dart # dependency injection
|- unknown_route.dart
|- ...
```

### Utilities

The `utilities` directory houses utility classes, extensions, and helper functions that can be used throughout the application to simplify common tasks and improve code reusability.

```
utilities/
|- extension
|- api_error.dart
|- deboucer.dart
|- app_preferences.dart
|- ...
```

### Data

The `data` directory is responsible for handling API and data-related operations in your Flutter application.

The `model` directory contains data models and related classes used to represent data from API response.

The `repository` directory is responsible for abstracting the data sources and providing a clean and consistent API for fetching and storing data. Each repository corresponds to a specific domain or feature within your application.

The `service` directory contains service classes responsible for making network requests to APIs or performing data-related operations. These services encapsulate the communication with external data sources.

```
data/
|- model/
    |- user/
        |- user_response.dart
    |- api_error.dart
    |- base_api_response.dart
    |- decodable.dart
    |- ...
|- repository/
    |- auth/
        |- login_repository_impl.dart
        |- ...
|- service/
    |- base_service.dart
    |- auth/
        |- login_service.dart
    |- ...
```

### Domain

The `domain` directory is a crucial part of your application. It focuses on defining core business logic, data models, and interactions with external systems cleanly and abstractly.

The `model` directory within the `domain` folder contains data models that represent core business entities or objects. These models typically do not contain any implementation details related to data storage or APIs. Instead, they define the structure of essential data objects in your application.

The `repository` directory within the `domain` folder defines repository interfaces. These interfaces act as contracts that specify how data should be retrieved and stored. They abstract away the details of data sources (such as databases or APIs) and provide a clean API for interacting with data.

```
domain/
|- model/
    |- user/
        |- user_entity.dart
    |- ...
|- repository/
    |- auth/
        |- login_repository.dart
    |- ...
|- use_case/
    |- auth/
        |- auth_use_case.dart
    |- ...
```

### Presentation

The `presentation` layer is responsible for the user interface (UI) or your Flutter application. It includes views, view models, and view states, following the Model-View-ViewModel (MVVM) architecture.

The `view` directory contains Flutter widgets and UI components that define the visual representation of your application. Each folder inside `view` typically corresponds to a specific screen or view within your app.

The `viewmodel` directory contains view models that handle the business logic and state management for each screen. ViewModel classes connect UI (views) with the underlying data (domain) and provide a way to interact with the data and perform actions.

The `viewstate` directory contains classes that represent the state of UI. Each screen typically has its own associated view state. These view state classes are used by view models to communicate changes in the UI state to the view.

```
presentation/
|- view/
    |- login/
        |- login_view.dart
    |- home/
        |- home_view.dart
    |- ...
|- viewmodel/
    |- auth/
        |- login_viewmodel.dart
    |- home/
        |- home_viewmodel.dart
    |- ...
|- viewstate/
    |- auth/
        |- login_view_state.dart
    |- ...
```

## Conclusion

A well-structured folder hierarchy is crucial for maintaining a clean and organized Flutter project. The structure outlined in this README helps streamline development, improve code maintainability, and enhance collaboration among team members. To recap:

- **Common**: Houses common widgets and components for consistent UI elements.
- **Constraints (Constants)**: Defines constants, configurations, and constraints for the app.
- **Core**: Manages essential app logic, such as routing and dependency injection.
- **Data**: Handles API and data-related operations, including models, repositories, and services.
- **Domain**: Defines core business logic, data models, repositories, and use cases.
- **Presentation**: Manages the UI layer, including views, view models, and view states.

By following this organized structure, you can focus on developing features and functionality without getting lost in the complexities of project organization. This also makes it easier for new team members to onboard and contribute effectively.

Feel free to customize this folder structure to match the specific requirements of your Flutter project, but remember that a well-thought-out structure goes a long way in ensuring a smooth development process and long-term project sustainability.

I will be happy to answer any questions that you may have on this approach, and if you want to lend a hand with the boilerplate then please feel free to submit an issue and/or pull request 🙂

Again to note, this example can appear as over-architectured for what it is - but it is an example only. If you liked my work, don’t forget to ⭐ star the repo to show your support.
