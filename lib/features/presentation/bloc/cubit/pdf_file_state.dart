part of 'pdf_file_cubit.dart';

sealed class PdfFileState extends Equatable {
  final PdfFileEntity? pdfFile;
  const PdfFileState({this.pdfFile});

  @override
  List<Object> get props => [pdfFile!];
}

class PdfFileInitial extends PdfFileState {}

final class PdfFileChoosed extends PdfFileState {
  const PdfFileChoosed(PdfFileEntity pdfFileEntity)
      : super(pdfFile: pdfFileEntity);
}

final class PdfFileNotChoosed extends PdfFileState {
  const PdfFileNotChoosed(PdfFileEntity pdfFileEntity)
      : super(pdfFile: pdfFileEntity);
}
