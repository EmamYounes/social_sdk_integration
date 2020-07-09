import 'package:flutter/material.dart';

import 'GoogleIntegrationScreen.dart';

class SocialPlatFormScreen extends StatefulWidget {
  @override
  _SocialPlatFormScreenState createState() => _SocialPlatFormScreenState();
}

class _SocialPlatFormScreenState extends State<SocialPlatFormScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text(' Google '),
              onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) => GoogleIntegrationScreen()
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
            RaisedButton(
              child: Text(''),
              onPressed: (){},
            ),
          ],
        ),
      ),
    );
  }
}
