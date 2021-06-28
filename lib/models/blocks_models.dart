import 'package:flutter_challenge/models/block_model.dart';

class Block {
  List<BlockModel>? data;

  Block({this.data});

  factory Block.fromJson(Map<String, dynamic> json) {
    return Block(
      data: json['data'] != null
          ? (json['data'] as List).map((i) => BlockModel.fromJson(i)).toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}
