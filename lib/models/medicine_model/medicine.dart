class Medicine {
  final String id;
  final String name;
  final String description;
  final double price;
  final String quantity;
  final String status;
  final String medicineType;
  final String image;
  final String locationId;
  final DateTime expDate;
  final String locationName;

  Medicine({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
    required this.status,
    required this.medicineType,
    required this.image,
    required this.locationId,
    required this.expDate,
    required this.locationName,
  });

  factory Medicine.fromJson(Map<String, dynamic> json) {
    return Medicine(
      id: json['medcine_id'] ?? 0,
      name: json['medcine_name'] ?? '',
      description: json['medcine_description'] ?? '',
      price: double.parse(json['price'] ?? '0'),
      quantity: json['quantity'] ?? 0,
      status: json['status'] ?? '',
      medicineType: json['medcine_type'] ?? '',
      image: json['image'] ?? '',
      locationId: json['location_id'] ?? '',
      expDate: DateTime.parse(json['exp_date'] ?? ''),
      locationName: json['location_name'] ?? '',
    );
  }
}
