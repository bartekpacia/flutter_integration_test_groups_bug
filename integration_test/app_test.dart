import 'package:convenient_test_dev/convenient_test_dev.dart';
import 'package:flutter/material.dart';
import 'package:flutter_integration_test_groups_bug/main.dart' as app;
import 'package:flutter_test/flutter_test.dart';

void main() {
  convenientTestMain(MyConvenientTestSlot(), () {
    group('Counter', () {
      testWidgets(
        'is incremented when plus button is tapped',
        (WidgetTester tester) async {
          await tester.pumpWidget(const app.MyApp());

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
          await tester.pumpWidget(const app.MyApp());

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
  });
}

class MyConvenientTestSlot extends ConvenientTestSlot {
  @override
  Future<void> appMain(AppMainExecuteMode mode) async => app.main();

  @override
  BuildContext? getNavContext(ConvenientTest t) =>
      app.MyApp.navigatorKey.currentContext;
}

extension on ConvenientTest {
  Future<void> myCustomCommand() async {
    // Do anything you like... This is just a normal function
    debugPrint('Hello, world!');
  }
}
