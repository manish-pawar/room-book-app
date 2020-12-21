import 'package:flutter/material.dart';
import 'package:room_book_app/screens/home/booking_page.dart';
import 'package:room_book_app/screens/home/detail_list.dart';
import 'package:room_book_app/screens/home/details_scroller.dart';
import 'package:room_book_app/screens/home/user_booking.dart';
import 'package:room_book_app/services/auth.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final AuthService _auth = AuthService();



  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
              'Room book App',
            style: TextStyle(
              color: Colors.black87,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
          ],
        ),
        body: Container(
          height: size.height,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      Navigator.push(context, new MaterialPageRoute(
                            builder: (context) => BookingPage(),
                        ),
                      );
                    },
                    child: Text(
                        'Book room',
                      style: TextStyle(
                          color: Colors.white,
                      ),
                    ),
                    color: Color(0xfff96060),
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.push(context, new MaterialPageRoute(
                          builder: (context) => UserBookingPage(),
                        ),
                      );
                    },
                    child: Text(
                      'See Bookings',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    color: Color(0xfff96060),
                  ),
                ],
              ),
              SizedBox(height: 12.0),
              DetailsScroller(),
              Expanded(
                  child: DetailsList(),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
