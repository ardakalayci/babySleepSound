import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:babysleep/model/sounds.dart';
import 'package:babysleep/prepare/prepare.dart';
import 'package:babysleep/ui/color.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class HomeaPage extends StatefulWidget {
  @override
  _HomeaPageState createState() => _HomeaPageState();
}

class _HomeaPageState extends State<HomeaPage> with TickerProviderStateMixin {
  List<TabItem> tabItems = List.of([
    new TabItem(Icons.trip_origin, "Ninni", Colors.blue),
    new TabItem(Icons.add_circle, "Home Tools", Colors.green),
    new TabItem(Icons.grain, "White Noise", Colors.orange),
    new TabItem(Icons.layers, "Cars", Colors.red),
    new TabItem(Icons.library_music, "Nature", Colors.yellow),
  ]);



  int seciliPozisyon = 2;
  CircularBottomNavigationController _navigationController;
  TabController controllerNinni;
  TabController controllerNature;
  TabController controllerHome;
  TabController controllerCars;
  TabController controllerWhite;

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  void initState() {
    debugPrint("sasdasd");
    super.initState();
    _navigationController =
        new CircularBottomNavigationController(seciliPozisyon);
    controllerNinni = new TabController(vsync: this, length: 3);
    controllerNature = new TabController(vsync: this, length: 5);
    controllerHome = new TabController(vsync: this, length: 3);
    controllerCars = new TabController(vsync: this, length: 4);
    controllerWhite = new TabController(vsync: this, length: 1);
  }

  @override
  void dispose() {
    super.dispose();
  }

  static List<Sound> homeTools;
  static List<Sound> ninnis;
  static List<Sound> whites;
  static List<Sound> natures;
  static List<Sound> cars;
  var arda = "baaykemal";
  var renk;
  var sesAcik = 0;
  var _value = 1.0;
  final ses = AssetsAudioPlayer();

