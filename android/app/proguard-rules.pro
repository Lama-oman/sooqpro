# Add project specific ProGuard rules here.
# By default, the flags in this file are appended to flags specified
# in /usr/local/Cellar/proguard/libexec/proguard-android.txt

# Flutter
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }

# Supabase
-keep class io.supabase.** { *; }
-keep class com.github.jeziellago.** { *; }

# Keep native methods
-keepclasseswithmembernames class * {
    native <methods>;
}

# Keep generic signature of Call, ResponseType, Response
-keepattributes Signature

# Keep class members for R8/ProGuard
-keepclassmembers class * {
    @com.google.gson.annotations.SerializedName <fields>;
}
