import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ptts/features/domain/entities/pdf_file.dart';
import 'package:ptts/features/presentation/bloc/pdf_files_list_bloc/pdf_file_bloc.dart';
import 'package:ptts/features/presentation/pages/home_page/pdf_file_grid_view_item.dart';
import 'package:ptts/features/presentation/providers/pdf_files_provider.dart';

class PdfFileGridView extends StatelessWidget {
  PdfFileGridView({super.key});
  List<PdfFileEntity>? pdfFilesList;

  @override
  Widget build(BuildContext context) {
    //context.read<PdfFilesProvider>().fetchPdfFilesFromDb();
    pdfFilesList = context.watch<PdfFilesProvider>().pdfFiles;
    print(pdfFilesList.toString());
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 340,
        childAspectRatio: 1.7 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (cntx, index) {
        return PdfFileGridViewItem(
          pdfFile: pdfFilesList![index],
        );
      },
      itemCount: pdfFilesList!.length,
    );
  }
}
