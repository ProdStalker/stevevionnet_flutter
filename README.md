# stevevionnet

Steve Vionnet's website

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


# Refresh the project

flutter clean
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
cd .

# Deploy ios

flutter clean
rm -rf ios/Pods ios/Runner.xcworkspaceflutter  
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter build ipa --release --obfuscate --split-debug-info=build/app/outputs/symbols

# Launch without cable
flutter run --release


# Icons

flutter clean
rm -rf ios/Pods ios/Runner.xcworkspaceflutter  
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs

flutter pub get
flutter pub run flutter_launcher_icons
dart run flutter_native_splash:create

# WITHOUT CABLE
flutter clean
rm -rf ios/Pods ios/Runner.xcworkspaceflutter  
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter run --release