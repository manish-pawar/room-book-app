import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:room_book_app/models/booking.dart';
import 'package:room_book_app/models/user.dart';
import 'package:room_book_app/screens/home/bookin_page_checker.dart';
import 'package:room_book_app/services/auth.dart';
import 'package:intl/intl.dart';
import 'package:room_book_app/services/database.dart';

class BookingPage extends StatefulWidget {
  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {

  final AuthService _auth = AuthService();



  @override
  Widget build(BuildContext context) {
    DateTime now = new DateTime.now();
    DateTime date = new DateTime(now.year, now.month, now.day);
    DateTime date1 = new DateTime(now.year, now.month, now.day +1);
    DateTime date2 = new DateTime(now.year, now.month, now.day + 2);

    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String d = formatter.format(date);
    final String d1 = formatter.format(date1);
    final String d2 = formatter.format(date2);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Book your room',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Color(0xfff96060),
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(
                  Icons.person,
                  color: Colors.white,
              ),
              label: Text(
                  'logout',
                style: TextStyle(
                color: Colors.white,
              ),
              ),
              onPressed: () async {
                await _auth.signOut();
                Navigator.pop(context);
              },
            ),
          ],
        ),
        body: Container(
            child:FittedBox(
                  fit: BoxFit.fill,
                  alignment: Alignment.topCenter,
                  child: Column(
                        children: <Widget>[

                          SizedBox(height: 80.0,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[

                                SizedBox(height: 10.0,),
                                Text(
                                  "Want room for today? ",
                                  style: const TextStyle(
                                      fontSize: 28, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 10.0,),
                                StreamProvider<List<Booking>>.value(
                                  value: DatabaseService(bodate: d).bookings,
                                  child: BookingChecker(bdate: d),
                                ),


                              ],
                            ),
                          ),
                          SizedBox(height: 40.0,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[

                                SizedBox(height: 10.0,),
                                Text(
                                  "Want room for tomorrow? ",
                                  style: const TextStyle(
                                      fontSize: 28, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 10.0,),
                                StreamProvider<List<Booking>>.value(
                                  value: DatabaseService(bodate: d1).bookings,
                                  child: BookingChecker(bdate: d1),
                                ),


                              ],
                            ),
                          ),
                          SizedBox(height: 40.0,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[

                                  SizedBox(height: 10.0,),
                                  Text(
                                    "Want room for Overmorrow? ",
                                    style: const TextStyle(
                                        fontSize: 28, fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 10.0,),
                                  StreamProvider<List<Booking>>.value(
                                    value: DatabaseService(bodate: d2).bookings,
                                    child: BookingChecker(bdate: d2),
                                  ),


                                ],
                              ),
                            ),
                          SizedBox(height: 40.0,),
                        ],
                   ),
            ),
        )
      ),
    );
  }
}
