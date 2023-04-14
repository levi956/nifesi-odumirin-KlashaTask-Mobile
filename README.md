# Klasha Mobile Engineer Assessment


## Installation
1. Make sure you have [Flutter](https://flutter.dev/docs/get-started/install) and its dependencies installed on your device.
2. Clone the repository: `git clone https://github.com/yourusername/my-app.git`
3. Go to the project directory: `cd my-app`
4. Run `flutter pub get` to install the dependencies.
5. Run `flutter run` to start the app on an emulator or connected device.


## User Interface
The application features the principle "Component Driven Design" which enables a clean and user-friendly interface, with widgets broken down into several components, following the DRY (Don't repeat yourself) principle to enable easier maitenance and usabiliy.

## Technical details
- The application is built with Flutter, using the Dart programming language.
- The major state management used is "Riverpod" & "Flutter Hooks".
- The app intends to follows functional, object oriented and imperative programming paradigms.
- It communicates with REST APIs to perform functionality.



## Folder Structure

* [app/](./lib/app)
  * [modules/](./lib/app/modules)
    * [ingredients/](./lib/app/modules/ingredients)
    * [recipes/](./lib/app/modules/recipes)
  * [shared/](./lib/app/shared)
    * [classes/](./lib/app/shared/classes)
    * [constants/](./lib/app/shared/constants)
    * [extensions/](./lib/app/shared/extensions)
    * [pages/](./lib/app/shared/pages)
    * [widgets/](./lib/app/shared/widgets)
* [core/](./lib/core)
  * [config/](./lib/core/config)
    * [device/](./lib/core/config/device)
  * [connection/](./lib/core/connection)
    * [handler.dart](./lib/core/connection/handler.dart)
  * [navigation/](./lib/core/navigation)
    * [navigator.dart](./lib/core/navigation/navigator.dart)
  * [setups/](./lib/core/setups)
    * [setups.dart](./lib/core/setups/setups.dart)
* [main.dart](./lib/main.dart)


## test directory
The `test` directory contains all the test files for the app. It's further organized in the following subdirectories
- `widget_test`: contains test files for widget testing
- `unit_test`: contains test files for unit testing


## Running Tests 

To run all unit tests use the following command:

```flutter test```
