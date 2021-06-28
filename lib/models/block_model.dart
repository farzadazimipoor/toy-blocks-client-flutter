import 'package:flutter_challenge/models/block_attribute_model.dart';

class BlockModel {
  String id;
  String type;
  BlockAttribute? attributes;

  BlockModel({
    required this.id,
    required this.type,
    required this.attributes,
  });

  factory BlockModel.fromJson(Map<String, dynamic> json) {
    return BlockModel(
      id: json['id'],
      type: json['type'],
      attributes: json['attributes'] != null
          ? BlockAttribute.fromJson(json['attributes'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    if (this.attributes != null) {
      data['attributes'] = this.attributes?.toJson();
    }
    return data;
  }
}
