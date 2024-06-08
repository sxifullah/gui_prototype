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
    var verifyActPage = find.text("Welcome !");

    // Verify activation page
    expect(verifyActPage, findsOneWidget);

    var checkBox = find.text("I agree to the terms & conditions");
    await tester.tap(checkBox);

    // Find the activation button (assuming it has a text label "Activate")
    var activationButton = find.text("Get Activation Code");

    // Tap the activation button
    await tester.tap(activationButton);
    await tester.pumpAndSettle();

    var verifyOtpPage =
        find.text("Enter the activation code you received via SMS.");
    var actButton = find.text("Activate");

    // Verify activation page
    expect(verifyOtpPage, findsOneWidget);

    await tester.tap(actButton);
    await tester.pumpAndSettle();

    var verifyFonePage = find.text("1549.7kW");
    var fOneButton = find.text("Factory 1");

    // Verify dashboard F1 page
    expect(verifyFonePage, findsOneWidget);

    await tester.tap(fOneButton);
    await tester.pumpAndSettle();
  });
}
