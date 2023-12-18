import 'package:file_picker/file_picker.dart';
import 'package:ptts/core/resources/data_state.dart';
import 'package:ptts/features/data/data_sources/local_database/app_database.dart';
import 'package:ptts/features/data/models/pdf_file.dart';
import 'package:ptts/features/domain/entities/pdf_file.dart';
import 'package:ptts/features/domain/repository/pdf_file_repository.dart';

class PdfFileRepositoryImpl implements PdfFileRepository {
  final AppDatabase _appDatabase;

  PdfFileRepositoryImpl(this._appDatabase);

  @override
  Future<DataState<List<PdfFileModel>>> getPdfFilesFromDirectories() async {
    try {
      final FilePickerResult? filePickerResult = await FilePicker.platform
          .pickFiles(
              allowedExtensions: ['pdf'],
              type: FileType.custom,
              allowMultiple: true);

      if (filePickerResult == null) {
        return DataFailed(PdfErrors(errror: "File Picker result is null"));
      }

      List<PdfFileModel> files = filePickerResult.files
          .map(
            (file) => PdfFileModel(
              name: file.name,
              path: file.path!,
            ),
          )
          .toList();

      return DataSuccess(files);
    } on PdfErrors catch (error) {
      error.errror = "Erorr in file";
      return DataFailed(error);
    }
  }

  @override
  Future<List<PdfFileEntity>> getPdfFilesFromDb() async {
    return _appDatabase.pdfFileDao.getPdfFiles();
  }

  @override
  Future<void> insertPdfFileToDb(PdfFileEntity pdfFile) async {
    return _appDatabase.pdfFileDao
        .insertPdfFile(PdfFileModel.fromEntity(pdfFile));
  }

  @override
  Future<void> removePdfFileFromDb(PdfFileEntity pdfFile) {
    return _appDatabase.pdfFileDao
        .deletePdfFile(PdfFileModel.fromEntity(pdfFile));
  }
}
