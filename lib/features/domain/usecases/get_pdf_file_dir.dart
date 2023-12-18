import 'package:ptts/core/resources/data_state.dart';
import 'package:ptts/core/usecase/usecase.dart';
import 'package:ptts/features/domain/entities/pdf_file.dart';
import 'package:ptts/features/domain/repository/pdf_file_repository.dart';

class GetPdfFileUseCase
    implements UseCase<DataState<List<PdfFileEntity>>, void> {
  final PdfFileRepository _pdfBookRepository;

  GetPdfFileUseCase(this._pdfBookRepository);

  @override
  Future<DataState<List<PdfFileEntity>>> call({void params}) {
    return _pdfBookRepository.getPdfFilesFromDirectories();
  }
}
