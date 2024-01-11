import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../repository/recipe_repository_impl.dart';

class RecentSection extends HookConsumerWidget {
  const RecentSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(recipeProvider);

    useEffect(() {
      ref.read(recipeProvider).getRecipes();
      return () {};
    }, [key]);
    return Column(
      children: [
        Row(
          children: [Text("Recent recipe")],
        ),
      ],
    );
  }
}
