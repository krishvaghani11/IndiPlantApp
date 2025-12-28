import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/plant.dart';
import '../providers/plant_provider.dart';
import '../widgets/plant_card.dart';
import '../widgets/plant_search_delegate.dart';
import 'category_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final plants = ref.watch(filteredPlantsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('IndiPlant'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: PlantSearchDelegate(ref),
              );
            },
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Categories',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 100,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: const [
                        _CategoryChip(
                          label: 'Medicinal',
                          icon: Icons.medication_liquid,
                          category: PlantCategory.medicinal,
                        ),
                        _CategoryChip(
                          label: 'Sacred',
                          icon: Icons.temple_hindu,
                          category: PlantCategory.sacred,
                        ),
                        _CategoryChip(
                          label: 'Fruit',
                          icon: Icons.apple,
                          category: PlantCategory.fruitBearing,
                        ),
                        _CategoryChip(
                          label: 'Timber',
                          icon: Icons.forest,
                          category: PlantCategory.timber,
                        ),
                        _CategoryChip(
                          label: 'Ornamental',
                          icon: Icons.yard,
                          category: PlantCategory.ornamental,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Common Indian Plants',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => PlantCard(plant: plants[index]),
                childCount: plants.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final PlantCategory category;

  const _CategoryChip({
    required this.label,
    required this.icon,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CategoryScreen(category: category),
            ),
          );
        },
        child: Column(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              child: Icon(icon, color: Theme.of(context).colorScheme.primary),
            ),
            const SizedBox(height: 8),
            Text(label, style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
