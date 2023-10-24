import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/api_client/api_client.dart';
import 'package:rick_and_morty_app/entity/character.dart';
import 'package:rick_and_morty_app/entity/character_info_response.dart';

// import 'package:rick_and_morty_app/entity/character.dart';

class CharacterInfoModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final int characterId;
  CharacterInfoResponse? _characterInfo;
  CharacterInfoResponse? get characterInfo => _characterInfo;

  CharacterInfoModel(this.characterId);

  Future<void> loadCharacterInfo() async {
    await _apiClient.getCharById(characterId);

    notifyListeners();
  }

  void onBackButtonTap(BuildContext context) {
    Navigator.of(context).pop();
  }
}

// class CharactersInfoModelProvider extends InheritedNotifier {
//   final CharacterInfoModel model;
//   const CharactersInfoModelProvider({
//     Key? key,
//     required this.model,
//     required Widget child,
//   }) : super(
//           key: key,
//           child: child,
//         );

//   static CharactersInfoModelProvider? watch(BuildContext context) {
//     return context
//         .dependOnInheritedWidgetOfExactType<CharactersInfoModelProvider>();
//   }

//   static CharactersInfoModelProvider? read(BuildContext context) {
//     final widget = context
//         .getElementForInheritedWidgetOfExactType<CharactersInfoModelProvider>()
//         ?.widget;
//     0;
//     return widget is CharactersInfoModelProvider ? widget : null;
//   }

//   @override
//   bool updateShouldNotify(CharactersInfoModelProvider oldWidget) {
//     return model != oldWidget.model;
//   }
// }
