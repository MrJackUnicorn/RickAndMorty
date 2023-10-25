import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/api_client/api_client.dart';
import 'package:rick_and_morty_app/entity/character.dart';

class CharacterInfoModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final int id;
  Character? _characterInfo;
  Character? get characterInfo => _characterInfo;

  CharacterInfoModel(this.id);

  Future<void> loadCharacterInfo() async {
    final infoResponse = await _apiClient.getCharById(id);
    _characterInfo = infoResponse;
    notifyListeners();
  }

  void onBackButtonTap(BuildContext context) {
    Navigator.of(context).pop();
  }
}
