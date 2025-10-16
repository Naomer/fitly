import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:fitly/main.dart';
import 'package:fitly/providers/workout_provider.dart';

void main() {
  group('Fitly App Tests', () {
    testWidgets('App loads and shows Workouts screen', (
      WidgetTester tester,
    ) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const FitlyApp());

      // Verify that the app loads with the Workouts screen
      expect(find.text('Workouts'), findsOneWidget);
      expect(find.text('Chest + tricep'), findsOneWidget);
      expect(find.text('Back + bicep + legs'), findsOneWidget);
    });

    testWidgets('Bottom navigation works correctly', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const FitlyApp());

      // Verify initial screen shows Workouts
      expect(find.text('Workouts'), findsOneWidget);

      // Tap on Calendar tab
      await tester.tap(find.byIcon(Icons.calendar_today));
      await tester.pump();

      // Verify Calendar screen is shown
      expect(find.text('Calendar Screen'), findsOneWidget);

      // Tap on Stats tab
      await tester.tap(find.byIcon(Icons.bar_chart));
      await tester.pump();

      // Verify Stats screen is shown
      expect(find.text('Stats Screen'), findsOneWidget);
    });

    testWidgets('Workout card navigation works', (WidgetTester tester) async {
      await tester.pumpWidget(const FitlyApp());

      // Find and tap on a workout card
      await tester.tap(find.text('Chest + tricep'));
      await tester.pumpAndSettle();

      // Verify we're on the workout detail screen
      expect(find.text("Today's workout"), findsOneWidget);
      expect(find.text('Start workout'), findsOneWidget);
    });

    testWidgets('Workout provider initializes with sample data', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const FitlyApp());

      // Verify sample workouts are loaded
      expect(find.text('Chest + tricep'), findsOneWidget);
      expect(find.text('Back + bicep + legs'), findsOneWidget);
      expect(find.text('Cardio'), findsOneWidget);

      // Verify body weight is displayed
      expect(find.text('190 lbs'), findsOneWidget);
      expect(find.text('Volume lifted'), findsOneWidget);
    });
  });
}
