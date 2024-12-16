import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_application_1/main.dart' as app;

// Integration test should run in a physical device

// NOTE: Define the main function fro the integration test
void main() {
  // ignore: unused_local_variable
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group(
    'end-to-end test',
    () {
      testWidgets(
        "description",
        (widgetTester) async {
          // TODO:

          // NOTE: Run the main function of the ap
          app.main();

          // NOTE: Waits for the app to finish the initial frame
          await widgetTester.pumpAndSettle();

          //
          //
          //

          final key1 = find.byKey(const ValueKey('key1'));
          await widgetTester.tap(key1);
          // Trigger a frame
          await widgetTester.pumpAndSettle();
        },
      );
    },
  );
}
