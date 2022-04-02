import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:night_read/utils/color.dart';
import 'package:night_read/widgets/team_card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _zoomDrawerController = ZoomDrawerController();

  Widget _menuScreen() => Material(
        color: HexColor('#603fb3'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(30, 85, 0, 35),
              child: SizedBox(
                width: 88,
                height: 88,
                child: CircleAvatar(
                  backgroundColor: Colors.amber,
                ),
              ),
            ),
            for (var i = 0; i < 6; i++)
              InkWell(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: i == 2 ? Colors.black.withOpacity(0.2) : null),
                  child: ListTile(
                    title: Text('hello$i'),
                    onTap: () {
                      print(i);
                    },
                  ),
                ),
              ),
          ],
        ),
      );

  Widget _itemCard(int index) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(28),
      child: Stack(
        children: [
          Image.asset(
            'images/card1.gif',
            opacity: const AlwaysStoppedAnimation<double>(0.4),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: 128,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        HexColor('#39334e'),
                        HexColor('#5f476a'),
                      ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(28))),
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                  child: Text(
                    '地下城与勇士',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 28, vertical: 6),
                child: Text(
                  '王者荣耀五排寻队友王者荣耀五排寻队友',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                height: 68,
                child: Row(
                  children: [
                    Expanded(
                        child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          for (var i = 0; i < 10; i++)
                            Row(
                              children: [
                                Container(
                                  width: 58,
                                  height: 58,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: HexColor('#7f8381'), width: 3),
                                  ),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.brown[800],
                                    child: Text(
                                      '大元',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 18,
                                )
                              ],
                            )
                        ],
                      ),
                    ))
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: _zoomDrawerController,
      menuScreen: _menuScreen(),
      mainScreen: Scaffold(
        appBar: AppBar(
          title: const Text('ReServe Player'),
          backgroundColor: HexColor('#1e2632'),
          leading: StatefulBuilder(
            builder: (BuildContext context, _setState) {
              print('icon');

              return IconButton(
                  onPressed: () async {
                    _zoomDrawerController.toggle?.call();
                    Timer(Duration(milliseconds: 300), () {
                      _setState(() {});
                    });
                  },
                  icon: _zoomDrawerController.isOpen != null &&
                          _zoomDrawerController.isOpen!()
                      ? Icon(Icons.close)
                      : Icon(Icons.menu));
            },
          ),
        ),
        body: DecoratedBox(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              HexColor('#1e2632'),
              HexColor('#603fb3'),
            ],
          )),
          child: Row(
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(28),
                child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 38,
                    );
                  },
                  itemBuilder: (context, index) {
                    return _itemCard(index);
                  },
                  itemCount: 10,
                ),
              ))
            ],
          ),
        ),
      ),
      borderRadius: 24.0,
      angle: -12.0,
      backgroundColor: Colors.grey,
      slideWidth: MediaQuery.of(context).size.width * 0.45,
    );
  }
}
