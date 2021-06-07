import 'dart:typed_data';

import 'package:archive/archive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:memorypath_db_api/memorypath_db_api.dart';

part 'MemoryPathFile.g.dart';

@JsonSerializable()
class MemoryPathFile {
  //UInt8List previewImage;
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
    //TODO: Implement Constructor from MemoryPaths
  }*/

  static MemoryPathFile? decode(Uint8List rawData) {
    GZipDecoder gZipDecoder = GZipDecoder();
    TarDecoder tarDecoder = TarDecoder();
    try {
      List<int> decompressedData = gZipDecoder.decodeBytes(rawData);
      Archive archive = tarDecoder.decodeBytes(decompressedData);
      ArchiveFile index = archive.first;
      Map<String, dynamic> json = index.content;
      Map<String, Uint8List> imageData = Map();
      for (int i = 1; i < archive.length; i++) {
        imageData.putIfAbsent(
            archive.elementAt(i).name, () => archive.elementAt(i).content);
      }
      //saveImages(imageData);
      MemoryPathFile decoded = MemoryPathFile.fromJson(json);
      decoded.imageData = imageData;
      return decoded;
    } catch (e) {
      throw DatabaseError("File could not be decomposed", e);
    }
  }

  /// encode [MemoryPathDb] to a compressed custom FileFormat for storing and sharing purposes
  Uint8List encode() {
    final TarEncoder tarEncoder = TarEncoder();
    Archive archive = Archive();
    //creating ArchiveFiles and add them to Archive
    final Map<String, dynamic> json = this.toJson();
    final ArchiveFile index = ArchiveFile('index.json', json.length, json);
    archive.addFile(index);
    if (imageData!.isNotEmpty) {
      imageData!.forEach((String key, Uint8List value) {
        final ArchiveFile image =
            ArchiveFile('assets/' + key, value.length, value);
        archive.addFile(image);
      });
    }
    tarEncoder.encode(archive);
    final GZipEncoder gZipEncoder = GZipEncoder();
    return Uint8List.fromList(gZipEncoder.encode(tarEncoder)!);
  }

  Future<void>? saveImages(Map<String, Uint8List> imageData) {
    //TODO: Implement saveImages-Method
    //Datei mit gleichem Namen in Internal Storage? Prüfsummenalgorithmus über Uint8List des Images : null
    //save Images
  }

  factory MemoryPathFile.fromJson(Map<String, dynamic> json) =>
      _$MemoryPathFileFromJson(json);
  Map<String, dynamic> toJson() => _$MemoryPathFileToJson(this);
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

  factory MemoryPathFileMetadata.fromJson(Map<String, dynamic> json) =>
      _$MemoryPathFileMetadataFromJson(json);
  Map<String, dynamic> toJson() => _$MemoryPathFileMetadataToJson(this);
}
