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
          Image.asset('images/card1.gif'),
          Column(
            children: [
              Text('hello'),
              Text('world'),
            ],
          )
        ],
      ),
    );
    // Stack(
    //   children: [
    //     Container(
    //       decoration: BoxDecoration(borderRadius: BorderRadius.circular(28)),
    //       child: Image.asset('images/card1.gif',fit: BoxFit.fill,width: 100,height: 100,),
    //     )
    //   ],
    // );
  }

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: _zoomDrawerController,
      menuScreen: _menuScreen(),
      mainScreen: Scaffold(
        appBar: AppBar(
          title: Text('ReServe Player'),
          backgroundColor: HexColor('#1e2632'),
          leading: IconButton(
              onPressed: () {
                _zoomDrawerController.toggle?.call();
              },
              icon: Icon(Icons.menu)),
        ),
        body: DecoratedBox(
          decoration:  BoxDecoration(
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
                padding: EdgeInsets.all(28),
                child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
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
