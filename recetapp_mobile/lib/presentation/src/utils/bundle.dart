import 'dart:collection';

/// A class that provides a flexible key-value storage mechanism.
/// It allows storing and retrieving values of various types.
class Bundle {
  // Use a private HashMap for internal storage
  final Map<String, dynamic> _entries = HashMap();

  /// Stores a value of type T with the given key.
  ///
  /// @param key The key to associate with the value.
  /// @param value The value to store.
  void putValue<T>(String key, T value) => _entries[key] = value;

  /// Retrieves a value of type T for the given key.
  ///
  /// @param key The key to look up.
  /// @return The value associated with the key, cast to type T.
  /// @throws TypeError if the stored value is not of type T.
  T getValue<T>(String key) => _entries[key] as T;

  /// Retrieves a value of type T for the given key, or returns a default value if not found.
  ///
  /// @param key The key to look up.
  /// @param defaultValue The value to return if the key is not found or if casting fails.
  /// @return The value associated with the key, or the default value.
  T getValueOrDefault<T>(String key, {required T defaultValue}) {
    T value;
    try {
      value = getValue<T>(key);
    } catch (e) {
      value = defaultValue;
    }
    return value;
  }

  /// Retrieves a boolean value for the given key.
  ///
  /// @param key The key to look up.
  /// @return The boolean value associated with the key, or null if not found or not a boolean.
  bool? getBoolValue(String key) => _entries[key] as bool?;

  /// Retrieves an integer value for the given key.
  ///
  /// @param key The key to look up.
  /// @return The integer value associated with the key, or null if not found or not an integer.
  int? getIntValue(String key) => _entries[key] as int?;

  /// Retrieves a string value for the given key.
  ///
  /// @param key The key to look up.
  /// @return The string value associated with the key, or null if not found or not a string.
  String? getStringValue(String key) => _entries[key] as String?;

  /// Retrieves a boolean value for the given key, or returns a default value if not found.
  ///
  /// @param key The key to look up.
  /// @param defaultValue The value to return if the key is not found or if the value is not a boolean.
  /// @return The boolean value associated with the key, or the default value.
  bool getBoolValueOrDefault(String key, {required bool defaultValue}) => _entries[key] as bool? ?? defaultValue;

  /// Retrieves a list of strings for the given key.
  ///
  /// @param key The key to look up.
  /// @return The list of strings associated with the key, or null if not found or not a list of strings.
  List<String>? getStringListValue(String key) => _entries[key] as List<String>?;

  /// Retrieves a list of doubles for the given key.
  ///
  /// @param key The key to look up.
  /// @return The list of doubles associated with the key, or null if not found or not a list of doubles.
  List<double>? getDoubleListValue(String key) => _entries[key] as List<double>?;
}
