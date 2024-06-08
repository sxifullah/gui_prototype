import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gui_prototype/main.dart' as app;
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("check for Welcome text and tap activation button",
      (tester) async {
    app.main();
    await tester.pumpAndSettle();

    // Find the text "Welcome !"
    var welcomeText = find.text("Welcome !");

    // Verify that the text "Welcome !" is present
    expect(welcomeText, findsOneWidget);

    // Tap on the "I agree to the terms & conditions" checkbox
    await tester.tap(find.byType(Checkbox));
    await tester.pumpAndSettle();

    // Find the activation button (assuming it has a text label "Get Activation Code")
    var activationButton =
        find.widgetWithText(ElevatedButton, "Get Activation Code");

    // Tap the activation button
    await tester.tap(activationButton);
    await tester.pumpAndSettle();

    // Verify we are on the OTP page (assuming there's some text like "Enter OTP")
    expect(find.text('Enter the activation code you received via SMS.'),
        findsOneWidget);

    // Check if the button is actually found and interactable
    final activateButton = find.text('Activate');
    expect(activateButton, findsOneWidget);

    // Tap the 'Activate' button.
    await tester.tap(activateButton);
    await tester.pumpAndSettle();
  });
}
