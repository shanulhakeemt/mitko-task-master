import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/variables/mediaQuery.dart';
import '../../home/screen/home_screen.dart';


class BottomNavigationMobile extends StatefulWidget {

  const BottomNavigationMobile({super.key});

  @override
  _BottomNavigationMobileState createState() => _BottomNavigationMobileState();
}

class _BottomNavigationMobileState extends State<BottomNavigationMobile>
    with TickerProviderStateMixin {

  int _selectedIndex = 0;

  bNavItems(int index) {
    final List<Widget> widgetOptions = <Widget>[
     HomeScreen(),
     HomeScreen(),
     HomeScreen(),
     HomeScreen(),
    ];
    return widgetOptions[index];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context1) {

    return WillPopScope(
      onWillPop: () async {
        final value = await showDialog<bool>(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Alert'),
                content: Text('do yo want to exit '),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                      child: Text('cancel')),
                  ElevatedButton(
                      onPressed: () {

                        Navigator.of(context).pop(true);
                      },
                      child: Text('ok'))
                ],
              );
            });
        return value ?? false;
      },
      child: Scaffold(
        extendBody: true,
        body:bNavItems(_selectedIndex, ),
        bottomNavigationBar: DotNavigationBar(
          marginR: EdgeInsets.symmetric(
              horizontal: w * 0.03, ),
          borderRadius: w * 0.03,
          backgroundColor: Colors.white12,
          currentIndex: _selectedIndex,
          dotIndicatorColor: Colors.white38,
          unselectedItemColor: Colors.grey[400],
          // splashBorderRadius: 50,
          onTap: _onItemTapped,
          items: [

            DotNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: w * 0.06,
              ),
            ),


            DotNavigationBarItem(
              icon: Icon(
                CupertinoIcons.arrow_2_circlepath,
                size: w * 0.06,
              ),

            ),


            DotNavigationBarItem(
              icon: Icon(
                CupertinoIcons.chart_bar,
                size: w * 0.06,
              ),

            ),

            DotNavigationBarItem(
              icon: Icon(
                Icons.settings,
                size: w * 0.06,
              ),

            ),
          ],
        ),
      ),
    );
  }
}
