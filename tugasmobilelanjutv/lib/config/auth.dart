import 'package:tugasmobilelanjutv/app/models/user.dart';

Map<String, dynamic> authConfig = {
  'guards': {
    'default': {
      'provider': User(),
    }
  }
};
