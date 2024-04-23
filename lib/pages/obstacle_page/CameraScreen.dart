import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image/image.dart' as img;


class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // Initialize the camera
    _initializeControllerFuture = _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;
    _controller = CameraController(firstCamera, ResolutionPreset.medium);
    return _controller.initialize();
  }

  Future<String> _captureAndConvertToBase64() async {
    try {
      // Ensure that the camera is initialized
      await _initializeControllerFuture;

      // Capture a frame
      final XFile imageFile = await _controller.takePicture();

      // Convert the captured frame to a base64 string
      final img.Image capturedImage = img.decodeImage(await imageFile.readAsBytes())!;
      final img.Image resizedImage = img.copyResize(capturedImage, width: 400);
      final List<int> resizedBytes = img.encodePng(resizedImage);
      return base64Encode(Uint8List.fromList(resizedBytes));
    } catch (e) {
      print('Error capturing image: $e');
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Camera')),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the camera preview
            return Column(
              children: [
                Expanded(child: CameraPreview(_controller)),
                ElevatedButton(
                  onPressed: () async {
                    String base64String = await _captureAndConvertToBase64();
                    print('Base64 String: $base64String');
                  },
                  child: Text('Capture'),
                ),
              ],
            );
          } else {
            // Otherwise, display a loading indicator
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
