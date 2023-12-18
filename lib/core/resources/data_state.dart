class PdfErrors {
  String? errror;
  PdfErrors({
    this.errror,
  });
}

abstract class DataState<T> {
  final T? data;
  final PdfErrors? error;

  const DataState({this.data, this.error});
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed(PdfErrors error) : super(error: error);
}
