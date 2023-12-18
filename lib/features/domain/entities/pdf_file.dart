import 'package:equatable/equatable.dart';

class PdfFileEntity extends Equatable {
  final String name;
  final String path;
  final int currentPage;
  final bool isChoosed;

  const PdfFileEntity({
    required this.name,
    required this.path,
    this.currentPage = 0,
    this.isChoosed = false,
  });

  @override
  List<Object> get props {
    return [
      name,
      path,
      currentPage,
      isChoosed,
    ];
  }

  PdfFileEntity copyWith({
    String? name,
    String? path,
    int? currentPage,
    bool? isChoosed,
  }) {
    return PdfFileEntity(
      name: name ?? this.name,
      path: path ?? this.path,
      currentPage: currentPage ?? this.currentPage,
      isChoosed: isChoosed ?? this.isChoosed,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'path': path,
      'currentPage': currentPage,
      'isChoosed': isChoosed,
    };
  }

  @override
  String toString() {
    return 'PDFFile(name: $name, path: $path, currentPage: $currentPage, isChoosed: $isChoosed)';
  }
}
