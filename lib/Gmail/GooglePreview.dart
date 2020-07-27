
import 'dart:async';
import 'dart:convert' show json;
import "package:http/http.dart" as http;
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:social_sdk_integration/Gmail/GoogleIntegrationScreen.dart';
import 'GoogleGetContacts.dart';



class GooglePreview extends StatefulWidget {
  @override
  State createState() => GooglePreviewState();
}

class GooglePreviewState extends State<GooglePreview> {


  Widget _buildBody() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
       //   const Text("Google integration Options." , style: TextStyle(color: Colors.blue, fontSize: 30),),
          RaisedButton(
            color: Colors.blue,
            child: const Text('Sign in ',style: TextStyle(color: Colors.white)),
            onPressed: ()=>     Navigator.push(context, MaterialPageRoute(
                builder: (context) => GoogleIntegrationScreen()
            )),
          ),
          RaisedButton(
            color: Colors.blue,
            child: const Text('get Contacts of my email ',style: TextStyle(color: Colors.white)),
            onPressed: ()=>    Navigator.push(context, MaterialPageRoute(
                builder: (context) => GoogleContactsScreen()
            )),

          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.yellow ,
        appBar: AppBar(
          title: const Text('Google Sign In'),
        ),
        body: ConstrainedBox(

          constraints: const BoxConstraints.expand(),
          child: _buildBody(),
        ));
  }
}