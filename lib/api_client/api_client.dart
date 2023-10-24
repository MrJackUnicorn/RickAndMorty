import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:rick_and_morty_app/entity/character_info_response.dart';
import 'package:rick_and_morty_app/entity/char_response.dart';

class ApiClient {
  final client = HttpClient();
  final _host = 'https://rickandmortyapi.com';
  final getPath = '/api/character';

  Future<CharResponse> getChars(int page) async {
    final response = await http.get(Uri.parse('$_host$getPath?page=$page'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final charResponse = CharResponse.fromJson(jsonData);
      return charResponse;
    } else {
      throw Exception('Failed to load chars');
    }
  }

  Future<CharacterInfoResponse> getCharById(int id) async {
    final response = await http.get(Uri.parse('$_host$getPath/$id'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final charResponse = CharacterInfoResponse.fromJson(jsonData);
      return charResponse;
    } else {
      throw Exception('Failed to load char');
    }
  }
}
