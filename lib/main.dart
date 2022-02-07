import 'package:downloader/add_download.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // brightness: Brightness.light,
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Simple Downloader'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> fruits = [
    "Apple",
    "Banana",
    "Pear",
    "Orange",
    "Apple",
    "Banana",
    "Pear",
    "Orange",
    "Apple",
    "Banana",
    "Pear",
    "Orange",
    "Apple",
    "Banana",
    "Pear",
    "Orange",
    "Apple",
    "Banana",
    "Pear",
    "Orange",
    "Apple",
    "Banana",
    "Pear",
    "Orange",
    "Apple",
    "Banana",
    "Pear",
    "Orange",
    "Apple",
    "Banana",
    "Pear",
    "Orange",
    "Apple",
    "Banana",
    "Pear",
    "Orange",
    "Apple",
    "Banana",
    "Pear",
    "Orange",
    "Apple",
    "Banana",
    "Pear",
    "Orange",
    "Apple",
    "Banana",
    "Kiwi"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: const EdgeInsets.all(5),
        child: ListView.builder(
          itemBuilder: _buildFruitItem,
          itemCount: fruits.length,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddDownload()),
          );
        },
        tooltip: "Add URL",
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildFruitItem(BuildContext context, int index) {
    return Card(
      child: ListTile(
        title: Text(fruits[index]),
        subtitle: const Text("25 MB/25MB"),
        enableFeedback: true,
        leading: const Icon(
          Icons.file_download,
        ),
        trailing: const Icon(Icons.download_done),
        onTap: () => {},
      ),
      // Text(
      //   fruits[index],
      //   textAlign: TextAlign.center,
      //   style: const TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
      // ),
    );
  }
}
