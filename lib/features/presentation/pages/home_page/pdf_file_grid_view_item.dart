import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ptts/features/domain/entities/pdf_file.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:ptts/features/presentation/bloc/cubit/pdf_file_cubit.dart';
import 'package:ptts/injection_container.dart';

class PdfFileGridViewItem extends StatelessWidget {
  PdfFileGridViewItem({super.key, required this.pdfFile});
  PdfFileEntity pdfFile;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl.get<PdfFileCubit>(),
      child: BlocBuilder<PdfFileCubit, PdfFileState>(
        builder: (context, state) {
          final state = context.watch<PdfFileCubit>().state;
          return Container(
            decoration: _containerDecoration(),
            child: GestureDetector(
              onTap: () {
                if (pdfFile.isChoosed) {
                  context.read<PdfFileCubit>().unChoosePdfFile(pdfFile);
                } else {
                  context.read<PdfFileCubit>().choosePdfFile(pdfFile);
                }
              },
              child: _pdfFileBody(state, context),
            ),
          );
        },
      ),
    );
  }

  _pdfFileBody(PdfFileState state, BuildContext context) {
    if (state is PdfFileInitial) {
      return GridTile(
        child: _buildGridTileChild(pdfFile.path),
        footer: _buildGridTileFooter(pdfFile.name, context),
      );
    }
    if (state is PdfFileChoosed) {
      pdfFile = state.pdfFile!;
      return _choosedPdfFile();
    }
    if (state is PdfFileNotChoosed) {
      pdfFile = state.pdfFile!;
      return GridTile(
        child: _buildGridTileChild(state.pdfFile!.path),
        footer: _buildGridTileFooter(state.pdfFile!.name, context),
      );
    }

    return const Placeholder();
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
