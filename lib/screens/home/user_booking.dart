import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:room_book_app/models/booking.dart';
import 'package:room_book_app/models/user.dart';
import 'package:room_book_app/screens/home/user_bookinglist.dart';
import 'package:room_book_app/services/auth.dart';
import 'package:room_book_app/services/database.dart';

class UserBookingPage extends StatefulWidget {
  @override
  _UserBookingPageState createState() => _UserBookingPageState();
}

class _UserBookingPageState extends State<UserBookingPage> {

  final AuthService _auth = AuthService();



  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);


    return StreamProvider<List<Booking>>.value(
      value: DatabaseService(uid: user.uid).userbooks,
      child:SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text(
                'Your Booking dates',
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
            body: UserBookList(),
        ),
      ),
    );
  }
}
