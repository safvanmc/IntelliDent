/// Dental tip data model
class DentalTipModel {
  final int id;
  final String title;
  final String description;
  final String category;

  const DentalTipModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
  });

  /// Create DentalTipModel from JSON
  factory DentalTipModel.fromJson(Map<String, dynamic> json) {
    return DentalTipModel(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
    );
  }

  /// Convert DentalTipModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
    };
  }
}
