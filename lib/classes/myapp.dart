import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Pomme, Poire et Ananas'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final List<String> _list = [];

  String getTitle(int c) {
    if (isPrime(c)) {
      return "$c nombre premier";
    } else if (c % 2 != 0) {
      return "$c pair";
    }
    return "$c impair";
  }

  Image getImage(int c) {
    if (isPrime(c)) {
      return const Image(image: AssetImage('assets/images/ananas.png'));
    } else if (c % 2 != 0) {
      return const Image(image: AssetImage('assets/images/pomme.png'));
    }
    return const Image(image: AssetImage('assets/images/poire.png'));
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      _list.add("$_counter");
    });
  }

  bool isPrime(int number) {
    if (number <= 1) return false; // Prime number is > 1
    for (int i = 2; i < number; i++) {
      if (number % i == 0) return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(getTitle(_counter)),
      ),
      body: Center(
          child: ListView(
        children: _list.map((String value) {
          return ListTile(
            title: Text(value),
            leading: getImage(int.parse(value)),
            tileColor:
                (int.parse(value) % 2 != 0) ? Colors.indigo : Colors.cyan,
          );
        }).toList(),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
