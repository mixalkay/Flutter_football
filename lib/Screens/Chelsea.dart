import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'ChelseaTop.dart';

class ResultsScreen extends StatefulWidget {
  @override
  _ResultsScreenState createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  List<dynamic> matches = [];

  @override
  void initState() {
    super.initState();
    fetchMatches();
  }

  Future<void> fetchMatches() async {
    final response = await http.get(
      Uri.parse('https://api.football-data.org/v2/teams/61/matches?status=FINISHED'),
      headers: {
        'X-Auth-Token': '1ea5890b3cdf41fd911845ccbc172190'
      },
    );

    if (response.statusCode == 200) {
      final decodedResponse = json.decode(response.body);
      setState(() {
        matches = decodedResponse['matches'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chelsea Results'),
      ),
      body: ListView.builder(
        itemCount: matches.length,
        itemBuilder: (BuildContext context, int index) {
          final match = matches[index];
          final homeTeamName = match['homeTeam']['name'];
          final awayTeamName = match['awayTeam']['name'];
          final homeTeamScore = match['score']['fullTime']['homeTeam'];
          final awayTeamScore = match['score']['fullTime']['awayTeam'];
          final matchDateTime = DateTime.parse(match['utcDate']).toLocal();
          final matchDate = matchDateTime.toIso8601String().split('T')[0];
          final matchTime = matchDateTime.toIso8601String().split('T')[1].substring(0, 5);

          return Card(
            child: ListTile(
              leading: Text(homeTeamName),
              trailing: Text(awayTeamName),
              title: Text('$homeTeamScore - $awayTeamScore'),
              subtitle: Text('$matchDate $matchTime'),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TopScorersScreen()),
          );
        },
        child: Icon(Icons.sports_soccer),
      ),
    );
  }
}
