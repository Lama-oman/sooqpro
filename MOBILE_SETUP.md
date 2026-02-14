# SooqPro Mobile Setup Guide

## Overview
SooqPro is configured for both Android and iOS deployment with full mobile support.

## Prerequisites
- Flutter SDK 3.0+
- Android Studio (for Android builds)
- Xcode 14+ (for iOS builds)
- Supabase account configured

## Environment Setup

1. **Copy environment file:**
   ```bash
   cp .env.example .env
   ```

2. **Update .env with your credentials:**
   ```
   SUPABASE_URL=https://exnrrpkrtdbxquzgluhn.supabase.co
   SUPABASE_ANON_KEY=your_anon_key_here
   ADMIN_PASSWORD=your_admin_password
   ```

## Android Build

### Debug Build
```bash
flutter build apk --debug
```

### Release Build
```bash
flutter build apk --release
flutter build appbundle --release  # For Play Store
```

### Output Locations
- APK: `build/app/outputs/flutter-apk/app-release.apk`
- AAB: `build/app/outputs/bundle/release/app-release.aab`

### Android Configuration Highlights
- **minSdkVersion:** 21 (Android 5.0)
- **ProGuard:** Enabled for release builds
- **Permissions:** Camera, Storage, Internet, Phone
- **Deep Linking:** Configured for `sooqpro://` and `https://sooqpro-oman.surge.sh`

## iOS Build

### Prerequisites
- macOS with Xcode 14+
- Apple Developer account (for device testing)
- CocoaPods: `sudo gem install cocoapods`

### Install Dependencies
```bash
cd ios
pod install
cd ..
```

### Build Commands
```bash
# Simulator build
flutter build ios --simulator

# Device build (requires signing)
flutter build ios --release

# Archive for App Store
flutter build ipa --release
```

### iOS Configuration Highlights
- **Deployment Target:** iOS 12.0
- **Permissions:** Camera, Photo Library
- **Bundle ID:** `com.sooqpro.sooqpro`
- **Deep Linking:** Custom URL scheme `sooqpro://` + Universal Links

## Running on Device

### Android
```bash
flutter devices  # List connected devices
flutter run -d <device_id>
```

### iOS
```bash
flutter run -d ios
```

## Web Build
```bash
flutter build web --release
```

## Deployment

### Web (Surge.sh)
```bash
npm install -g surge
surge build/web sooqpro-oman.surge.sh
```

### Android (Play Store)
1. Build AAB: `flutter build appbundle`
2. Upload to Google Play Console

### iOS (App Store)
1. Build IPA: `flutter build ipa`
2. Upload via Xcode or Transporter

## Troubleshooting

### Android
- **Gradle issues:** Run `flutter clean` then rebuild
- **ProGuard errors:** Check `android/app/proguard-rules.pro`

### iOS
- **Pod install fails:** Run `cd ios && pod deintegrate && pod install`
- **Signing issues:** Open Xcode → Runner → Signing & Capabilities

## Security Notes
- All secrets are in `.env` (not committed to git)
- Admin password loaded from environment
- ProGuard/R8 enabled for Android release builds
- No hardcoded API keys in source code
