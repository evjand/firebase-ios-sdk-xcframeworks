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
        "_FirebaseAuthInterop",
        "_FirebaseCoreExtension",
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
        "_AppCheckCore",
        .target(name: "_GTMAppAuth", condition: .when(platforms: [.iOS])),
        "_GTMSessionFetcher",
        .target(name: "_GoogleSignIn", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/GoogleSignIn"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_AppAuth.xcframework.zip",
      checksum: "98ddca74bac0bf1df1b1f656187f1a9f6bc3618417146750b2372a2b4d1a5b59"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_AppCheckCore.xcframework.zip",
      checksum: "f3de54a02872d3553e9ce4f3876ea338abd29cd5faafa73d66eb073fcbdf3674"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FBLPromises.xcframework.zip",
      checksum: "e7a187a8e460ef0aca3c2a0d89c380b7540a0b42aa60aab78d4bf196c560c52d"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseABTesting.xcframework.zip",
      checksum: "190812004b4f4bda0ea674f07109dbafe13f0f36f654c80e540063ba0c26ad69"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "1041dce9eeea1afcbe9f950cc56872e3bc8c4e75157155487693a053e7becdac"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "8a31ff84b360888fa760ecbea8288f64b87e7d33b36facb142018f6d9d74f52d"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "3b02c1470e82565a7a1eae947babe87e3fd02f302fbe47ad8a81200cf83e16d9"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "11ea7ff61a4380815d772fa974a15d4276ffadd1b7801e241f1edd5b7a4f8e1a"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "6b0017276592a0226228a188bf731b8fe5edfd65512a6703c3ee4acb5d9ac536"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseAuth.xcframework.zip",
      checksum: "d2fe628f8bef26d4a84c658b1026c06b9e778dffcfda20976b480572865c69b5"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "fa265f319017bfe71fd622643ffbccaae56fcbee929e11b0d9a792e2225fd276"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseCore.xcframework.zip",
      checksum: "c048de47109cbd76045d37da30bf638b3b8ff146cc1aadf336f22915edad1ff6"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "5f427745db4d116a09e022e449c0b5bb5a58d65ecf5edcd31904361a8a8d7ed7"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "db9dcb7cb6aff52a1675b806b04f2edeb0276344e5c527fe530909c01386fd25"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "722dddf8355a1b98a9b78c1852151a2a94c4e79301e2a51ca7e36a7d903c15c4"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseDatabase.xcframework.zip",
      checksum: "b5a913f828de3cc2b86ca4e53c6b63ab06a402dafa42bdbaab81eae9d208903e"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "a4dabb1de37f7a2d44c109a0a0098c2a06d89e4f0ebbfc581bb81d694b46d1a9"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseFirestore.xcframework.zip",
      checksum: "d329ae310e1d09a466a1bc0aed87cdbec6ffbe14537d6aca552539170dfe00ec"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "cc0a15c4097b8e3422891546465707f10686a8002f25a7cb509a74abcc8b194c"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseFunctions.xcframework.zip",
      checksum: "d3ae8a9feb05db59626ea1dfa6a939ee22e1d017568986e17dccaf1533f1f1ee"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "a27e871123befda56d101bc9d7f373a703dcd41a513af3dfeacbc8941cbfa956"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseInstallations.xcframework.zip",
      checksum: "016587b933831da6e53bdfe6a98d7ba62dc91d7f06f7959e228436142dccaa69"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "99a15a289dd4ff787423f530851194edc63dd3609778d90bb5f9324ad86c2a16"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseMessaging.xcframework.zip",
      checksum: "1dfddd7e8708a5aa897910df523d0eefa8f6b6ea5f4f0253e7800d7c8a2c0b26"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "fb2668f8ffeb87a3641c596842de95abad972ec958287a59fa0b3c8e56544624"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebasePerformance.xcframework.zip",
      checksum: "8d1adf1987ee229eb838a124c26450f5c3e62b12aae3b16611f067b6e90d95fd"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "1c4d3df96a88d4337d3abf56c50c1701fa66c4fd7ce5a5f485d3909bd0830449"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "e1ab1b047844378a58ff17a1de7af3b023b98b441f0c41995903384d294449d8"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseSessions.xcframework.zip",
      checksum: "21a462eb648574a7a482eed6cf1273da1c27a17cee3d508dc254d2a6180717e9"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "875a7efaf85270be1ecd7797c0ce85ab38b6837e0edfe4a4e87eccd979d8a8a6"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseStorage.xcframework.zip",
      checksum: "3e4c819f8c29f192f953ea3580cfc9118a0d4b8bc1cccf4442e3d983972b181c"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_GTMAppAuth.xcframework.zip",
      checksum: "192bf42db42ce226dbd6630fdc060d33535afdc6b418fcc22b45c0822107981c"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "1fb2589a9cfeced8d0c722b655f80ed6f132c8058c629e529746051990f40a2c"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "e37acc61817fb10aae7d76186c303c531fcdbda1ea2fe807a8913dc823aff19b"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "52372ab96da0681604fbf9b5a5430a3471138c7b99121adc81658b2806a658d7"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "6bb1913a56f72ff15e89c91f90b94c1e29a291360c9913e1d33aed560461c433"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_GoogleDataTransport.xcframework.zip",
      checksum: "b2d4611f707416cdd50bf02e61a5b19c536068ecc58f3de337141ac90039ec14"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_GoogleMobileAds.xcframework.zip",
      checksum: "1af216406c9c10f1f08c4e25c7eae5069386e432f0251bc72ebd89c8d3f6fe18"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_GoogleSignIn.xcframework.zip",
      checksum: "2375ef23bbc7681c71298661de0ef3d47347460110917d122c30c336c8dc63f3"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_GoogleUtilities.xcframework.zip",
      checksum: "adc89977c7acf8583db71cca3bbdc5ef34d9348c26a288c962ade8f6874ca868"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_Promises.xcframework.zip",
      checksum: "e18ece8d5ecacbd1295abbdec80dbae29b443ff68c429fb01bb52801326a0a32"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_RecaptchaInterop.xcframework.zip",
      checksum: "9aae60396bd449e3e14624f0f8438fd395c77cf01e7e6b72fedebdce5cb12ab5"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_SwiftProtobuf.xcframework.zip",
      checksum: "0d266f2a81a3efa5235d1d1c835bf6866724c5a8109a0faabb2e447ee0074c35"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "0f2ed48aefd7e58a83c83004dba4bde32ebeb0688917a26d91522d7c2bc15c3d"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_absl.xcframework.zip",
      checksum: "6ccb58038c7fccdb48e010356abbd6b84fc3dacc1972b8b9300ee2f28b6c996a"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_grpc.xcframework.zip",
      checksum: "f49b0b459d0cdfb32f3b3a5cea5f88c9c25c33d2682f41c1dd0f249052c7c2cc"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_grpcpp.xcframework.zip",
      checksum: "f374651cae3dea93713c4ef3e7329c1bb9cdcdf91afaa04f0a5ead06a7baa33c"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_leveldb.xcframework.zip",
      checksum: "ca2c3f0aed01f6e203780cc7c3af90c77ed449c0efb644b4e44174a8aaa04564"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_nanopb.xcframework.zip",
      checksum: "1496cc9ceb135c6b834ca8938fa6e054191687e5b31675f3dbd05d4022fafdca"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/evjand/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_openssl_grpc.xcframework.zip",
      checksum: "8a192be7d37e94404696b209283948371ff5612133945dd4bb6a8949fa25d47e"
    )
  ]
)
    