import 'package:flutter/material.dart';
import 'package:project_app/models/teams.dart';
import 'package:project_app/ui/widgets/card_widget_theme.dart';

class TeamDetails extends StatelessWidget {
  final Teams teams;

  const TeamDetails({required this.teams, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, {required}) {
    return Scaffold(
      appBar: AppBar(
        title: Text(teams.name),
      ),
      body: Column(
        children: <Widget>[
          const Spacer(),
          CardWidgetTheme(
            title: 'Bandeira/Brasão: ${teams.name}',
            subTitle: 'Imagem da banderia/Brasão:',
            urlImage: teams.linkImage
          ),
          const Spacer()
        ],
      ),
    );
  }
}
