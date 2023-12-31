# WEATHER APP

## Open Weather API Rule - Free Subscription

- Make sure you are running with no more than 60 call per minute, otherwise the api might not
  responding/respond with error, if this happening then just wait for a minute or less
- The forecasted weather hour interval would be 3 hour
- Maximum days forecasted is 5 days
- In case the Open Weather key is invalid, you could register an account yourself
  at https://openweathermap.org/ and replace api key inside root/core/const/weather_api_key.dart

## How to run the App - Android

- Make sure you are running the latest Android API(34) and Flutter SDK (3.13+)
- Run "flutter pub get" on terminal to get all plugin needed in the pubspec.yaml
- Run "dart run build_runner build --delete-conflicting-outputs" on terminal to build autogenerated
  all files needed
- Make sure you already open or start an android emulator
- Run "flutter run" to run the app

## How to build the App - Android

- Make sure you are running the latest Android (34) and Flutter SDK (3.13+)
- Run "flutter pub get" on terminal to get all plugin needed in the pubspec.yaml
- Run "dart run build_runner build --delete-conflicting-outputs" on terminal to build autogenerated
  all files needed
- Run "flutter build apk --release" to build the app
- apk file will be built inside root/build/app/outputs/flutter-apk/

## How to run the App - iOS

- Make sure you are running the latest XCode(15+) and Flutter SDK (3.13+)
- Make sure you already installed cocoapods, if not you can use this link as your
  guide https://guides.cocoapods.org/using/getting-started.html
- Run "flutter pub get" on terminal to get all plugin needed in the pubspec.yaml
- Run "dart run build_runner build --delete-conflicting-outputs" on terminal to build autogenerated
  all files needed
- Make sure you already open simulator
- Run "flutter run" to run the app
- if had any problem when running the app on iOS, try to delete Podfile.lock and run following
  command "pod install" in the terminal
- rerun the app

## How to build the App - iOS

- Currently this project is not configured to be able to build .ipa file

