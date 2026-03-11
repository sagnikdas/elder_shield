# Flutter embedding and engine — required for release to work
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.embedding.** { *; }
-keep class io.flutter.plugins.** { *; }

# Keep native methods (used by Flutter engine)
-keepclasseswithmembernames class * {
    native <methods>;
}

# Common plugin reflection (adjust if a specific plugin breaks)
-keepattributes Signature
-keepattributes *Annotation*
-dontwarn io.flutter.embedding.**
