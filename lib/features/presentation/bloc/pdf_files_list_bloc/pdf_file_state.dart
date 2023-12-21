part of 'pdf_file_bloc.dart';

abstract class PdfFilesListState extends Equatable {
  final List<PdfFileEntity>? pdfFiles;

  const PdfFilesListState({this.pdfFiles});

  @override
  List<Object> get props => [pdfFiles!];
}

final class PdfFilesListInitial extends PdfFilesListState {}

final class PdfFilesListLoaded extends PdfFilesListState {
  const PdfFilesListLoaded(List<PdfFileEntity> pdfFiles)
      : super(pdfFiles: pdfFiles);
}
