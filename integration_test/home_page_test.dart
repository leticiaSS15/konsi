import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:teste_konsi/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('Home Page E2E Test', () {
    testWidgets('Testativa de busca de CEP', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      await Future.delayed(const Duration(seconds: 1));
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(Icons.search));
      await Future.delayed(const Duration(seconds: 5));
      await tester.enterText(find.byKey(const Key('cepInputField')), '85722340');
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 5));
      await tester.tap(find.byKey(const Key('searchButton')));
      await tester.pump();
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 20));
    });
  });
}
