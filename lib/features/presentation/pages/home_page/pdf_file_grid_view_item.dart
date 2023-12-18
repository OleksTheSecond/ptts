import 'package:flutter/material.dart';
import 'package:ptts/features/domain/entities/pdf_file.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PdfFileGridViewItem extends StatelessWidget {
  const PdfFileGridViewItem({super.key, required this.pdfFile});
  final PdfFileEntity pdfFile;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _containerDecoration(),
      child: GridTile(
        footer: _buildGridTileFooter(pdfFile.name, context),
        child: _buildGridTileChild(pdfFile.path),
      ),
    );
  }

  _containerDecoration() {
    return BoxDecoration(border: Border.all(color: Colors.black));
  }

  _buildGridTileFooter(String name, BuildContext context) {
    return GridTileBar(
      title: Text(
        name,
        style: const TextStyle(color: Colors.black),
      ),
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
