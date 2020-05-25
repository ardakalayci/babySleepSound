import 'package:babysleep/model/sounds.dart';
import 'package:babysleep/prepare/prepare.dart';
import 'package:babysleep/utils/home_tools_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final FixedExtentScrollController _controller = FixedExtentScrollController();

  static List<Sound> homeTools;
  static List<Sound> animals;
  var arda="baaykemal";
  var renk;
  var sesAcik = 0;
  var _value = 1.0;
  final ses = AssetsAudioPlayer();
  List expanded = [1, 1, 1, 1, 1, 1, 1, 1];

@override
  void initState() {
    // TODO: implement initState
    super.initState();



  }
  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {

    homeTools = homeHazirla();
    animals = whitesHazirla();

    return Scaffold(


      backgroundColor: Colors.pink.shade50,

      appBar: AppBar(
          bottom: PreferredSize(
      child: Container(
      alignment: Alignment.center,
        color: Colors.grey,
        constraints: BoxConstraints.expand(height: 50),
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
      ),
      preferredSize: Size(50, 50),
    ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        flexibleSpace: Container(

          child: Container(
            padding: EdgeInsets.fromLTRB(45, 45, 45, 0)
          ),
          decoration: BoxDecoration(
            
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.purple.shade700, Colors.pink])
          )

        ),


        backgroundColor: Colors.yellow.shade50,

        elevation: 22,
        titleSpacing: 1 / 2,
        title: Center(
            child: Text(
          "Urfanın Etrafı Dumanlı Dağlar",
          textAlign: TextAlign.center,
        )),
      ),
      body: bodypage(),
    );
  }

  Widget bodypage() {

    return Container(

      decoration: BoxDecoration(

          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blue, Colors.red])
      ),
      constraints: BoxConstraints.expand(),
      padding: EdgeInsets.fromLTRB(5, 25, 5, 10),

      child: ListView(
        children: <Widget>[
          Text("Title 1"),
          GridView.count(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 5,
              children: new List<Widget>.generate(animals.length, (index) {
                return new GridTile(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
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

          Text("Title 2"),
          GridView.count(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 5,
              children: new List<Widget>.generate(homeTools.length, (index) {

                return new GridTile(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        arda="arnanababana";
                        ses.isPlaying.value
                            ? ses.pause()
                            : ses.open(Audio(homeTools[index].sesPath.toString()));
                        ses.isPlaying.value
                            ? renk=Colors.blue
                            : renk=Colors.yellow;
                        ses.isPlaying.value
                            ? renk=Colors.blue
                            : renk=Colors.yellow;




                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(80)),
                          color: renk,),
                      child: new Center(
                        child: new Image.asset(homeTools[index].sesIconPath.toString()),
                      ),
                    ),
                  ),
                );
              })),
          Slider(
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
          Text(arda),
          ListWheelScrollView(
            controller: _controller,
            itemExtent: 80,
            magnification: 1.2,
            useMagnifier: true,
            physics: FixedExtentScrollPhysics(),
            children: <Widget>[
              Container(
                child: Text("arsa"),
              ),
              Container(
                child: Text("arsa"),
              ),
              Container(
                child: Text("arsa"),
              ),

            ],
          )
        ],
      ),
    );
  }




}
