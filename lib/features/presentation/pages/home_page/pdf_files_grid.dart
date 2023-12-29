import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ptts/features/presentation/bloc/pdf_files_list_bloc/pdf_file_bloc.dart';
import 'package:ptts/features/presentation/pages/home_page/pdf_file_grid_view.dart';
import 'package:ptts/tokens/colors.dart';

class PdfFileGridPage extends StatelessWidget {
  const PdfFileGridPage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _decoration(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: _buildAppBar(title),
        body: _buildBody(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: _buildButton(context),
      ),
    );
  }

  _decoration() {
    return const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          PTTSColors.deepLightBlue,
          PTTSColors.deepDarkBlue,
        ],
      ),
    );
  }

  _buildAppBar(String title) {
    return AppBar(
      backgroundColor: PTTSColors.deepLightBlue,
      title: Text(title),
    );
  }

  _buildBody() {
    return BlocBuilder<PdfFilesListBloc, PdfFilesListState>(
        builder: (context, state) {
      if (state is PdfFilesListInitial) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is PdfFilesListLoaded) {
        return PdfFileGridView(listState: state);
      }
      return Container();
    });
  }

  _buildButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FloatingActionButton.large(
        onPressed: () =>
            context.read<PdfFilesListBloc>().add(InsertPdfFilesToDbFromDirs()),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add),
            Text("Add"),
          ],
        ),
      ),
    );
  }
}
