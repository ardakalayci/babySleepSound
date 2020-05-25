import 'dart:async';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:babysleep/model/sounds.dart';
import 'package:babysleep/prepare/prepare.dart';
import 'package:babysleep/ui/color.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../i18n.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  double timeIndicator = 1;
  int sayac = 5;
  var switchDurum;
  int timer = 15;
  int showtimer = 30;
  int seciliPozisyon = 2;
  bool canceltimer = false;
  CircularBottomNavigationController _navigationController;
  TabController controllerNinni;
  TabController controllerNature;
  TabController controllerHome;
  TabController controllerCars;
  TabController controllerWhite;

  @override
  void setState(fn) {
    super.setState(fn);
  }

  @override
  void initState() {
    super.initState();
    _navigationController =
        new CircularBottomNavigationController(seciliPozisyon);
    controllerNinni = new TabController(vsync: this, length: 3);
    controllerNature = new TabController(vsync: this, length: 5);
    controllerHome = new TabController(vsync: this, length: 3);
    controllerCars = new TabController(vsync: this, length: 4);
    controllerWhite = new TabController(vsync: this, length: 1);
  }

  static List<Sound> homeTools;
  static List<Sound> ninnis;
  static List<Sound> whites;
  static List<Sound> natures;
  static List<Sound> cars;
  var arda = "baaykemal";
  var rollingswitch = false;
  var renk;
  var sesAcik = 0;
  var _value = 0.5;
  final ses = AssetsAudioPlayer();
  var timeindex = 1;

  @override
  Widget build(BuildContext context) {
    ses.loop = true;
    homeTools = homeHazirla();
    whites = whitesHazirla();
    natures = natureHazirla();
    ninnis = ninnisHazirla();
    cars = carsHazirla();
    return Scaffold(
      //endDrawer: drawerGetir(),
      //drawer: drawerGetir(),
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
            padding: EdgeInsets.only(bottom: 50),
          ),
          Align(alignment: Alignment.bottomCenter, child: bottomNav())
        ],
      ),
    );
  }

  timeSecim() {
    switch (timeindex) {
      case 0:
        setState(() {
          timer = 300;
        });

        return 300;
        break;

      case 1:
        setState(() {
          timer = 600;
        });
        return 600;
        break;
      case 2:
        setState(() {
          timer = 1800;
        });
        return 1800;
        break;
    }
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
                      setGetir(index);
                    },
                    child: Container(
                        margin: EdgeInsets.all(0),
                        padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                        decoration: BoxDecoration(color: colors[index+2]),
                        child: tabWidgets(index)),
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
                      setGetir(index);
                    },
                    child: Container(
                        margin: EdgeInsets.all(0),
                        padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                        decoration: BoxDecoration(color: colors[index + 1]),
                        child: tabWidgets(index)),
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
                      setGetir(index);
                    },
                    child: Container(
                      margin: EdgeInsets.all(0),
                      padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                      decoration: BoxDecoration(color: colors[index + 2]),
                      child: tabWidgets(index),
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
                      setGetir(index);
                    },
                    child: Container(
                      margin: EdgeInsets.all(0),
                      padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                      decoration: BoxDecoration(color: colors[index + 2]),
                      child: tabWidgets(index),
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
                      setGetir(index);
                    },
                    child: Container(
                      margin: EdgeInsets.all(0),
                      padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                      decoration: BoxDecoration(color: colors[index + 1]),
                      child: tabWidgets(index),
                    ),
                  ),
                );
              }),
            ),
          ),
        ));
  }

  bottomNav() {
    List<TabItem> tabItems = List.of([
      new TabItem(Icons.music_note, I18n.of(context).ninni, Colors.blue),
      new TabItem(Icons.category, I18n.of(context).home_tools, Colors.green),
      new TabItem(Icons.grain, I18n.of(context).white_noise, Colors.orange),
      new TabItem(Icons.directions_car, I18n.of(context).cars, Colors.red),
      new TabItem(Icons.terrain, I18n.of(context).nature, Colors.yellow),
    ]);
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
        valueIndicatorColor: _value * 100 > 32&&_value * 100<63  ? Colors.black: Color.fromARGB(70, 0, 0, 0),
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

  void starttimer() async {
    const onesec = Duration(seconds: 1);
    rollingswitch == true
        ? Timer.periodic(onesec, (Timer t) {
            setState(() {
              valueGetir();
              if (timer < 1) {
                canceltimer = false;
                t.cancel();
                ses.pause();
                ses.isPlaying.value ? sesAcik = 0 : sesAcik = 1;
              } else if (canceltimer == false) {
                ses.pause();

                t.cancel();
              } else {
                timer = timer - 1;
              }
              showtimer = timer;
            });
          })
        : null;
  }

  switchGetir(index) {
    return LiteRollingSwitch(
      //initial value
      value: rollingswitch,
      textOn: I18n.of(context).time,
      textOff: I18n.of(context).time,
      colorOn: toolscolors[index],
      colorOff: Colors.red,
      iconOn: Icons.done,
      iconOff: Icons.remove_circle_outline,
      textSize: 16.0,
      onTap: () {
        setState(() {
          timer = timeSecim();
          showtimer = timer;
          rollingswitch = rollingswitch;
        });
      },
      onChanged: (bool state) {
        rollingswitch = state;
      },
    );
  }

  getirToggle(index) {
    return ToggleSwitch(
      cornerRadius: 20,
      //minWidth: 90.0,
      initialLabelIndex: 1,
      activeBgColor: Colors.white,
      activeTextColor: Colors.black,
      inactiveBgColor: toolscolors[index],
      inactiveTextColor: Colors.white,
      labels: [I18n.of(context).fivemin, I18n.of(context).tenmin, I18n.of(context).thirtymin],
      onToggle: (index) {
        setState(() {
          timeindex = index;
          timer = timeSecim();
          showtimer = timer;

          print('switched to: $index');
        });
      },
    );
  }

  valueGetir() {
    timeIndicator = showtimer / timeSecims();
  }

  timeSecims() {
    switch (timeindex) {
      case 0:
        return 10;
        break;

      case 1:
        return 12;
        break;
      case 2:
        return 900;
        break;
    }
  }

  tabWidgets(index) {
    return Padding(
      padding: EdgeInsets.only(top: 25),
      child: new Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Divider(
                height: 20,
                color: Color.fromARGB(0, 0, 0, 0),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.5,
                child: new Image.asset(iconGetir(index)),
              ),
              Divider(
                height: 10,
                color: Color.fromARGB(0, 0, 0, 0),
              ),
              Container(
                child: Icon(
                  sesAcik == 0
                      ? Icons.play_circle_outline
                      : Icons.pause_circle_outline,
                  size: MediaQuery.of(context).orientation ==
                          Orientation.landscape
                      ? 30
                      : 45,
                  color: Colors.white,
                ),
              ),
              Divider(
                height: 20,
                color: Color.fromARGB(0, 0, 0, 0),
              ),
              switchGetir(index),
              Divider(
                height: 15,
                color: Color.fromARGB(0, 0, 0, 0),
              ),
              rollingswitch == true
                  ? getirToggle(index)
                  : Divider(
                      height: 40,
                      color: Color.fromARGB(0, 0, 0, 0),
                    ),
              Divider(
                height: 15,
                color: Color.fromARGB(0, 0, 0, 0),
              ),
              rollingswitch == true
                  ? SizedBox(
                      width: MediaQuery.of(context).size.width / 5,
                      height: MediaQuery.of(context).size.width / 5,
                      child: LiquidCircularProgressIndicator(
                          value: timeIndicator,
                          // Defaults to 0.5.
                          valueColor:
                              AlwaysStoppedAnimation(toolscolors[index]),
                          // Defaults to the current Theme's accentColor.
                          backgroundColor: Colors.white,
                          // Defaults to the current Theme's backgroundColor.
                          borderColor: Color.fromARGB(0, 0, 0, 0),
                          borderWidth: 5.0,
                          direction: Axis.vertical,
                          // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.vertical.
                          center:
                          Icon(
                            Icons.access_time,
                            color: timeIndicator > 0.4 ?Colors.white:toolscolors[index],
                          )),
                    )
                  : Divider(
                      height: 20,
                      color: Color.fromARGB(0, 0, 0, 0),
                    ),
            ]),
      ),
    );
  }

  String iconGetir(index) {
    switch (seciliPozisyon) {
      case 0:
        return ninnis[index].sesIconPath.toString();
        break;
      case 1:
        return homeTools[index].sesIconPath.toString();
        break;
      case 2:
        return whites[index].sesIconPath.toString();
        break;
      case 3:
        return cars[index].sesIconPath.toString();
        break;
      case 4:
        return natures[index].sesIconPath.toString();
        break;
    }
  }

  String sesGetir(index) {
    switch (seciliPozisyon) {
      case 0:
        return ninnis[index].sesPath.toString();
        break;
      case 1:
        return homeTools[index].sesPath.toString();
        break;
      case 2:
        return whites[index].sesPath.toString();
        break;
      case 3:
        return cars[index].sesPath.toString();
        break;
      case 4:
        return natures[index].sesPath.toString();
        break;
    }
  }

  void setGetir(index) {
    setState(() {
      timer = timeSecim();

      canceltimer == true ? canceltimer = false : canceltimer = true;
      starttimer();
      ses.isPlaying.value ? ses.pause() : ses.open(Audio(sesGetir(index)));
      ses.isPlaying.value ? sesAcik = 0 : sesAcik = 1;
    });
  }
}
