class BlockAttribute {
  int index;
  int timestamp;
  String data;
  String previous_hash;
  String hash;

  BlockAttribute({
    required this.index,
    required this.timestamp,
    required this.data,
    required this.previous_hash,
    required this.hash,
  });

  factory BlockAttribute.fromJson(Map<String, dynamic> json) {
    return BlockAttribute(
      index: json['index'],
      timestamp: json['timestamp'],
      data: json['data'],
      previous_hash: json['previous-hash'],
      hash: json['hash'],
    );
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['index'] = this.index;
    data['timestamp'] = this.timestamp;
    data['data'] = this.data;
    data['previous-hash'] = this.previous_hash;
    data['hash'] = this.hash;
    return data;
  }
}
