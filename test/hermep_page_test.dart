import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'utils/pages/simple/simple.dart';
import 'utils/pages/simple/simple_model.dart';
import 'utils/pages/simple/simple_presenter.dart';

void main() {
  late SimplePresenter presenter;
  late SimpleModel model;

  group('Hermep page test', () {
    void getHermepState(WidgetTester tester) {
      final dynamic simpleWidgetState = tester.state(find.byType(SimplePage));
      presenter = simpleWidgetState.presenter;
      model = simpleWidgetState.viewModel;
    }

    Future _beforeEach(
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: SimplePage(),
        ),
      );
      await tester.pumpAndSettle();
      getHermepState(tester);
    }

    testWidgets('should display correct page', (WidgetTester tester) async {
      await _beforeEach(tester);

      expect(find.text('Simple'), findsOneWidget);
      expect(find.text('You have pushed the button this many times:'),
          findsOneWidget);
      expect(find.byKey(ValueKey('Increment_Button')), findsOneWidget);
    });

    testWidgets('should increment counter on button tap',
        (WidgetTester tester) async {
      await _beforeEach(tester);

      expect(model.counter, 0);

      final incrementButton = find.byKey(ValueKey('Increment_Button'));
      await tester.tap(incrementButton);
      await tester.pumpAndSettle();

      expect(model.counter, 1);

      await tester.tap(incrementButton);
      await tester.pumpAndSettle();

      expect(model.counter, 2);

      presenter.onPlusTap();

      expect(model.counter, 3);
    });
  });
}
