extension StringValidator on String? {
  // 1. Email Validation
  String? validateEmail() {
    if (this == null || this!.trim().isEmpty) {
      return 'Email address is required';
    }
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!emailRegExp.hasMatch(this!)) {
      return 'Please enter a valid email address';
    }
    return null; // Valid
  }

  // 2. Full Name Validation
  String? validateFullName() {
    if (this == null || this!.trim().isEmpty) {
      return 'Full name is required';
    }
    if (this!.trim().split(' ').length < 2) {
      return 'Please enter your first and last name';
    }
    return null; // Valid
  }

  // 3. Password Validation
  String? validatePassword() {
    if (this == null || this!.trim().isEmpty) {
      return 'Password is required';
    }
    if (this!.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    // Optional: Add complexity check
    if (!RegExp(r'(?=.*[a-z])(?=.*[0-9])').hasMatch(this!)) {
      return 'Password must include at least one letter and one number';
    }
    return null; // Valid
  }
}