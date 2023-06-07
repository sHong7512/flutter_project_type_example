import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const channelName = 'moduleEx';
const methodChannel = MethodChannel(channelName);

void main() {
  runApp(
    MaterialApp(
      title: 'Flutter Module Test',
      routes: {
        '/custom1': (context) => const CustomPage1(title: 'Flutter Custom Module1'),
        '/custom2': (context) => const CustomPage2(title: 'Flutter Custom Module2'),
        '/custom3': (context) => const CustomPage3(title: 'Flutter Custom Module3'),
      },
    ),
  );
}

class CustomPage1 extends StatefulWidget {
  const CustomPage1({super.key, required this.title});

  final String title;

  @override
  State<CustomPage1> createState() => _CustomPage1State();
}

class _CustomPage1State extends State<CustomPage1> {
  int _counter = 0;
  var _methodCallArguments = "null";

  @override
  void initState() {
    super.initState();
    print('sHong] <${widget.title}>initState');
    // 메소드 채널에서 호출되는 메소드의 핸들러를 설정
    methodChannel.setMethodCallHandler(methodHandler);
  }

  // 메소드 호출이 입력으로 들어오는 함수
  Future<dynamic> methodHandler(MethodCall methodCall) async {
    print('sHong] method :: ${methodCall.method} arguments :: ${methodCall.arguments}');
    if (methodCall.method == "ButtonOrder") {
      setState(() {
        _methodCallArguments = methodCall.arguments;
      });
      return "received flutter";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            SystemNavigator.pop();
          },
        ),
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(widget.title),
            Text(_methodCallArguments),
            Text('$_counter', style: Theme.of(context).textTheme.headline4),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _counter++;
          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CustomPage2 extends CustomPage1 {
  const CustomPage2({super.key, required super.title});
}

class CustomPage3 extends CustomPage1 {
  const CustomPage3({super.key, required super.title});
}
