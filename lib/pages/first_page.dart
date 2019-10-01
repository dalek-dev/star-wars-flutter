import 'package:flutter/material.dart';
import 'dart:core';

import 'package:prueba/models/model_starwars.dart';
import 'package:prueba/provider/provider_starwars.dart';
import 'package:prueba/utils/global_widget.dart';
import 'package:prueba/utils/star_painter.dart';

class FirstPage extends StatefulWidget {
  final StarWars starwars;

  const FirstPage({Key key, this.starwars}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  static const colorStarWarsPrimary  = Color(0xFFFFE81F);
  StarWarsLoadMoreStatus loadMoreStatus = StarWarsLoadMoreStatus.STABLE;
  final ScrollController scrollController = new ScrollController();
  int currentPageNumber;
  String tempNext;
  String newNext;
  List<StarWarsModel> starW;
  int FIRST_PAGE_PEOPLE = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        key: GlobKeys.scaffoldKey,
        backgroundColor: Colors.black,
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
            NotificationListener(
              onNotification: (overscroll) => overscroll.disallowGlow() as bool,
              child: FutureBuilder<StarWars>(
              future: StarWarsProvider().fetchStarWars(FIRST_PAGE_PEOPLE),
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
                          child: NotificationListener(
                            onNotification: onNotification,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: people == null ? 0 : people.length,
                              itemBuilder: (context, index) {
                                return Card(
                                    color: colorStarWarsPrimary,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20.0)
                                    ),
                                    elevation: 2,
                                    child: GestureDetector(
                                      onTap: ()=>Navigator.pushNamed(context, 'detalle',arguments: people[index]),
                                      child: Container(
                                        height: 80.0,
                                        width: MediaQuery.of(context).size.width - 80.0,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          topLeft: Radius.circular(10),
                                        ),),
                                        child: Column(
                                          children: <Widget>[
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      top:22.0,
                                                      left:60.0,
                                                      right: 20.0,
                                                  ),
                                                  child: Text(
                                                    people[index].name,
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontFamily: "StarWars",
                                                      fontSize: 20.0,
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
                              controller: scrollController,
                            ),
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
            )
          ]
        ),
        resizeToAvoidBottomPadding: true ,
      );
    }

  bool onNotification(ScrollNotification notification) {
    if (notification is ScrollUpdateNotification) {
      if (scrollController.position.maxScrollExtent > scrollController.offset &&
          scrollController.position.maxScrollExtent - scrollController.offset <=
              50) {
        if (loadMoreStatus != null &&
            loadMoreStatus == StarWarsLoadMoreStatus.STABLE) {
          loadMoreStatus = StarWarsLoadMoreStatus.LOADING;
          StarWarsProvider()
              .fetchStarWars(currentPageNumber + 1)
              .then((starWarsObject) {
            tempNext              = starWarsObject.next;
            newNext               = tempNext.substring(tempNext.length - 1);
            currentPageNumber = newNext as int;
            loadMoreStatus = StarWarsLoadMoreStatus.STABLE;
            setState(() => starW.addAll(starWarsObject.results));
          });
        }
      }
    }
    return true;
  }
}

