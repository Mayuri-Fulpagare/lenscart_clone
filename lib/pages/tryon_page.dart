//import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class TryOnPage extends StatefulWidget {
  const TryOnPage({Key? key}) : super(key: key);

  @override
  State<TryOnPage> createState() => _TryOnPageState();
}

class _TryOnPageState extends State<TryOnPage> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    initCamera();
  }

  Future<void> initCamera() async {
    final cameras = await availableCameras();
    final frontCamera = cameras.firstWhere((camera) => camera.lensDirection == CameraLensDirection.front);
    _controller = CameraController(frontCamera, ResolutionPreset.medium);
    _initializeControllerFuture = _controller.initialize();
    setState(() {}); // Rebuild to show camera
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              alignment: Alignment.center,
              children: [
                CameraPreview(_controller),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.3,
                  child: Image.asset('lib/assets/images/sunglasses/sunglass1.png',
                    width: 180,
                    height: 80,
                  ),
                ),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
