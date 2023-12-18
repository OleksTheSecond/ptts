part of 'pdf_file_bloc.dart';

abstract class PdfFileState extends Equatable {
  final List<PdfFileEntity>? pdfFiles;

  const PdfFileState({this.pdfFiles});

  @override
  List<Object> get props => [pdfFiles!];
}

final class PdfFileInitial extends PdfFileState {}

final class PdfFilesLoaded extends PdfFileState {
  const PdfFilesLoaded(List<PdfFileEntity> pdfFiles)
      : super(pdfFiles: pdfFiles);
}
