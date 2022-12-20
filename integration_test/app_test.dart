import 'package:flutter/material.dart';
import 'package:flutter_integration_test_groups_bug/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Counter', () {
    testWidgets(
      'is incremented when plus button is tapped',
      (WidgetTester tester) async {
        await tester.pumpWidget(const MyApp());

        expect(find.text('0'), findsOneWidget);
        expect(find.text('1'), findsNothing);

        await tester.pump(const Duration(seconds: 3));

        await tester.tap(find.byIcon(Icons.add));
        await tester.pump();

        await tester.pump(const Duration(seconds: 3));

        expect(find.text('0'), findsNothing);
        expect(find.text('1'), findsOneWidget);
      },
    );

    testWidgets(
      'is decremented when minus button is tapped',
      (WidgetTester tester) async {
        await tester.pumpWidget(const MyApp());

        expect(find.text('0'), findsOneWidget);
        expect(find.text('-1'), findsNothing);

        await tester.pump(const Duration(seconds: 3));

        await tester.tap(find.byIcon(Icons.remove));
        await tester.pump();

        await tester.pump(const Duration(seconds: 3));

        expect(find.text('0'), findsNothing);
        expect(find.text('-1'), findsOneWidget);
      },
    );
  });
}
