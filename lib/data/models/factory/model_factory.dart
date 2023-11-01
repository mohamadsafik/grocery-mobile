import 'dart:developer';
import 'package:flutter_cubit/data/models/base/source.dart';

import '../base/article.dart';
import '../base/info_medical_checkup.dart';

Object factoryModel(String type, {Map<String, dynamic>? json}) {
  switch (type) {
    case 'InfoMedicalCheckup':
      return json != null
          ? InfoMedicalCheckup.fromJson(json)
          : InfoMedicalCheckup();
    case 'Article':
      return json != null ? Article.fromJson(json) : Article();
    case 'Source':
      return json != null ? Source.fromJson(json) : Source();
    case 'dynamic':
      return json != null ? DefaultModel(json) : DefaultModel({});
    default:
      throw '$type factory unimplemented!';
  }
}

abstract class ModelFactory {
  static Object fromJson(Type type, Map<String, dynamic> json) {
    String strType = type.toString().trim().replaceAll("?", "");
    return factoryModel(strType, json: json);
  }
}

class DefaultModel {
  dynamic result;
  String? warning;

  DefaultModel(this.result, {this.warning}) {
    log('$warning');
  }
}
