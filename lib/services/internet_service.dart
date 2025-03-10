import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

// Static class to track internet status and always have a cached state.
class InternetService {
  static bool _connection = false;
  static bool _initialized = false;

  static Future<void> initialize() async {
    // make sure theres no redundant listeners.
    if (_initialized) return;
    _connection = await InternetConnection().hasInternetAccess;

    InternetConnection().onStatusChange.listen((InternetStatus status) {
      _connection = (status == InternetStatus.connected);
    });

    _initialized = true;
  }

  static bool get hasConnection => _connection;
}
