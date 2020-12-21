
import 'package:flutter/material.dart';
import 'package:room_book_app/models/booking.dart';

class UserBookingTile extends StatelessWidget {

  final Booking book;
  UserBookingTile({ this.book });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          title: Text('your booking date is - ${book.bookdate}'),
        ),
      ),
    );
  }
}