import 'package:ptts/core/usecase/usecase.dart';
import 'package:ptts/features/domain/entities/pdf_file.dart';
import 'package:ptts/features/domain/repository/pdf_file_repository.dart';

class InsertPdfFileToDbUseCase implements UseCase<void, PdfFileEntity> {
  final PdfFileRepository _pdfFileRepository;

  InsertPdfFileToDbUseCase(this._pdfFileRepository);

  @override
  Future<void> call({PdfFileEntity? params}) {
    return _pdfFileRepository.insertPdfFileToDb(params!);
  }
}
