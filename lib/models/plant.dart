enum PlantCategory {
  medicinal,
  ornamental,
  fruitBearing,
  sacred,
  timber,
}

class IdentificationGuide {
  final String leaves;
  final String flowers;
  final String bark;
  final String fruit;

  const IdentificationGuide({
    required this.leaves,
    required this.flowers,
    required this.bark,
    required this.fruit,
  });
}

class Plant {
  final String id;
  final String name;
  final String hindiName;
  final String botanicalName;
  final PlantCategory category;
  final String description;
  final String significance;
  final String imageUrl;
  final IdentificationGuide identification;

  const Plant({
    required this.id,
    required this.name,
    required this.hindiName,
    required this.botanicalName,
    required this.category,
    required this.description,
    required this.significance,
    required this.imageUrl,
    required this.identification,
  });
}
