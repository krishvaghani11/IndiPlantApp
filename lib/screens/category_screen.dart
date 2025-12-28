import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/plant.dart';
import '../providers/plant_provider.dart';
import '../widgets/plant_card.dart';

class CategoryScreen extends ConsumerWidget {
  final PlantCategory category;

  const CategoryScreen({super.key, required this.category});

  String _getCategoryTitle() {
    switch (category) {
      case PlantCategory.medicinal: return 'Medicinal Plants';
      case PlantCategory.ornamental: return 'Ornamental Plants';
      case PlantCategory.fruitBearing: return 'Fruit Trees';
      case PlantCategory.sacred: return 'Sacred Trees';
      case PlantCategory.timber: return 'Timber Trees';
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final plants = ref.watch(categoryFilterProvider(category));

    return Scaffold(
      appBar: AppBar(title: Text(_getCategoryTitle())),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: plants.length,
        itemBuilder: (context, index) => PlantCard(plant: plants[index]),
      ),
    );
  }
}
