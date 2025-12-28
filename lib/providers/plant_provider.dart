import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/plant.dart';
import '../data/plant_data.dart';

final plantListProvider = Provider<List<Plant>>((ref) {
  return allPlants;
});

final searchQueryProvider = StateProvider<String>((ref) => '');

final filteredPlantsProvider = Provider<List<Plant>>((ref) {
  final plants = ref.watch(plantListProvider);
  final query = ref.watch(searchQueryProvider).toLowerCase();

  if (query.isEmpty) return plants;

  return plants.where((plant) {
    return plant.name.toLowerCase().contains(query) ||
           plant.hindiName.contains(query) ||
           plant.botanicalName.toLowerCase().contains(query);
  }).toList();
});

final categoryFilterProvider = Provider.family<List<Plant>, PlantCategory>((ref, category) {
  final plants = ref.watch(plantListProvider);
  return plants.where((p) => p.category == category).toList();
});
