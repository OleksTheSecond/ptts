import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:ptts/features/presentation/bloc/pdf_file_bloc/pdf_file_bloc.dart';
import 'package:ptts/features/presentation/pages/home_page/pdf_file_grid_view.dart';

class PdfFileListPage extends StatelessWidget {
  const PdfFileListPage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(title),
      body: _buildBody(),
      floatingActionButton: _buildFAB(context),
    );
  }

  _buildAppBar(String title) {
    return AppBar(
      title: Text(title),
    );
  }

  _buildBody() {
    return BlocBuilder<PdfFileBloc, PdfFileState>(builder: (context, state) {
      if (state is PdfFileInitial) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is PdfFilesLoaded) {
        return PdfFileGridView(state: state);
      }
      return Container();
    });
  }

  _buildFAB(BuildContext context) {
    return FloatingActionButton.large(
      onPressed: () {
        context.read<PdfFileBloc>().add(InsertPdfFilesToDbFromDirs());
      },
      child: const Icon(Icons.add),
    );
  }
}
