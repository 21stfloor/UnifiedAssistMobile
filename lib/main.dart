import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'auth/firebase_auth/firebase_user_provider.dart';
import 'auth/firebase_auth/auth_util.dart';

import 'backend/firebase/firebase_config.dart';
import 'backend/schema/regions_detection.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/nav/nav.dart';
import 'package:http/http.dart' as http;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  await initFirebase();

  await FlutterFlowTheme.initialize();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = FlutterFlowTheme.themeMode;

  late Stream<BaseAuthUser> userStream;

  late AppStateNotifier _appStateNotifier;
  late GoRouter _router;

  final authUserSub = authenticatedUserStream.listen((_) {});

  @override
  void initState() {
    super.initState();

    _appStateNotifier = AppStateNotifier.instance;
    _router = createRouter(_appStateNotifier);
    userStream = unifiedAssistFirebaseUserStream()
      ..listen((user) => _appStateNotifier.update(user));
    jwtTokenStream.listen((_) {});
    Future.delayed(
      const Duration(milliseconds: 1000),
      () => _appStateNotifier.stopShowingSplashImage(),
    );
    postData();
  }

  Future<void> postData() async {
    // Define the URL for the POST request
    Uri url = Uri.parse('https://api.clarifai.com/v2/users/clarifai/apps/main/models/general-image-detection/versions/1580bb1932594c93b7e2e04456af7c6f/outputs');

    // Define the data you want to send in the POST request
    Map<String, dynamic> requestData = {
      'inputs': [
        {
          'data': {
            'image': {
              'url': 'https://samples.clarifai.com/metro-north.jpg',
            }
          }
        }
      ]
    };

    // Convert the requestData map to JSON format
    String jsonBody = jsonEncode(requestData);

    // Make the POST request
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json', // Set the content type to JSON
          'Authorization': 'Key f01cbd07244844b0ba4592502e2a494c'
        },
        body: jsonBody, // Pass the JSON body
      );

      // Check if the request was successful (status code 200)
      if (response.statusCode == 200) {
        // Parse the response JSON
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);

        // Access the 'outputs' array from the response
        List<dynamic> outputs = jsonResponse['outputs'];

        // Access the first item in the 'outputs' array
        Map<String, dynamic> output = outputs.isNotEmpty ? outputs[0] : null;

        // Access the 'data' object from the output
        Map<String, dynamic> data = output.containsKey('data') ? output['data'] : null;

        // Access the 'regions' array from the data
        List<dynamic> regions = data.containsKey("regions") ? data['regions'] : null;

        // Print the 'regions' array
        print('Regions: $regions');
        // Extract custom regions from the response body
        extractRegions(response.body).then((customRegions) {
          // Print the custom regions
          customRegions.forEach((region) {
            print('Name: ${region.name}');
            print('Bounding Box: ${region.boundingBox}');
          });
        });
      } else {
        // Request failed with an error code, handle the error
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      // An error occurred while making the request
      print('Error: $e');
    }
  }


  @override
  void dispose() {
    authUserSub.cancel();

    super.dispose();
  }

  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
        FlutterFlowTheme.saveThemeMode(mode);
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'UnifiedAssist',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en', '')],
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: false,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: false,
      ),
      themeMode: _themeMode,
      routerConfig: _router,
    );
  }
}
