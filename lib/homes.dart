import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:babysleep/model/sounds.dart';
import 'package:babysleep/prepare/prepare.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';

class HomeaPage extends StatefulWidget {
  @override
  _HomeaPageState createState() => _HomeaPageState();
}

class _HomeaPageState extends State<HomeaPage> with TickerProviderStateMixin {
  List<TabItem> tabItems = List.of([
    new TabItem(Icons.trip_origin, "Anasayfa", Colors.blue),
    new TabItem(Icons.add_circle, "Akrababa", Colors.green),
    new TabItem(Icons.grain, "Müzik Ara", Colors.orange),
    new TabItem(Icons.layers, "Kitaplık", Colors.red),
    new TabItem(Icons.library_music, "Hit Müzik", Colors.yellow),
  ]);

  final List<Color> colors = <Color>[
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange
  ];

  int seciliPozisyon = 2;
  CircularBottomNavigationController _navigationController;
  @override
  TabController controller;
  TabController controller2;
  TabController controller3;

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
    controller = new TabController(vsync: this, length: 3);
    controller2 = new TabController(vsync: this, length: 5);
    controller3 = new TabController(vsync: this, length: 5);
  }

  @override
  void dispose() {
    super.dispose();
  }

  static List<Sound> homeTools;
  static List<Sound> animals;
  static List<Sound> natures;
  var arda = "baaykemal";
  var renk;
  var sesAcik = 0;
  var _value = 1.0;
  final ses = AssetsAudioPlayer();
  List expanded = [1, 1, 1, 1, 1, 1, 1, 1];

  @override
  Widget build(BuildContext context) {
    ses.loop = true;
    homeTools = homeHazirla();
    animals = animalsHazirla();
    natures = natureHazirla();
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
        return controller;
        break;
      case 1:
        return controller2;
        break;
      case 2:
        return controller3;
        break;
      case 3:
        return controller2;
        break;
      case 4:
        return controller2;
        break;
    }
  }

  Widget bodyContainer() {
    String slogan;
    switch (seciliPozisyon) {
      case 0:
        return bodypage();
        break;
      case 1:
        return bodypage1();
        break;
      case 2:
        return bodypage2();
        break;
      case 3:
        slogan = "Hit Müzikler";
        break;
      case 4:
        slogan = "Hit Müzikler";
        break;
    }
    return Center(
      child: Text(slogan),
    );
  }

  bodypage() {
    return DefaultTabController(
        length: 3,
        child: Builder(
          builder: (BuildContext context) => Padding(
            padding: EdgeInsets.all(0),
            child: TabBarView(
              controller: controller,
              children: new List<Widget>.generate(animals.length, (index) {
                return new GridTile(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        arda = "arnana";
                        ses.isPlaying.value
                            ? ses.pause()
                            : ses
                                .open(Audio(animals[index].sesPath.toString()));
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
                                    animals[index].sesIconPath.toString()),
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

  bodypage1() {
    return DefaultTabController(
        length: 3,
        child: Builder(
          builder: (BuildContext context) => Padding(
            padding: EdgeInsets.all(0),
            child: TabBarView(
              controller: controller2,
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

  bodypage2() {
    return DefaultTabController(
        length: natures.length,
        child: Builder(
          builder: (BuildContext context) => Padding(
            padding: EdgeInsets.all(0),
            child: TabBarView(
              controller: controller3,
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
    return Drawer(
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
          ExpansionTile(
            leading: Icon(Icons.perm_device_information),
            title: Text('Kurumsal'),
            trailing: Icon(Icons.arrow_drop_down),
            children: <Widget>[
              ListTile(
                title: Text('Biz Kimiz'),
                trailing: Icon(Icons.arrow_right),
                onTap: () {
                  Navigator.pushNamed(context, "/bizkimiz");
                },
              ),
              ListTile(
                title: Text('Tarihçemiz'),
                trailing: Icon(Icons.arrow_right),
                onTap: () {
                  Navigator.pushNamed(context, "/tarihcemiz");
                },
              ),
              ListTile(
                title: Text('Kurumsal'),
                trailing: Icon(Icons.arrow_right),
                onTap: () {
                  Navigator.pushNamed(context, "/kurumsal");
                },
              ),
            ],
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
