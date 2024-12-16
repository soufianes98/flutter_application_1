import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_driver/flutter_driver.dart' as driver;
import 'package:integration_test/integration_test_driver.dart';

// For more info: https://docs.flutter.dev/cookbook/testing/integration/profiling

// Run
/* 
flutter drive \
--driver=test_driver/perf_driver.dart \
--target=integration_test/scrolling_test.dart \
--device-id=21061119AG
--release
--no-dds
--keep-app-running
--dart-define=API_KEY=secure_key
--dart-define=API_KEY2=secure_key2
--profile
*/

Future<void> main() {
  return integrationDriver(
    responseDataCallback: (data) async {
      if (data != null) {
        final timeline = driver.Timeline.fromJson(
          data['scrolling_timeline'] as Map<String, dynamic>,
        );

        // Convert the Timeline into a TimelineSummary that's easier to read and understand
        final summary = driver.TimelineSummary.summarize(timeline);

        // Then, write the entire timeline to disk in a json format.
        // This file can be opened in the Chrome browser's tools
        // found by navigating to chrome://tracing.
        // Optionally, save the summary to disk by setting includeSummary
        // to true
        await summary.writeTimelineToFile(
          'scrolling_timeline',
          pretty: true,
          includeSummary: true,
        );
      }
    },
  );
}
