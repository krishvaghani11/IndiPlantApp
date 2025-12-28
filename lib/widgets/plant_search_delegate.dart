import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/plant_provider.dart';
import '../screens/plant_detail_screen.dart';

class PlantSearchDelegate extends SearchDelegate {
  final WidgetRef ref;

  PlantSearchDelegate(this.ref);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildList();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildList();
  }

  Widget _buildList() {
    final plants = ref.watch(plantListProvider);
    final results = plants.where((p) =>
        p.name.toLowerCase().contains(query.toLowerCase()) ||
        p.botanicalName.toLowerCase().contains(query.toLowerCase())).toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final plant = results[index];
        return ListTile(
          title: Text(plant.name),
          subtitle: Text(plant.botanicalName),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PlantDetailScreen(plant: plant),
              ),
            );
          },
        );
      },
    );
  }
}
