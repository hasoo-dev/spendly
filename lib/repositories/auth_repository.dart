import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sup;
import '../core/error/exceptions.dart';
import '../core/utils/logger/app_logger.dart';
import '../model/user/user_model.dart';

class AuthRepository {
  final sup.SupabaseClient _supabase = sup.Supabase.instance.client;

  // IMPORTANT: For Android, you MUST provide the 'Web Client ID' fromyour Google Cloud Console.
  // This is required for Supabase to verify the Google Identity Token.
  // IMPORTANT: Paste your WEB CLIENT ID from the Google Cloud Console here.
  // In your screenshot, it's the one named "spendly web" (starting with 653560953776-vc25...).
  static const String _webClientId =
      '457959762316-nvuh52avm93nenn44t8eumebr38bn59g.apps.googleusercontent.com';

  /// Sign in with Google
  Future<UserModel> signInWithGoogle() async {
    try {
      AppLogger.auth('Initiating Google Sign-In flow');

      // 1. Trigger the native Google Sign-In
      final GoogleSignIn googleSignIn = GoogleSignIn(
        serverClientId: _webClientId,
      );
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        throw AuthException('Google Sign-In was cancelled by user');
      }

      // 2. Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final accessToken = googleAuth.accessToken;
      final idToken = googleAuth.idToken;

      if (idToken == null) {
        throw AuthException('No ID Token found from Google');
      }

      // 3. Authenticate with Supabase using the ID Token
      final sup.AuthResponse response = await _supabase.auth.signInWithIdToken(
        provider: sup.OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken,
      );

      if (response.user == null) {
        throw AuthException(
          'Supabase authentication failed after Google Sign-In',
        );
      }

      final user = UserModel(
        id: response.user!.id,
        email: response.user!.email!,
        fullName:
            response.user!.userMetadata?['full_name'] ?? googleUser.displayName,
        avatarUrl:
            response.user!.userMetadata?['avatar_url'] ?? googleUser.photoUrl,
      );

      AppLogger.success(
        'Google Sign-In successful for: ${user.email}',
        tag: 'AUTH',
      );
      return user;
    } on sup.AuthException catch (e) {
      AppLogger.error(
        'Supabase Auth error during Google Sign-In',
        error: e,
        tag: 'AUTH',
      );
      throw AuthException(e.message);
    } catch (e) {
      AppLogger.error(
        'Unexpected error during Google Sign-In',
        error: e,
        tag: 'AUTH',
      );
      throw AuthException(e.toString());
    }
  }

  /// Sign in with email and password
  Future<UserModel> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      AppLogger.auth('Attempting sign-in for: $email');

      final sup.AuthResponse response = await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.user == null) {
        throw AuthException('Sign-in failed: User is null');
      }

      final user = UserModel(
        id: response.user!.id,
        email: response.user!.email!,
        fullName: response.user!.userMetadata?['full_name'],
      );

      AppLogger.success('Sign-in successful for: $email', tag: 'AUTH');
      return user;
    } on sup.AuthException catch (e) {
      AppLogger.error(
        'Supabase Auth error during sign-in',
        error: e,
        tag: 'AUTH',
      );
      throw AuthException(e.message);
    } catch (e) {
      AppLogger.error('Unexpected error during sign-in', error: e, tag: 'AUTH');
      throw AuthException(e.toString());
    }
  }

  /// Sign up with email, password, and full name
  Future<UserModel> signUpWithEmail({
    required String email,
    required String password,
    required String fullName,
  }) async {
    try {
      AppLogger.auth('Attempting sign-up for: $email');

      final sup.AuthResponse response = await _supabase.auth.signUp(
        email: email,
        password: password,
        data: {'full_name': fullName},
      );

      if (response.user == null) {
        throw AuthException('Sign-up failed: User is null');
      }

      final user = UserModel(
        id: response.user!.id,
        email: response.user!.email!,
        fullName: fullName,
      );

      AppLogger.success('Sign-up successful for: $email', tag: 'AUTH');
      return user;
    } on sup.AuthException catch (e) {
      AppLogger.error(
        'Supabase Auth error during sign-up',
        error: e,
        tag: 'AUTH',
      );
      throw AuthException(e.message);
    } catch (e) {
      AppLogger.error('Unexpected error during sign-up', error: e, tag: 'AUTH');
      throw AuthException(e.toString());
    }
  }

  /// Send password reset email
  Future<void> resetPasswordForEmail({required String email}) async {
    try {
      AppLogger.auth('Attempting password reset for: $email');

      await _supabase.auth.resetPasswordForEmail(email);

      AppLogger.success('Password reset email sent to: $email', tag: 'AUTH');
    } on sup.AuthException catch (e) {
      AppLogger.error(
        'Supabase Auth error during password reset',
        error: e,
        tag: 'AUTH',
      );
      if (e.statusCode == '429' ||
          e.message.toLowerCase().contains('rate limit')) {
        throw AuthException(
          'Too many requests. Please wait a few minutes before trying again.',
          code: 'rate_limit_exceeded',
        );
      }
      throw AuthException(e.message);
    } catch (e) {
      AppLogger.error(
        'Unexpected error during password reset',
        error: e,
        tag: 'AUTH',
      );
      throw AuthException(e.toString());
    }
  }

  /// Sign out
  Future<void> signOut() async {
    try {
      AppLogger.auth('Attempting sign-out');
      await _supabase.auth.signOut();
      AppLogger.success('Sign-out successful', tag: 'AUTH');
    } catch (e) {
      AppLogger.error('Error during sign-out', error: e, tag: 'AUTH');
      throw AuthException('Logout failed: $e');
    }
  }

  /// Upload profile image to Supabase Storage and update user metadata
  // Future<String> uploadProfileImage(dynamic file, String userId) async {
  //   try {
  //     AppLogger.auth('Attempting to upload profile image for user: $userId');

  //     final String fileExt = file.path.split('.').last;
  //     final String fileName =
  //         '${DateTime.now().millisecondsSinceEpoch}.$fileExt';

  //     // ✅ Path starts with userId as the first folder
  //     final String path = '$userId/$fileName';

  //     await _supabase.storage
  //         .from('profile_image')
  //         .upload(
  //           path, // = 'userId/timestamp.jpg'  ✅
  //           file,
  //           fileOptions: const sup.FileOptions(
  //             cacheControl: '3600',
  //             upsert: true,
  //           ),
  //         );

  //     final String publicUrl = _supabase.storage
  //         .from('profile_image')
  //         .getPublicUrl(path);

  //     await _supabase.auth.updateUser(
  //       sup.UserAttributes(data: {'avatar_url': publicUrl}),
  //     );

  //     AppLogger.success('Profile image uploaded: $publicUrl', tag: 'AUTH');
  //     return publicUrl;
  //   } on sup.StorageException catch (e) {
  //     AppLogger.error(
  //       'Storage error uploading profile image',
  //       error: e,
  //       tag: 'AUTH',
  //     );
  //     throw AuthException(e.message);
  //   } catch (e) {
  //     AppLogger.error(
  //       'Unexpected error uploading profile image',
  //       error: e,
  //       tag: 'AUTH',
  //     );
  //     throw AuthException(e.toString());
  //   }
  // }

  /// Get current user session
  sup.User? get currentUser => _supabase.auth.currentUser;

  /// Check if user is logged in
  bool get isAuthenticated => _supabase.auth.currentSession != null;

  /// Update user password
  Future<void> updatePassword(String newPassword) async {
    try {
      AppLogger.auth('Attempting to update password for current user');
      
      await _supabase.auth.updateUser(
        sup.UserAttributes(
          password: newPassword,
        ),
      );
      
      AppLogger.success('Password updated successfully', tag: 'AUTH');
    } on sup.AuthException catch (e) {
      AppLogger.error(
        'Supabase Auth error during password update',
        error: e,
        tag: 'AUTH',
      );
      throw AuthException(e.message);
    } catch (e) {
      AppLogger.error(
        'Unexpected error during password update',
        error: e,
        tag: 'AUTH',
      );
      throw AuthException(e.toString());
    }
  }
}
