import 'package:floor/floor.dart';
import 'package:ptts/features/data/data_sources/local_database/DAO/pdf_file_dao.dart';
import 'package:ptts/features/data/models/pdf_file.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';
part 'app_database.g.dart';

@Database(version: 1, entities: [PdfFileModel])
abstract class AppDatabase extends FloorDatabase {
  PdfFileDao get pdfFileDao;
}
