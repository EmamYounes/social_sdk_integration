/// [clientID], [appSecret], [redirectUri] from your facebook developer basic display panel.
/// [scope] choose what kind of data you're wishing to get.
/// [responseType] I recommend only 'code', I try on DEV MODE with token, it wasn't working.
/// [url] simply the url used to communicate with Instagram API at the beginning.
const String clientID = "774782759728742";
const String appSecret = "773c5277105a5daea37f558215c01733";
const String redirectUri = 'https://hexaapp.net/';
const String scope = 'user_profile,user_media';
const String responseType = 'code';
const String url =
    'https://api.instagram.com/oauth/authorize?client_id=${clientID}&redirect_uri=${redirectUri}&scope=${scope}&response_type=${responseType}';

/// Presets your required fields on each call api.
/// Please refers to https://developers.facebook.com/docs/instagram-basic-display-api/reference .
List<String> userFields = ['id', 'username'];
List<String> mediasListFields = ['id', 'caption'];
List<String> mediaFields = [
  'id',
  'media_type',
  'media_url',
  'username',
  'timestamp'
];
const String googleSignInApi = 'https://www.googleapis.com/auth/contacts.readonly';
const String googleConnectionsApi = 'https://people.googleapis.com/v1/people/me/connections'
    '?requestMask.includeField=person.names';
const String twitterKey = 'RyrvFOOjlJfJASZODeoTwL8RR';
const String twitterInfoApi = 'account/verify_credentials.json';
const String twitterSecretKey = 'j4AyVa8IwbHEkvGUt6zcQbV5nL5W2g6394VVjcxpcEzqdb7GyR';
const String twitterProfilePictureTag = "profile_image_url";
