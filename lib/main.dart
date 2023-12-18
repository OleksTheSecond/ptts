import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ptts/features/presentation/bloc/pdf_file_bloc/pdf_file_bloc.dart';
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
    return BlocProvider<PdfFileBloc>(
      create: (context) => sl()..add(const GetPdfFiles()),
      child: MaterialApp(
        home: Scaffold(),
      ),
    );
  }
}
