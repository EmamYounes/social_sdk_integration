import 'package:flutter/material.dart';

class GoogleIntegrationScreen extends StatefulWidget {
  @override
  _GoogleIntegrationScreenState createState() => _GoogleIntegrationScreenState();
}

class _GoogleIntegrationScreenState extends State<GoogleIntegrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Integrate'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: (){
                },
                child: Container(
                  alignment: Alignment.center,
                    height: 40,
                    decoration: BoxDecoration(color: Colors.red),
                    child: Text(' Gmail Sign up', style: TextStyle(color: Colors.white),)),
              ), GestureDetector(
                onTap: (){

                },
                child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    decoration: BoxDecoration(color: Colors.blue),
                    child: Text(' Gmail Sign in', style: TextStyle(color: Colors.white),)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
