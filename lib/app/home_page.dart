import 'package:Time_Tracker_Flutter/services/auth.dart';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key, @required this.auth,})
      : super(key: key);

  final AuthBase auth;

  Future<void> _signOut() async {
    try {
      await auth.signOut();
 
      // print('${_userCredentials.user.uid}');

    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          FlatButton(
              onPressed: _signOut,
              child: Text(
                'LogOut',
                style: TextStyle(
                  fontSize: 19,
                  color: Colors.white,
                ),
              ))
        ],
      ),
    );
  }
}
