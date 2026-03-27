# Flutter Wrapper
-keep class com.example.spendly.MainActivity { *; }
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }

# Supabase / Postgrest / Serialization
-keep class com.supabase.** { *; }
-keep class io.github.jan.supabase.** { *; }
-keep class kotlinx.serialization.** { *; }
-keepattributes Signature
-keepattributes *Annotation*
-keepattributes EnclosingMethod

# Google Sign-In
-keep class com.google.android.gms.auth.api.signin.** { *; }
-keep class com.google.android.gms.common.api.** { *; }

# Google Play Core (Required for some Flutter features/plugins in release mode)
-dontwarn com.google.android.play.core.**
-keep class com.google.android.play.core.** { *; }

# AndroidX / GMS General
-dontwarn com.google.android.gms.**
-dontwarn androidx.**
-keep class com.google.android.gms.** { *; }
-keep class androidx.** { *; }
