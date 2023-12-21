import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ptts/features/domain/entities/pdf_file.dart';

part 'pdf_file_state.dart';

class PdfFileCubit extends Cubit<PdfFileState> {
  PdfFileCubit() : super(PdfFileInitial());

  void choosePdfFile(PdfFileEntity pdfFileEntity) {
    pdfFileEntity = pdfFileEntity.copyWith(isChoosed: true);
    print(pdfFileEntity.name);
    emit(PdfFileChoosed(pdfFileEntity));
  }

  void unChoosePdfFile(PdfFileEntity pdfFileEntity) {
    pdfFileEntity = pdfFileEntity.copyWith(isChoosed: false);
    print(pdfFileEntity.name);
    emit(PdfFileNotChoosed(pdfFileEntity));
  }
}
