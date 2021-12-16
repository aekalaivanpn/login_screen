import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:login_screen/homepage.dart';
import 'package:login_screen/loginpage.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StartingPage(),
    );
  }
}

class StartingPage extends StatefulWidget {
  const StartingPage({Key? key}) : super(key: key);

  @override
  _StartingPageState createState() => _StartingPageState();
}

class _StartingPageState extends State<StartingPage> {

  final logindata = GetStorage();

  @override
  void initState() {
    super.initState();

    logindata.writeIfNull('isLoggedIn', false);

    Future.delayed(Duration.zero, () async {
      checkifloggedin();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
  void checkifloggedin() {
    logindata.read('isLoggedIn')
        ? Get.offAll(HomePage())
        : Get.offAll(LoginPage());
  }

}
