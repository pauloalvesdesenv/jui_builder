import 'dart:convert';

import 'package:jui_builder/src/data/entities/framework_meta_data_entity.dart';

class FrameworkMetaDataResponseModel extends FrameworkMetaDataResponseEntity {
  FrameworkMetaDataResponseModel({required super.url});

  factory FrameworkMetaDataResponseModel.fromMap(Map<String, dynamic> map) {
    return FrameworkMetaDataResponseModel(url: map['url']);
  }

  Map<String, dynamic> toMap() {
    return {
      'url': url,
    };
  }

  String toJson() => jsonEncode(toMap());
}
