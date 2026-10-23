import 'package:flutter_test/flutter_test.dart';
import 'package:postcard_app/main.dart';

void main() {
  testWidgets('App displays the start screen', (WidgetTester tester) async {
    await tester.pumpWidget(const PostcardApp());

    expect(find.text('Save your memories!'), findsOneWidget);
    expect(find.text('Get Started'), findsOneWidget);
  });
}
