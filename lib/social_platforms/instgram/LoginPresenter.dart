import 'dart:async';

import 'package:social_sdk_integration/social_platforms/instgram/Instagram.dart';
import 'package:social_sdk_integration/strings.dart';

abstract class LoginViewContract {
  void onLoginScuccess(Token token);
  void onLoginError(String message);
}

class LoginPresenter {
  LoginViewContract _view;
  LoginPresenter(this._view);

  void perform_login() {
    assert(_view != null);
    getToken(clientID, appSecret).then((token) {
      if (token != null) {
        _view.onLoginScuccess(token);
      } else {
        _view.onLoginError('Error');
      }
    });
  }
}
