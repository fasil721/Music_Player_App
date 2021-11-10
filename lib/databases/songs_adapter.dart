import 'package:hive/hive.dart';

part 'songs_adapter.g.dart';

@HiveType(typeId: 1)
class Songs extends HiveObject {
  @HiveField(0)
  dynamic title;
  @HiveField(1)
  dynamic artist;
  @HiveField(2)
  dynamic uri;
  @HiveField(3)
  dynamic id;

  Songs({
    required this.title,
    required this.artist,
    required this.uri,
    required this.id,
  });
}
