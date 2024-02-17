import 'package:flutter/material.dart';

import 'data.dart';

class Scrollablegames extends StatelessWidget {
  final double _height;
  final double _width;
  final bool _showtitle;

  final List<Game> _gamesData;

  Scrollablegames(this._height, this._width, this._gamesData, this._showtitle);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _height,
      width: _width,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: _gamesData.map((game) {
          return Container(
            height: _height,
            width: _width * 0.30,
            margin: EdgeInsets.symmetric(horizontal: _width * 0.020),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  height: _height * 0.70,
                  width: _width * 0.30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(game.coverImage.url)),
                  ),
                ),
                SizedBox(
                  height: _height * 0.04,
                ),
                Text(
                  game.title,
                  maxLines: 2,
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
