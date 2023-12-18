import 'package:floor/floor.dart';
import 'package:ptts/features/data/models/pdf_file.dart';

@dao
abstract class PdfFileDao {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertPdfFile(PdfFileModel pdfFile);

  @delete
  Future<void> deletePdfFile(PdfFileModel pdfFile);

  @Query('SELECT * FROM pdf_file')
  Future<List<PdfFileModel>> getPdfFiles();
}
