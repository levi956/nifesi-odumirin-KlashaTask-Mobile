import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_task/app/modules/ingredients/data/ingredients_data.dart';
import 'package:tech_task/app/modules/ingredients/model/ingredients_model.dart';
import 'package:tech_task/core/connection/handler.dart';

final ingredientsProvider =
    FutureProvider<ServiceResponse<List<Ingredients>>>((ref) async {
  return IngredientsRepo.getIngredients();
});
