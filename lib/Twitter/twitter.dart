import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_twitter_login/flutter_twitter_login.dart';
import 'package:twitter_api/twitter_api.dart';

class twitter extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<twitter> {
  String accessToken ;
  static final TwitterLogin twitterLogin = new TwitterLogin(
    consumerKey: 'RyrvFOOjlJfJASZODeoTwL8RR',
    consumerSecret: 'j4AyVa8IwbHEkvGUt6zcQbV5nL5W2g6394VVjcxpcEzqdb7GyR',
  );

  String _message = 'Logged out.';
  String _image ;

  void _login() async {
    final TwitterLoginResult result = await twitterLogin.authorize();
    String newMessage;
    accessToken=result.session.token;
    switch (result.status) {
      case TwitterLoginStatus.loggedIn:
        newMessage =  result.session.username;
        final _twitterOauth = new twitterApi(
            consumerKey: 'RyrvFOOjlJfJASZODeoTwL8RR',
            consumerSecret:'j4AyVa8IwbHEkvGUt6zcQbV5nL5W2g6394VVjcxpcEzqdb7GyR' ,
            token: accessToken,
            tokenSecret: result.session.secret

        );
        print("access token " +accessToken);
        print("secret access token " +result.session.secret);

        Future twitterRequest = _twitterOauth.getTwitterRequest(
          // Http Method
          "GET",
          // Endpoint you are trying to reach
          "account/verify_credentials.json",
          // The options for the request
          options: {
            "user_id": result.session.userId,
          },
        );
        twitterRequest.then((onValue){
          var jsonDecoded = jsonDecode(onValue.body);
          String newImage = jsonDecoded["profile_image_url"];
          newImage.replaceAll('/', "");
          print(newImage);
          setState(() {
            _image= newImage;
          });
        });
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
      _image="";
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
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Row(

                  children: <Widget>[
                    CircleAvatar(backgroundImage:NetworkImage(_image??""), ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Text(_message),
                    ),
                  ],
                ),
              )
              ,
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