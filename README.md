# social_sdk_integration
Intergration is reference app for all social media integration and will sum up all flutter plugin that we used them regularly.
we split them into category:
1- social platforms like facebook, twitter, gmail, instagram
2- platforms for video call like zoom

======================================================

Zoom :
1- first create your app on ==> https://marketplace.zoom.us/develop/create?source=devdocs
2- choose sdk https://marketplace.zoom.us/develop/apps/kd1JqxQ9RHSAx01SoObI8g/credentials
3- save SDK Key and SDK Secret for later
4- take our native code library and add in mainfest all activities of zoom and add internet permission
5- replace your SDK Key and SDK Secret with ==> go to  InitAuthSDKHelper class => 
    public void initSDK(Context context, InitAuthSDKCallback callback) {
        if (!mZoomSDK.isInitialized()) {
            mInitAuthSDKCallback = callback;
            ZoomSDKInitParams initParams = new ZoomSDKInitParams();
            //replace here your one 
            initParams.appKey = APP_KEY;
            //replace here your one 
            initParams.appSecret =  APP_SECRET;
            initParams.enableLog = true;
            initParams.enableGenerateDump =true;
            initParams.logSize = 50;
            initParams.domain= AuthConstants.WEB_DOMAIN;
            initParams.videoRawDataMemoryMode = ZoomSDKRawDataMemoryMode.ZoomSDKRawDataMemoryModeStack;
            mZoomSDK.initialize(context, this, initParams);
        }
    }
=============================================================================================    


