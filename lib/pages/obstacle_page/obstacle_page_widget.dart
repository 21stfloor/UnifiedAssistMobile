import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:just_audio/just_audio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../backend/schema/regions_detection.dart';
import '../base.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'camera_controller.dart';
import 'camera_preview.dart';
import 'obstacle_page_model.dart';
export 'obstacle_page_model.dart';
import 'dart:convert';
import 'dart:convert' as convert;
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:camera_platform_interface/camera_platform_interface.dart';

class ObstaclePageWidget extends BasePage {
  const ObstaclePageWidget({super.key});

  @override
  State<ObstaclePageWidget> createState() => _ObstaclePageWidgetState();
}

class _ObstaclePageWidgetState extends BasePageState<ObstaclePageWidget> {
  late ObstaclePageModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  CameraController? controller;
  List<CameraDescription> _cameras = <CameraDescription>[];
  bool isLoading = false;

  late String base64Captured;
  final Iterable<Duration> pauses = [
    const Duration(milliseconds: 500),
    const Duration(milliseconds: 1000),
    const Duration(milliseconds: 500),
  ];

  bool showCamera = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ObstaclePageModel());

    initializeCamera();
  }

  Future<void> initializeCamera() async {
    _cameras = await availableCameras();

    onNewCameraSelected(_cameras[0]);
  }

  // #docregion AppLifecycle
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final CameraController? cameraController = controller;

    // App state changed before we got the chance to initialize.
    if (cameraController == null || !cameraController.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      onNewCameraSelected(cameraController.description);
    }
  }

  @override
  void dispose() {
    _model.dispose();
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(90.0),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primary,
            automaticallyImplyLeading: false,
            actions: const [],
            flexibleSpace: FlexibleSpaceBar(
              title: Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      FlutterFlowTheme.of(context).primary,
                      FlutterFlowTheme.of(context).secondary
                    ],
                    stops: const [0.0, 1.0],
                    begin: const AlignmentDirectional(-1.0, 0.0),
                    end: const AlignmentDirectional(1.0, 0),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                      const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30.0,
                            borderWidth: 1.0,
                            buttonSize: 50.0,
                            icon: const Icon(
                              Icons.arrow_back_rounded,
                              color: Colors.white,
                              size: 30.0,
                            ),
                            onPressed: () async {
                              context.pop();
                            },
                          ),
                          Flexible(
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'OBSTACLES',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                    fontFamily: 'Montserrat',
                                    color: Colors.white,
                                    fontSize: 24.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              centerTitle: true,
              expandedTitleScale: 1.0,
            ),
            toolbarHeight: 70.0,
            elevation: 2.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child:
          Stack(children: [
              _cameraPreviewWidget(),
          Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(0, 0, 0, 0),
                  ),
                  child: Align(
                    alignment: const AlignmentDirectional(-1.0, -1.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: ()
                    async {
                      if(isLoading){
                        return;
                      }
                      print('toggleScan pressed ...');
                      setState(() {
                        isLoading = true;
                      });
                      XFile photo = await controller!.takePicture();
                      List<int> photoAsBytes = await photo.readAsBytes();
                      base64Captured = convert.base64Encode(photoAsBytes);
                      print(base64Captured);
                      // print(await cameraImageToBase64(_image!));
                      // postData();
                      try {
                        var result = await _postData();
                        print(result!.predictions.toString());
                        if(result.predictions.isNotEmpty) {
                          Vibrate.vibrateWithPauses(pauses);
                        }
                      }
                      catch (error){
                        Fluttertoast.showToast(
                            msg: error.toString());
                      }

                      setState(() {
                        isLoading = false;
                      });
                    },
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 0.1,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            FlutterFlowTheme.of(context).primary,
                            FlutterFlowTheme.of(context).secondary
                          ],
                          stops: const [0.0, 1.0],
                          begin: const AlignmentDirectional(-1.0, 0.0),
                          end: const AlignmentDirectional(1.0, 0),
                        ),
                      ),
                      child: Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 10.0, 0.0),
                          child:
                          isLoading? Container():
                          Icon(
                            Icons.camera_alt,
                            color: FlutterFlowTheme.of(context).primaryBackground,
                            size: 50,
                          ),
                          ),
                        ),
                          ),
                        ),
                      ].divide(const SizedBox(height: 20.0)),
                    ),
                  ),
        ),
          ]
      ),
    )));
  }

  Widget _cameraPreviewWidget() {
    final CameraController? cameraController = controller;

    if (cameraController == null || !cameraController.value.isInitialized || cameraController.value.isPreviewPaused) {
      return Container(
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
      );
    } else {
      return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
        height: MediaQuery.sizeOf(context).height * 1.0,
        decoration: const BoxDecoration(
        color: Colors.black,
      ),
      child:
       CameraPreview(controller!)
      );
    }
  }

  Future<PostResponse?> _postData() async {

    final response = await http.post(
      Uri.parse('https://detect.roboflow.com/od-cte7x/2?api_key=Fm5i5qj5uNmV7UzI1UPS&confidence=0.5'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: base64Captured,
    );

    if (response.statusCode == 200) {
      return PostResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load post response');
    }
  }


  Future<String?> postData() async {
    // Define the URL for the POST request
    Uri url = Uri.parse('https://api.clarifai.com/v2/users/clarifai/apps/main/models/general-image-detection/versions/1580bb1932594c93b7e2e04456af7c6f/outputs');

    // Define the data you want to send in the POST request
    Map<String, dynamic> requestData = {
      'inputs': [
        {
          'data': {
            'image': {
              'base64': base64Captured,
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
          List<String> allTextDetected = [];
          // Print the custom regions
          customRegions.forEach((region) {
            if(!allTextDetected.contains(region.name)) {
              allTextDetected.add(region.name);
              print('Name: ${region.name}');
              print('Bounding Box: ${region.boundingBox}');
            }
          });

        });
      } else {
        // Request failed with an error code, handle the error
        print('Error: ${response.statusCode}');
        Fluttertoast.showToast(
            msg: response.body);
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString());
      print('Error: $e');
    }
  }



  Future<void> onNewCameraSelected(CameraDescription cameraDescription) async {
    final CameraController? oldController = controller;
    if (oldController != null) {
      // `controller` needs to be set to null before getting disposed,
      // to avoid a race condition when we use the controller that is being
      // disposed. This happens when camera permission dialog shows up,
      // which triggers `didChangeAppLifecycleState`, which disposes and
      // re-creates the controller.
      controller = null;
      await oldController.dispose();
    }

    final CameraController cameraController = CameraController(
      cameraDescription,
      mediaSettings: const MediaSettings(
        resolutionPreset: ResolutionPreset.low,
        fps: 15,
        videoBitrate: 200000,
        audioBitrate: 32000,
      ),
      imageFormatGroup: ImageFormatGroup.jpeg,
    );

    controller = cameraController;

    // If the controller is updated then update the UI.
    cameraController.addListener(() {
      if (mounted) {
        setState(() {});
      }
      if (cameraController.value.hasError) {
        Fluttertoast.showToast(msg:
            'Camera error ${cameraController.value.errorDescription}');
      }
    });

    try {
      await cameraController.initialize();
    } on CameraException catch (e) {
      switch (e.code) {
        case 'CameraAccessDenied':
          Fluttertoast.showToast(msg:'You have denied camera access.');
        case 'CameraAccessDeniedWithoutPrompt':
        // iOS only
          Fluttertoast.showToast(msg:'Please go to Settings app to enable camera access.');
        case 'CameraAccessRestricted':
        // iOS only
          Fluttertoast.showToast(msg:'Camera access is restricted.');
        case 'AudioAccessDenied':
          Fluttertoast.showToast(msg:'You have denied audio access.');
        case 'AudioAccessDeniedWithoutPrompt':
        // iOS only
          Fluttertoast.showToast(msg:'Please go to Settings app to enable audio access.');
        case 'AudioAccessRestricted':
        // iOS only
          Fluttertoast.showToast(msg:'Audio access is restricted.');
        default:
            Fluttertoast.showToast(msg: '${e.description}');
          break;
      }
    }

    if (mounted) {
      setState(() {});
    }
  }

  Future<void> onPausePreviewButtonPressed() async {
    final CameraController? cameraController = controller;

    if (cameraController == null || !cameraController.value.isInitialized) {
      Fluttertoast.showToast(msg: 'Error: select a camera first.');
      return;
    }

    if (cameraController.value.isPreviewPaused) {
      await cameraController.resumePreview();
    } else {
      await cameraController.pausePreview();
    }

    if (mounted) {
      setState(() {});
    }
  }
}




class PostResponse {
  final double time;
  final Map<String, dynamic> image;
  final List<dynamic> predictions;

  PostResponse({required this.time, required this.image, required this.predictions});

  factory PostResponse.fromJson(Map<String, dynamic> json) {
    return PostResponse(
      time: json['time'],
      image: json['image'],
      predictions: json['predictions'],
    );
  }
}

