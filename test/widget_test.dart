import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:week2_hello/main.dart';

void main() {
  testWidgets('Hello World screen and counter work', (tester) async {
    await tester.pumpWidget(const Week2HelloApp());

    expect(find.text('Hello World'), findsOneWidget);
    expect(find.text('Week 2 | Hello World'), findsOneWidget);
    expect(find.text('0'), findsOneWidget);

    await tester.tap(find.byKey(const ValueKey('incrementButton')));
    await tester.pump();

    expect(find.text('1'), findsOneWidget);

    await tester.tap(find.byKey(const ValueKey('incrementButton')));
    await tester.pump();

    expect(find.text('2'), findsOneWidget);
  });
}
