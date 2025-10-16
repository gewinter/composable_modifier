import 'package:example/modifier_class.dart';
import 'package:flutter/material.dart';
import 'package:composable_modifier/composable_modifier.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: ModifierScope<ModifierClass>(
        scopeDefinition: (ModifierClass value) => switch (value) {
          Message(:final message) => (mod) => mod.tappable(
            () => print(message),
          ),
          Red() => (mod) => mod.colored(Colors.red),
        },
        child: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
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

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Modified<ModifierClass>(
          classes: [Message('Tap on Title')],
          child: Text(widget.title),
        ),
      ),
      body: Modified(
        modBuilder: (mod) => mod.centered(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: Modified<ModifierClass>(
        classes: [Message('Test Message')],
        modBuilder: (mod) => mod
            .square(40)
            .decorated(
              BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
            )
            .tappable(_incrementCounter),
        child: const Icon(Icons.add),
      ),
    );
  }
}
