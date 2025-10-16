import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fitly/theme/app_theme.dart';

void main() {
  group('AppTheme Tests', () {
    test('Dark theme has correct colors', () {
      final theme = AppTheme.darkTheme;

      expect(theme.brightness, Brightness.dark);
      expect(theme.scaffoldBackgroundColor, AppTheme.primaryColor);
      expect(theme.primaryColor, AppTheme.primaryColor);
    });

    test('Color scheme is correctly configured', () {
      final theme = AppTheme.darkTheme;
      final colorScheme = theme.colorScheme;

      expect(colorScheme.primary, AppTheme.primaryColor);
      expect(colorScheme.secondary, AppTheme.accentColor);
      expect(colorScheme.surface, AppTheme.cardColor);
      expect(colorScheme.background, AppTheme.primaryColor);
    });

    test('Text theme has correct colors', () {
      final theme = AppTheme.darkTheme;
      final textTheme = theme.textTheme;

      expect(textTheme.headlineLarge?.color, AppTheme.textPrimary);
      expect(textTheme.bodyMedium?.color, AppTheme.textSecondary);
      expect(textTheme.bodySmall?.color, AppTheme.textTertiary);
    });

    test('App bar theme is correctly configured', () {
      final theme = AppTheme.darkTheme;
      final appBarTheme = theme.appBarTheme;

      expect(appBarTheme.backgroundColor, AppTheme.primaryColor);
      expect(appBarTheme.foregroundColor, AppTheme.textPrimary);
      expect(appBarTheme.elevation, 0);
    });

    test('Card theme is correctly configured', () {
      final theme = AppTheme.darkTheme;
      final cardTheme = theme.cardTheme;

      expect(cardTheme.color, AppTheme.cardColor);
      expect(cardTheme.elevation, 0);
    });

    test('Elevated button theme is correctly configured', () {
      final theme = AppTheme.darkTheme;
      final buttonTheme = theme.elevatedButtonTheme;

      expect(
        buttonTheme.style?.backgroundColor?.resolve({}),
        AppTheme.textPrimary,
      );
      expect(
        buttonTheme.style?.foregroundColor?.resolve({}),
        AppTheme.primaryColor,
      );
    });
  });
}
