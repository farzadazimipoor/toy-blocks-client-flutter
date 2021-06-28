import 'package:flutter/material.dart';
import 'package:flutter_challenge/models/block_model.dart';

class BlockWidget extends StatelessWidget {
  final BlockModel block;

  BlockWidget({
    Key? key,
    required this.block,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.grey.withOpacity(0.4),
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(vertical: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            block.attributes!.index.toString(),
            style: TextStyle(color: Colors.blue),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            block.attributes!.data.toString(),
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
