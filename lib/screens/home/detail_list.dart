import 'package:flutter/material.dart';


class DetailsList extends StatelessWidget {
  const DetailsList();

  @override
  Widget build(BuildContext context) {
    final double categoryHeight = MediaQuery.of(context).size.height * 0.30 - 50;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: FittedBox(
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
          child: Column(
            children: <Widget>[
                Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Large spaced rooms",
                          style: const TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "with proper ventilation.",
                          style: const TextStyle(fontSize: 17, color: Colors.grey),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                    SizedBox(width: 20.0,),
                    Image(
                      image: AssetImage('assets/images/r1.jpeg'),
                      height: 200.0,
                      width: 300.0,
                    )
                  ],
                ),
              ),
              SizedBox(height: 40.0,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[

                Image(
                  image: AssetImage('assets/images/r2.jpg'),
                  width: 300.0,
                ),

                SizedBox(width: 20.0,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    Text(
                      "Good designer rooms",
                      style: const TextStyle(
                          fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "which will make you relax.",
                      style: const TextStyle(fontSize: 17, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                SizedBox(width: 20.0,),
              ],
            ),
          ),
              SizedBox(height: 40.0,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Good hotel Staff",
                          style: const TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Who will feel you as boss.",
                          style: const TextStyle(fontSize: 17, color: Colors.grey),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                    SizedBox(width: 20.0,),
                    Image(
                      image: AssetImage('assets/images/r3.jpg'),
                      height: 200.0,
                      width: 300.0,
                    )
                  ],
                ),
              ),
              SizedBox(height: 40.0,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[

                    Image(
                      image: AssetImage('assets/images/employer4.jpg'),
                      height: 200.0,
                    ),

                    SizedBox(width: 20.0,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        Text(
                          "Good chefs",
                          style: const TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Whose foods would make your day \ndelightful.",
                          style: const TextStyle(fontSize: 17, color: Colors.grey),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                    SizedBox(width: 20.0,),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}





