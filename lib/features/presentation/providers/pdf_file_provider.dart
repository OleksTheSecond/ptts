import 'package:flutter/foundation.dart';
import 'package:ptts/features/domain/entities/pdf_file.dart';

class PdfFileProvider extends ChangeNotifier {
  PdfFileEntity? pdfFileEntity;

  PdfFileProvider(this.pdfFileEntity);

  void choosePdfFile() {
    if (pdfFileEntity != null) {
      pdfFileEntity = pdfFileEntity!.copyWith(isChoosed: true);
      notifyListeners();
    }
  }

  void changePdfFileEntity(PdfFileEntity file) {
    pdfFileEntity = file;
    print("${pdfFileEntity!.name} ${pdfFileEntity!.isChoosed}");
    notifyListeners();
  }

  void invertChoosing() {
    if (pdfFileEntity != null) {
      pdfFileEntity =
          pdfFileEntity!.copyWith(isChoosed: !pdfFileEntity!.isChoosed);
      notifyListeners();
    }
  }

  void unChoosePdfFile() {
    if (pdfFileEntity != null) {
      pdfFileEntity = pdfFileEntity!.copyWith(isChoosed: false);
      notifyListeners();
    }
  }
}
