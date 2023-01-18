import 'package:convenient_test_common_dart/src/protobuf/convenient_test.pbenum.dart';
import 'package:convenient_test_dev/convenient_test_dev.dart';
import 'package:flutter/material.dart';
import 'package:flutter_integration_test_groups_bug/main.dart' as app;
import 'package:flutter_test/flutter_test.dart';

const _timeout = Duration(seconds: 1);

void main() {
  convenientTestMain(MyConvenientTestSlot(), () {
    group('Counter', () {
      tTestWidgets(
        'is incremented when plus button is tapped',
        (ConvenientTest ct) async {
          final tester = ct.tester;
          await tester.pumpWidget(const app.MyApp());

          expect(find.text('0'), findsOneWidget);
          expect(find.text('1'), findsNothing);

          await tester.pump(_timeout);

          await tester.tap(find.byIcon(Icons.add));
          await tester.pump();

          await tester.pump(_timeout);

          expect(find.text('0'), findsNothing);
          expect(find.text('1'), findsOneWidget);
        },
      );

      group('does some things', () {
        tTestWidgets(
          'in a nicely written convenient test',
          (ConvenientTest ct) async {
            final tester = ct.tester;
            await tester.pumpWidget(const app.MyApp());

            ct.log(
              'Everyone hold tight',
              'The app has just started',
              type: LogSubEntryType.GENERAL_MESSAGE,
            );

            await ct.get(find.text('0')).should(findsOneWidget);
            await ct.get(find.text('1')).should(findsNothing);

            await tester.pump(_timeout);

            await tester.tap(find.byIcon(Icons.add));
            await tester.pump();

            await tester.pump(_timeout);

            await ct.get(find.text('0')).should(findsNothing);
            await ct.get(find.text('1')).should(findsOneWidget);
          },
        );

        tTestWidgets(
          'is decremented when minus button is tapped',
          (ConvenientTest ct) async {
            final tester = ct.tester;
            await tester.pumpWidget(const app.MyApp());

            expect(find.text('0'), findsOneWidget);
            expect(find.text('-1'), findsNothing);

            await tester.pump(_timeout);

            await tester.tap(find.byIcon(Icons.remove));
            await tester.pump();

            await tester.pump(_timeout);

            expect(find.text('0'), findsNothing);
            expect(find.text('-1'), findsOneWidget);
          },
        );
      });
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