  @override
  Widget build(BuildContext context) {
    ses.loop = true;
    homeTools = homeHazirla();
    whites = whitesHazirla();
    natures = natureHazirla();
    ninnis = ninnisHazirla();
    cars = carsHazirla();
    return Scaffold(
      endDrawer: drawerGetir(),
      drawer: drawerGetir(),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        bottom: PreferredSize(
          child: Container(
            child: sesAyar(),
            alignment: Alignment.center,
            color: Color.fromARGB(0, 10, 10, 10),
            constraints: BoxConstraints.expand(height: 50),
          ),
          preferredSize: Size(50, 50),
        ),
        bottomOpacity: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        flexibleSpace: Container(
          child: Container(padding: EdgeInsets.fromLTRB(45, 45, 45, 0)),
          decoration: BoxDecoration(color: Color.fromARGB(0, 10, 10, 10)),
        ),
        backgroundColor: Color.fromARGB(0, 10, 10, 10),
        elevation: 0,
        titleSpacing: 1 / 2,
        title: Center(
            child: Column(children: <Widget>[
          TabPageSelector(
            indicatorSize: 14,
            color: Color.fromARGB(0, 255, 255, 255),
            selectedColor: Colors.white,
            controller: seciliContainer(),
          ),
        ])),
      ),
      backgroundColor: Colors.pink.shade50,
      body: Stack(
        children: <Widget>[
          Padding(
            child: bodyContainer(),
            padding: EdgeInsets.only(bottom: 60),
          ),
          Align(alignment: Alignment.bottomCenter, child: bottomNav())
        ],
      ),
    );
  }

  seciliContainer() {
    switch (seciliPozisyon) {
      case 0:
        controllerHome.index = 0;
        controllerCars.index = 0;
        controllerNature.index = 0;
        controllerWhite.index = 0;

        return controllerNinni;
        break;
      case 1:
        controllerNinni.index = 0;
        controllerCars.index = 0;
        controllerNature.index = 0;
        controllerWhite.index = 0;

        return controllerHome;
        break;
      case 2:
        controllerHome.index = 0;
        controllerNinni.index = 0;
        controllerNature.index = 0;
        controllerCars.index = 0;

        return controllerWhite;
        break;
      case 3:
        controllerHome.index = 0;
        controllerNinni.index = 0;
        controllerNature.index = 0;
        controllerWhite.index = 0;

        return controllerCars;
        break;
      case 4:
        controllerHome.index = 0;
        controllerNinni.index = 0;
        controllerCars.index = 0;
        controllerWhite.index = 0;

        return controllerNature;
        break;
    }
  }

  Widget bodyContainer() {
    String slogan;
    switch (seciliPozisyon) {
      case 0:
        return ninnisPage();
        break;
      case 1:
        return homeToolsPage();
        break;
      case 2:
        return whitesPage();
        break;
      case 3:
        return carsPage();
        break;
      case 4:
        return naturesPage();
        break;
    }
    return Center(
      child: Text(slogan),
    );
  }

  ninnisPage() {
    return DefaultTabController(
        length: ninnis.length,
        child: Builder(
          builder: (BuildContext context) => Padding(
            padding: EdgeInsets.all(0),
            child: TabBarView(
              controller: controllerNinni,
              children: new List<Widget>.generate(ninnis.length, (index) {
                return new GridTile(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        arda = "arnana";
                        ses.isPlaying.value
                            ? ses.pause()
                            : ses.open(Audio(ninnis[index].sesPath.toString()));
                        ses.isPlaying.value ? sesAcik = 0 : sesAcik = 1;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(0),
                      padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                      decoration: BoxDecoration(color: colors[index+1]),
                      child: new Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                width: MediaQuery.of(context).orientation ==
                                        Orientation.landscape
                                    ? MediaQuery.of(context).size.width / 5
                                    : MediaQuery.of(context).size.width / 2,
                                child: new Image.asset(
                                    ninnis[index].sesIconPath.toString()),
                              ),
                              Divider(
                                height: 25,
                                color: Color.fromARGB(0, 0, 0, 0),
                              ),
                              Container(
                                child: Icon(
                                  sesAcik == 0
                                      ? Icons.play_circle_outline
                                      : Icons.pause_circle_outline,
                                  size: MediaQuery.of(context).orientation ==
                                          Orientation.landscape
                                      ? 40
                                      : 55,
                                  color: Colors.white,
                                ),
                              )
                            ]),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ));
  }

  homeToolsPage() {
    return DefaultTabController(
        length: 3,
        child: Builder(
          builder: (BuildContext context) => Padding(
            padding: EdgeInsets.all(0),
            child: TabBarView(
              controller: controllerHome,
              children: new List<Widget>.generate(homeTools.length, (index) {
                return new GridTile(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        arda = "arnana";
                        ses.isPlaying.value
                            ? ses.pause()
                            : ses.open(
                                Audio(homeTools[index].sesPath.toString()));
                        ses.isPlaying.value ? sesAcik = 0 : sesAcik = 1;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(0),
                      padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                      decoration: BoxDecoration(color: colors[index]),
                      child: new Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                width: MediaQuery.of(context).orientation ==
                                        Orientation.landscape
                                    ? MediaQuery.of(context).size.width / 5
                                    : MediaQuery.of(context).size.width / 2,
                                child: new Image.asset(
                                    homeTools[index].sesIconPath.toString()),
                              ),
                              Divider(
                                height: 25,
                                color: Color.fromARGB(0, 0, 0, 0),
                              ),
                              Container(
                                child: Icon(
                                  sesAcik == 0
                                      ? Icons.play_circle_outline
                                      : Icons.pause_circle_outline,
                                  size: MediaQuery.of(context).orientation ==
                                          Orientation.landscape
                                      ? 40
                                      : 55,
                                  color: Colors.white,
                                ),
                              )
                            ]),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ));
  }

  naturesPage() {
    return DefaultTabController(
        length: natures.length,
        child: Builder(
          builder: (BuildContext context) => Padding(
            padding: EdgeInsets.all(0),
            child: TabBarView(
              controller: controllerNature,
              children: new List<Widget>.generate(natures.length, (index) {
                return new GridTile(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        arda = "arnana";
                        ses.isPlaying.value
                            ? ses.pause()
                            : ses
                                .open(Audio(natures[index].sesPath.toString()));
                        ses.isPlaying.value ? sesAcik = 0 : sesAcik = 1;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(0),
                      padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                      decoration: BoxDecoration(color: colors[index]),
                      child: new Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                width: MediaQuery.of(context).orientation ==
                                        Orientation.landscape
                                    ? MediaQuery.of(context).size.width / 5
                                    : MediaQuery.of(context).size.width / 2,
                                child: new Image.asset(
                                    natures[index].sesIconPath.toString()),
                              ),
                              Divider(
                                height: 25,
                                color: Color.fromARGB(0, 0, 0, 0),
                              ),
                              Container(
                                child: Icon(
                                  sesAcik == 0
                                      ? Icons.play_circle_outline
                                      : Icons.pause_circle_outline,
                                  size: MediaQuery.of(context).orientation ==
                                          Orientation.landscape
                                      ? 40
                                      : 55,
                                  color: Colors.white,
                                ),
                              )
                            ]),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ));
  }
  whitesPage() {
    return DefaultTabController(
        length: whites.length,
        child: Builder(
          builder: (BuildContext context) => Padding(
            padding: EdgeInsets.all(0),
            child: TabBarView(
              controller: controllerWhite,
              children: new List<Widget>.generate(whites.length, (index) {
                return new GridTile(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        arda = "arnana";
                        ses.isPlaying.value
                            ? ses.pause()
                            : ses
                                .open(Audio(whites[index].sesPath.toString()));
                        ses.isPlaying.value ? sesAcik = 0 : sesAcik = 1;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(0),
                      padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                      decoration: BoxDecoration(color: colors[index+2]),
                      child: new Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                width: MediaQuery.of(context).orientation ==
                                        Orientation.landscape
                                    ? MediaQuery.of(context).size.width / 5
                                    : MediaQuery.of(context).size.width / 2,
                                child: new Image.asset(
                                    whites[index].sesIconPath.toString()),
                              ),
                              Divider(
                                height: 25,
                                color: Color.fromARGB(0, 0, 0, 0),
                              ),
                              Container(
                                child: Icon(
                                  sesAcik == 0
                                      ? Icons.play_circle_outline
                                      : Icons.pause_circle_outline,
                                  size: MediaQuery.of(context).orientation ==
                                          Orientation.landscape
                                      ? 40
                                      : 55,
                                  color: Colors.white,
                                ),
                              )
                            ]),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ));
  }

  carsPage() {
    return DefaultTabController(
        length: cars.length,
        child: Builder(
          builder: (BuildContext context) => Padding(
            padding: EdgeInsets.all(0),
            child: TabBarView(
              controller: controllerCars,
              children: new List<Widget>.generate(cars.length, (index) {
                return new GridTile(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        arda = "arnana";
                        ses.isPlaying.value
                            ? ses.pause()
                            : ses.open(Audio(cars[index].sesPath.toString()));
                        ses.isPlaying.value ? sesAcik = 0 : sesAcik = 1;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(0),
                      padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                      decoration: BoxDecoration(color: colors[index+3]),
                      child: new Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                width: MediaQuery.of(context).orientation ==
                                    Orientation.landscape
                                    ? MediaQuery.of(context).size.width / 5
                                    : MediaQuery.of(context).size.width / 2,
                                child: new Image.asset(
                                    cars[index].sesIconPath.toString()),
                              ),
                              Divider(
                                height: 25,
                                color: Color.fromARGB(0, 0, 0, 0),
                              ),
                              Container(
                                child: Icon(
                                  sesAcik == 0
                                      ? Icons.play_circle_outline
                                      : Icons.pause_circle_outline,
                                  size: MediaQuery.of(context).orientation ==
                                      Orientation.landscape
                                      ? 40
                                      : 55,
                                  color: Colors.white,
                                ),
                              )
                            ]),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ));
  }

  bottomNav() {
    return CircularBottomNavigation(
      tabItems,
      controller: _navigationController,
      barHeight: 60,
      barBackgroundColor: Colors.white,
      animationDuration: Duration(milliseconds: 300),
      selectedCallback: (int selectedPos) {
        setState(() {
          seciliPozisyon = selectedPos;
        });
      },
    );
  }

  sesAyar() {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        valueIndicatorColor: Color.fromARGB(55, 0, 0, 0),
        // This is what you are asking for
        inactiveTrackColor: Colors.white,
        // Custom Gray Color
        activeTrackColor: Colors.white,
        thumbColor: Colors.white,
        overlayColor: Colors.white,
        // Custom Thumb overlay Color
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
        overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
      ),
      child: Slider(
          value: _value.toDouble(),
          label: (_value * 100).toInt().toString(),
          min: 0,
          max: 1,
          divisions: 100,
          onChanged: (double newvalue) {
            setState(() {
              _value = newvalue;
              ses.setVolume(_value);
              newvalue = _value;

              debugPrint(newvalue.toString());
            });
          }),
    );
  }

  drawerGetir() {
    return ClipPath(
      clipper: OvalRightBorderClipper(),
      child: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Align(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.directions_car,
                      color: Colors.white,
                      size: 100.0,
                    ),
                    Text(
                      "Kurnaz Nakliyat",
                      style: TextStyle(color: Colors.white, fontSize: 25.0),
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Anasayfa'),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                Navigator.pushNamed(context, "/");
              },
            ),
            ListTile(
              leading: Icon(Icons.local_laundry_service),
              title: Text('Hizmetler'),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }


/*return Container(
        child:
        ListWheelScrollView(
          controller: _controller,
          itemExtent: MediaQuery.of(context).size.height/3,
          diameterRatio: 4,




          physics: FixedExtentScrollPhysics(),
          children: <Widget>[
            GestureDetector(
              onTap: (){
                debugPrint("ardaaadsds");
              },
              child: Container(
                constraints: BoxConstraints.expand(),
                decoration: BoxDecoration(
                    color: Colors.blue
                ),
                child: GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 5,
                    children: new List<Widget>.generate(animals.length, (index) {
                      return new GridTile(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              debugPrint("ardaaaaa");
                              arda="arnana";
                              ses.isPlaying.value
                                  ? ses.pause()
                                  : ses.open(Audio(animals[index].sesPath.toString()));






                            });
                          },
                          child: Container(
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(80)),
                                color: ses.isPlaying.value
                                    ? Colors.pinkAccent
                                    : Colors.pink),
                            child: new Center(
                              child: new Image.asset(animals[index].sesIconPath.toString()),
                            ),
                          ),
                        ),
                      );
                    })),
              ),
            ),
            Container(constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                  color: Colors.grey
              ),
              child: Text("arfdsda"),
            ),
            Container(constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                  color: Colors.yellow
              ),
              child: Text("arasa"),
            ),
            Container(constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                  color: Colors.blue
              ),
              child: Text("arsa"),
            ),
            Container(constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                  color: Colors.blue
              ),
              child: Text("arfdafsa"),
            ),

          ],
        )

    );
  }*/
}
