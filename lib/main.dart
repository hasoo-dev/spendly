import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:saypay/app/spendly.dart';
import 'package:device_preview/device_preview.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://lfezgctmoguzljzfqrux.supabase.co',
    anonKey: 'sb_publishable_3w-cR_SmmjPo7v59CBZBvw_kbgj2WL6',
  );

  runApp(const Spendly());
  // runApp(
  //   DevicePreview(
  //     enabled: !kReleaseMode,
  //     builder: (context) => const Spendly(),
  //   ),
  // );
}
