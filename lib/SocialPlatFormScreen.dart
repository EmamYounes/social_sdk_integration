import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:social_sdk_integration/social_platforms/facebook/Facebook.dart';
import 'package:social_sdk_integration/social_platforms/instgram/InstagramLogin.dart';

import 'Gmail/GooglePreview.dart';
import 'Twitter/twitter.dart';



class SocialPlatFormScreen extends StatefulWidget {
  @override
  _SocialPlatFormScreenState createState() => _SocialPlatFormScreenState();
}

class _SocialPlatFormScreenState extends State<SocialPlatFormScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: const Color(0xff7c94b6),
          image: DecorationImage(
            colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.dstATop),
            image: AssetImage("assets/images/back_social.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          margin: EdgeInsets.only(top: 300),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      child:  Container(
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0)
                        ),
                        width: 140,
                        height: 40,
                        child: Row(
                          children: <Widget>[
                            Icon(FontAwesomeIcons.google,color: Colors.red,),
                            SizedBox(width: 10,),
                            Center(child: Text('Google',style: TextStyle(
                                fontSize: 20
                            ),),)
                          ],
                        ),
                      ),
                      onTap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) => GooglePreview()
                        ));
                      },
                    ),
                    SizedBox(width: 40,),
                    GestureDetector(
                      child:  Container(
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0)
                        ),
                        width: 140,
                        height: 40,
                        child: Row(
                          children: <Widget>[
                            Icon(FontAwesomeIcons.twitter,color: Colors.blue,),
                            SizedBox(width: 10,),
                            Text('Twitter', style: TextStyle(
                              fontSize: 20
                            ),),
                          ],
                        ),
                      ),
                      onTap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) => BlocProvider<LoginBloc>(
                                create: (_)=>LoginBloc(),
                                child: twitter())
                        ));
                      },
                    ),

                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      child:  Container(
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0)
                        ),
                        width: 140,
                        height: 40,
                        child: Row(
                          children: <Widget>[
                            Icon(FontAwesomeIcons.instagram,color: Colors.red,),
                            SizedBox(width: 10,),
                            Text('Instagram',style: TextStyle(
                                fontSize: 20
                            ),),
                          ],
                        ),
                      ),
                      onTap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) => Instagram_Login()
                        ));
                      },
                    ),
                    SizedBox(width: 40,),
                    GestureDetector(
                      child:  Container(
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0)
                        ),
                        width: 140,
                        height: 40,
                        child: Row(
                          children: <Widget>[
                            Icon(FontAwesomeIcons.facebook,color: Colors.blue,),
                            SizedBox(width: 10,),
                            Text('Facebook' , style: TextStyle(
                                fontSize: 20
                            ),),
                          ],
                        ),
                      ),
                      onTap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) => Facebook_Login()
                        ));
                      },
                    ),

                  ],
                ),
              ),
            ],

          ),
        ),
      ),
    );
  }
}

