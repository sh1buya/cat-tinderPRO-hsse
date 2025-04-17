import 'package:equatable/equatable.dart';

class Cat extends Equatable {
  final String id;
  final String imageUrl;
  final String breedName;
  final String? temperament;
  final String? origin;
  final String? description;

  const Cat({
    required this.id,
    required this.imageUrl,
    required this.breedName,
    this.temperament,
    this.origin,
    this.description,
  });

  @override
  List<Object?> get props => [id];
}
