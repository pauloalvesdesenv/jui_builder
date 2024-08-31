import 'dart:developer';

import 'package:jsonata/jsonata.dart';
import 'package:jui_builder/src/domain/utils/strings.dart';
import 'package:rfc_6901/rfc_6901.dart';

class JuiStorage {
  static Map<String, dynamic> storage = {'anotherstore': {}};

  static String get(String store, String key) {
    try {
      final pointer = JsonPointer('/$store/$key');
      return pointer.read(storage).toString();
    } catch (e) {
      log(e.toString());
      return empty;
    }
  }

  static String set(String store, String path, String value) {
    try {
      Jsonata jsonata = Jsonata(store);
      jsonata.data = storage[store];
      return jsonata.data;
    } catch (e) {
      log(e.toString());
      return empty;
    }
  }
}
