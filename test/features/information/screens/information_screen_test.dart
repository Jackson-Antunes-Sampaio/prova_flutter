import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prova_flutter/features/information/screens/information_screen.dart';

void main() {
  const String infoTextField = 'infoTextField';
  const String showSnackBar = 'showSnackBar';

  Future<void> loadPage(WidgetTester tester) async {
    MaterialApp materialApp = const MaterialApp(home: InformationScreen());
    await tester.pumpWidget(materialApp);
  }

  testWidgets('Should call verify items screen', (WidgetTester tester) async {
    await loadPage(tester);

    expect(find.byKey(const Key(infoTextField)), findsOneWidget);
    expect(find.byType(Card), findsOneWidget);
  });

  testWidgets('Should call error text', (WidgetTester tester) async {
    await loadPage(tester);

    await tester.enterText(find.byKey(const Key(infoTextField)), '');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();

    expect(find.byKey(const Key(showSnackBar)), findsOneWidget);
  });

  testWidgets('Should call success text', (WidgetTester tester) async {
    await loadPage(tester);

    await tester.enterText(find.byKey(const Key(infoTextField)), 'information');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();

    expect(find.byKey(const Key(showSnackBar)), findsNothing);
  });

  testWidgets('Should call success edit ', (WidgetTester tester) async {
    await loadPage(tester);
    String text = 'information';
    await tester.enterText(find.byKey(const Key(infoTextField)), text);
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();

    await tester.tap(find.byKey(Key("0-edit-$text")));
    await tester.pump();

    expect(find.text('Atenção'), findsOneWidget);
  });

  testWidgets('Should call success delete ', (WidgetTester tester) async {
    await loadPage(tester);
    String text = 'information';
    await tester.enterText(find.byKey(const Key(infoTextField)), text);
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();

    await tester.tap(find.byKey(Key("0-delete-$text")));
    await tester.pump();

    expect(find.text('Deseja Excluir esse item?'), findsOneWidget);
  });
}
