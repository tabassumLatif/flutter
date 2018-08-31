import 'package:flutter/material.dart';
import 'package:fam_properties_test/MainScreen.dart' as mainScreen;
import 'package:fam_properties_test/ResturantMap.dart' as restaurantsMap;

class MainTabScreen extends StatefulWidget {
  @override
  _MainTabScreenState createState() => _MainTabScreenState();
}

class _MainTabScreenState extends State<MainTabScreen> with SingleTickerProviderStateMixin{

  TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 2, vsync: this);
  }


  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      color: Colors.yellow,
      home: DefaultTabController(
        length: 2,
        child: new Scaffold(
          appBar: new AppBar(
            title: new Text("Fam Property"),
            backgroundColor: Colors.teal,
            bottom: new TabBar(

              controller: tabController,
              tabs: [
                Tab(
                  text: "Places",
                ),
                Tab(
                  text: "Resturants",
                ),

              ],

              labelColor: Colors.yellow,
              unselectedLabelColor: Colors.blue,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorPadding: EdgeInsets.all(5.0),
              indicatorColor: Colors.red,
            ),
          ),
          body: TabBarView(
            controller: tabController,
            children: [
             /* new Container(
                child: new MainTabScreen(),
              ),
              new Container(
                color: Colors.orange,
              ),*/

             new mainScreen.MainScreen(),
             new restaurantsMap.RestaurantsMap(),
            ],
          ),

          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
