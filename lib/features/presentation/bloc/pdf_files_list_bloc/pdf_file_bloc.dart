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

class PdfFilesListBloc extends Bloc<PdfFileListEvent, PdfFilesListState> {
  final GetPdfFileUseCase _getPdfFileUseCase;
  final GetPdfFileFromDbUseCase _getPdfFileFromDbUseCase;
  final InsertPdfFileToDbUseCase _insertPdfFileToDbUseCase;
  final RemovePdfFileFromDbUseCase _removePdfFileFromDbUseCase;

  PdfFilesListBloc(this._getPdfFileUseCase, this._getPdfFileFromDbUseCase,
      this._insertPdfFileToDbUseCase, this._removePdfFileFromDbUseCase)
      : super(PdfFilesListInitial()) {
    on<GetPdfFilesList>(_onGetPdfFiles);
    on<InsertPdfFilesToDbFromDirs>(_onInsertPdfFilesToDbFromDirs);
    on<RemovePdfFileFromDb>(_onRemovePdfFilesFromDb);
  }

  Future<void> _onGetPdfFiles(
      GetPdfFilesList event, Emitter<PdfFilesListState> emit) async {
    final pdfFiles = await _getPdfFileFromDbUseCase();
    emit(PdfFilesListLoaded(pdfFiles));
  }

  Future<void> _onRemovePdfFilesFromDb(
      RemovePdfFileFromDb pdfFile, Emitter<PdfFilesListState> emit) async {
    await _removePdfFileFromDbUseCase(params: pdfFile.pdfFile);
    final pdfFiles = await _getPdfFileFromDbUseCase();
    emit(PdfFilesListLoaded(pdfFiles));
  }

  Future<void> _onInsertPdfFilesToDbFromDirs(
      InsertPdfFilesToDbFromDirs event, Emitter<PdfFilesListState> emit) async {
    final dataState = await _getPdfFileUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      for (var item in dataState.data!) {
        await _insertPdfFileToDbUseCase(params: item);
        final pdfFiles = await _getPdfFileFromDbUseCase();
        emit(PdfFilesListLoaded(pdfFiles));
      }
    }
  }
}
