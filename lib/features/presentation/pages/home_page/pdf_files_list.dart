import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ptts/features/presentation/bloc/pdf_files_list_bloc/pdf_file_bloc.dart';
import 'package:ptts/features/presentation/pages/home_page/pdf_file_grid_view.dart';

class PdfFileListPage extends StatelessWidget {
  const PdfFileListPage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
            Color(0xff1CB5E0),
            Color(0xff000046),
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: _buildAppBar(title),
        body: _buildBody(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: _buildButton(context),
      ),
    );
  }

  _buildAppBar(String title) {
    return AppBar(
      backgroundColor: Color(0xff1CB5E0),
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
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(200, 50),
        ),
        onPressed: () {},
        label: Text("Add"),
        icon: Icon(Icons.add),
      ),
    );
  }

  _buildFAB(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => context.read<PdfFilesListBloc>().add(
              InsertPdfFilesToDbFromDirs(),
            ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Color(0xff59C173).withOpacity(0.3),
                borderRadius: const BorderRadius.all(Radius.circular(40)),
                border: Border.all(
                  width: 1.5,
                  color: Color(0xff59C173).withOpacity(0.5),
                ),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FittedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.add,
                          size: 30,
                          color: Colors.white,
                        ),
                        Text(
                          "Add",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );

    FloatingActionButton.large(
      onPressed: () {},
      child: const Icon(Icons.add),
    );
  }
}
