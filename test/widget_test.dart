import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_perguntas/main.dart';

main()
{
  testWidgets('Teste para saber se tudo funciona no widget principal', (WidgetTester tester) async {
    await tester.pumpWidget(PerguntasApp());

    expect(tester.takeException(), null);
  });
}