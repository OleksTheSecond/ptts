import 'package:get_it/get_it.dart';
import 'package:ptts/features/data/data_sources/local_database/app_database.dart';
import 'package:ptts/features/data/repository/pdf_file_repository_impl.dart';
import 'package:ptts/features/domain/repository/pdf_file_repository.dart';
import 'package:ptts/features/domain/usecases/get_pdf_file_db.dart';
import 'package:ptts/features/domain/usecases/get_pdf_file_dir.dart';
import 'package:ptts/features/domain/usecases/insert_pdf_file_db.dart';
import 'package:ptts/features/domain/usecases/remove_pdf_file_db.dart';
import 'package:ptts/features/presentation/bloc/pdf_files_list_bloc/pdf_file_bloc.dart';
import 'package:ptts/features/presentation/providers/pdf_file_provider.dart';
import 'package:ptts/features/presentation/providers/pdf_files_provider.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  final database =
      await $FloorAppDatabase.databaseBuilder('pdf_to_voice.db').build();

  sl.registerSingleton<AppDatabase>(database);

  sl.registerSingleton<PdfFileRepository>(PdfFileRepositoryImpl(sl()));

  sl.registerSingleton<GetPdfFileUseCase>(GetPdfFileUseCase(sl()));
  sl.registerSingleton<GetPdfFileFromDbUseCase>(GetPdfFileFromDbUseCase(sl()));
  sl.registerSingleton<InsertPdfFileToDbUseCase>(
      InsertPdfFileToDbUseCase(sl()));
  sl.registerSingleton<RemovePdfFileFromDbUseCase>(
      RemovePdfFileFromDbUseCase(sl()));

  sl.registerFactory(() => PdfFilesListBloc(sl(), sl(), sl(), sl()));
  sl.registerFactory(() => PdfFilesProvider(sl(), sl(), sl(), sl()));
  // sl.registerFactory(() => PdfFileProvider(sl()));
}
