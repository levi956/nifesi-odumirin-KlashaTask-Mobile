import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tech_task/app/modules/ingredients/model/ingredients_model.dart';
import 'package:tech_task/app/modules/ingredients/provider/ingredients_provider.dart';
import 'package:tech_task/app/modules/recipes/models/recipe_model.dart';
import 'package:tech_task/app/modules/recipes/provider/recipes_provider.dart';
import 'package:tech_task/app/shared/constants/layout.dart';
import 'package:tech_task/app/shared/widgets/base_text.dart';
import 'package:tech_task/core/config/device/bar_color.dart';

import '../widgets/recipe_tile.dart';

class Dashboard extends HookConsumerWidget {
  final DateTime lunchDate;

  const Dashboard(this.lunchDate, {super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    setStatusBarColor(color: BarColor.black);

    final ingredients = ref.watch(ingredientsProvider);

    final _selectedIngredients = useState<List<String>>([]);

    final recipes = ref
        .watch(recipesProvider(RecipleListModel(_selectedIngredients.value)));

    return Scaffold(
      body: Padding(
        padding: screenPadding,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // maybe a custom back button ?

              YBox(20),

              Row(
                children: [
                  BaseText(
                    text: 'Available Ingredients',
                    size: 20,
                    weight: FontWeight.w600,
                  ),
                  XBox(10),
                  Icon(Icons.food_bank)
                ],
              ),

              YBox(30),

              // if (useByDate.isBefore(_selectedDate) || isIncluded) {
              //         return SizedBox.shrink();
              //       }

              BaseText(
                text: 'Select Ingredients',
                size: 17,
                weight: FontWeight.w500,
              ),
              YBox(10),

              ingredients.when(
                data: (data) {
                  if (data.error) {
                    return BaseText(text: 'An error has occured');
                  }
                  final ingredients = data.data!;
                  if (ingredients.isEmpty) {
                    return BaseText(
                      text: 'No ingredients available in the fridge.',
                    );
                  }
                  return ChipsChoice<String>.multiple(
                    padding: EdgeInsets.zero,
                    choiceStyle: C2ChipStyle(
                      backgroundColor: Colors.blue.withOpacity(.3),
                      foregroundStyle: Theme.of(context).textTheme.bodyMedium,
                      checkmarkColor: Colors.black,
                    ),
                    choiceCheckmark: true,
                    wrapped: true,
                    value: _selectedIngredients.value,
                    onChanged: (v) {
                      _selectedIngredients.value = v;
                    },
                    choiceItems: C2Choice.listFrom<String, Ingredients>(
                      source: ingredients,
                      value: (i, v) {
                        // if (v.useBy.isBefore(lunchDate)) {
                        //   //TODO make the condition for the date stuff p here
                        // }
                        return v.title;
                      },
                      label: (i, v) => v.title,
                    ),
                  );
                },
                error: (_, __) => BaseText(text: 'An error has occured'),
                loading: () =>
                    Center(child: CircularProgressIndicator.adaptive()),
              ),
              YBox(40),

              Row(
                children: [
                  BaseText(
                    text: 'Recipes',
                    size: 19,
                    weight: FontWeight.w500,
                  ),
                  XBox(10),
                  Icon(Icons.receipt),
                ],
              ),
              YBox(10),
              Expanded(
                child: recipes.when(
                  data: (data) {
                    if (data.error) {
                      return BaseText(text: 'An error has occured');
                    }
                    final recipe = data.data!;
                    if (recipe.isEmpty) {}
                    return ListView.separated(
                      itemCount: recipe.length,
                      separatorBuilder: (_, __) => YBox(20),
                      itemBuilder: (_, index) {
                        final data = recipe[index];
                        return RecipeTile(data);
                      },
                    );
                  },
                  error: (_, __) => BaseText(text: 'An error has occured'),
                  loading: () =>
                      Center(child: CircularProgressIndicator.adaptive()),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
