part of 'pdf_file_bloc.dart';

sealed class PdfFileListEvent extends Equatable {
  final PdfFileEntity? pdfFile;

  const PdfFileListEvent({this.pdfFile});

  @override
  List<Object> get props => [pdfFile!];
}

class GetPdfFilesList extends PdfFileListEvent {
  const GetPdfFilesList();
}

class InsertPdfFilesToDbFromDirs extends PdfFileListEvent {}

class RemovePdfFileFromDb extends PdfFileListEvent {
  const RemovePdfFileFromDb(PdfFileEntity pdfFile) : super(pdfFile: pdfFile);
}
