import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_app/ui/char_screen/char_info_model.dart';
import 'package:rick_and_morty_app/ui/char_screen/char_info_widget.dart';

import 'package:rick_and_morty_app/ui/main_chars_screen/main_chars_screen_widget.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/mainCharactersWidget': (context) => const MainCharsScreenWidget(),
        //  '/charactersInfoWidget': (context) => const CharacterInfoWidget(),
      },
      initialRoute: '/mainCharactersWidget',
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/charactersInfoWidget':
            final arguments = settings.arguments;
            final id = arguments is int ? arguments : 0;
            return MaterialPageRoute(
              builder: (context) => ChangeNotifierProvider(
                create: (context) => CharacterInfoModel(id),
                child: CharacterInfoWidget(
                  id: id,
                ),
              ),
            );
        }
        return null;
      },
    );
  }
}
