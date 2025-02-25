{
  "$GMExtension":"",
  "%Name":"GoogleSignIn",
  "androidactivityinject":"",
  "androidclassname":"YYGoogleSignIn",
  "androidcodeinjection":"<YYAndroidGradleDependencies>\r\n\r\nimplementation 'com.google.android.gms:play-services-auth:19.2.0'\r\n\r\n</YYAndroidGradleDependencies>\r\n\r\n<YYAndroidGradleAndroid>\r\ncompileOptions {\r\n   sourceCompatibility 1.8\r\n   targetCompatibility 1.8\r\n}\r\n</YYAndroidGradleAndroid>",
  "androidinject":"",
  "androidmanifestinject":"",
  "androidPermissions":[],
  "androidProps":true,
  "androidsourcedir":"",
  "author":"",
  "classname":"YYGoogleSignIn",
  "copyToTargets":3035426170322551022,
  "description":"",
  "exportToGame":true,
  "extensionVersion":"2.0.1",
  "files":[
    {"$GMExtensionFile":"","%Name":"","constants":[],"copyToTargets":44,"filename":"GoogleSignIn.ext","final":"","functions":[
        {"$GMExtensionFunction":"","%Name":"GoogleSignIn_Show","argCount":0,"args":[],"documentation":"","externalName":"GoogleSignIn_Show","help":"GoogleSignIn_Show()","hidden":false,"kind":4,"name":"GoogleSignIn_Show","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":1,},
        {"$GMExtensionFunction":"","%Name":"GoogleSignIn_SignOut","argCount":0,"args":[],"documentation":"","externalName":"GoogleSignIn_SignOut","help":"GoogleSignIn_SignOut()","hidden":false,"kind":4,"name":"GoogleSignIn_SignOut","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":1,},
      ],"init":"","kind":4,"name":"","order":[
        {"name":"GoogleSignIn_Show","path":"extensions/GoogleSignIn/GoogleSignIn.yy",},
        {"name":"GoogleSignIn_SignOut","path":"extensions/GoogleSignIn/GoogleSignIn.yy",},
      ],"origname":"","ProxyFiles":[
        {"$GMProxyFile":"","%Name":"GoogleSignIn.js","name":"GoogleSignIn.js","resourceType":"GMProxyFile","resourceVersion":"2.0","TargetMask":5,},
      ],"resourceType":"GMExtensionFile","resourceVersion":"2.0","uncompress":false,"usesRunnerInterface":false,},
  ],
  "gradleinject":"\r\n\r\nimplementation 'com.google.android.gms:play-services-auth:19.2.0'\r\n\r\n",
  "hasConvertedCodeInjection":true,
  "helpfile":"",
  "HTML5CodeInjection":"\r\n<GM_HTML5_PreBody>\r\n    <script src=\"https://accounts.google.com/gsi/client\" async defer></script>\r\n</GM_HTML5_PreBody>",
  "html5Props":true,
  "IncludedResources":[],
  "installdir":"",
  "iosCocoaPodDependencies":"",
  "iosCocoaPods":"\r\npod 'GoogleSignIn','8.0'\r\n",
  "ioscodeinjection":"\r\n<YYIosCocoaPods>\r\npod 'GoogleSignIn','8.0'\r\n</YYIosCocoaPods>\r\n\r\n<YYIosPlist>\r\n<key>GIDClientID</key>\r\n<string>${YYEXTOPT_GoogleSignIn_iosClientID}.apps.googleusercontent.com</string>\r\n\r\n\t<key>CFBundleURLTypes</key>\r\n\t<array>\r\n\t  <dict>\r\n\t  <key>CFBundleURLSchemes</key>\r\n\t  <array>\r\n\t\t<string>com.googleusercontent.apps.${YYEXTOPT_GoogleSignIn_iosClientID}</string>\r\n\t  </array>\r\n\t  </dict>\r\n\t</array>\r\n\r\n</YYIosPlist>",
  "iosdelegatename":"",
  "iosplistinject":"\r\n<key>GIDClientID</key>\r\n<string>${YYEXTOPT_GoogleSignIn_iosClientID}.apps.googleusercontent.com</string>\r\n\r\n\t<key>CFBundleURLTypes</key>\r\n\t<array>\r\n\t  <dict>\r\n\t  <key>CFBundleURLSchemes</key>\r\n\t  <array>\r\n\t\t<string>com.googleusercontent.apps.${YYEXTOPT_GoogleSignIn_iosClientID}</string>\r\n\t  </array>\r\n\t  </dict>\r\n\t</array>\r\n\r\n",
  "iosProps":true,
  "iosSystemFrameworkEntries":[],
  "iosThirdPartyFrameworkEntries":[],
  "license":"",
  "maccompilerflags":"",
  "maclinkerflags":"",
  "macsourcedir":"",
  "name":"GoogleSignIn",
  "options":[
    {"$GMExtensionOption":"","%Name":"__extOptLabel","defaultValue":"HTML5 CONFIG:","description":"","displayName":"","exportToINI":false,"extensionId":null,"guid":"846fca3c-a7eb-4b6c-8bb1-c1a52b47a09b","hidden":false,"listItems":[],"name":"__extOptLabel","optType":5,"resourceType":"GMExtensionOption","resourceVersion":"2.0",},
    {"$GMExtensionOption":"","%Name":"html5ClientID","defaultValue":"","description":"Can be accessed in-game by the name 'html5ClientID'","displayName":"HTML5 Client ID","exportToINI":false,"extensionId":null,"guid":"a9082ed0-4d32-4f1d-9d8e-3e8dccfe075a","hidden":false,"listItems":[],"name":"html5ClientID","optType":2,"resourceType":"GMExtensionOption","resourceVersion":"2.0",},
    {"$GMExtensionOption":"","%Name":"__extOptLabel1","defaultValue":"ANDROID CONFIG:","description":"","displayName":"","exportToINI":false,"extensionId":null,"guid":"00f56131-838f-4504-b843-a09756cd5912","hidden":false,"listItems":[],"name":"__extOptLabel1","optType":5,"resourceType":"GMExtensionOption","resourceVersion":"2.0",},
    {"$GMExtensionOption":"","%Name":"androidClientID","defaultValue":"","description":"Can be accessed in-game by the name 'androidClientID'","displayName":"Android Client ID","exportToINI":false,"extensionId":null,"guid":"dbf63b47-98bd-4520-95ca-f70576af7321","hidden":false,"listItems":[],"name":"androidClientID","optType":2,"resourceType":"GMExtensionOption","resourceVersion":"2.0",},
    {"$GMExtensionOption":"","%Name":"FilterByAuthorizedAccounts","defaultValue":"True","description":"","displayName":"","exportToINI":false,"extensionId":null,"guid":"474d3975-2be1-48ff-9423-17ec70691d76","hidden":false,"listItems":[],"name":"FilterByAuthorizedAccounts","optType":0,"resourceType":"GMExtensionOption","resourceVersion":"2.0",},
    {"$GMExtensionOption":"","%Name":"__extOptLabel2","defaultValue":"IOS CONFIG:","description":"","displayName":"","exportToINI":false,"extensionId":null,"guid":"486019da-b312-488c-bd69-7540325de158","hidden":false,"listItems":[],"name":"__extOptLabel2","optType":5,"resourceType":"GMExtensionOption","resourceVersion":"2.0",},
    {"$GMExtensionOption":"","%Name":"iosClientID","defaultValue":"","description":"Can be accessed in-game by the name 'iosClientID'","displayName":"iOS Client ID","exportToINI":false,"extensionId":null,"guid":"c25a7650-d2fb-4e2b-8495-e56fbe1d36b4","hidden":false,"listItems":[],"name":"iosClientID","optType":2,"resourceType":"GMExtensionOption","resourceVersion":"2.0",},
    {"$GMExtensionOption":"","%Name":"__extOptLabel3","defaultValue":"OAUTH CONFIG:","description":"","displayName":"","exportToINI":false,"extensionId":null,"guid":"7554551d-e3ed-44a7-85c5-d3cd3652d0f7","hidden":false,"listItems":[],"name":"__extOptLabel3","optType":5,"resourceType":"GMExtensionOption","resourceVersion":"2.0",},
    {"$GMExtensionOption":"","%Name":"oauthClientId","defaultValue":"","description":"","displayName":"OAuth Client ID","exportToINI":false,"extensionId":null,"guid":"18da80f6-73be-4f3c-bd78-acebc8474c99","hidden":false,"listItems":[],"name":"oauthClientId","optType":2,"resourceType":"GMExtensionOption","resourceVersion":"2.0",},
    {"$GMExtensionOption":"","%Name":"oauthUrl","defaultValue":"","description":"","displayName":"OAuth Redirect URL","exportToINI":false,"extensionId":null,"guid":"4120ed8f-fba5-4725-9a61-9854756d79b9","hidden":false,"listItems":[],"name":"oauthUrl","optType":2,"resourceType":"GMExtensionOption","resourceVersion":"2.0",},
  ],
  "optionsFile":"options.json",
  "packageId":"",
  "parent":{
    "name":"Extensions",
    "path":"folders/GoogleSignIn/Extensions.yy",
  },
  "productId":"",
  "resourceType":"GMExtension",
  "resourceVersion":"2.0",
  "sourcedir":"",
  "supportedTargets":-1,
  "tvosclassname":null,
  "tvosCocoaPodDependencies":"",
  "tvosCocoaPods":"",
  "tvoscodeinjection":"<YYTvosPlist>\r\n\r\n</YYTvosPlist>\r\n\r\n",
  "tvosdelegatename":null,
  "tvosmaccompilerflags":"",
  "tvosmaclinkerflags":"",
  "tvosplistinject":"\r\n\r\n",
  "tvosProps":false,
  "tvosSystemFrameworkEntries":[],
  "tvosThirdPartyFrameworkEntries":[],
}