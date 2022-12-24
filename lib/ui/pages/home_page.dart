import 'package:flutter/material.dart';
import 'package:project_app/api/api.dart';
import 'package:project_app/models/teams.dart';
import 'package:project_app/ui/pages/team_details.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Teams>? _teams = [];

  @override
  void initState() {
    super.initState();
    _get();
  }

  void _get() async {
    _teams = (await Api().getTeams()) ?? [];
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Times de Futebol'),
      ),
      body: Center(
        child: _teams == null
            ? const CircularProgressIndicator()
            : ListView.builder(
                itemCount: _teams!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          _teams![index].linkImage
                      ),
                    ),
                    title: Text(_teams![index].name),
                    onTap: () {
                      _openTeamDetails(_teams![index]);
                    },
                  );
                },
              ),
      ),
    );
  }

  void _openTeamDetails(Teams teams) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => TeamDetails(teams: teams)
    ));
  }
}
