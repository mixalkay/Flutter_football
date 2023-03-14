import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TopScorersScreen extends StatefulWidget {
  @override
  _TopScorersScreenState createState() => _TopScorersScreenState();
}

class _TopScorersScreenState extends State<TopScorersScreen> {
  List<dynamic> topScorers = [];

  @override
  void initState() {
    super.initState();
    fetchTopScorers();
  }

  Future<void> fetchTopScorers() async {
    final response = await http.get(
      Uri.parse('https://api-football-v1.p.rapidapi.com/v3/players/topscorers?league=39&season=2021&team=61'),
      headers: {
        'x-rapidapi-key': '3bcccb02c1mshc8d5852442e2c1ep17ccacjsn720a7ca80402',
        'x-rapidapi-host': 'api-football-v1.p.rapidapi.com',
      },
    );

    if (response.statusCode == 200) {
      final decodedResponse = json.decode(response.body);
      setState(() {
        topScorers = decodedResponse['response'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chelsea Top Scorers'),
      ),
      body: ListView.builder(
        itemCount: topScorers.length,
        itemBuilder: (BuildContext context, int index) {
          final scorer = topScorers[index];
          final playerName = scorer['player']['name'];
          final goals = scorer['goals']['total'];

          return ListTile(
            leading: Text('${index + 1}'),
            title: Text(playerName),
            trailing: Text('$goals goals'),
          );
        },
      ),
    );
  }
}
