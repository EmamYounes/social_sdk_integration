import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_twitter_login/flutter_twitter_login.dart';
import 'package:twitter_api/twitter_api.dart';

class twitter extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<twitter> {

  String consumerApiKey = "RyrvFOOjlJfJASZODeoTwL8RR";
  String consumerApiSecret = "j4AyVa8IwbHEkvGUt6zcQbV5nL5W2g6394VVjcxpcEzqdb7GyR";
  String accessToken = "ABC";
  String accessTokenSecret = "ABC";
  static final TwitterLogin twitterLogin = new TwitterLogin(
    consumerKey: 'RyrvFOOjlJfJASZODeoTwL8RR',
    consumerSecret: 'j4AyVa8IwbHEkvGUt6zcQbV5nL5W2g6394VVjcxpcEzqdb7GyR',
  );

  String _message = 'Logged out.';

  void _login() async {
    final TwitterLoginResult result = await twitterLogin.authorize();
    String newMessage;
    switch (result.status) {
      case TwitterLoginStatus.loggedIn:
       // newMessage = 'Logged in! username: ${result.session.username}';
        newMessage = 'Logged in! id: ${result.session.username}';
        break;
      case TwitterLoginStatus.cancelledByUser:
        newMessage = 'Login cancelled by user.';
        break;
      case TwitterLoginStatus.error:
        newMessage = 'Login error: ${result.errorMessage}';
        break;
    }

    setState(() {
      _message = newMessage;
    });
  }

  void _logout() async {
    await twitterLogin.logOut();

    setState(() {
      _message = 'Logged out.';
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Twitter login sample'),
        ),
        body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(_message),
              new RaisedButton(
                child: new Text('Log in'),
                onPressed: _login,
              ),
              new RaisedButton(
                child: new Text('Log out'),
                onPressed: _logout,
              ),
            ],
          ),
        ),
      ),
    );
  }
}