import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sch_mgt_system/views/auth/login.dart';
import 'package:sch_mgt_system/views/home/res_layout.dart';
import 'package:sch_mgt_system/views/home/desktop.dart';
import 'package:sch_mgt_system/views/home/mobile.dart';
import 'package:sch_mgt_system/views/home/tablet.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hostel Management System',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: ResponsiveLayout(
      //   mobile: MobileView(),
      //   tablet: TabletView(),
      //   desktop: DeskTopView(),
      //   smallMobile: MobileView(),
      // ),
      home: LoginView(),
    );
  }
}
