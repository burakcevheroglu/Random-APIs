import 'package:apiapp/model1/appbody.dart';
import 'package:apiapp/model2/secondbody.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API REQUESTS',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Screen'),
      ),
      body: Center(
        child: SizedBox(
          height: 100,
          child: Column(
            children: [
              FilledButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const AppBody()));
              }, child: const Text('GO TO API 1')),
              FilledButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SecondBody()));
              }, child: const Text('GO TO API 2')),
            ],
          ),
        ),
      ),
    );
  }
}
