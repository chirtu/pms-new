class Food {
  final String id;
  final String name;
  final String imageUrl;
  final String description;
  final String servedWith;
  final double sellingPrice;
  int boughtQuantity;
  bool isSelected;

  Food(
      {required this.id,
      required this.name,
      required this.imageUrl,
      required this.description,
      required this.sellingPrice,
      required this.servedWith,
      this.boughtQuantity = 0,
      this.isSelected = false});

  @override
  String toString() {
    return 'Food{id: $id, name: $name, imageUrl: $imageUrl, description: $description, servedWith: $servedWith, sellingPrice: $sellingPrice, boughtQuantity: $boughtQuantity, isSelected: $isSelected}';
  }
}