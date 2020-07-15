import 'package:flutter/material.dart';
import 'package:social_sdk_integration/Twitter/twitter.dart';

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
                child: Text(' Twitter '),
                onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) => twitter()
                  ));
                },
              ),
              RaisedButton(
                child: Text(''),
                onPressed: (){},
              ),
              RaisedButton(
                child: Text(''),
                onPressed: (){},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

