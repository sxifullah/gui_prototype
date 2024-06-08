import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gui_prototype/main.dart' as app;
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("check for Welcome text", (tester) async {
    app.main();
    await tester.pumpAndSettle();

    // Find the text "Welcome !"
    var welcomeText = find.text("Welcome !");

    // Verify that the text "Welcome !" is present
    expect(welcomeText, findsOneWidget);
  });
}
