import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_sdk_integration/Bloc/LoginBloc.dart';
import 'package:social_sdk_integration/Twitter/twitter.dart';
import 'package:social_sdk_integration/social_platforms/facebook/Facebook.dart';
import 'package:social_sdk_integration/social_platforms/instgram/InstagramLogin.dart';

import 'Gmail/GoogleIntegrationScreen.dart';
import 'Gmail/GooglePreview.dart';


class SocialPlatFormScreen extends StatefulWidget {
  @override
  _SocialPlatFormScreenState createState() => _SocialPlatFormScreenState();
}

class _SocialPlatFormScreenState extends State<SocialPlatFormScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text(' Google '),
                onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) => GooglePreview()
                  ));
                },
              ),
              RaisedButton(
                child: Text('Twitter'),
                onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) => BlocProvider<LoginBloc>(
                          create: (_)=>LoginBloc(),
                          child: twitter())
                  ));
                },
              ),
              RaisedButton(
                child: Text('Instagram'),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Instagram_Login()));
                    },
              ),
              RaisedButton(
                child: Text('Facebook'),
                onPressed: (){ Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Facebook_Login()));},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

