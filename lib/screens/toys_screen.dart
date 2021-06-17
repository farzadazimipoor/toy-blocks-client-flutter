import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_challenge/models/node_element.dart';
import 'package:flutter_challenge/models/node_model.dart';
import 'package:flutter_challenge/providers/nodes_provider.dart';
import 'package:flutter_challenge/widgets/node_widget.dart';
import 'package:provider/provider.dart';

class ToysScreen extends StatefulWidget {
  const ToysScreen({Key? key}) : super(key: key);

  @override
  _ToysScreenState createState() => _ToysScreenState();
}

class _ToysScreenState extends State<ToysScreen> {
  Future<List<Node>> _loadInitialNodes() async {
    NodesProvider nodesProvider =
        Provider.of<NodesProvider>(context, listen: false);
    return await nodesProvider.getInitialNodes();
  }

  Widget _buildBlankBlockTile() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Blank Block',
        textAlign: TextAlign.left,
      ),
    );
  }

  List<NodeElement> _items = [];

  void _updateItems(List<Node>? nodes) {
    if (_items.isEmpty) {
      _items = nodes!.map((Node item) {
        return NodeElement(
          isExpanded: false, // isExpanded ?
          node: item,
          body: _buildBlankBlockTile(), // body
        );
      }).toList();
    }
  }

  Widget _generateNodesWidget() {
    return ListView(
      children: [
        Padding(
            padding: const EdgeInsets.all(10.0),
            child: ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded) {
                setState(() {
                  _items[index].isExpanded = !_items[index].isExpanded;
                  //TODO: Implement the blocks widget
                });
              },
              children: _items.map((NodeElement item) {
                return ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: NodeWidget(node: item.node),
                    );
                  },
                  isExpanded: item.isExpanded,
                  body: item.body,
                );
              }).toList(),
            ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Nodes",
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: FutureBuilder(
        future: _loadInitialNodes(),
        builder: (context, AsyncSnapshot<List<Node>> snapshot) {
          if (snapshot.hasData) {
            _updateItems(snapshot.data);
            return _generateNodesWidget();
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
