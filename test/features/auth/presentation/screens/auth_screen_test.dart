import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:prova_flutter/features/auth/presentation/screens/auth_screen.dart';

void main() {
  const String userTextField = 'userTextField';
  const String passwordTextField = 'passwordTextField';
  const String enterButton = 'enterButton';

  Future<void> loadPage(WidgetTester tester) async {
    MaterialApp materialApp = const MaterialApp(home: AuthScreen());
    await tester.pumpWidget(materialApp);
  }

  testWidgets('Should call verify start state desable button',
      (WidgetTester tester) async {
    await loadPage(tester);
    final buttonFinder = find.byKey(const Key(enterButton));
    ElevatedButton elevatedButton = tester.widget(buttonFinder);
    expect(elevatedButton.enabled, isFalse);
  });

  testWidgets('Should call verify exist user and password',
      (WidgetTester tester) async {
    await loadPage(tester);

    expect(find.byKey(const Key(userTextField)), findsOneWidget);
    expect(find.byKey(const Key(passwordTextField)), findsOneWidget);
  });

  testWidgets('Should call error field user', (WidgetTester tester) async {
    await loadPage(tester);

    await tester.enterText(find.byKey(const Key(userTextField)), 'i ');
    await tester.enterText(
        find.byKey(const Key(passwordTextField)), 'password');
    await tester.pump();

    final buttonFinder = find.byKey(const Key(enterButton));
    ElevatedButton elevatedButton = tester.widget(buttonFinder);
    expect(elevatedButton.onPressed, isNull);
  });

  testWidgets('Should call error field password', (WidgetTester tester) async {
    await loadPage(tester);

    await tester.enterText(find.byKey(const Key(userTextField)), 'username');
    await tester.enterText(find.byKey(const Key(passwordTextField)), 'p***');
    await tester.pump();

    final buttonFinder = find.byKey(const Key(enterButton));
    ElevatedButton elevatedButton = tester.widget(buttonFinder);
    expect(elevatedButton.onPressed, isNull);
  });

  testWidgets('Should call success', (WidgetTester tester) async {
    await loadPage(tester);

    await tester.enterText(find.byKey(const Key(userTextField)), 'username');
    await tester.enterText(
        find.byKey(const Key(passwordTextField)), 'password');

    await tester.pump();

    final button =
        tester.widget<ElevatedButton>(find.byKey(const Key(enterButton)));
    expect(button.onPressed, isNotNull);
  });
}
