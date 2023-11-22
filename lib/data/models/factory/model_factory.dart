import 'dart:developer';
import 'package:flutter_cubit/data/models/base/user.dart';

import '../base/cart.dart';
import '../base/catalog.dart';

Object factoryModel(String type, {Map<String, dynamic>? json}) {
  switch (type) {
    case 'User':
      return json != null ? User.fromJson(json) : User();
    case 'Catalog':
      return json != null ? Catalog.fromJson(json) : Catalog();
    case 'Cart':
      return json != null ? Cart.fromJson(json) : Cart();
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
