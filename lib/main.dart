import 'package:flutter/material.dart';
import 'package:video_call/cam_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'NotoSans',
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Expanded(
                child: _Logo(onPressed: onPressed),
              ),
              const Expanded(child: _Image()),
              Expanded(child: _Button(onPressed: onPressedBtn)),
            ],
          ),
        ),
      ),
    );
  }

  onPressed() {
    print('Pressed');
  }

  onPressedBtn() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => const CamScreen()));
  }
}

class _Logo extends StatelessWidget {
  final VoidCallback onPressed;
  const _Logo({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      /// Center가 없으면, container가 expanded 의 모든 영역을 차지한다.
      child: Container(
        ///-------------------------
        ///꽉 채워짐
        // alignment: Alignment.center,
        ///-------------------------
        ///기울어짐
        transform: Matrix4.rotationZ(0.1),

        ///-------------------------
        ///기울어짐
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              blurRadius: 15,
              offset: const Offset(10, 10),
              color: Colors.black.withOpacity(0.3),
              // spreadRadius: 5,
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(
                Icons.video_camera_front_outlined,
                color: Colors.white,
                size: 40,
              ),
              SizedBox(
                width: 12,
              ),
              Text(
                'Video Chat',
                style: TextStyle(
                    color: Colors.white, fontSize: 30, letterSpacing: 2),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _Image extends StatelessWidget {
  const _Image();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      // 'asset/img/video_call.png',
      'asset/img/live_chat.png',
      width: 200,
    );
  }
}

class _Button extends StatelessWidget {
  final VoidCallback onPressed;
  const _Button({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
            onPressed: onPressed,
            child: const Text(
              'Call',
              style: TextStyle(fontSize: 20),
            )),
      ],
    );
  }
}
