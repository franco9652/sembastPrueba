import 'package:flutter/material.dart';
import 'package:nosql_sembast_bd/db/app_theme.dart';
import 'package:nosql_sembast_bd/db/db.dart';
import 'package:nosql_sembast_bd/screens/home_page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DB.instance.init();
  await MyAppTheme.instance.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    DB.instance.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: MyAppTheme.instance,
      child: Consumer<MyAppTheme>(builder: (_, myAppTheme, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: MyAppTheme.instance.darkEnabled
              ? ThemeData.dark()
              : ThemeData.light(),
          home: HomePage(),
        );
      }),
    );
  }
}
