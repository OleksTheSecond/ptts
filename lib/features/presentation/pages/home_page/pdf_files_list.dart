import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ptts/features/presentation/bloc/pdf_files_list_bloc/pdf_file_bloc.dart';
import 'package:ptts/features/presentation/pages/home_page/pdf_file_grid_view.dart';
import 'package:ptts/features/presentation/providers/pdf_files_provider.dart';

class PdfFileListPage extends StatelessWidget {
  const PdfFileListPage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(title),
      body: _buildBody(context),
      floatingActionButton: _buildFAB(context),
    );
  }

  _buildAppBar(String title) {
    return AppBar(
      title: Text(title),
    );
  }

  _buildBody(BuildContext context) {
    if (context.watch<PdfFilesProvider>().pdfFiles != null) {
      return PdfFileGridView();
    } else {
      context.read<PdfFilesProvider>().fetchPdfFilesFromDb();
    }
  }

  _buildFAB(BuildContext context) {
    return FloatingActionButton.large(
      onPressed: () {
        context
            .read<PdfFilesProvider>()
            .fetchPdfFilesFromDirectory()
            .then((value) {
          context.read<PdfFilesProvider>().insertPdfFilesInDb().then((value) =>
              context.read<PdfFilesProvider>().fetchPdfFilesFromDb());
        });
      },
      child: const Icon(Icons.add),
    );
  }
}
