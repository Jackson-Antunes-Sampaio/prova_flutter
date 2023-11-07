import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prova_flutter/features/information/screens/information_screen.dart';

void main() {
  testWidgets('Teste da segunda tela', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: InformationScreen()));

    expect(find.byKey(const Key('infoTextField')), findsOneWidget);
    expect(find.byKey(const Key('submitButton')), findsOneWidget);
    expect(
        find.byType(Card), findsOneWidget); // Verifica se o Card está presente

    await tester.enterText(
        find.byKey(const Key('infoTextField')), 'Nova informação');
    await tester.tap(find.byKey(const Key('submitButton')));

    expect(find.text('Nova informação'),
        findsOneWidget); // Verifica se a informação foi adicionada à lista

    // Outros testes de interação, como editar uma informação na lista e verificar se a caixa de diálogo para edição é exibida corretamente, etc.
  });
}
