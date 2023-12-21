import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ptts/features/presentation/bloc/pdf_files_list_bloc/pdf_file_bloc.dart';
import 'package:ptts/features/presentation/pages/home_page/pdf_files_list.dart';
import 'package:ptts/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PdfFilesListBloc>(
      create: (context) => sl()..add(const GetPdfFilesList()),
      child: const MaterialApp(
        home: PdfFileListPage(title: "PTTS"),
      ),
    );
  }
}
