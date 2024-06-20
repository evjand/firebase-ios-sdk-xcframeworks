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
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_AppAuth.xcframework.zip",
      checksum: "82c4c3024e1ac967b1b9d5d01114c26de72a71a96f063e24e7dbd1ea13cc6dda"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_AppCheckCore.xcframework.zip",
      checksum: "21161aabe2a565ea8df41de0caecef44b4a883fe76ec07d9739aec92955c0447"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FBLPromises.xcframework.zip",
      checksum: "885d248ece91235284fcad893382abb4055fdd148f21bfd31b18099b2166c2a2"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseABTesting.xcframework.zip",
      checksum: "b67d379815cb02d68fdc530378ac2e51600498878db004b0d98005436d734c5d"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "c5ee03a217494505ece045dde7844dc387edc4c223e8482c5907c9c4b41b0289"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "3d7ee62ac0e1622267f65ccb11c03026bb0752f88ecfafda9e276358be7cf18e"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "b1dcf2bd5e2d06fdb7f80eeb5be6c25130cef08948a66c3ae42bbd21756a8f0c"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "5c1280a64e7d8b77b3bc111df4dc47e2403d3ab52f54faacb7399174bc1e5ee9"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "986e1d7fbc955c61982cf1db4e967fac34556efe79cee98a009b00aa87b0368c"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseAuth.xcframework.zip",
      checksum: "10657f2aa009fb1f5c460d16c3a8670ddfd320e7a070e84d8e1f0916d17647cd"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "f9c7205749ac3b192db8b3ce836418bd637f24d6ead4fde00a0862075486b24c"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseCore.xcframework.zip",
      checksum: "85a6de43febae6e711694dea6f423285d2d7e21fb40056d0b13a55fcbd951090"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "4158c2bd87296258740d339bd03512580363471d6e214f826f4638c792c12c24"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "989540791d856c5d85604290da085df5b933807b908654cb51e23d14fe235211"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "cd02fda650054ddf23082e566ed73b913b1425069c5dc2e1ec415e122f7b0b8c"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseDatabase.xcframework.zip",
      checksum: "9399f213f82a486bde368241dc464d05521ba0d0c1419f6a0423851fb0bb4198"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "1987e4ca00077de0de0c63c3896d5f461b73b90f1a32177eda450bb569410aea"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseFirestore.xcframework.zip",
      checksum: "53418eb8dcfad9559f706e9d7bd72f7fba69a6a571ea62d0e4ed9f973945f83d"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "d0a68cc2871a5ace56fb3d3a6b1f4c628a4e1326e4fe7427aaa7ec8a310aaf29"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseFunctions.xcframework.zip",
      checksum: "996f609152b1263cc20615b1a176d4d9b77b68907abdb8963b5019acbf68097f"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "32cf64bdbff8eddea450f531344f9792f8796fb4aa863f2aea1ccf1cd6c26bdb"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseInstallations.xcframework.zip",
      checksum: "5f43caedca9363410fd35505b80248fb73766c9b6c423c87d07f8f2d92f2983b"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "95c74be182fd410a8d01a63643f22d3ed7e38dd5f1f5f12291bcab23f1cd60b7"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseMessaging.xcframework.zip",
      checksum: "e26ac2ef38d87342303088974364e68285a649528792cf16a7c33f31eb28e6dd"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "3341b2190d14b0e470e71c80f327c6b6c57334b95a1551664fba3e581427ec2b"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebasePerformance.xcframework.zip",
      checksum: "6fe3ac143d6868b6413816e7ac3652e58bda833ef866eea49b02c54c9cad5ce5"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "4c2e0923e8837a8562be7877922eb2fc31276ff73e6460141f7ff6baf486cdc4"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "cb0a780b7385a5f36d03e9cbbf7fb08bcd7e7962185ad728a292dfbfa23be320"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseSessions.xcframework.zip",
      checksum: "858421ca1b60aa4cf5e2b8b08ccca34da3700a0910f9ca988379a9554e2df654"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "603126526275c4405948c3fabd615094125feb90bf957ffc88741bc017ce921a"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseStorage.xcframework.zip",
      checksum: "0c2648f1649c49cfe88b4c46679fc6515c776b9817c090ecc97725c492aad8fc"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_GTMAppAuth.xcframework.zip",
      checksum: "66c6fe981a66aefce6f064cf034cb12b94e81c0d0b940affb8fdb426ff24fc29"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "b46f2d19b9b0de6d45e0ac1c9a0af1d8f6d156083c29a15a5214b40df5c58216"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "59dd1cad02e85a7e7cf6bd51a57301b1f0e3f357d6728dd3f7851114ce42d41c"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "c3a49e1c8569bb9ce5610e9e205ad7521e3f1b943eb0a74ed70b9ada05708e1a"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "d5aba8229977b1819d01937649661e9d5da2f0acb1efb1cfbe6cd73e5dcb0df3"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_GoogleDataTransport.xcframework.zip",
      checksum: "f0d44faec5683cb92464b96b68b0772347ca18986fdb3af05307490bc6ef28ef"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_GoogleMobileAds.xcframework.zip",
      checksum: "4b0061c713a691873f81d45c09654df9aac2901a6b967bdba503c9d15b89a0b2"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_GoogleSignIn.xcframework.zip",
      checksum: "01fa97c1a31c98fe70fcb1e3cff30b3612f0ef127547be6714c6856140141784"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_GoogleUtilities.xcframework.zip",
      checksum: "8627814cf257d223020e654264626e765b48cab7bf3e876ffd6f907868120ea9"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_Promises.xcframework.zip",
      checksum: "ba8ae3d9cdc84c78409b0930c581c8d76519fce42842e627e1a0812c414a5da2"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_RecaptchaInterop.xcframework.zip",
      checksum: "f5402801d3d4520fd3181ab99c33169d969e80e5852b421ed2e1d02ff3db2147"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_SwiftProtobuf.xcframework.zip",
      checksum: "e63eff530041c4df8ac8abc4404db44b02b3ef2aae786f5a2707f2a0938180c2"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "026351b73224eb7233a1c4a391f44569b3f0308af3cafe4bb9115435a3336f45"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_absl.xcframework.zip",
      checksum: "e021d528fc5e3f338bea7db3003d22387fb66f24e929c184d6c38cf36b8eb9d7"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_grpc.xcframework.zip",
      checksum: "bf6f9f7cb7b03803539b523e48796c467b64715d7e7ac943bdf49715142c1fed"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_grpcpp.xcframework.zip",
      checksum: "f6d888838b2d1ba4ce868c2035ace2dd2ee3f3c1513dd37de587bbc98a332f7f"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_leveldb.xcframework.zip",
      checksum: "2bba33e5b07f7eb1d5a42f9b2d4aa15e8a8fac11498cd6acc0e63c6b5cde136d"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_nanopb.xcframework.zip",
      checksum: "9c5dba7bcf8e222f9f83fd3e697294dde9314921a7976917d8d412e2370d42a6"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_openssl_grpc.xcframework.zip",
      checksum: "bf7b67f7ab1d5041cd205d5c0a74d44ae26347e8231643e40d20cc3eb54515a5"
    )
  ]
)
    