/// A utility class for validating form inputs in the order management system.
/// Provides static methods to validate various fields such as name, address, package type, etc.
class Validators {
  /// Validates the full name input.
  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Full Name is required';
    }
    return null;
  }

  /// Validates the shipping address input.
  static String? validateShippingAddress(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Shipping Address is required';
    }
    return null;
  }

  /// Validates the package type input.
  static String? validatePackageType(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Package Type is required';
    }
    return null;
  }

  /// Validates the weight input.
  /// Returns an error message if the value is null or empty.
  static String? validateWeight(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Weight is required';
    }

    // Optional: Add additional validation for numeric weight
    final weight = double.tryParse(value);
    if (weight == null || weight <= 0) {
      return 'Weight must be a positive number';
    }

    return null;
  }

  /// Validates the card number input.
  static String? validateCardNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Card Number is required';
    }

    // Optional: Add additional validation for card number format
    if (value.length != 16 || !RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Card Number must be 16 digits';
    }

    return null;
  }

  /// Validates the payment method input.
  static String? validatePaymentMethod(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Payment Method is required';
    }
    return null;
  }
}
