import 'package:supabase_flutter/supabase_flutter.dart' as sup;

import '../core/error/exceptions.dart';
import '../core/utils/logger/app_logger.dart';

class ProfileRepositry {
  final sup.SupabaseClient supabase = sup.Supabase.instance.client;
  Future<String> uploadProfileImage(dynamic file, String userId) async {
    try {
      AppLogger.auth('Attempting to upload profile image for user: $userId');

      final String fileExt = file.path.split('.').last;
      final String fileName =
          '${DateTime.now().millisecondsSinceEpoch}.$fileExt';

      // ✅ Path starts with userId as the first folder
      final String path = '$userId/$fileName';

      await supabase.storage
          .from('profile_image')
          .upload(
            path, // = 'userId/timestamp.jpg'  ✅
            file,
            fileOptions: const sup.FileOptions(
              cacheControl: '3600',
              upsert: true,
            ),
          );

      final String publicUrl = supabase.storage
          .from('profile_image')
          .getPublicUrl(path);

      await supabase.auth.updateUser(
        sup.UserAttributes(data: {'avatar_url': publicUrl}),
      );

      AppLogger.success('Profile image uploaded: $publicUrl', tag: 'AUTH');
      return publicUrl;
    } on sup.StorageException catch (e) {
      AppLogger.error(
        'Storage error uploading profile image',
        error: e,
        tag: 'AUTH',
      );
      throw AuthException(e.message);
    } catch (e) {
      AppLogger.error(
        'Unexpected error uploading profile image',
        error: e,
        tag: 'AUTH',
      );
      throw AuthException(e.toString());
    }
  }
}
