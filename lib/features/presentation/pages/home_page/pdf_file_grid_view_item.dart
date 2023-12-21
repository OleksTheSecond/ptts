import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:ptts/features/domain/entities/pdf_file.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:ptts/features/presentation/providers/pdf_file_provider.dart';
import 'package:ptts/injection_container.dart';

class PdfFileGridViewItem extends StatelessWidget {
  const PdfFileGridViewItem({super.key, required this.pdfFile});
  final PdfFileEntity pdfFile;

  @override
  Widget build(BuildContext cntx) {
    return ChangeNotifierProvider<PdfFileProvider>(
        create: (_) => PdfFileProvider(pdfFile),
        builder: (context, child) {
          final pdfFileEntity = context.watch<PdfFileProvider>().pdfFileEntity!;
          bool isChoosed = pdfFileEntity.isChoosed;

          return Container(
            decoration: _containerDecoration(),
            child: isChoosed
                ? GestureDetector(
                    onTap: () => _onTap(context, pdfFileEntity),
                    child: _isChoosed(),
                  )
                : GestureDetector(
                    onLongPress: () => _onTap(context, pdfFileEntity),
                    child: GridTile(
                      footer: _buildGridTileFooter(pdfFile.name, context),
                      child: _buildGridTileChild(pdfFile.path),
                    ),
                  ),
          );
        });
  }

  _isChoosed() {
    return Container(
      color: Colors.lightGreen,
      child: const Center(
        child: Icon(
          Icons.check_circle,
          size: 60,
        ),
      ),
    );
  }

  void _onTap(BuildContext context, PdfFileEntity pdfFileEntity) {
    context.read<PdfFileProvider>().changePdfFileEntity(pdfFileEntity);

    context.read<PdfFileProvider>().invertChoosing();
    print("FILE: ${pdfFile.name} ${pdfFile.isChoosed}");
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
