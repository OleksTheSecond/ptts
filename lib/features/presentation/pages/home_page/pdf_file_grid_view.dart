import 'package:flutter/material.dart';
import 'package:ptts/features/presentation/bloc/pdf_file_bloc/pdf_file_bloc.dart';
import 'package:ptts/features/presentation/pages/home_page/pdf_file_grid_view_item.dart';

class PdfFileGridView extends StatelessWidget {
  const PdfFileGridView({super.key, required this.state});
  final PdfFileState state;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 340,
        childAspectRatio: 1.7 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return PdfFileGridViewItem(pdfFile: state.pdfFiles![index]);
      },
      itemCount: state.pdfFiles!.length,
    );
  }
}
