import 'dart:convert';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

import 'Instagram.dart';
import 'package:social_sdk_integration/strings.dart';

import 'LoginPresenter.dart';

class Instagram_Login extends StatefulWidget {
  GlobalKey<ScaffoldState> skey;

  Instagram_Login({GlobalKey<ScaffoldState> this.skey, Key key})
      : super(key: key);

  @override
  _InstagramLoginState createState() => new _InstagramLoginState(skey);
}

class _InstagramLoginState extends State<Instagram_Login>
    implements LoginViewContract {
  LoginPresenter _presenter;
  bool _IsLoading;
  Token token;

  GlobalKey<ScaffoldState> _scaffoldKey;

  void showInSnackBar(String value) {
    _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(value)));
  }

  _InstagramLoginState(GlobalKey<ScaffoldState> skey) {
    _presenter = new LoginPresenter(this);
    _scaffoldKey = skey;
  }

  @override
  void initState() {
    super.initState();
    _IsLoading = false;
  }

  @override
  void onLoginError(String msg) {
    setState(() {
      _IsLoading = false;
    });
    showInSnackBar(msg);
  }

  @override
  void onLoginScuccess(Token t) {
    setState(() {
      _IsLoading = false;
      token = t;
    });
    showInSnackBar('Login successful');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Continue with instagram',
                  ),
                ),
                onPressed: () {
                  _login();
                  // Navigator.of(context).push(MaterialPageRoute(
                  //   builder: (context) => SocialPlatforms()));
                },
              ),
            ),
          ],
        ),
      ),
      color: Colors.blue,
    );
    //  }
    // return widget;
  }

  void _login() {
    setState(() {
      _IsLoading = true;
    });
    _presenter.perform_login();
  }
}
