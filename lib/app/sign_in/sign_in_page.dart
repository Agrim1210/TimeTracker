import 'package:Time_Tracker_Flutter/app/sign_in/sign_in_button.dart';
import 'package:Time_Tracker_Flutter/app/sign_in/social_sign_in_button.dart';
import 'package:Time_Tracker_Flutter/common_widgets/custom_raised_widget.dart';
import 'package:Time_Tracker_Flutter/services/auth.dart';


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key key, @required this.auth,})
      : super(key: key);
 
  final AuthBase auth;

  Future<void> _signInAnonymously() async {
    try {
     await auth.signInAnonymously();
      // print('${_userCredentials.user.uid}');
   
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          'Time Tracker',
          style: GoogleFonts.montserrat(),
        ),
      ),
      body: buildContainer(),
    );
  }

  Widget buildContainer() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Sign In',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserratAlternates(
                fontWeight: FontWeight.bold, fontSize: 32),
          ),
          SizedBox(
            height: 48,
          ),
          CustomRaisedButton(
            color: Colors.white,
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('images/google-logo.png'),
                Text(
                  'Sign In With Google',
                ),
                Opacity(
                  opacity: 0.0,
                  child: Image.asset(
                    'images/google-logo.png',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          SocialSignInButton(
            assetName: 'images/facebook-logo.png',
            text: 'Sign In With Facebook',
            textColor: Colors.white,
            onPressed: () {},
            color: Color(0xFF334D92),
          ),
          SizedBox(
            height: 8,
          ),
          SignInButton(
            text: 'Sign In With E-MAIL',
            textColor: Colors.white,
            onPressed: () {},
            color: Colors.teal[700],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'OR',
            style: TextStyle(fontSize: 15, color: Colors.black87),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10,
          ),
          SignInButton(
            text: 'Sign In With Anonymously',
            textColor: Colors.black,
            onPressed: _signInAnonymously,
            color: Colors.lime[300],
          ),
        ],
      ),
    );
  }
}
