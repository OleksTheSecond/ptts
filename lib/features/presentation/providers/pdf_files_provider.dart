import 'package:flutter/foundation.dart';
import 'package:ptts/core/resources/data_state.dart';
import 'package:ptts/features/domain/entities/pdf_file.dart';
import 'package:ptts/features/domain/usecases/get_pdf_file_db.dart';
import 'package:ptts/features/domain/usecases/get_pdf_file_dir.dart';
import 'package:ptts/features/domain/usecases/insert_pdf_file_db.dart';
import 'package:ptts/features/domain/usecases/remove_pdf_file_db.dart';

class PdfFilesProvider with ChangeNotifier {
  List<PdfFileEntity>? pdfFiles;

  final GetPdfFileUseCase _getPdfFileUseCase;
  final GetPdfFileFromDbUseCase _getPdfFileFromDbUseCase;
  final InsertPdfFileToDbUseCase _insertPdfFileToDbUseCase;
  final RemovePdfFileFromDbUseCase _removePdfFileFromDbUseCase;

  PdfFilesProvider(
    this._getPdfFileUseCase,
    this._getPdfFileFromDbUseCase,
    this._insertPdfFileToDbUseCase,
    this._removePdfFileFromDbUseCase,
  );

  Future<void> fetchPdfFilesFromDb() async {
    pdfFiles = await _getPdfFileFromDbUseCase();
    notifyListeners();
  }

  Future<void> fetchPdfFilesFromDirectory() async {
    final dataState = await _getPdfFileUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      pdfFiles = dataState.data;
    }
    notifyListeners();
  }

  Future<void> insertPdfFilesInDb() async {
    for (PdfFileEntity item in pdfFiles!) {
      await _insertPdfFileToDbUseCase(params: item);
    }
  }

  Future<void> removePdfFileFromDb(PdfFileEntity pdfFileEntity) async {
    await _removePdfFileFromDbUseCase(params: pdfFileEntity);
    pdfFiles!.remove(pdfFileEntity);
    notifyListeners();
  }
}
