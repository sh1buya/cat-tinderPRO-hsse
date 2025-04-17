import 'package:cat_tinder_hsse/domain/entities/cat.dart';

class CatDto {
  final String id;
  final String imageUrl;
  final String breedName;
  final String temperament;
  final String origin;
  final String description;

  CatDto({
    required this.id,
    required this.imageUrl,
    required this.breedName,
    required this.temperament,
    required this.origin,
    required this.description,
  });
  factory CatDto.fromJson(Map<String, dynamic> json) {
    final breeds = json['breeds'] as List<dynamic>? ?? [];
    final breed = breeds.isNotEmpty ? breeds[0] : <String, dynamic>{};

    return CatDto(
      id: json['id']?.toString() ?? '',
      imageUrl: json['url']?.toString() ?? '',
      breedName: breed['name']?.toString() ?? 'Unknown',
      temperament: breed['temperament']?.toString() ?? '',
      origin: breed['origin']?.toString() ?? '',
      description: breed['description']?.toString() ?? '',
    );
  }

  Cat toEntity() => Cat(
    id: id,
    imageUrl: imageUrl,
    breedName: breedName,
    temperament: temperament,
    origin: origin,
    description: description,
  );
}
