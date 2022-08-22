import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:test_api_app/main.dart' as app;

void main() {
  group('App Test', () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    testWidgets('full app test', (tester) async {
      app.main();

      await tester.pumpAndSettle();

      final emailForm = find.byType(TextFormField).first;
      final passwordForm = find.byType(TextFormField).last;

      final loginButton = find.byType(TextButton).first;

      await tester.enterText(emailForm, 'ola@gmail.com');
      await waiter();

      await tester.enterText(passwordForm, 'Test123456');
      await waiter();

      await tester.pumpAndSettle();
      await waiter();

      await tester.tap(loginButton);

      await tester.pumpAndSettle();
    });
  });
}

Future<void> waiter() async =>
    await Future.delayed(const Duration(milliseconds: 500));
