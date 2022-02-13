import 'package:downloader/download_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

class AddDownload extends StatefulWidget {
  const AddDownload({Key? key}) : super(key: key);

  @override
  _AddDownloadState createState() => _AddDownloadState();
}

class _AddDownloadState extends State<AddDownload> {
  late final Box box;

  @override
  void initState() {
    super.initState();
    box = Hive.box('downloadBox');
  }

  TextEditingController urlController = TextEditingController();
  String url = '';
  String resp = '';

  _addDownload() async {
    DownloadItem newDownload = DownloadItem(
        url: urlController.text,
        filepath: 'Downloads',
        filename: urlController.text.split('/').last,
        progress: 0.0);
    box.add(newDownload);
    print('Info added to box!');
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Download'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(top: 100.0, right: 10.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  style: GoogleFonts.sourceCodePro(
                      fontSize: 20.0, fontWeight: FontWeight.w500),
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: 'Add URL',
                  ),
                  controller: urlController,
                ),
              ),
              ElevatedButton(
                onPressed: _addDownload,
                child: const Text('ADD'),
              ),
              Text(resp),
            ],
          ),
        ),
      ),
    );
  }
}
