import 'package:room_book_app/screens/shared/loading.dart';
import 'package:room_book_app/services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({ this.toggleView });

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();

  final _formKey = GlobalKey<FormState>();
  String error = '';
  // text field state
  String email = '';
  String password = '';

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading? Loading():Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Sign Up to book ',
          style: TextStyle(
            color: Color(0xfff96060),
          ),
        ),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(
              Icons.person,
              color: Color(0xfff96060),
            ),
            label: Text(
              'Sign in',
              style: TextStyle(
                color: Color(0xfff96060),
              ),
            ),
            onPressed: () => widget.toggleView(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20,),
                Text("Hello !", style: TextStyle(
                    fontSize: 35
                ),),
                Text("Sign up to start bookings", style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey
                ),),
                SizedBox(height: 20,),
                Text("Email", style: TextStyle(
                  fontSize: 23,
                ),),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Enter email"
                  ),
                  validator: (val) => val.isEmpty ? 'Enter an email' : null,
                  style: TextStyle(
                      fontSize: 20
                  ),
                  onChanged: (val) {
                    setState(() => email = val);
                  },
                ),
                SizedBox(height: 40,),
                Text("Password", style: TextStyle(
                  fontSize: 23,
                ),),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Enter your password here"
                  ),
                  validator: (val) => val.length < 6 ? 'Enter a password 6+ characters long' : null,
                  style: TextStyle(
                      fontSize: 20
                  ),
                  onChanged: (val) {
                    setState(() => password = val);
                  },
                ),
                SizedBox(height: 40,),

                RaisedButton(
                    color: Color(0xfff96060),
                    padding:  EdgeInsets.all(20),
                    child: Text(
                      'Register',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {

                      if(_formKey.currentState.validate()){

                        setState(() => loading = true);
                        dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                        if(result == null) {
                          setState(() {
                            loading = false;
                            error = 'Please supply a valid email';
                          });
                        }
                      }
                    }
                ),
                SizedBox(height: 12.0),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}