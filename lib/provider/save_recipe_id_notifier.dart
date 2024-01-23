import 'package:food_recipe/database/app_database.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SavedRecipeIdNotifier extends StateNotifier<List<String>> {
  SavedRecipeIdNotifier(this.ref) : super([]) {
    repo = ref.read(provideSavedIdRepo);
    fetchString();
  }

  late SavedRecipeRepo repo;
  final StateNotifierProviderRef ref;

  void fetchString() {
    state = repo.getValue();
  }

  void addId(String id) {
    state = repo.addValue(id);
  }

  void removeString(String id) {
    state = repo.removeString(id);
  }
}
