class VariationEntity {
  final int id;
  final String name;
  final double price;
  final String attributeSummary;
  final int priceTax;
  final int points;

  VariationEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.attributeSummary,
    required this.priceTax,
    required this.points,
  });
}
