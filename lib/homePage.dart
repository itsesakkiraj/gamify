import 'package:flutter/material.dart';
import 'package:gamify/data.dart';
import 'package:gamify/scrollablegames.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _deviceheight;
  var _devicewidth;
  var _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    _deviceheight = MediaQuery.of(context).size.height;
    _devicewidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          _featuredGameswidget(),
          _gradiantwidget(),
          _toplayeredwidget(),
        ],
      ),
    );
  }

  Widget _featuredGameswidget() {
    return SizedBox(
        height: _deviceheight * 0.50,
        width: _devicewidth,
        child: PageView(
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          children: featuredGames.map((_game) {
            return Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(_game.coverImage.url))),
            );
          }).toList(),
        ));
  }

  Widget _gradiantwidget() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: _deviceheight * 0.80,
        width: _devicewidth,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromRGBO(35, 45, 59, 1.0),
          Colors.transparent,
        ], stops: [
          0.65,
          1.0
        ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
      ),
    );
  }

  Widget _toplayeredwidget() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: _devicewidth * 0.05, vertical: _deviceheight * 0.01),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            _topbarwidget(),
            SizedBox(
              height: _deviceheight * 0.25,
            ),
            _featuredGameinfowidget(),
            SizedBox(
              height: _deviceheight * 0.03,
            ),
            Scrollablegames(
              _deviceheight * 0.25,
              _devicewidth,
              games,
              true,
            ),
            SizedBox(
              height: _deviceheight * 0.02,
            ),
            Scrollablegames(
              _deviceheight * 0.20,
              _devicewidth,
              games2,
              false,
            ),
          ],
        ),
      ),
    );
  }

  Widget _topbarwidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Icon(
          Icons.menu,
          size: 26,
        ),
        Row(
          children: [
            Icon(
              Icons.search_sharp,
              size: 26,
            ),
            SizedBox(
              width: _devicewidth * 0.04,
            ),
            Icon(
              Icons.notifications,
              size: 26,
            ),
          ],
        )
      ],
    );
  }

  Widget _featuredGameinfowidget() {
    return SizedBox(
      height: _deviceheight * 0.14,
      width: _devicewidth,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            featuredGames[_selectedIndex].title,
            maxLines: 2,
            style: TextStyle(
                color: Colors.white,
                fontSize: _deviceheight * 0.040,
                fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: featuredGames.map((game) {
              double _circleradios = _deviceheight * 0.005;
              bool isActive = game.title == featuredGames[_selectedIndex].title;
              return Container(
                margin: EdgeInsets.only(right: 5),
                height: _circleradios * 2,
                width: _circleradios * 2,
                decoration: BoxDecoration(
                  color: isActive ? Colors.orangeAccent : Colors.grey,
                  borderRadius: BorderRadius.circular(100),
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
