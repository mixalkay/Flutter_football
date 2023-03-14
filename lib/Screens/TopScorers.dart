import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TopScorersScreen extends StatefulWidget {
  @override
  _TopScorersScreenState createState() => _TopScorersScreenState();
}

class _TopScorersScreenState extends State<TopScorersScreen> {
  List<dynamic> scorers = [];

  @override
  void initState() {
    super.initState();
    fetchScorers();
  }

  Future<void> fetchScorers() async {
    final response = await http.get(Uri.parse(
        'https://api.football-data.org/v2/competitions/CL/scorers?limit=20'),
        headers: {'X-Auth-Token': '1ea5890b3cdf41fd911845ccbc172190'});

    if (response.statusCode == 200) {
      final decodedResponse = json.decode(response.body);
      setState(() {
        scorers = decodedResponse['scorers'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top Scorers'),
      ),
      body: ListView.builder(
        itemCount: scorers.length,
        itemBuilder: (BuildContext context, int index) {
          final scorer = scorers[index];
          final playerName = scorer['player']['name'];
          final teamName = scorer['team']['name'];
          final goals = scorer['numberOfGoals'];

          return ListTile(
            leading: CircleAvatar(
              child: Text(goals.toString()),
            ),
            title: Text(playerName),
            subtitle: Text(teamName),
            trailing: Text('$goals goals'),
          );
        },
      ),
    );
  }
}
