import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_task/app/modules/recipes/models/recipe_model.dart';
import 'package:tech_task/app/shared/extensions/http_extensions.dart';
import 'package:tech_task/core/connection/handler.dart';

import '../../../shared/classes/HTTP/http.dart';

final recipesRepo = Provider<RecipesRepo>((ref) {
  return RecipesRepo(ref: ref);
});

class RecipesRepo {
  ProviderRef? ref;

  RecipesRepo({this.ref});

  FutureHandler<List<Recipes>> getRecipes(List<String> ingredient) {
    return serveFuture<List<Recipes>>(
      function: (fail) async {
        final r = await HTTP.get('recipes?ingredients=${ingredient.join(',')}');
        if (r.is200 || r.is201) {
          List<dynamic> body = r.data;
          final recipe = body.map((e) => Recipes.fromJson(e)).toList();
          return recipe;
        }
        return fail(r.data['message'] ?? defaultError);
      },
    );
  }
}
