import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_app/ui/char_screen/char_info_model.dart';

class CharacterInfoWidget extends StatefulWidget {
  const CharacterInfoWidget({super.key, required this.id});

  final int id;

  @override
  State<CharacterInfoWidget> createState() => _CharacterInfoWidgetState();
}

class _CharacterInfoWidgetState extends State<CharacterInfoWidget> {
  late CharacterInfoModel model;

  @override
  void initState() {
    super.initState();
    model = CharacterInfoModel(widget.id);
    model.loadCharacterInfo();
  }

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider.value(
        value: model,
        child: const _CharacterInfoView(),
      );
}

class _CharacterInfoView extends StatelessWidget {
  const _CharacterInfoView();

  @override
  Widget build(BuildContext context) {
    final model = context.watch<CharacterInfoModel>();
    final title = model.characterInfo?.name;
    final avatar = model.characterInfo?.avatar;
    final name = model.characterInfo?.name ?? 'The name is loading...';
    final status = model.characterInfo?.status ?? 'The status is loading...';
    final species = model.characterInfo?.species ?? 'The spesies is loading...';
    var type = model.characterInfo?.type ?? 'The type is loading...';
    if (type.isEmpty) {
      type = "Classic";
    }
    final gender = model.characterInfo?.gender ?? 'The gender is loading...';
    if (avatar == null) return const SizedBox();
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: const Color.fromRGBO(174, 235, 238, 1),
          onPressed: () => model.onBackButtonTap(context),
        ),
        title: Text(
          title ?? 'Characters info',
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
        ),
        foregroundColor: const Color.fromRGBO(174, 235, 238, 1),
        backgroundColor: const Color.fromRGBO(35, 156, 33, 1),
      ),
      body: ListView(children: [
        Column(
          children: [
            Image.network(
              avatar,
              width: 300,
            ),
            Text('Name: $name'),
            Text('Status: $status'),
            Text('Species: $species'),
            Text('Type: $type'),
            Text('Gender: $gender'),
          ],
        )
      ]),
    );
  }
}
