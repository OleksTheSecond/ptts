import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ptts/features/domain/entities/pdf_file.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:ptts/injection_container.dart';

class PdfFileGridViewItem extends StatelessWidget {
  PdfFileGridViewItem({super.key, required this.pdfFile});
  PdfFileEntity pdfFile;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _containerDecoration(),
      child: GestureDetector(
        onTap: () {},
        child: _pdfFileBody(context),
      ),
    );
  }

  _pdfFileBody(BuildContext context) {
    return GridTile(
      child: _buildGridTileChild(pdfFile.path),
      footer: _buildGridTileFooter(pdfFile.name, context),
    );
  }

  _choosedPdfFile() {
    return Container(
      color: Colors.lightGreen,
      child: const Center(
          child: Icon(
        Icons.check_circle,
        size: 60,
      )),
    );
  }

  _containerDecoration() {
    return BoxDecoration(border: Border.all(color: Colors.black));
  }

  _buildGridTileFooter(String name, BuildContext context) {
    return GridTileBar(
      title: Text(name),
      backgroundColor:
          Theme.of(context).colorScheme.primaryContainer.withOpacity(0.7),
    );
  }

  _buildGridTileChild(String path) {
    return PDFView(
      filePath: path,
      enableSwipe: false,
      autoSpacing: false,
      pageFling: false,
      pageSnap: false,
      fitPolicy: FitPolicy.BOTH,
    );
  }
}
