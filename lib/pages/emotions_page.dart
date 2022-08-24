import 'package:agni/pages/emotions/Anger/better_communication.dart';
import 'package:agni/pages/emotions/Anger/cognitive_reappraisal.dart';
import 'package:agni/pages/emotions/Anger/cognitive_restructuring.dart';
import 'package:agni/pages/emotions/Anger/pause_reflect.dart';
import 'package:agni/pages/emotions/Anger/relaxation.dart';
import 'package:agni/pages/emotions/Anger/think_before_you_speak.dart';
import 'package:agni/pages/emotions/Anxiety/being_mindful.dart';
import 'package:agni/pages/emotions/Anxiety/self_awareness.dart';
import 'package:agni/pages/emotions/Sad/emotional_support.dart';
import 'package:agni/pages/emotions/Sad/self_compassion.dart';
import 'package:flutter/material.dart';

class EmotionsPage extends StatefulWidget {
  EmotionsPage({Key? key}) : super(key: key);

  @override
  State<EmotionsPage> createState() => _EmotionsPageState();
}

class _EmotionsPageState extends State<EmotionsPage> {
  final titleStyle = const TextStyle(fontSize: 20, fontWeight: FontWeight.w200);
  final subTitleStyle = const TextStyle(
    fontSize: 12,
    fontFamily: 'Roboto Thin',
    color: Color.fromRGBO(66, 66, 66, 1),
  );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 108, 99, 254),
          title: Text('Events'),
          automaticallyImplyLeading: false,
          centerTitle: true,
          bottom: TabBar(tabs: [
            Tab(text: 'Anger'),
            Tab(text: 'Anxiety'),
            Tab(text: 'Sadness')
          ]),
        ),
        body: TabBarView(children: [
          Column(
            children: [
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Scrollbar(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    // child: TabBar(
                    // minWidth: 120.0,
                    // fontSize: 14,
                    // cornerRadius: 7.0,
                    // customWidths: _customWidhts,
                    // activeBgColors: _activebgcolors,
                    // activeFgColor: Colors.white,
                    // inactiveBgColor: Color.fromARGB(251, 251, 251, 251),
                    // inactiveFgColor: Colors.black,
                    // //initialLabelIndex: 0,
                    // //totalSwitches: 5,
                    // labels: _categories,
                    // radiusStyle: true,
                    // customTextStyles: [
                    //   TextStyle(fontSize: 11, fontWeight: FontWeight.w200)
                    // ],
                    // ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: entries1.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 3),
                      child: Card(
                        elevation: 5,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14)),
                        child: new InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => _pages1[index],
                              ),
                            );
                          },
                          child: SizedBox(
                              height: 270,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 200,
                                      child: Stack(children: [
                                        Container(
                                          foregroundDecoration: BoxDecoration(
                                              image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/${entries1[index]}'),
                                            fit: BoxFit.fitWidth,
                                          )),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Align(
                                            alignment: Alignment.topRight,
                                            child: Container(
                                              height: 35,
                                              width: 35,
                                              decoration: const BoxDecoration(
                                                  color: Color.fromARGB(
                                                      95, 0, 0, 0),
                                                  shape: BoxShape.circle),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 10.0),
                                                child: IconButton(
                                                  icon: Icon(
                                                    _selections1[index]
                                                        ? Icons
                                                            .favorite_border_sharp
                                                        : Icons.favorite_sharp,
                                                    color: _selections1[index]
                                                        ? Colors.white
                                                        : Colors.red,
                                                    size: 20,
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      _selections1[index] =
                                                          !_selections1[index];
                                                    });
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]),
                                    ),
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            14.0, 20, 0, 10),
                                        child: Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              anger[index],
                                              style: titleStyle,
                                            )),
                                      ),
                                    ),
                                  ])),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Column(
            children: [
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Scrollbar(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    // child: TabBar(
                    // minWidth: 120.0,
                    // fontSize: 14,
                    // cornerRadius: 7.0,
                    // customWidths: _customWidhts,
                    // activeBgColors: _activebgcolors,
                    // activeFgColor: Colors.white,
                    // inactiveBgColor: Color.fromARGB(251, 251, 251, 251),
                    // inactiveFgColor: Colors.black,
                    // //initialLabelIndex: 0,
                    // //totalSwitches: 5,
                    // labels: _categories,
                    // radiusStyle: true,
                    // customTextStyles: [
                    //   TextStyle(fontSize: 11, fontWeight: FontWeight.w200)
                    // ],
                    // ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: entries2.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 3),
                      child: Card(
                        elevation: 5,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14)),
                        child: new InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => _pages2[index],
                              ),
                            );
                          },
                          child: SizedBox(
                              height: 270,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 200,
                                      child: Stack(children: [
                                        Container(
                                          foregroundDecoration: BoxDecoration(
                                              image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/${entries2[index]}'),
                                            fit: BoxFit.fitWidth,
                                          )),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Align(
                                            alignment: Alignment.topRight,
                                            child: Container(
                                              height: 35,
                                              width: 35,
                                              decoration: const BoxDecoration(
                                                  color: Color.fromARGB(
                                                      95, 0, 0, 0),
                                                  shape: BoxShape.circle),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 10.0),
                                                child: IconButton(
                                                  icon: Icon(
                                                    _selections2[index]
                                                        ? Icons
                                                            .favorite_border_sharp
                                                        : Icons.favorite_sharp,
                                                    color: _selections2[index]
                                                        ? Colors.white
                                                        : Colors.red,
                                                    size: 20,
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      _selections2[index] =
                                                          !_selections2[index];
                                                    });
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]),
                                    ),
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            14.0, 20, 0, 10),
                                        child: Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              anxiety[index],
                                              style: titleStyle,
                                            )),
                                      ),
                                    ),
                                  ])),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Column(
            children: [
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Scrollbar(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    // child: TabBar(
                    // minWidth: 120.0,
                    // fontSize: 14,
                    // cornerRadius: 7.0,
                    // customWidths: _customWidhts,
                    // activeBgColors: _activebgcolors,
                    // activeFgColor: Colors.white,
                    // inactiveBgColor: Color.fromARGB(251, 251, 251, 251),
                    // inactiveFgColor: Colors.black,
                    // //initialLabelIndex: 0,
                    // //totalSwitches: 5,
                    // labels: _categories,
                    // radiusStyle: true,
                    // customTextStyles: [
                    //   TextStyle(fontSize: 11, fontWeight: FontWeight.w200)
                    // ],
                    // ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: entries3.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 3),
                      child: Card(
                        elevation: 5,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14)),
                        child: new InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => _pages3[index],
                              ),
                            );
                          },
                          child: SizedBox(
                              height: 270,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 200,
                                      child: Stack(children: [
                                        Container(
                                          foregroundDecoration: BoxDecoration(
                                              image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/${entries3[index]}'),
                                            fit: BoxFit.fitWidth,
                                          )),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Align(
                                            alignment: Alignment.topRight,
                                            child: Container(
                                              height: 35,
                                              width: 35,
                                              decoration: const BoxDecoration(
                                                  color: Color.fromARGB(
                                                      95, 0, 0, 0),
                                                  shape: BoxShape.circle),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 10.0),
                                                child: IconButton(
                                                  icon: Icon(
                                                    _selections3[index]
                                                        ? Icons
                                                            .favorite_border_sharp
                                                        : Icons.favorite_sharp,
                                                    color: _selections3[index]
                                                        ? Colors.white
                                                        : Colors.red,
                                                    size: 20,
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      _selections3[index] =
                                                          !_selections3[index];
                                                    });
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]),
                                    ),
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            14.0, 20, 0, 10),
                                        child: Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              sad[index],
                                              style: titleStyle,
                                            )),
                                      ),
                                    ),
                                  ])),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

