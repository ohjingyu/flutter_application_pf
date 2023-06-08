import 'package:flutter/material.dart';
import 'kobis_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({
    super.key,
  });

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  dynamic mvlist = Text("결과를 입력하시오");

  void showCal() async {
    var dt = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2025));
    String toDate = dt.toString().split(' ')[0].replaceAll('-', '');
    var kobisApi = KobisApi();
    var movies = await kobisApi.getMovie(toDate: toDate);
    setState(() {
      if (movies.isEmpty) {
        mvlist = Center(
          child: Text('결과없음'),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showCal,
        child: Icon(Icons.calendar_month),
      ),
    );
  }
}
