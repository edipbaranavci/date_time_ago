import 'package:date_time_ago/date_time_ago.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math show Random;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final String appTitle = 'Date Time Ago Package';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String generateButtonTitle = 'Generate';
  final String pageTitle = 'Calculate Date Time Ago';
  // import package class
  final dateTimeAgo = DateTimeAgo();
  int randomValue = 2;
  late DateTime dateTime;
  String resultTR = '';
  String resultEn = '';

  @override
  void initState() {
    setResults();
    super.initState();
  }

  void setResults() {
    dateTime = DateTime.now().subtract(Duration(days: randomValue));
    resultTR = dateTimeAgo.toCalculate(
      dateTime,
      locale: DateTimeAgoLocalesEnums.turkish,
    );
    resultEn = dateTimeAgo.toCalculate(
      dateTime,
      locale: DateTimeAgoLocalesEnums.english,
    );
  }

  void randomValueGenerated() {
    randomValue = math.Random().nextInt(100);
    setResults();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pageTitle)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Turkish: $resultTR',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              'English: $resultEn',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            ElevatedButton(
              onPressed: randomValueGenerated,
              child: Text(generateButtonTitle),
            ),
          ],
        ),
      ),
    );
  }
}
