import 'package:fe_test_task/fe_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets(
    'Ensure that when the app starts, [MultiProvider] widget is at the root of the app',
    (WidgetTester tester) async {
      await tester.pumpWidget(const FETestApp());

      expect(find.byType(MultiProvider), findsOneWidget);
    },
  );
}
