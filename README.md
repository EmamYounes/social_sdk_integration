# Social Sdk Intergration
Intergration is reference app for all social media integration and will sum up all flutter plugin that we used them regularly.
we split them into category:
1- social platforms like facebook, twitter, gmail, instagram
2- platforms for video call like zoom
======================================================
Zoom :
1- First create your app on ==> https://marketplace.zoom.us/develop/create?source=devdocs
2- Choose sdk https://marketplace.zoom.us/develop/apps/kd1JqxQ9RHSAx01SoObI8g/credentials
3- Save SDK Key and SDK Secret for later
4- Take our native code library and add in mainfest all activities of zoom  :
InitAuthSDKActivity , APIUserStartJoinMeetingActivity , LoginUserStartJoinMeetingActivity , EmailUserLoginActivity , SSOUserLoginActivity,
PreMeetingExampleActivity , ScheduleMeetingExampleActivity , MyInviteActivity , MyWaitJoinActivity , MyCallMeByPhoneActivity , MeetingSettingActivity ,
QAActivity , BreakoutRoomsAdminActivity , BoEditActivity 
5- add internet permission ==>     <uses-permission android:name="android.permission.INTERNET" />
6- replace your SDK Key and SDK Secret with ==> go to  InitAuthSDKHelper class => 
    public void initSDK(Context context, InitAuthSDKCallback callback) {
            //replace here your one 
            initParams.appKey = APP_KEY;
            //replace here your one 
            initParams.appSecret =  APP_SECRET; 
            }
7- Don't forget to make a channel to run zoom code like
in flutter main.dart : 
openZoomApp()async{
    const platform = const MethodChannel('flutter.native/zoom');
    String response = "";
    try {
      final String result = await platform.invokeMethod('openZoom');
      response = result;
    } on PlatformException catch (e) {
      response = "Failed to Invoke: '${e.message}'.";
    }
  }
  In native MainActivity 
    private val CHANNEL = "flutter.native/zoom"
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);
        MethodChannel(flutterEngine.dartExecutor, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "openZoom") {
                val intent = Intent(this, InitAuthSDKActivity::class.java)
                startActivity(intent)
            }
        }
    }
Here is our reference code https://github.com/zoom/zoom-sdk-android/tree/master/mobilertc-android-studio/sample
=====================================================================


