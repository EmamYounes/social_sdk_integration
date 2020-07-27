import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_twitter_login/flutter_twitter_login.dart';
import 'package:social_sdk_integration/Bloc/LoginBloc.dart';
import 'package:social_sdk_integration/strings.dart';
import 'package:twitter_api/twitter_api.dart';

class twitter extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<twitter> {
  String accessToken ;
  LoginBloc _bloc ;

  String _message = 'Logged out.';
  String _image ;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
_bloc= BlocProvider.of<LoginBloc>(context);
}
  void _login() async {
    _bloc.add(LoginEvent(type: LoginType.TWITTER));
  }
  TwitterLogin twitterLogin;
  void _logout() async {
_bloc.add(LogoutEvent(type: LoginType.GMAIL));
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
              BlocBuilder<LoginBloc , BaseState>(
                builder: (context , baseState){
                  TwitterLoginState state ;
                  if(baseState is TwitterLoginState)
                    {
                      state = baseState;
                      if(state.state ==ResultState.Loaded)
                      {
                        String newMessage;
                        switch (state.result.status) {
                          case TwitterLoginStatus.loggedIn:
                            newMessage =  state.result.session.username;
                            accessToken=state.result.session.token;
                            final _twitterOauth = new twitterApi(
                                consumerKey: twitterKey,
                                consumerSecret:twitterSecretKey ,
                                token: accessToken,
                                tokenSecret: state.result.session.secret

                            );
                            print("access token " +accessToken);
                            //    print("secret access token " +result.session.secret);

                            Future twitterRequest = _twitterOauth.getTwitterRequest(
                              // Http Method
                              "GET",
                              // Endpoint you are trying to reach
                              twitterInfoApi,
                              // The options for the request
                              options: {
                                "user_id": state.result.session.userId,
                              },
                            );
                            twitterRequest.then((onValue){
                              var jsonDecoded = jsonDecode(onValue.body);
                              String newImage = jsonDecoded[twitterProfilePictureTag];
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
                          //    newMessage = 'Login error: ${result.errorMessage}';
                            break;
                        }
                        _message = newMessage;
                        return  Column(
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
                            ),
                            new RaisedButton(
                              child: new Text('Log out'),
                              onPressed: _logout,
                            ),
                          ],
                        );
                      }
                      else return new RaisedButton(
                          child: new Text('Log in'),
                  onPressed: _login,
                  );
                     // final TwitterLoginResult result = await twitterLogin.authorize();
                    }
                  else{
                    return   new RaisedButton(
                      child: new Text('Log in'),
                      onPressed: _login,
                    );
                  }
                },
              ),
     ],
          ),
        ),
      ),
    );
  }
}
