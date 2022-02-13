import 'package:hive/hive.dart';
part 'download_item.g.dart';

@HiveType(typeId: 1)
class DownloadItem {
  @HiveField(0)
  late String filepath;
  @HiveField(1)
  late String url;
  @HiveField(2)
  late String filename;
  @HiveField(3)
  late double progress;
  // @HiveField(4)
  // late String status; // Status:Not Started, Downloaded, Downloading
  // @HiveField(5)
  // late Float fileSize;
  // @HiveField(6)
  // late Float downloadedSize;

  DownloadItem(
      {required this.url,
      required this.filepath,
      required this.filename,
      required this.progress});
}


// https://cdn.mos.musicradar.com/audio/samples/musicradar-8-bit-bonanza-samples.zip
// time_started,
// time_end,
// Duration
