// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get welcome => 'Bienvenido a ';

  @override
  String get username => 'Nombre de Usuario';

  @override
  String get password => 'Contraseña';

  @override
  String get complete_fields => 'Por favor, completa los campos';

  @override
  String get login => 'Iniciar sesión';

  @override
  String get sing_up => 'Registrarse';

  @override
  String get loading => 'Cargando...';

  @override
  String get error_empty_username => 'El usuario no puede estar vacío';

  @override
  String get error_empty_password => 'La contraseña no puede estar vacía';

  @override
  String get error_short_password => 'La constraseña es muy corta';

  @override
  String get error_user_not_exists => 'El usuario no existe';

  @override
  String get error_invalid_credentials => 'Usuario o contraseña incorrectos';

  @override
  String get error_unexpected => 'Error desconocido';
}
