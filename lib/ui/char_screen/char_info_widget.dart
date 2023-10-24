import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_app/ui/char_screen/char_info_model.dart';

class CharacterInfoWidget extends StatefulWidget {
  const CharacterInfoWidget({super.key});

  @override
  State<CharacterInfoWidget> createState() => _CharacterInfoWidgetState();
}

class _CharacterInfoWidgetState extends State<CharacterInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return const _CharacterInfoView();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final model = context.watch<CharacterInfoModel>();
    model.loadCharacterInfo();
  }
}

class _CharacterInfoView extends StatelessWidget {
  const _CharacterInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<CharacterInfoModel>();
    final title = model.characterInfo?.name;
    final avatar = model.characterInfo?.avatar;
    // if (avatar == null) return Icon(Icons.person);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: const Color.fromRGBO(174, 235, 238, 1),
          onPressed: () => model.onBackButtonTap(context),
        ),
        title: Text(
          title ?? 'Characters info',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
        ),
        foregroundColor: const Color.fromRGBO(174, 235, 238, 1),
        backgroundColor: const Color.fromRGBO(35, 156, 33, 1),
      ),
      body: ListView(children: [
        Column(
          children: [Image.network(avatar)],
        )
      ]),
    );
  }
}
