// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_article_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalArticleModelAdapter extends TypeAdapter<LocalArticleModel> {
  @override
  final int typeId = 0;

  @override
  LocalArticleModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalArticleModel(
      articleId: fields[0] as String,
      title: fields[1] as String,
      link: fields[2] as String?,
      keywords: (fields[3] as List?)?.cast<String>(),
      creator: (fields[4] as List?)?.cast<String>(),
      videoUrl: fields[5] as String?,
      description: fields[6] as String?,
      content: fields[7] as String?,
      pubDate: fields[8] as String?,
      imageUrl: fields[9] as String?,
      sourceId: fields[10] as String?,
      sourcePriority: fields[11] as int?,
      sourceUrl: fields[12] as String?,
      sourceIcon: fields[13] as String?,
      language: fields[14] as String?,
      country: (fields[15] as List?)?.cast<String>(),
      category: (fields[16] as List?)?.cast<String>(),
      aiTag: fields[17] as String?,
      sentiment: fields[18] as String?,
      sentimentStats: fields[19] as String?,
      aiRegion: fields[20] as String?,
      aiOrg: fields[21] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, LocalArticleModel obj) {
    writer
      ..writeByte(22)
      ..writeByte(0)
      ..write(obj.articleId)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.link)
      ..writeByte(3)
      ..write(obj.keywords)
      ..writeByte(4)
      ..write(obj.creator)
      ..writeByte(5)
      ..write(obj.videoUrl)
      ..writeByte(6)
      ..write(obj.description)
      ..writeByte(7)
      ..write(obj.content)
      ..writeByte(8)
      ..write(obj.pubDate)
      ..writeByte(9)
      ..write(obj.imageUrl)
      ..writeByte(10)
      ..write(obj.sourceId)
      ..writeByte(11)
      ..write(obj.sourcePriority)
      ..writeByte(12)
      ..write(obj.sourceUrl)
      ..writeByte(13)
      ..write(obj.sourceIcon)
      ..writeByte(14)
      ..write(obj.language)
      ..writeByte(15)
      ..write(obj.country)
      ..writeByte(16)
      ..write(obj.category)
      ..writeByte(17)
      ..write(obj.aiTag)
      ..writeByte(18)
      ..write(obj.sentiment)
      ..writeByte(19)
      ..write(obj.sentimentStats)
      ..writeByte(20)
      ..write(obj.aiRegion)
      ..writeByte(21)
      ..write(obj.aiOrg);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalArticleModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
