
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:room_book_app/models/booking.dart';
import 'package:room_book_app/screens/home/user_booking_tile.dart';


class UserBookList extends StatefulWidget {
  @override
  _UserBookListState createState() => _UserBookListState();
}

class _UserBookListState extends State<UserBookList> {
  @override
  Widget build(BuildContext context) {
    final bookings = Provider.of<List<Booking>>(context) ?? [];

    if ( bookings.length == 0){
      return Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          title: Text(
            'You havent booked any room yet',
            style: TextStyle(
              color: Colors.black87,
            ),
          ),
          subtitle: Text( 'Booked your rooms and enjoy your weekends or holidays'),
        ),
      );
    }
    else{
      return ListView.builder(
            itemCount: bookings.length,
            itemBuilder: (context, index) {
              return UserBookingTile(book : bookings[index]);
            },
          );
    }


  }
}