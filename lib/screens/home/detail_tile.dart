import 'package:room_book_app/models/user.dart';
import 'package:flutter/material.dart';

class DetailTile extends StatelessWidget {

  final det;
  DetailTile({ this.det });

  @override
  Widget build(BuildContext context) {
    print(det);
    if ( det == null ){
      return Text('please wait');
    }
    else {
      return (Container(
          height: 150,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '${det.name}',
                      style: const TextStyle(
                          fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${det.desc}',
                      style: const TextStyle(fontSize: 17, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                Image.asset(
                  "assets/images/${det.image}",
                  height: double.infinity,
                )
              ],
            ),
          )));
    }

  }
}