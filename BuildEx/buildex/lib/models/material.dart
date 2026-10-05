// Mirrors material_stock + daily_material_usages tables. Static only.
class MaterialModel {
  final String stockId;
  final String materialName;
  final double remainingQuantity;
  final String unit;
  const MaterialModel({required this.stockId, required this.materialName, this.remainingQuantity = 0, this.unit = ''});
  factory MaterialModel.fromJson(Map<String, dynamic> j) => MaterialModel(
        stockId: j['stock_id'] as String,
        materialName: j['material_name'] as String,
        remainingQuantity: (j['remaining_quantity'] as num? ?? 0).toDouble(),
        unit: j['unit'] as String? ?? '',
      );
  Map<String, dynamic> toJson() => {'stock_id': stockId, 'material_name': materialName, 'remaining_quantity': remainingQuantity, 'unit': unit};
}
