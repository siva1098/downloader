import 'package:flutter/material.dart';

class AddDownload extends StatefulWidget {
  const AddDownload({Key? key}) : super(key: key);

  @override
  _AddDownloadState createState() => _AddDownloadState();
}

class _AddDownloadState extends State<AddDownload> {
  TextEditingController controller = TextEditingController();
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
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    // labelText: 'Add URL',
                    hintText: 'Add URL',
                  ),
                  controller: controller,
                ),
              ),
              const ElevatedButton(
                onPressed: null,
                child: Text('ADD'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
