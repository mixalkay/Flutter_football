import 'package:flutter/material.dart';
import 'package:footballapp/Screens/TableScreen.dart';
import 'package:footballapp/Widgets/LeagueContainer.dart';
import 'package:footballapp/Screens/ChampionsLeague.dart';
import 'Chelsea.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              const Color(0xffa8af4e),
              const Color(0xff3f2d86),
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(0.0, 1.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          )),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Competitions',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        offset: Offset(3.0, 3.0),
                        blurRadius: 1.0,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
  child: Text("Upcoming matches of UCL"),
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MatchesScreen()),
    );
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.black26, // задаем цвет фона кнопки
  ),
),
             ElevatedButton(
  child: Text("Chelsea Matches"),
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ResultsScreen()),
    );
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.black26, // задаем цвет фона кнопки
  ),
),
                GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  children: [
                    GestureDetector(
                      child: LeagueContainer(image: 'assets/pl.png'),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TableScreen(code: 'PL'),
                            ));
                      },
                    ),
                    GestureDetector(
                      child: LeagueContainer(image: 'assets/laliga.png'),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TableScreen(code: 'PD'),
                            ));
                      },
                    ),
                    GestureDetector(
                      child: LeagueContainer(image: 'assets/bundesliga.png'),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TableScreen(code: 'BL1'),
                            ));
                      },
                    ),
                    GestureDetector(
                      child: LeagueContainer(image: 'assets/seria.png'),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TableScreen(code: 'SA'),
                            ));
                      },
                    ),
                    GestureDetector(
                      child: LeagueContainer(image: 'assets/ligue1.png'),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TableScreen(code: 'FL1'),
                            ));
                      },
                    ),
                    GestureDetector(
                      child: LeagueContainer(image: 'assets/nos.png'),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TableScreen(code: 'PPL'),
                            ));
                      },
                    ),
                    
                  ],
                )
              ],
            ),
            
          ),
        ),
      ),
    );
    
  }
}

