import 'package:flutter/material.dart';
import 'package:footballapp/Screens/TopScorers.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:footballapp/Screens/TopScorers.dart'; // экран лучших бомбардиров

class MatchesScreen extends StatefulWidget {
  @override
  _MatchesScreenState createState() => _MatchesScreenState();
}

class _MatchesScreenState extends State<MatchesScreen> {
  List<dynamic> matches = [];

  @override
  void initState() {
    super.initState();
    fetchMatches();
  }

  Future<void> fetchMatches() async {
    final response = await http.get(Uri.parse(
        'https://api.football-data.org/v2/competitions/CL/matches?status=SCHEDULED&limit=4'),
        headers: {'X-Auth-Token': '1ea5890b3cdf41fd911845ccbc172190'});

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
        title: Text('Upcoming Matches'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.sports_soccer),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TopScorersScreen()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: matches.length,
        itemBuilder: (BuildContext context, int index) {
          final match = matches[index];
          final homeTeamName = match['homeTeam']['name'];
          final awayTeamName = match['awayTeam']['name'];
          final matchDateTime = DateTime.parse(match['utcDate']).toLocal();
          final matchDate = matchDateTime.toIso8601String().split('T')[0];
          final matchTime = matchDateTime.toIso8601String().split('T')[1].substring(0, 5);

          return Card(
            child: ListTile(
              leading: Text(homeTeamName),
              trailing: Text(awayTeamName),
              title: Text('$matchDate $matchTime'),
            ),
          );
        },
      ),
    );
  }
}
