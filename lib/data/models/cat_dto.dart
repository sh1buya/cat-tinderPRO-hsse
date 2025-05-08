import 'package:drift/drift.dart';
import 'package:cat_tinder_hsse/data/local/app_database.dart';
import 'package:cat_tinder_hsse/domain/entities/cat.dart' as d;

class CatDto {
  CatDto({
    required this.id,
    required this.breedName,
    required this.imageUrl,
    this.origin,
    this.temperament,
    this.description,
  });

  final String id;
  final String breedName;
  final String imageUrl;
  final String? origin;
  final String? temperament;
  final String? description;

  factory CatDto.fromJson(Map<String, dynamic> j) => CatDto(
    id: j['id'] as String,
    breedName: j['breedName'] as String,
    imageUrl: j['imageUrl'] as String,
    origin: j['origin'] as String?,
    temperament: j['temperament'] as String?,
    description: j['description'] as String?,
  );

  factory CatDto.fromDrift(CatRow r) => CatDto(
    id: r.id,
    breedName: r.breedName,
    imageUrl: r.imageUrl,
    origin: r.origin,
    temperament: r.temperament,
    description: r.description,
  );

  CatsCompanion toCompanion() => CatsCompanion(
    id: Value(id),
    breedName: Value(breedName),
    imageUrl: Value(imageUrl),
    origin: Value(origin),
    temperament: Value(temperament),
    description: Value(description),
  );

  d.Cat toEntity() => d.Cat(
    id: id,
    breedName: breedName,
    imageUrl: imageUrl,
    origin: origin,
    temperament: temperament,
    description: description,
  );
}

extension CatMapper on d.Cat {
  CatDto toDto() => CatDto(
    id: id,
    breedName: breedName,
    imageUrl: imageUrl,
    origin: origin,
    temperament: temperament,
    description: description,
  );
}
