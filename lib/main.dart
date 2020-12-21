import 'package:flutter/material.dart';
import 'package:room_book_app/models/user.dart';
import 'package:room_book_app/screens/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:room_book_app/services/auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}

