import 'package:food_recipe/database/save_recipe_id_notifier.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SavedRecipeRepo {
  late Box<String> _hive;
  late List<String> _box;

  SavedRecipeRepo();

  List<String> getValue() {
    _hive = Hive.box<String>('ids');
    _box = _hive.values.toList();
    return _box;
  }

  List<String> addValue(String id) {
    _hive.add(id);
    return _hive.values.toList();
  }

  List<String> removeString(String id) {
    _hive
        .deleteAt(_hive.values.toList().indexWhere((element) => element == id));
    return _hive.values.toList();
  }

  List<String> updateString(int index, String id) {
    _hive.putAt(index, id);
    return _hive.values.toList();
  }

  void deleteAll() {
    _box.clear();
  }
}

final provideSavedIdRepo =
    Provider<SavedRecipeRepo>((ref) => SavedRecipeRepo());

final provideSavedIdNotifier =
    StateNotifierProvider<SavedRecipeIdNotifier, List<String>>(
        (ref) => SavedRecipeIdNotifier(ref));


final checkedProvider = Provider.family<bool, String>((ref, id) {
  final ids = ref.watch(provideSavedIdNotifier);
  return ids.contains(id);
});
