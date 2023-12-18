import 'dart:convert';

import 'package:floor/floor.dart';
import 'package:ptts/features/domain/entities/pdf_file.dart';

@Entity(tableName: 'pdf_file', primaryKeys: ['path'])
class PdfFileModel extends PdfFileEntity {
  const PdfFileModel({
    required String name,
    required String path,
    int currentPage = 0,
    bool isChoosed = false,
  }) : super(name: name, path: path);

  factory PdfFileModel.fromMap(Map<String, dynamic> map) {
    return PdfFileModel(
      name: map['name'] ?? '',
      path: map['path'] ?? '',
      currentPage: map['currentPage']?.toInt() ?? 0,
      isChoosed: map['isChoosed'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory PdfFileModel.fromJson(String source) =>
      PdfFileModel.fromMap(json.decode(source));

  factory PdfFileModel.fromEntity(PdfFileEntity entity) {
    return PdfFileModel(
      name: entity.name,
      path: entity.path,
      currentPage: entity.currentPage,
      isChoosed: entity.isChoosed,
    );
  }
}
