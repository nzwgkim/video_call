import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class CamScreen extends StatelessWidget {
  const CamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Live...',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
      body: FutureBuilder<bool>(
          future: init(),
          builder: (context, snapshot) {
            /// 에러가 발생하면 화면에 보여준다.
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            if (snapshot.hasData) {
            } else {
              /// 로딩중일때
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return Column(children: const []);
          }),
    );
  }

  Future<bool> init() async {
    final response = await [Permission.camera, Permission.microphone].request();

    final cameraPermission = response[Permission.camera];
    final microphonePermission = response[Permission.microphone];

    if (cameraPermission != PermissionStatus.granted ||
        microphonePermission != PermissionStatus.granted) {
      throw 'No privilege for camera or microphone';
    }
    return true;
  }
}
