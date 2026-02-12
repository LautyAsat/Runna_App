// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get welcome => 'Welcome to ';

  @override
  String get username => 'Username';

  @override
  String get password => 'Password';

  @override
  String get complete_fields => 'Please fill in all fields';

  @override
  String get login => 'Login';

  @override
  String get sing_up => 'Sign Up';

  @override
  String get loading => 'Loading...';

  @override
  String get error_empty_username => 'Username cannot be empty';

  @override
  String get error_empty_password => 'Password cannot be empty';

  @override
  String get error_invalid_credentials => 'Invalid username or password';
}
