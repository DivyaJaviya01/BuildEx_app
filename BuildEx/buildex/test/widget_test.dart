// Smoke test: app boots → SplashScreen shows BuildEx branding.
// Run: flutter test

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:buildex/app.dart';
import 'package:buildex/features/splash/splash_screen.dart';

void main() {
  testWidgets('App launches to Splash Screen', (WidgetTester tester) async {
    await tester.pumpWidget(const BuildExApp());
    await tester.pumpAndSettle();

    // SplashScreen route renders
    expect(find.byType(SplashScreen), findsOneWidget);

    // Branding present
    expect(find.text('BUILDEX'), findsOneWidget);
  });
}