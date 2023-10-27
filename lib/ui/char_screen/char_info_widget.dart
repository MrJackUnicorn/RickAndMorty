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
    final title = model.characterInfo?.name ?? 'The name is loading...';
    final avatar = model.characterInfo?.avatar;
    final name = model.characterInfo?.name ?? 'The name is loading...';
    final status = model.characterInfo?.status ?? 'The status is loading...';
    final species = model.characterInfo?.species ?? 'The spesies is loading...';
    var type = model.characterInfo?.type ?? 'The type is loading...';
    final gender = model.characterInfo?.gender ?? 'The gender is loading...';
    if (type.isEmpty) {
      type = "Classic";
    }
    if (avatar == null) return const SizedBox.shrink();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: BackButton(
          color: const Color.fromRGBO(174, 235, 238, 1),
          onPressed: () => model.onBackButtonTap(context),
        ),
        title: Text(
          title,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
        ),
        foregroundColor: const Color.fromRGBO(174, 235, 238, 1),
        backgroundColor: Colors.indigo,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 16),
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Image.network(
                    avatar,
                    width: 300,
                  ),
                ),
              ),
              Text(
                'Name: $name',
                style: const TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
              const SizedBox(height: 10),
              Text(
                'Status: $status',
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey),
              ),
              const SizedBox(height: 5),
              Text(
                'Species: $species',
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey),
              ),
              const SizedBox(height: 5),
              Text(
                'Type: $type',
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey),
              ),
              const SizedBox(height: 5),
              Text(
                'Gender: $gender',
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey),
              ),
            ],
          )
        ],
      ),
    );
  }
}
