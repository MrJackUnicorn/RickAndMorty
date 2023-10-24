import 'package:flutter/material.dart';

import 'package:rick_and_morty_app/entity/character.dart';

import '../../api_client/api_client.dart';

class MainCharsScreenModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  bool isLoading = false;
  final _chars = <Character>[];
  List<Character> get chars => List.unmodifiable(_chars);
  int currentPage = 1;

  void showedCharacterAtIndex(int index) {
    if (index < chars.length - 1) return;
    loadChars();
  }

  Future<void> loadChars() async {
    if (isLoading) return;
    isLoading = true;
    final charsResponse = await _apiClient.getChars(currentPage);
    _chars.addAll(charsResponse.chars);
    currentPage++;
    isLoading = false;
    notifyListeners();
  }

  void onCharacterTap(BuildContext context, int index) {
    final char = chars[index];
    final charId = char.id;
    Navigator.of(context).pushNamed('/charactersInfoWidget', arguments: charId);
  }
}

// class MainCharsScreenModelProvider extends InheritedNotifier {
//   final MainCharsScreenModel model;

//   const MainCharsScreenModelProvider({
//     Key? key,
//     required this.model,
//     required Widget child,
//   }) : super(
//           key: key,
//           notifier: model,
//           child: child,
//         );
//   static MainCharsScreenModelProvider? watch(BuildContext context) {
//     return context
//         .dependOnInheritedWidgetOfExactType<MainCharsScreenModelProvider>();
//   }

//   static MainCharsScreenModelProvider? read(BuildContext context) {
//     final widget = context
//         .getElementForInheritedWidgetOfExactType<MainCharsScreenModelProvider>()
//         ?.widget;
//     return widget is MainCharsScreenModelProvider ? widget : null;
//   }
// }
