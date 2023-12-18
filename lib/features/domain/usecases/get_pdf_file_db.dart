import 'package:ptts/core/usecase/usecase.dart';
import 'package:ptts/features/domain/entities/pdf_file.dart';
import 'package:ptts/features/domain/repository/pdf_file_repository.dart';

class GetPdfFileFromDbUseCase implements UseCase<List<PdfFileEntity>, void> {
  final PdfFileRepository _pdfFileRepository;

  GetPdfFileFromDbUseCase(this._pdfFileRepository);

  @override
  Future<List<PdfFileEntity>> call({void params}) {
    return _pdfFileRepository.getPdfFilesFromDb();
  }
}
