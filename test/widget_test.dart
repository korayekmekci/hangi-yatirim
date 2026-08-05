import 'package:flutter_test/flutter_test.dart';
import 'package:hangi_yatirim/app.dart';

void main() {
  testWidgets('Hangi Yatirim App test', (WidgetTester tester) async {
    await tester.pumpWidget(const HangiYatirimApp());

    expect(find.byType(HangiYatirimApp), findsOneWidget);
  });
}