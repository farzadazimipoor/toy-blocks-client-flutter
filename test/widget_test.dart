// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_challenge/providers/nodes_provider.dart';
import 'package:flutter_challenge/screens/toys_screen.dart';
import 'package:flutter_challenge/widgets/block_widget.dart';
import 'package:flutter_challenge/widgets/node_widget.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('Verify the existence of the main nodes',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider<NodesProvider>(
        create: (_) => NodesProvider(),
        child: const MediaQuery(
          data: MediaQueryData(),
          child: MaterialApp(
            home: ToysScreen(),
          ),
        ),
      ),
    );
    expect(find.text('Nodes'), findsOneWidget);
  });

  testWidgets('Verify the loading progress at the start of the app',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider<NodesProvider>(
        create: (_) => NodesProvider(),
        child: const MediaQuery(
          data: MediaQueryData(),
          child: MaterialApp(
            home: ToysScreen(),
          ),
        ),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('Verify the completion of the first call ',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider<NodesProvider>(
        create: (_) => NodesProvider(),
        child: const MediaQuery(
          data: MediaQueryData(),
          child: MaterialApp(
            home: ToysScreen(),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byType(NodeWidget), findsNWidgets(4));
  });

  testWidgets('Verify that no block widgets loaded when app start ',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          ChangeNotifierProvider<NodesProvider>(
            create: (_) => NodesProvider(),
            child: const MediaQuery(
              data: MediaQueryData(),
              child: MaterialApp(
                home: ToysScreen(),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();

        expect(find.byType(BlockWidget), findsNothing);
      });

  testWidgets('Verify that by expand last node, not any block will be found ',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          ChangeNotifierProvider<NodesProvider>(
            create: (_) => NodesProvider(),
            child: const MediaQuery(
              data: MediaQueryData(),
              child: MaterialApp(
                home: ToysScreen(),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();

        var totalNodes = tester.widgetList(find.byType(ExpandIcon)).length;

        expect(totalNodes, 4);

        await tester.tap(find.byType(ExpandIcon).last);

        await tester.pumpAndSettle();

        expect(find.byType(BlockWidget), findsNothing);
      });

  //TODO: Implement test cases related to the blocks implementation
}
