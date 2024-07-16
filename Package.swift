// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Firebase",
  platforms: [.iOS(.v11), .macOS(.v10_12), .tvOS(.v12), .watchOS(.v7)],
  products: [
    .library(
      name: "FirebaseABTesting",
      targets: ["FirebaseABTestingTarget"]
    ),
    .library(
      name: "FirebaseAnalytics",
      targets: ["FirebaseAnalyticsTarget"]
    ),
    .library(
      name: "FirebaseAnalyticsOnDeviceConversion",
      targets: ["FirebaseAnalyticsOnDeviceConversionTarget"]
    ),
    .library(
      name: "FirebaseAppCheck",
      targets: ["FirebaseAppCheckTarget"]
    ),
    .library(
      name: "FirebaseAppDistribution",
      targets: ["FirebaseAppDistributionTarget"]
    ),
    .library(
      name: "FirebaseAuth",
      targets: ["FirebaseAuthTarget"]
    ),
    .library(
      name: "FirebaseCrashlytics",
      targets: ["FirebaseCrashlyticsTarget"]
    ),
    .library(
      name: "FirebaseDatabase",
      targets: ["FirebaseDatabaseTarget"]
    ),
    .library(
      name: "FirebaseDynamicLinks",
      targets: ["FirebaseDynamicLinksTarget"]
    ),
    .library(
      name: "FirebaseFirestore",
      targets: ["FirebaseFirestoreTarget"]
    ),
    .library(
      name: "FirebaseFunctions",
      targets: ["FirebaseFunctionsTarget"]
    ),
    .library(
      name: "FirebaseInAppMessaging",
      targets: ["FirebaseInAppMessagingTarget"]
    ),
    .library(
      name: "FirebaseMLModelDownloader",
      targets: ["FirebaseMLModelDownloaderTarget"]
    ),
    .library(
      name: "FirebaseMessaging",
      targets: ["FirebaseMessagingTarget"]
    ),
    .library(
      name: "FirebasePerformance",
      targets: ["FirebasePerformanceTarget"]
    ),
    .library(
      name: "FirebaseRemoteConfig",
      targets: ["FirebaseRemoteConfigTarget"]
    ),
    .library(
      name: "FirebaseStorage",
      targets: ["FirebaseStorageTarget"]
    ),
    .library(
      name: "Google-Mobile-Ads-SDK",
      targets: ["Google-Mobile-Ads-SDKTarget"]
    ),
    .library(
      name: "GoogleSignIn",
      targets: ["GoogleSignInTarget"]
    )
  ],
  dependencies: [
  ],
  targets: [
    .target(
      name: "Firebase",
      publicHeadersPath: "./"
    ),
    .target(
      name: "FirebaseABTestingTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseABTesting"
      ],
      path: "Sources/FirebaseABTesting"
    ),
    .target(
      name: "FirebaseAnalyticsTarget",
      dependencies: [
        "Firebase",
        "_FBLPromises",
        "_FirebaseAnalytics",
        "_FirebaseCore",
        "_FirebaseCoreInternal",
        "_FirebaseInstallations",
        "_GoogleAppMeasurement",
        "_GoogleAppMeasurementIdentitySupport",
        "_GoogleUtilities",
        "_nanopb"
      ],
      path: "Sources/FirebaseAnalytics"
    ),
    .target(
      name: "FirebaseAnalyticsOnDeviceConversionTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "_FirebaseAnalyticsOnDeviceConversion", condition: .when(platforms: [.iOS])),
        .target(name: "_GoogleAppMeasurementOnDeviceConversion", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseAnalyticsOnDeviceConversion"
    ),
    .target(
      name: "FirebaseAppCheckTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_AppCheckCore",
        "_FirebaseAppCheck",
        "_FirebaseAppCheckInterop"
      ],
      path: "Sources/FirebaseAppCheck"
    ),
    .target(
      name: "FirebaseAppDistributionTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "_FirebaseAppDistribution", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseAppDistribution"
    ),
    .target(
      name: "FirebaseAuthTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAppCheckInterop",
        "_FirebaseAuth",
        "_GTMSessionFetcher",
        .target(name: "_RecaptchaInterop", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseAuth"
    ),
    .target(
      name: "FirebaseCrashlyticsTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseCoreExtension",
        "_FirebaseCrashlytics",
        "_FirebaseRemoteConfigInterop",
        "_FirebaseSessions",
        "_GoogleDataTransport",
        "_Promises"
      ],
      path: "Sources/FirebaseCrashlytics",
      exclude: [
        "run",
        "upload-symbols"
      ]
    ),
    .target(
      name: "FirebaseDatabaseTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAppCheckInterop",
        "_FirebaseDatabase",
        "_FirebaseSharedSwift",
        "_leveldb"
      ],
      path: "Sources/FirebaseDatabase"
    ),
    .target(
      name: "FirebaseDynamicLinksTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "_FirebaseDynamicLinks", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseDynamicLinks"
    ),
    .target(
      name: "FirebaseFirestoreTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAppCheckInterop",
        "_FirebaseCoreExtension",
        "_FirebaseFirestore",
        "_FirebaseFirestoreInternal",
        "_FirebaseSharedSwift",
        "_absl",
        "_grpc",
        "_grpcpp",
        "_leveldb",
        "_openssl_grpc"
      ],
      path: "Sources/FirebaseFirestore"
    ),
    .target(
      name: "FirebaseFunctionsTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAppCheckInterop",
        "_FirebaseAuthInterop",
        "_FirebaseCoreExtension",
        "_FirebaseFunctions",
        "_FirebaseMessagingInterop",
        "_FirebaseSharedSwift",
        "_GTMSessionFetcher"
      ],
      path: "Sources/FirebaseFunctions"
    ),
    .target(
      name: "FirebaseInAppMessagingTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseABTesting",
        .target(name: "_FirebaseInAppMessaging", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseInAppMessaging"
    ),
    .target(
      name: "FirebaseMLModelDownloaderTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseCoreExtension",
        "_FirebaseMLModelDownloader",
        "_GoogleDataTransport",
        "_SwiftProtobuf"
      ],
      path: "Sources/FirebaseMLModelDownloader"
    ),
    .target(
      name: "FirebaseMessagingTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseMessaging",
        "_GoogleDataTransport"
      ],
      path: "Sources/FirebaseMessaging"
    ),
    .target(
      name: "FirebasePerformanceTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseABTesting",
        "_FirebaseCoreExtension",
        .target(name: "_FirebasePerformance", condition: .when(platforms: [.iOS, .tvOS])),
        "_FirebaseRemoteConfig",
        "_FirebaseRemoteConfigInterop",
        "_FirebaseSessions",
        "_FirebaseSharedSwift",
        "_GoogleDataTransport",
        "_Promises"
      ],
      path: "Sources/FirebasePerformance"
    ),
    .target(
      name: "FirebaseRemoteConfigTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseABTesting",
        "_FirebaseRemoteConfig",
        "_FirebaseRemoteConfigInterop",
        "_FirebaseSharedSwift"
      ],
      path: "Sources/FirebaseRemoteConfig"
    ),
    .target(
      name: "FirebaseStorageTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAppCheckInterop",
        "_FirebaseAuthInterop",
        "_FirebaseCoreExtension",
        "_FirebaseStorage",
        "_GTMSessionFetcher"
      ],
      path: "Sources/FirebaseStorage"
    ),
    .target(
      name: "Google-Mobile-Ads-SDKTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "_GoogleMobileAds", condition: .when(platforms: [.iOS])),
        .target(name: "_UserMessagingPlatform", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/Google-Mobile-Ads-SDK"
    ),
    .target(
      name: "GoogleSignInTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "_AppAuth", condition: .when(platforms: [.iOS])),
        .target(name: "_GTMAppAuth", condition: .when(platforms: [.iOS])),
        "_GTMSessionFetcher",
        .target(name: "_GoogleSignIn", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/GoogleSignIn"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_AppAuth.xcframework.zip",
      checksum: "3f6a5eda0d934a8fba1e11e8a2519c4162ac2b42123be90ec2bdfeb02529b96b"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_AppCheckCore.xcframework.zip",
      checksum: "6b89ac3b0fdc67865f231cee52830c591be13898ebcc55465b1c22d4b20a7536"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FBLPromises.xcframework.zip",
      checksum: "1c72e484f745eebe4fa83a09d291b909a9fddbd082e9b4176c364532f1f55da7"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseABTesting.xcframework.zip",
      checksum: "94ef21d9663e75a1bf1b9aacf276c585e5488768e58a62b500da30f420832176"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "d49c8bb0cb9ee55d24deb49dc983a046a0aa469813e903ed9ba43ecadb639373"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "39baf690ab3f56004bdb3656cc200f204a89a37f636d178cde65b7964a215e64"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "09dbeffedfcdc76e380b95d444aa452947aeef4e76fb6695ae327e316f8ccc23"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "c54626a4ea413cc54555e501a8db0b3a7184de385187a700e9cfde0d2698f407"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "19bf5c944941793a330d912cac5fe90912710430df62a0001fcc1ecafdb22577"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseAuth.xcframework.zip",
      checksum: "6a5ce4384c377c97d06b0dd693b2018eae446964e2414fc4df8b7773f3e3bcbe"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "ad338f7ac64ef86ce8b0af405bc86ec06899e7aa2707d71aecf6d56a18e86cd3"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseCore.xcframework.zip",
      checksum: "e782d1d71fee52298ad498766035f302d7862eb6aa8b3de5d1a1541cf5ce07a7"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "b8081461f1022f14420361fa0b957457855d05bf696eada8598d098f9f7b4d19"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "f8345266ea835041ec79f200eb4d48d76b5a014b60912c1245572e77e8ae52ea"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "832b4065f8e8aca82e1ddbbd7b8a60c97a929a0f095d64e621078eafa0296de0"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseDatabase.xcframework.zip",
      checksum: "da12c21a9bf5c88bd1c96956b9bb1f72762aa8fb1468b2dbb1ef822e086c8ab7"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "009642bff86e2ba96071c8772f841123e0e2383a3294469c59ab7ec1683d7a1b"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseFirestore.xcframework.zip",
      checksum: "a8eaef26da835f04d12d6602a41944300fa7d9fc27acbe95896b3bf096bfcdf3"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "0a254652d5137bcb1e5bf1733c0fd935b90ac26a635cfd36e1fdf4fc234eb08f"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseFunctions.xcframework.zip",
      checksum: "aca2f59c4637a267c7ec4fabf33730d4742fb8141512b79f3239835305aec610"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "2dde651b2ab7293c227ececd6105c46fd634528b6b5bc718a4e821e20926899a"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseInstallations.xcframework.zip",
      checksum: "5ed76713035d09fb18ac56478f33d1517b0e258a35cc280ac4ec226384deaa60"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "8fc0e1f2ae061fbb5e57980671bc6b71a17f51f288c0dd0b5748d4fbfed9353d"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseMessaging.xcframework.zip",
      checksum: "a26dfb214954f5c8f461de8076da367e6e14314f603935eb637103e6fb32442a"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "72803ed82e3f1ab850f3be26035cbc7353ca72d2f9fb2fdbeb605513f2c8a5ef"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebasePerformance.xcframework.zip",
      checksum: "04fd9ccfe13f05301ee2954abb207b296919668a7096b350ea30668ff89ac32c"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "79e873fdc3fb2e172b693b49713bd1b03ba06015efc47521935bacfb0a8c1e0d"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "c113085d43f00747a042c56574fd878d0e5599a734e0072ba21dec5bbcb7afa5"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseSessions.xcframework.zip",
      checksum: "94f362fd23c45b9ba8409d2cd5abc17ac98aa297cbf39cdc23242a17ccd77d7c"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "95b211b1271c33013f8e6e6408bda6e520b2b343aa942e50563eb992ba333e08"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseStorage.xcframework.zip",
      checksum: "99f8bbcbe2039a587a3a01a261bcb3ba17d6c0ac136b41961b502692ccfc1b75"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_GTMAppAuth.xcframework.zip",
      checksum: "09f04256aec04a2671079c501cc04f295f13068facd5da924a6cc5bc2b50b917"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "1cfb8176396b72c65d027da5e3c4cdef46899e9ba1007f3335d23ba3f0110ea0"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "e1a4b471df73694ed7feb19da85dd37290d59f388417894ef63f20600f62e3e7"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "6f79ed0ad19cc0ad46ea7778a210446ccfba68bc056b671cf0f75a07c81530f8"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "1c3cd16c7b37eaf48767dac7dbefbed80f3abc746f5b205ae2ba562dfcd1e686"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_GoogleDataTransport.xcframework.zip",
      checksum: "05160493af123706048a0e72e10e6f597f6826937e23d3a3f0f2dc339ce59050"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_GoogleMobileAds.xcframework.zip",
      checksum: "679fcdf904e95494c4b63cbb3e375e259f72fbf000fef88fe2672673f9f38a60"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_GoogleSignIn.xcframework.zip",
      checksum: "b18308a25ebc7aa348ca75258ca8a2dd705fca2126aaf6fde69c869274e378c1"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_GoogleUtilities.xcframework.zip",
      checksum: "179e951c5600ced304618e88a64598866f2e130af3145014f9d0847c5c5fb07d"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_Promises.xcframework.zip",
      checksum: "193534e3d27691c43c94da48ba18da6db3701c0a7717e2b209b087b101f836c5"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_RecaptchaInterop.xcframework.zip",
      checksum: "54d874248ed39d1dfa69e29cd2d805b41ec465cbf76d7a48c210dd2593e29bf1"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_SwiftProtobuf.xcframework.zip",
      checksum: "62c684f0e1a370c29e2f5d8f81de7596b2c7d0299b94e9845b52994c909d705f"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "b1b433d44c67c72bc75454491f77fcafed45048ab539a77dbfbc7a0e1eb5552f"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_absl.xcframework.zip",
      checksum: "6d0c0e629bdc1838ae976fa2fee539b6586487a3ef1add205288b26d631e807e"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_grpc.xcframework.zip",
      checksum: "1fa9b9e210538447d68d8a8d66b21d783b9778444bdc06d0bf7842a7f3d7910f"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_grpcpp.xcframework.zip",
      checksum: "a19e8fd12df8f046cef3dcc7a400e0bf863fb59d61afe9439c99149fc1d603de"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_leveldb.xcframework.zip",
      checksum: "89bc5257ddfb826f432f68972b249374596d166ad9847aa5d3709c7471a0313e"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_nanopb.xcframework.zip",
      checksum: "48f1c6c690701d532f1f15c908028cde74ed5f2555747df7a35f328f7371cdf4"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_openssl_grpc.xcframework.zip",
      checksum: "c6a709645e8198da5cf6fe4d92811ae50a5169b18fbea095d1b01d7cf55ec719"
    )
  ]
)
    