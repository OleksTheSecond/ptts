import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ptts/core/resources/data_state.dart';
import 'package:ptts/features/domain/entities/pdf_file.dart';
import 'package:ptts/features/domain/usecases/get_pdf_file_db.dart';
import 'package:ptts/features/domain/usecases/get_pdf_file_dir.dart';
import 'package:ptts/features/domain/usecases/insert_pdf_file_db.dart';
import 'package:ptts/features/domain/usecases/remove_pdf_file_db.dart';

part 'pdf_file_event.dart';
part 'pdf_file_state.dart';

class PdfFileBloc extends Bloc<PdfFileEvent, PdfFileState> {
  final GetPdfFileUseCase _getPdfFileUseCase;
  final GetPdfFileFromDbUseCase _getPdfFileFromDbUseCase;
  final InsertPdfFileToDbUseCase _insertPdfFileToDbUseCase;
  final RemovePdfFileFromDbUseCase _removePdfFileFromDbUseCase;

  PdfFileBloc(this._getPdfFileUseCase, this._getPdfFileFromDbUseCase,
      this._insertPdfFileToDbUseCase, this._removePdfFileFromDbUseCase)
      : super(PdfFileInitial()) {
    on<GetPdfFiles>(_onGetPdfFiles);
    on<InsertPdfFilesToDbFromDirs>(_onInsertPdfFilesToDbFromDirs);
    on<RemovePdfFilesFromDb>(_onRemovePdfFilesFromDb);
  }

  Future<void> _onGetPdfFiles(
      GetPdfFiles event, Emitter<PdfFileState> emit) async {
    final pdfFiles = await _getPdfFileFromDbUseCase();
    emit(PdfFilesLoaded(pdfFiles));
  }

  Future<void> _onRemovePdfFilesFromDb(
      RemovePdfFilesFromDb pdfFile, Emitter<PdfFileState> emit) async {
    await _removePdfFileFromDbUseCase(params: pdfFile.pdfFile);
    final pdfFiles = await _getPdfFileFromDbUseCase();
    emit(PdfFilesLoaded(pdfFiles));
  }

  Future<void> _onInsertPdfFilesToDbFromDirs(
      InsertPdfFilesToDbFromDirs event, Emitter<PdfFileState> emit) async {
    final dataState = await _getPdfFileUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      for (var item in dataState.data!) {
        await _insertPdfFileToDbUseCase(params: item);
        final pdfFiles = await _getPdfFileFromDbUseCase();
        emit(PdfFilesLoaded(pdfFiles));
      }
    }
  }
}
