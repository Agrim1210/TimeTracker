import 'package:Time_Tracker_Flutter/app/home_page.dart';
import 'package:Time_Tracker_Flutter/app/sign_in/sign_in_page.dart';
import 'package:Time_Tracker_Flutter/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  final AuthBase auth;

  const LandingPage({Key key,@required this.auth}) : super(key: key);
  
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  User _user;
  @override
  void initState() {
    super.initState();
    _updateUser(widget.auth.currentUser);
  }

  void _updateUser(User user) {
    // print('User id:${user.uid}');
    setState(() {
      _user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_user == null) {
      return SignInPage(
        auth: widget.auth,
        onSignIn: (user) => _updateUser(
          user,
        ),
      );
    }
    return HomePage(
      auth: widget.auth,
      onSignOut: () => _updateUser(null),
    );
  }
}
