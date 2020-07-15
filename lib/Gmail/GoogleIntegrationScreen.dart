import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'GoogleModue.dart';




class GoogleIntegrationScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignInDemo(),
    );
  }
}

class SignInDemo extends StatefulWidget {
  @override
  _SignInDemoState createState() => _SignInDemoState();
}

class _SignInDemoState extends State<SignInDemo> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GoogleModule.googleSingIn.onCurrentUserChanged.listen((account){
      setState(() {
        _currentUser = account;
        _currentUser.authentication.then((onValue){
          print(onValue);
        }).catchError((onError){
          print(onError);
        });
      });

    });
    GoogleModule.signInSilently();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google Integration Demo"),
      ),
      body: Center(
        child:_buildBody() ,
      ),
    );
  }

  GoogleSignInAccount _currentUser;

  _buildBody() {
    if (_currentUser != null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ListTile(
            leading: GoogleUserCircleAvatar(
              identity: _currentUser,
            ),
            title: Text(_currentUser.displayName),
            subtitle: Text(_currentUser.email),
          ),
          RaisedButton(
            child: Text("Sign Out"),
            onPressed: () => _handleSignOut(),
          )
        ],
      );
    } else {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("You are not signed in yet "),
            RaisedButton(
              child: Text("Sign In"),
              onPressed: () => _handleSignIn(),
            )
          ],
        ),
      );
    }
  }

  _handleSignOut()async {
    try {
      _currentUser = await GoogleModule.signOutFromGmail();
    } catch (err) {
      print(err);
    }
  }

  Future<void> _handleSignIn() async {
    try {
      _currentUser = await GoogleModule.signInWithGmail();
    } catch (err) {
      print(err);
    }
  }
  Future<void> _clearAuthCash()async {
    await _currentUser.clearAuthCache();
  }
}
