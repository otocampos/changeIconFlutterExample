import 'package:dynamic_icon_flutter/dynamic_icon_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int batchIconNumber = 0;

  String currentIconName = "?";

  bool loading = false;

  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    super.initState();
      setState(() {

      });

  }


  @override
  Widget build(BuildContext context) {
    const List<String> list = ["icon_1","icon_2","icon_3","MainActivity"];

    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: const Text('Dynamic App Icon'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 28),
          child: ListView(
            children: <Widget>[

              OutlineButton.icon(
                icon: const Icon(Icons.soup_kitchen),
                label: const Text("Culinária"),
                onPressed: () async {
                  try {
                    //print(await DynamicIconFlutter.supportsAlternateIcons);
                    DynamicIconFlutter.setIcon(icon: "icon_1", listAvailableIcon: list);
                  } on PlatformException catch (e) {
                    // ignore: avoid_print
                    print(e.toString());
                    _scaffoldKey.currentState?.hideCurrentSnackBar();
                    _scaffoldKey.currentState?.showSnackBar(const SnackBar(
                      content: Text("Failed to change app icon"),
                    ));
                  }
                },
              ), OutlineButton.icon(
                icon: const Icon(Icons.chair),
                label: const Text("Beleza"),
                onPressed: () async {
                  try {
                    //print(await DynamicIconFlutter.supportsAlternateIcons);
                    DynamicIconFlutter.setIcon(icon: "icon_2", listAvailableIcon: list);
                  } on PlatformException catch (e) {
                    // ignore: avoid_print
                    print(e.toString());
                    _scaffoldKey.currentState?.hideCurrentSnackBar();
                    _scaffoldKey.currentState?.showSnackBar(const SnackBar(
                      content: Text("Failed to change app icon"),
                    ));
                  }
                },
              ), OutlineButton.icon(
                icon: const Icon(Icons.people),
                label: const Text("Fofocas"),
                onPressed: () async {
                  try {
                    //print(await DynamicIconFlutter.supportsAlternateIcons);
                    DynamicIconFlutter.setIcon(icon: "icon_3", listAvailableIcon: list);
                  } on PlatformException catch (e) {
                    // ignore: avoid_print
                    print(e.toString());
                    _scaffoldKey.currentState?.hideCurrentSnackBar();
                    _scaffoldKey.currentState?.showSnackBar(const SnackBar(
                      content: Text("Failed to change app icon"),
                    ));
                  }
                },
              ),

              const SizedBox(
                height: 28,
              ),
              OutlineButton.icon(
                icon: const Icon(Icons.restore_outlined),
                label: const Text("Restore Icon"),
                onPressed: () async {
                  try {
                    DynamicIconFlutter.setIcon(icon: "MainActivity", listAvailableIcon: list);
                  } on PlatformException catch (e) {
                    _scaffoldKey.currentState?.hideCurrentSnackBar();
                    _scaffoldKey.currentState?.showSnackBar(const SnackBar(
                      content: Text("Failed to change app icon"),
                    ));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}