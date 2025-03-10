// lib/services/service_initializer.dart
import 'package:julelotteri_frontend/services/database_service.dart';

import 'internet_service.dart';

Future<void> initializeServices() async {
  DatabaseService.initialize();
  await InternetService.initialize();
}
