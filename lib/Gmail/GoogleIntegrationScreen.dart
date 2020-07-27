import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:social_sdk_integration/Bloc/LoginBloc.dart';

import 'GoogleModue.dart';

class GoogleIntegrationScreen extends StatelessWidget {
  bool LoggedIn = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Integration ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<LoginBloc>(
          create: (_) => LoginBloc(), child: SignInDemo()),
    );
  }
}

class SignInDemo extends StatefulWidget {
  @override
  _SignInDemoState createState() => _SignInDemoState();
}

class _SignInDemoState extends State<SignInDemo> {
  bool LoggedIn = true;
  LoginBloc _bloc;

  @override
  void initState() {
    _bloc = BlocProvider.of<LoginBloc>(context);
    // TODO: implement initState
    super.initState();
    GoogleModule.googleSingIn.onCurrentUserChanged.listen((account) {
      setState(() {
        _currentUser = account;
        _currentUser.authentication.then((onValue) {
          print(onValue);
        }).catchError((onError) {
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
        child: _buildBody(),
      ),
    );
  }

  GoogleSignInAccount _currentUser;

  _buildBody() {
    return BlocBuilder<LoginBloc, BaseState>(
      builder: (context, baseState) {
        GmailLoginState state;
        if (baseState is GmailLoginState) {
          state = baseState;
          if (state.state == ResultState.Loaded && LoggedIn) {
            LoggedIn = true;
            _currentUser = state.currentUser;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ListTile(
                  leading: GoogleUserCircleAvatar(
                    identity: state.currentUser,
                  ),
                  title: Text(state.currentUser.displayName),
                  subtitle: Text(state.currentUser.email),
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
        } else {
          {
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
      },
    );
  }

  _handleSignOut() async {
    try {
      _currentUser = await GoogleModule.signOutFromGmail();
      setState(() {
        LoggedIn = false;
      });
    } catch (err) {
      print(err);
    }
  }

  Future<void> _handleSignIn() async {
    try {
      // _currentUser = await GoogleModule.signInWithGmail();
      _bloc.add(LoginEvent(type: LoginType.GMAIL));
      //   LoggedIn=true;
    } catch (err) {
      print(err);
    }
  }

  Future<void> _clearAuthCash() async {
    await _currentUser.clearAuthCache();
  }
}
