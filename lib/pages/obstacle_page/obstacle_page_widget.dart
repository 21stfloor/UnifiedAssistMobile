import '../../backend/schema/regions_detection.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'obstacle_page_model.dart';
export 'obstacle_page_model.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'dart:convert' as convert;


class ObstaclePageWidget extends StatefulWidget {
  const ObstaclePageWidget({super.key});

  @override
  State<ObstaclePageWidget> createState() => _ObstaclePageWidgetState();
}

class _ObstaclePageWidgetState extends State<ObstaclePageWidget> {
  late ObstaclePageModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late CameraController controller;
  late List<CameraDescription> _cameras;
  CameraImage? _image;

  late String base64Captured;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ObstaclePageModel());

    initializeCamera();
  }

  Future<void> initializeCamera() async {
    _cameras = await availableCameras();

    controller = CameraController(_cameras[0], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      controller.startImageStream((image) {
        _image = image;
        setState(() { });
      });
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
          // Handle access errors here.
            break;
          default:
          // Handle other errors here.
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();

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
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Switch.adaptive(
                                value: _model.switchValue ??= true,
                                onChanged: (newValue) async {
                                  setState(
                                          () => _model.switchValue = newValue);
                                },
                                activeColor:
                                FlutterFlowTheme.of(context).primary,
                                activeTrackColor:
                                FlutterFlowTheme.of(context).accent4,
                                inactiveTrackColor:
                                FlutterFlowTheme.of(context).primaryText,
                                inactiveThumbColor:
                                FlutterFlowTheme.of(context).secondaryText,
                              ),
                            ],
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
            elevation: 2.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child:
              Stack(children: [

                controller.value.isInitialized == true?
                Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child:CameraPreview(controller)
                ): Container(),
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
                        Align(
                          alignment: const AlignmentDirectional(1.0, 1.0),
                          child: Padding(
                            padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                print('toggleScan pressed ...');
                                XFile photo = await controller.takePicture();
                                List<int> photoAsBytes = await photo.readAsBytes();
                                base64Captured = convert.base64Encode(photoAsBytes);
                                print(base64Captured);
                                // print(await cameraImageToBase64(_image!));
                                postData();
                              },
                              text: '',
                              icon: const Icon(
                                Icons.camera_alt,
                                size: 50.0,
                              ),
                              options: FFButtonOptions(
                                height: 65.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 0.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle:
                                FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Inter',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                                elevation: 3.0,
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(45.0),
                                  bottomRight: Radius.circular(45.0),
                                  topLeft: Radius.circular(45.0),
                                  topRight: Radius.circular(45.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
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
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.remove_red_eye,
                                color: FlutterFlowTheme.of(context).alternate,
                                size: 24.0,
                              ),
                              Text(
                                'VIEW',
                                style:
                                FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Inter',
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ].divide(const SizedBox(height: 20.0)),
                    ),
                  ),
                )
              ],),


        ),
      ),
    );
  }

  // Future<String> cameraImageToBase64(CameraImage image) async {
  //   try {
  //     // Convert the image planes to a single plane Uint8List
  //     Uint8List bytes = concatenatePlanes(image.planes);
  //
  //     // Encode the bytes to base64
  //     base64Captured = base64Encode(bytes);
  //     print(base64Captured);
  //     return base64Captured;
  //   } catch (e) {
  //     print("Error converting camera image to base64: $e");
  //     return "";
  //   }
  // }

  Future<void> postData() async {
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
      }
    } catch (e) {
      // An error occurred while making the request
      print('Error: $e');
    }
  }
}
