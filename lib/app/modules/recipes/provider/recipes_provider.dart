import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_task/app/modules/recipes/data/recipes_data.dart';
import 'package:tech_task/app/modules/recipes/models/recipe_model.dart';
import 'package:tech_task/core/connection/handler.dart';

final recipesProvider = FutureProvider.autoDispose
    .family<ServiceResponse<List<Recipes>>, RecipleListModel>(
        (ref, param) async {
  return ref.read(recipesRepo).getRecipes(param.ingredients);
});
