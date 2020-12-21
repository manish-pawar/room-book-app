import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:room_book_app/models/booking.dart';

class DatabaseService {

  final String bodate;
  final String uid;
  DatabaseService({ this.uid, this.bodate});

  // collection reference
  final CollectionReference bookingCollection = Firestore.instance.collection('booking');


  Future<void> book(String bid , String bod) async {

    return await bookingCollection.add({
      'booker_id' : bid,
      'booking_date': bod,
    });
  }
  List<Booking> _boookingListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      return Booking(
        bid : doc.data['booker_id'],
        bookdate: doc.data['booking_date']
      );
    }).toList();
  }



  Stream<List<Booking>> get bookings {

    return bookingCollection.where('booking_date' , isEqualTo: bodate).snapshots()
        .map(_boookingListFromSnapshot);
  }

  Stream<List<Booking>> get userbooks{

    return bookingCollection.where('booker_id' , isEqualTo: uid).snapshots()
        .map(_boookingListFromSnapshot);
  }

}