class Drink {
  final String? id;
  final String name;
  final double buyingPrice;
  final double sellingPrice;
  final double unit;
  final double stockQuantity;
  final String imageUrl;
  int boughtQuantity;
  bool isSelected;

  Drink(
      {this.id,
      required this.buyingPrice,
      required this.imageUrl,
      required this.name,
      required this.stockQuantity,
      required this.sellingPrice,
      required this.unit,
      this.boughtQuantity = 1,
      this.isSelected = false});


        @override
  String toString() {
    return 'Drink{name: $name, isSelected: $isSelected, boughtQuantity: $boughtQuantity}';
  }
}
