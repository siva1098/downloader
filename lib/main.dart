import 'dart:io';

import 'package:downloader/add_download.dart';
import 'package:flowder/flowder.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'download_item.dart';

Future<void> main() async {
  // Initialize hive
  await Hive.initFlutter();
  // Registering the adapter
  Hive.registerAdapter(DownloadItemAdapter());
  // Opening the box
  await Hive.openBox('downloadBox');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Downloader',
      theme: ThemeData(
        // brightness: Brightness.light,
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
      //const MyHomePage(title: 'Simple Downloader'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  // final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final Box downloadBox;
  late DownloaderUtils options;
  late DownloaderCore core;
  late final String path;
  // Delete info from people box
  _deleteDownload(int index) {
    downloadBox.deleteAt(index);
    print('Item deleted from box at index: $index');
  }

  void _setPath() async {
    Directory _path = await getApplicationDocumentsDirectory();

    String _localPath = _path.path + Platform.pathSeparator + 'FDownload';

    final savedDir = Directory(_localPath);
    bool hasExisted = await savedDir.exists();
    if (!hasExisted) {
      savedDir.create();
    }

    path = _localPath;
  }

  Future<void> initPlatformState() async {
    _setPath();
    if (!mounted) return;
  }

  @override
  void initState() {
    super.initState();
    initPlatformState();
    // Get reference to an already opened box
    downloadBox = Hive.box('downloadBox');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Downloads'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const AddDownload(),
          ),
        ),
        child: const Icon(Icons.add),
      ),
      body: ValueListenableBuilder(
        valueListenable: downloadBox.listenable(),
        builder: (context, Box box, widget) {
          if (box.isEmpty) {
            return const Center(
              child: Text('Empty'),
            );
          } else {
            return ListView.builder(
              itemCount: box.length,
              itemBuilder: (context, index) {
                var currentBox = box;
                var downloadData = currentBox.getAt(index)!;
                return InkWell(
                  onTap: () => {}
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => UpdateScreen(
                  //       index: index,
                  //       person: personData,
                  //     ),
                  //   ),
                  // ),
                  ,
                  child: ListTile(
                    title: Text(downloadData.filename),
                    subtitle: Text(downloadData.filepath),
                    trailing: IconButton(
                      onPressed: () => _deleteDownload(index),
                      // _deleteInfo(index),
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  // final List<String> fruits = [
  //   "Apple",
  //   "Banana",
  //   "Pear",
  //   "Orange",
  //   "Apple",
  //   "Banana",
  //   "Pear",
  //   "Orange",
  //   "Apple",
  //   "Banana",
  //   "Pear"
  // ];
  // Widget _buildFruitItem(BuildContext context, int index) {
  //   return Card(
  //     shape: const StadiumBorder(),
  //     color: const Color.fromARGB(255, 200, 214, 207),
  //     child: ListTile(
  //       title: Text(
  //         fruits[index],
  //         style: GoogleFonts.quintessential(
  //             fontSize: 20.0, fontWeight: FontWeight.w500),
  //       ),
  //       subtitle: const Text("25 MB/25MB"),
  //       enableFeedback: true,
  //       leading: const Icon(
  //         Icons.file_download,
  //       ),
  //       trailing: const Icon(Icons.download_done),
  //       onTap: () => {},
  //     ),
  //   );
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text(widget.title),
  //     ),
  //     body: Container(
  //       padding: const EdgeInsets.all(5),
  //       child: ListView.builder(
  //         itemBuilder: _buildFruitItem,
  //         itemCount: fruits.length,
  //       ),
  //     ),
  //     floatingActionButton: FloatingActionButton(
  //       onPressed: () {
  //         Navigator.push(
  //           context,
  //           MaterialPageRoute(builder: (context) => const AddDownload()),
  //         );
  //       },
  //       tooltip: "Add URL",
  //       child: const Icon(Icons.add),
  //     ),
  //   );
  // }
}
