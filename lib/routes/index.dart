import 'package:night_read/routes/home.dart';
import 'package:night_read/routes/login.dart';
import 'package:night_read/routes/registry.dart';

final routes = {
  '/': (context) => MyHomePage(),
  'login': (context) => Login(),
  'registry': (context) => Registry()
};
