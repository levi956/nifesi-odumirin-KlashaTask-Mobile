import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../modules/recipes/models/recipe_model.dart';
import '../constants/layout.dart';
import 'base_text.dart';

class RecipeTile extends HookConsumerWidget {
  final Recipes recipe;

  const RecipeTile(this.recipe, {super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: Colors.grey.withOpacity(.1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BaseText(
            text: recipe.title,
            weight: FontWeight.w600,
            size: 16,
          ),
          YBox(7),
          SizedBox(
            height: 30,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: recipe.ingredients.length,
              separatorBuilder: (_, __) => XBox(10),
              itemBuilder: (_, index) {
                if (recipe.ingredients.isEmpty) {}
                final data = recipe.ingredients[index];
                return CustomChip(data);
              },
            ),
          )
        ],
      ),
    );
  }
}

class CustomChip extends StatelessWidget {
  final String label;
  const CustomChip(this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blue.withOpacity(.3),
      ),
      child: BaseText(
        text: label,
        size: 13,
      ),
    );
  }
}
