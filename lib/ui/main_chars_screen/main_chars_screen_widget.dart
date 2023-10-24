import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main_chars_screen_model.dart';

class MainCharsScreenWidget extends StatefulWidget {
  const MainCharsScreenWidget({super.key});

  @override
  State<MainCharsScreenWidget> createState() => _MainCharsScreenWidgetState();
}

class _MainCharsScreenWidgetState extends State<MainCharsScreenWidget> {
  final model = MainCharsScreenModel();
  @override
  void initState() {
    super.initState();
    model.loadChars();
  }

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider.value(
        value: model,
        child: const _MainCharsScreenView(),
      );
}

class _MainCharsScreenView extends StatelessWidget {
  const _MainCharsScreenView();

  @override
  Widget build(BuildContext context) {
    final model = context.watch<MainCharsScreenModel>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'All Characters',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
        ),
        foregroundColor: const Color.fromRGBO(253, 255, 128, 1),
        backgroundColor: const Color.fromRGBO(35, 156, 33, 1),
      ),
      body: ListView.builder(
        itemExtent: 100,
        itemCount: model.chars.length,
        itemBuilder: (BuildContext context, int index) {
          model.showedCharacterAtIndex(index);
          final char = model.chars[index];
          final avatar = char.avatar;
          final chatId = char.id;
          if (chatId == null) return SizedBox.shrink();
          if (avatar == null) return const SizedBox();
          return Stack(
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {},
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromRGBO(180, 232, 251, 1),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Image.network(
                          avatar,
                          width: 80,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              char.name.toString(),
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(char.id.toString()),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Material(
                color: Colors.transparent,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () => model.onCharacterTap(context, chatId),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
