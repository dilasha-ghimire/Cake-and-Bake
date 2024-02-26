import 'package:cake_app/screens/home/views/add_cake_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:cake_app/screens/home/blocs/save_cake_bloc/save_cake_bloc.dart';

class MockSaveCakeBloc implements SaveCakeBloc {
  @override
  void add(SaveCakeEvent event) {
    // TODO: implement add
  }

  @override
  void addError(Object error, [StackTrace? stackTrace]) {
    // TODO: implement addError
  }

  @override
  Future<void> close() {
    // TODO: implement close
    throw UnimplementedError();
  }

  @override
  void emit(SaveCakeState state) {
    // TODO: implement emit
  }

  @override
  // TODO: implement isClosed
  bool get isClosed => throw UnimplementedError();

  @override
  Stream<SaveCakeState> mapEventToState(SaveCakeEvent event) {
    // TODO: implement mapEventToState
    throw UnimplementedError();
  }

  @override
  void on<E extends SaveCakeEvent>(EventHandler<E, SaveCakeState> handler,
      {EventTransformer<E>? transformer}) {
    // TODO: implement on
  }

  @override
  void onChange(Change<SaveCakeState> change) {
    // TODO: implement onChange
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    // TODO: implement onError
  }

  @override
  void onEvent(SaveCakeEvent event) {
    // TODO: implement onEvent
  }

  @override
  void onTransition(Transition<SaveCakeEvent, SaveCakeState> transition) {
    // TODO: implement onTransition
  }

  @override
  // TODO: implement state
  SaveCakeState get state => throw UnimplementedError();

  @override
  // TODO: implement stream
  Stream<SaveCakeState> get stream => throw UnimplementedError();
}

void main() {
  group('CakeForm Widget Tests', () {
    late MockSaveCakeBloc mockSaveCakeBloc;

    setUp(() {
      mockSaveCakeBloc = MockSaveCakeBloc();
    });

    testWidgets('Renders CakeForm', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<SaveCakeBloc>(
            create: (_) => mockSaveCakeBloc,
            child: AddCakeScreen(),
          ),
        ),
      );

      expect(find.byType(CakeForm), findsOneWidget);
    });

    testWidgets('Saving cake triggers SaveCakeBloc',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<SaveCakeBloc>(
            create: (_) => mockSaveCakeBloc,
            child: AddCakeScreen(),
          ),
        ),
      );

      final cakeIdFinder = find.byKey(const Key('cakeId'));
      final nameFinder = find.byKey(const Key('name'));
      final descriptionFinder = find.byKey(const Key('description'));
      final pictureFinder = find.byKey(const Key('picture'));
      final priceFinder = find.byKey(const Key('price'));
      final discountFinder = find.byKey(const Key('discount'));

      await tester.enterText(cakeIdFinder, 'test_cake_id');
      await tester.enterText(nameFinder, 'Test Cake');
      await tester.enterText(descriptionFinder, 'Test Description');
      await tester.enterText(pictureFinder, 'http://example.com/picture.jpg');
      await tester.enterText(priceFinder, '100');
      await tester.enterText(discountFinder, '10');

      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      verify(mockSaveCakeBloc.add(any)).called(1);
    });
  });
}
