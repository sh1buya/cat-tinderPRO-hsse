import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:cat_tinder_hsse/data/models/cat_dto.dart';
import 'package:cat_tinder_hsse/data/datasources/cat_remote_data_source.dart';

class CatApi implements CatRemoteDataSource {
  static const _base = 'https://api.thecatapi.com/v1';
  final _key = const String.fromEnvironment('CAT_API_KEY');

  @override
  Future<CatDto> getRandomCat() async {
    final uri = Uri.parse('$_base/images/search?limit=1&has_breeds=1');
    final res = await http
        .get(uri, headers: {'x-api-key': _key})
        .timeout(const Duration(seconds: 8));

    if (res.statusCode != 200) {
      throw SocketException('Cat API status ${res.statusCode}');
    }

    final list = jsonDecode(res.body) as List;
    if (list.isEmpty) throw const SocketException('Cat API empty');

    final m = list.first as Map<String, dynamic>;
    final breed = (m['breeds'] as List).first;

    return CatDto(
      id: m['id'],
      breedName: breed['name'],
      imageUrl: m['url'],
      origin: breed['origin'],
      temperament: breed['temperament'],
      description: breed['description'],
    );
  }
}
