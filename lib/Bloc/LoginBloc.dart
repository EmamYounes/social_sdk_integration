import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_twitter_login/flutter_twitter_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:social_sdk_integration/Gmail/GoogleModue.dart';

import '../strings.dart';

class LoginBloc extends Bloc<BaseEvent, BaseState>{
  static final TwitterLogin twitterLogin = new TwitterLogin(
    consumerKey: twitterKey,
    consumerSecret: twitterSecretKey,
  );
  @override
  // TODO: implement initialState
  BaseState get initialState => BaseState(state: ResultState.Empty);

  @override
  Stream<BaseState> mapEventToState(BaseEvent event) async*{
    BaseState(state: ResultState.Loading);
    if(event is LoginEvent){
      if(event.type == LoginType.GMAIL)
      {
        yield GmailLoginState(await GoogleModule.signInWithGmail(),ResultState.Loaded);
      }
      else if(event.type == LoginType.TWITTER)
      {
        TwitterLoginResult twitterLoginResult = await twitterLogin.authorize();
        yield TwitterLoginState(ResultState.Loaded,result: twitterLoginResult);
      }
    }
    else {
      if(event.type == LoginType.TWITTER)
      {
          await twitterLogin.logOut();
        yield TwitterLoginState(ResultState.LoggedOut);
      }
    }

  }


}
class BaseEvent{
  LoginType type ;
  BaseEvent({this.type});
}
class LoginEvent extends BaseEvent{
  LoginEvent({LoginType type}){
    super.type=type;
  }
}
class LogoutEvent extends BaseEvent{

  LogoutEvent({LoginType type}){
    super.type=type;
  }}
class BaseState{
  ResultState state ;
  BaseState({this.state});
}
class GmailLoginState extends BaseState{
  GoogleSignInAccount currentUser;
  GmailLoginState(this.currentUser, ResultState state ){
    super.state=state;
  }
}class TwitterLoginState extends BaseState{
  TwitterLoginResult result;
  TwitterLoginState( ResultState state,{this.result} ){
    super.state=state;
  }
}

enum ResultState {
  Empty , Loading , Loaded , Error, LoggedOut
}
enum LoginType {
  GMAIL , TWITTER , FACEBOOK , INSTAGRAM
}
