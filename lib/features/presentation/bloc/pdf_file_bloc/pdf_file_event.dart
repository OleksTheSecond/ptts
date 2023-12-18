part of 'pdf_file_bloc.dart';

sealed class PdfFileEvent extends Equatable {
  final PdfFileEntity? pdfFile;

  const PdfFileEvent({this.pdfFile});

  @override
  List<Object> get props => [pdfFile!];
}

class GetPdfFiles extends PdfFileEvent {
  const GetPdfFiles();
}

class InsertPdfFilesToDbFromDirs extends PdfFileEvent {}

class RemovePdfFilesFromDb extends PdfFileEvent {
  const RemovePdfFilesFromDb(PdfFileEntity pdfFile) : super(pdfFile: pdfFile);
}
