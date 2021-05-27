import 'dart:typed_data';

import 'package:json_annotation/json_annotation.dart';
import 'package:memorypath_db_api/memorypath_db_api.dart';

part 'MemoryPathFile.g.dart';

@JsonSerializable()
class MemoryPathFile {
  MemoryPathFileMetadata metadata;
  List<MemoryPathDb> memoryPathData;
  @JsonKey(ignore: true)
  Map<String, Uint8List>? imageData;

  MemoryPathFile({
    required this.metadata,
    required this.memoryPathData,
    this.imageData,
  });

  /*MemoryPathFile.fromMemoryPaths(
      MemoryPathFileMetadata metadata, List<MemoryPathDb> memoryPaths) {
    //TODO!
  }*/

  //UInt8List previewImage;

  static Future<MemoryPathFile>? decode(Uint8List rawData) {
    //Decode: ZipDecoder.decodeBytes()
    //read index.json -> MemoryPathFile.fromJson
    //Datei mit gleichem Namen in Internal Storage? Prüfsummenalgorithmus über Uint8List des Images : null
    //save Images
  }

  /// encode [MemoryPathDb] to a compressed custom FileFormat for storing and sharing purposes
/*  Uint8List encode() {
    final Map<String, dynamic> json = <String, dynamic>{}; //toJson();
    //Archive archive = Archive();
    final TarEncoder tarEncoder = TarEncoder();
    final ArchiveFile index = ArchiveFile('index.json', json.length, json);
    tarEncoder.add(index);
    imageData!.forEach((String key, Uint8List value) {
      final ArchiveFile image =
          ArchiveFile('assets/' + key, value.length, value);
      tarEncoder.add(image);
    });
    final GZipEncoder gZipEncoder = GZipEncoder();
    return Uint8List.fromList(gZipEncoder.encode(tarEncoder)!);

    //ArchiveFile assets = ArchiveFile('assets', size, memoryPathData.);
    //tar ImageFiles
    //encoder.create('$name.tar');
    //   encoder.addDirectory(Directory('assets'));
    //   ArchiveFile index = ArchiveFile(...)
    //   encoder.addFile(index);
    //   encoder.close();
    //Gzip encoder
  }*/

  /*factory MemoryPathFile.fromJson(Map<String, dynamic> json) =>
      _$MemoryPathFileFromJson(json);
  Map<String, dynamic> toJson() => _$MemoryPathFileToJson(this);*/
}

@JsonSerializable()
class MemoryPathFileMetadata {
  final String author;
  final int createTime;
  final int fileFormatVersion;

  MemoryPathFileMetadata({
    required this.author,
    required this.createTime,
    required this.fileFormatVersion,
  });
}
