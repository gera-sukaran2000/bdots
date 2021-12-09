import 'package:bdots/provider/data.dart';
import 'package:bdots/screens/mainUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      builder: () => ChangeNotifierProvider(
        create: (BuildContext context) => UserDataList(),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(fontFamily: 'Inter'),
          home: MainUi(),
        ),
      ),
    );
  }
}
