import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cat_tinder_hsse/data/datasources/cat_remote_data_source.dart';
import 'package:cat_tinder_hsse/data/models/cat_dto.dart';

class CatApi implements CatRemoteDataSource {
  static const _baseUrl = 'https://api.thecatapi.com/v1';
  static const _apiKey = String.fromEnvironment('CAT_API_KEY');

  @override
  Future<CatDto> getRandomCat() async {
    final response = await http.get(
      Uri.parse('$_baseUrl/images/search?has_breeds=1&api_key=$_apiKey'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List;
      if (data.isEmpty) throw Exception('No cats found');
      return CatDto.fromJson(data[0]);
    } else {
      throw Exception('Failed to load cat: ${response.statusCode}');
    }
  }
}
