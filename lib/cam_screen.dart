import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class CamScreen extends StatefulWidget {
  const CamScreen({super.key});

  @override
  State<CamScreen> createState() => _CamScreenState();
}

class _CamScreenState extends State<CamScreen> {
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
          future: getPermission(),
          builder: (context, snapshot) {
            /// 에러가 발생하면 화면에 보여준다.
            if (snapshot.hasError) {
              print('Err-state: ${snapshot.connectionState}');
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            if (snapshot.hasData) {
              print('Data-state: ${snapshot.connectionState}');
              print('data: ${snapshot.data}');
              return Center(child: Text(snapshot.data.toString()));
            } else {
              print('NoData-state: ${snapshot.connectionState}');

              /// 로딩중일때
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return Column(children: const []);
          }),
    );
  }

  Future<bool> getPermission() async {
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
