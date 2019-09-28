import 'package:flutter/material.dart';
import 'package:prueba/models/model_starwars.dart';
import 'dart:core';
import 'package:prueba/provider/provider_starwars.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    StarWarsProvider.peopleStarWars();
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.black,
        body: FutureBuilder<StarWars>(
          future: StarWarsProvider.peopleStarWars(),
          builder: (BuildContext context, AsyncSnapshot<StarWars> snapshot){
            if(snapshot.hasData){
              final people = snapshot.data.results;
              return Column(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(top:68.0),
                      child: Text(
                        "STAR WARS",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "starwars",
                          fontSize: 40.0,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 8,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: people == null ? 0 : people.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.only(
                                top: 6.0,
                                bottom:6.0,
                                right: 12.0,
                                left: 12.0
                            ),
                            child: Card(
                              color: Color(0xFFFFE81F),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)
                              ),
                            elevation: 2,
                              child: Container(
                                height: 285.0,
                                width: 130.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                  topLeft: Radius.circular(15),
                                ),),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(top:10.0, left: 20.0),
                                          child: Text(
                                            "Name:",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18.0,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top:8.0, left:10.0),
                                          child: Text(
                                            people[index].name,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: "StarWars",
                                              fontSize: 16.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(top:10.0, left: 20.0),
                                          child: Text(
                                            "Height:",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18.0,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top:8.0, left:10.0),
                                          child: Text(
                                            people[index].height,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: "StarWars",
                                              fontSize: 16.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(top:10.0, left: 20.0),
                                          child: Text(
                                            "Mass:",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18.0,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top:8.0, left:10.0),
                                          child: Text(
                                            people[index].mass,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: "StarWars",
                                              fontSize: 16.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(top:10.0, left: 20.0),
                                          child: Text(
                                            "Hair Color:",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18.0,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top:8.0, left:10.0),
                                          child: Text(
                                            people[index].hair_color,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: "StarWars",
                                              fontSize: 16.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(top:10.0, left: 20.0),
                                          child: Text(
                                            "Skin Color:",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18.0,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top:8.0, left:10.0),
                                          child: Text(
                                            people[index].skin_color,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: "StarWars",
                                              fontSize: 16.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(top:10.0, left: 20.0),
                                          child: Text(
                                            "Eye Color:",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18.0,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top:8.0, left:10.0),
                                          child: Text(
                                            people[index].eye_color,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: "StarWars",
                                              fontSize: 16.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(top:10.0, left: 20.0),
                                          child: Text(
                                            "Birth Year:",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18.0,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top:8.0, left:10.0),
                                          child: Text(
                                            people[index].birth_year,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: "StarWars",
                                              fontSize: 16.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(top:10.0, left: 20.0),
                                          child: Text(
                                            "Gender:",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18.0,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top:8.0, left:10.0),
                                          child: Text(
                                            people[index].gender,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: "StarWars",
                                              fontSize: 16.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                              ),
                            ),
                          );
                        },
                      ),
                    ),
                ],
              );
            }else if(snapshot.hasError){
              return new Text("${snapshot.error}");
            }
              return Center(child: CircularProgressIndicator(),);
          },
        ),
      );
    }
}