final List<String> entries1 = <String>[
  'relaxation.jpg',
  'restructuring_card.jpg',
  'think.jpg',
  'communication.jpg',
  'reappraisal.jpg',
  'pause.jpg'
];

final List<String> entries2 = <String>['mindful.png', 'self_awareness.jpg'];

final List<String> entries3 = <String>[
  'self_compassion_card.jpg',
  'emotional_support.jpg'
];

final List<String> anger = <String>[
  'Relaxation Techniques',
  'Cognitive Restructuring',
  'Think Before You Speak',
  'Better Communication',
  'Cognitive Reappraisal',
  'Pause and Reflect'
];

final List<String> anxiety = <String>['Being Mindful', 'Self Awareness'];

final List<String> sad = <String>['Self Compassion', 'Emotional Support'];

final List<bool> _selections1 = List.generate(anger.length, (_) => true);

final List<bool> _selections2 = List.generate(anger.length, (_) => true);

final List<bool> _selections3 = List.generate(anger.length, (_) => true);

final List<Widget> _pages1 = [
  Relaxation(),
  CognitiveRestructuring(),
  ThinkSpeak(),
  BetterCommunication(),
  CognitiveReappraisal(),
  PauseReflect()
];

final List<Widget> _pages2 = [
  BeingMindful(),
  SelfAwareness(),
];

final List<Widget> _pages3 = [
  SelfCompassion(),
  EmotionalSupport(),
];
