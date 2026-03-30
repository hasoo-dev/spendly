import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class CurrencyController extends GetxController {
  final _storage = const FlutterSecureStorage();
  
  // Reactive variable to hold the selected currency
  final RxString selectedCurrency = 'USD'.obs;

  @override
  void onInit() {
    super.onInit();
    _loadCurrency();
  }

  // Load from secure storage
  Future<void> _loadCurrency() async {
    try {
      final savedCurrency = await _storage.read(key: 'preferred_currency');
      if (savedCurrency != null && savedCurrency.isNotEmpty) {
        selectedCurrency.value = savedCurrency;
      }
    } catch (e) {
      // Fallback
    }
  }

  // Save to secure storage and update state
  Future<void> setCurrency(String code) async {
    selectedCurrency.value = code;
    try {
      await _storage.write(key: 'preferred_currency', value: code);
    } catch (e) {
      // Ignored
    }
  }
}
