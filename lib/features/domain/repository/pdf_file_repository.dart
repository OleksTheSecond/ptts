import 'package:ptts/core/resources/data_state.dart';
import 'package:ptts/features/domain/entities/pdf_file.dart';

abstract class PdfFileRepository {
  Future<DataState<List<PdfFileEntity>>> getPdfFilesFromDirectories();

  Future<List<PdfFileEntity>> getPdfFilesFromDb();

  Future<void> insertPdfFileToDb(PdfFileEntity pdfFile);

  Future<void> removePdfFileFromDb(PdfFileEntity pdfFile);
}
