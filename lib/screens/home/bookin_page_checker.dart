
import 'package:flutter/material.dart';
// import 'package:donar_app/shared/loading.dart';
import 'package:provider/provider.dart';
import 'package:room_book_app/models/booking.dart';
import 'package:room_book_app/models/user.dart';
import 'package:room_book_app/services/database.dart';


class BookingChecker extends StatelessWidget {
  final String bdate;
  BookingChecker({ this.bdate });
  @override
  Widget build(BuildContext context) {
    final DatabaseService dbs = DatabaseService();
    final user = Provider.of<User>(context);
    bool booking = false;
    final books = Provider.of<List<Booking>>(context) ?? [];

      if ( books.length > 30 ) {
        return Text(
          "Rooms not available",
          style: const TextStyle(
            fontSize: 17,
            color: Colors.grey,

          ),
        );
      }
      else {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Rooms available are - ${30 - books.length}",
              style: const TextStyle(
                fontSize: 17,
                color: Colors.grey,

              ),
            )
            ,
            SizedBox(width: 10.0,),
            RaisedButton(
              onPressed: () {
                dbs.book(user.uid, bdate);
                Navigator.pop(context);
              },
              child: Text(
                'Book now',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Color(0xfff96060),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        );
      }


  }
}