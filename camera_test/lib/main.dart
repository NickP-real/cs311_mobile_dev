import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras.first;
  runApp(MaterialApp(home: TakePicutureScreen(camera: firstCamera)));
}

class TakePicutureScreen extends StatefulWidget {
  const TakePicutureScreen({required this.camera, super.key});

  final CameraDescription camera;

  @override
  State<TakePicutureScreen> createState() => _TakePicutureScreenState();
}

class _TakePicutureScreenState extends State<TakePicutureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    _controller = CameraController(widget.camera, ResolutionPreset.medium);
    _initializeControllerFuture = _controller.initialize();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              body: SafeArea(child: CameraPreview(_controller)),
              floatingActionButton: FloatingActionButton(
                onPressed: () async {
                  try {
                    final image = await _controller.takePicture();
                    await Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Scaffold(
                            body: SafeArea(
                                child: Image.file(File(image.path))))));
                  } catch (e) {
                    print(e);
                  }
                },
                child: const Icon(Icons.camera_alt),
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
