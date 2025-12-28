import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/plant.dart';

class PlantDetailScreen extends StatelessWidget {
  final Plant plant;

  const PlantDetailScreen({super.key, required this.plant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                plant.name,
                style: const TextStyle(
                  color: Colors.white,
                  shadows: [Shadow(color: Colors.black, blurRadius: 4)],
                ),
              ),
              background: Hero(
                tag: plant.id,
                child: CachedNetworkImage(
                  imageUrl: plant.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        plant.hindiName,
                        style: TextStyle(
                          fontSize: 24,
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        '(${plant.botanicalName})',
                        style: const TextStyle(
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildSectionTitle('Description'),
                  Text(plant.description, style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 16),
                  _buildSectionTitle('Cultural & Medicinal Significance'),
                  Text(plant.significance, style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 24),
                  _buildSectionTitle('Identification Guide'),
                  _buildIdentificationTile(
                    'Leaves', 
                    plant.identification.leaves, 
                    Icons.eco_outlined,
                  ),
                  _buildIdentificationTile(
                    'Flowers', 
                    plant.identification.flowers, 
                    Icons.local_florist_outlined,
                  ),
                  _buildIdentificationTile(
                    'Bark/Stem', 
                    plant.identification.bark, 
                    Icons.texture_outlined,
                  ),
                  _buildIdentificationTile(
                    'Fruit/Seeds', 
                    plant.identification.fruit, 
                    Icons.grain_outlined,
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color(0xFF1B5E20),
        ),
      ),
    );
  }

  Widget _buildIdentificationTile(String title, String content, IconData icon) {
    return ExpansionTile(
      leading: Icon(icon, color: const Color(0xFF2E7D32)),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: Text(content, style: const TextStyle(fontSize: 15)),
        ),
      ],
    );
  }
}
