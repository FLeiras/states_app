import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:states_app/pages/pages.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: '/page1',
      getPages: [
        GetPage(name: '/page1', page: () => const Page1Page()),
        GetPage(name: '/page2', page: () => const Page2Page()),
      ],
      // routes: {
      //   'page1': (_) => const Page1Page(),
      //   'page2': (_) => const Page2Page(),
      // },
    );
  }
}
