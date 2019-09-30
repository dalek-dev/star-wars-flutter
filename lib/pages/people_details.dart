import 'package:flutter/material.dart';
import 'package:prueba/models/model_starwars.dart';
import 'package:prueba/utils/caracter_people.dart';
import 'package:prueba/utils/star_painter.dart';

class PeopleDetails extends StatelessWidget {

  static const colorStarWarsPrimary   = Color(0xFFFFE81F);
  static const colorStarWarsSecondary = Color(0xFF000000);


  @override
  Widget build(BuildContext context) {
    final StarWarsModel starwars = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: colorStarWarsSecondary,
      body: Stack(
        children:<Widget>[
          FittedBox(
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 10.0,
              height: MediaQuery.of(context).size.height - 100.0,
              child: CustomPaint(
                painter: StarPainter(),
              ),
            ),
          ),
          CustomScrollView(
          slivers: <Widget>[
            _crearAppbar(starwars),
            SliverList(
                delegate:SliverChildListDelegate(
                  [
                  SizedBox(
                    height: 10.0,
                  ),
                  _description(starwars),
                  ]
                )
            ),
          ],
        ),
      ]
      ),
    );
  }

  Widget _crearAppbar(StarWarsModel starwars) {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: colorStarWarsPrimary,
      expandedHeight: 80.0,
      floating: false,
      pinned: true,
      title: Text(
        starwars.name,
        style: TextStyle(
          fontSize: 22.0,
          color: colorStarWarsSecondary,
          fontFamily: "starwars",
        ),
      ),
    );
  }

  Widget _description(StarWarsModel starwars) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        child: Column(
          children: <Widget>[
            CaracterPeople(
                "Height: ",
                starwars.height,
            ),
            CaracterPeople(
                "Mass: ",
                starwars.mass,
            ),
            CaracterPeople(
              "Hair Color: ",
              starwars.hair_color,
            ),
            CaracterPeople(
              "Skin Color: ",
              starwars.skin_color,
            ),
            CaracterPeople(
              "Eye Color: ",
              starwars.eye_color,
            ),
            CaracterPeople(
              "Birth Year: ",
              starwars.birth_year,
            ),
            CaracterPeople(
              "Gender: ",
              starwars.gender,
            ),
          ],
        )
    );
  }
}
