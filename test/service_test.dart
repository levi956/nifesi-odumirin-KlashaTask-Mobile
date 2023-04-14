import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tech_task/app/modules/ingredients/data/ingredients_data.dart';
import 'package:tech_task/core/connection/handler.dart';

void main() {
  test('Retrieve all Ingredients', () async {
    final mockIngredientsRepo = MockIngredientsRepo();
    when(mockIngredientsRepo.getIngredients())
        .thenAnswer((_) async => serveData(value: []));

    expect(
      await mockIngredientsRepo.getIngredients(),
      serveData(value: []),
    );
  });
}

class MockIngredientsRepo extends Mock implements IngredientsRepo {}
