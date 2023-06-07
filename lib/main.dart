import 'package:flutter/material.dart';
import 'package:package_ex/package_ex.dart';
import 'package:plugin_ex/plugin_ex.dart';

void main() {
  runApp(const MaterialApp(home: HomePage(title: "Project Type Example")));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final num _x = 4;
  final num _y = 2;
  num? _result;
  String _exKind = '';

  late final PackageEx _packageEx;
  late final PluginEx _pluginEx;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _packageEx = PackageEx();
    _pluginEx = PluginEx();
  }

  @override
  Widget build(BuildContext context) {
    List<Foo> l =[];
    l.add(Foo<PackageEx>(PackageEx()));

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_exKind),
            Text('<x = $_x, y = $_y> => $_result'),
            ElevatedButton(
              onPressed: () {
                _exKind = "${_packageEx.name} >> plus";
                _result = _packageEx.calculator.plus(_x, _y);
                setState(() {});
              },
              child: Text(PackageEx().name),
            ),
            ElevatedButton(
              onPressed: () async {
                _exKind = "${_pluginEx.name} >> minus";
                _result = await _pluginEx.minus(_x, _y);
                setState(() {});
              },
              child: Text(_pluginEx.name),
            ),
          ],
        ),
      ),
    );
  }
}

class Foo<T>{
  Foo(this.cls);

  final T cls;
}
