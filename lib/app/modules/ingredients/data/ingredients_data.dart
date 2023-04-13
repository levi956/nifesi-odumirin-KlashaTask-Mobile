import 'package:tech_task/app/shared/extensions/http_extensions.dart';
import 'package:tech_task/core/connection/handler.dart';

import '../../../shared/classes/HTTP/http.dart';
import '../model/ingredients_model.dart';

class IngredientsRepo {
  static FutureHandler<List<Ingredients>> getIngredients() {
    return serveFuture<List<Ingredients>>(
      function: (fail) async {
        final r = await HTTP.get('ingredients');
        if (r.is200 || r.is201) {
          List<dynamic> body = r.data;
          final inFridge = body.map((e) => Ingredients.fromJson(e)).toList();
          return inFridge;
        }
        return fail(r.data['message'] ?? defaultError);
      },
    );
  }
}
