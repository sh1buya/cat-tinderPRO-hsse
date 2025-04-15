class Cat {
  final String id;
  final String imageUrl;
  final String breedName;
  final String temperament;
  final String origin;
  final String description;
  final DateTime likedDate;

  Cat({
    required this.id,
    required this.imageUrl,
    required this.breedName,
    required this.temperament,
    required this.origin,
    required this.description,
    required this.likedDate,
  });


  factory Cat.fromJson(Map<String, dynamic> json) {
    return Cat(
      id: json['id'] ?? DateTime.now().millisecondsSinceEpoch.toString(),
      imageUrl: json['url'] ?? '',
      breedName: json['breeds'][0]['name'] ?? 'Unknown',
      temperament: json['breeds'][0]['temperament'] ?? '',
      origin: json['breeds'][0]['origin'] ?? '',
      description: json['breeds'][0]['description'] ?? '',
      likedDate: DateTime.now(),
    );
  }

}
